#!/usr/bin/env python3
"""Audit a Typst project with the SeaSlides diagnostic quality gate.

Compiler warnings are evidence, not a single undifferentiated failure class.
This checker uses stable diagnostic codes and three severities:

- blocker: automatically fails the default quality gate;
- review: requires a render/source disposition but is not automatically fatal;
- advisory: maintenance guidance that does not imply a visual defect.

Exit codes:
    0  audit completed and the configured gate passed
    1  audit completed and diagnostics met the configured failure threshold
    2  audit could not complete (setup, compile, or output verification failure)
"""

import argparse
import hashlib
import json
import re
import sys
from importlib import metadata
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple

try:
    import typst
except ImportError:  # Kept import-safe so taxonomy/static tests can still run.
    typst = None

from error_helper import analyze_common_issues, analyze_template_spacing_file
from typst_diagnostics import (
    Diagnostic,
    classify_warning,
    code_counts,
    deduplicate_diagnostics,
    gate_failed,
    make_diagnostic,
    severity_counts,
    sort_diagnostics,
)
from workspace_context import resolve_workspace_context


SCHEMA_VERSION = 2


def _configure_utf8_stdio() -> None:
    """Avoid console encoding crashes when diagnostics contain Unicode."""
    for stream_name in ("stdout", "stderr"):
        stream = getattr(sys, stream_name, None)
        if stream is None or not hasattr(stream, "reconfigure"):
            continue
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")
        except Exception:
            pass


_configure_utf8_stdio()


def _package_version() -> Optional[str]:
    try:
        return metadata.version("typst")
    except metadata.PackageNotFoundError:
        return None


def _exception_detail(exc: Exception) -> str:
    parts = []
    diagnostic = getattr(exc, "diagnostic", None)
    if diagnostic:
        parts.append(str(diagnostic))
    elif str(exc):
        parts.append(str(exc))
    hints = getattr(exc, "hints", None)
    if hints:
        parts.append("Hints: %s" % hints)
    trace = getattr(exc, "trace", None)
    if trace:
        parts.append("Trace: %s" % trace)
    return "\n".join(parts) or exc.__class__.__name__


def _compile_pdf(entry_path: Path) -> Dict[str, Any]:
    """Compile to PDF bytes in memory without changing project artifacts."""
    diagnostics: List[Diagnostic] = []
    if typst is None:
        diagnostics.append(
            make_diagnostic(
                "TYPST_BINDING_UNAVAILABLE",
                "blocker",
                "The typst Python package is not installed; install the skill requirements.",
                owner="environment",
            )
        )
        return {
            "success": False,
            "warning_capture": False,
            "incomplete": True,
            "diagnostics": diagnostics,
        }

    warning_capture = hasattr(typst, "compile_with_warnings")
    try:
        if warning_capture:
            generated, warnings = typst.compile_with_warnings(
                input=str(entry_path),
                format="pdf",
            )
            diagnostics.extend(classify_warning(item) for item in (warnings or []))
        else:
            generated = typst.compile(str(entry_path), format="pdf")
            diagnostics.append(
                make_diagnostic(
                    "WARNING_CAPTURE_UNAVAILABLE",
                    "review",
                    "Compilation succeeded, but this typst binding cannot capture warnings; inspect the render.",
                    owner="environment",
                )
            )
    except Exception as exc:
        detail = _exception_detail(exc)
        diagnostics.append(
            make_diagnostic(
                "COMPILE_ERROR",
                "blocker",
                detail.splitlines()[0],
                detail=detail,
            )
        )
        return {
            "success": False,
            "warning_capture": warning_capture,
            "incomplete": True,
            "diagnostics": diagnostics,
        }

    if not isinstance(generated, bytes) or not generated:
        diagnostics.append(
            make_diagnostic(
                "MISSING_PDF_OUTPUT",
                "blocker",
                "Typst returned no PDF bytes after compilation.",
            )
        )
        return {
            "success": False,
            "warning_capture": warning_capture,
            "incomplete": True,
            "diagnostics": diagnostics,
        }

    return {
        "success": True,
        "warning_capture": warning_capture,
        "incomplete": False,
        "diagnostics": diagnostics,
    }


def _page_count(entry_path: Path) -> Tuple[Optional[int], Optional[Diagnostic]]:
    """Compile low-resolution PNGs in memory and return an authoritative count.

    Existing PNG files are deliberately ignored because they may be stale.
    """
    if typst is None:
        return None, make_diagnostic(
            "PAGE_COUNT_UNAVAILABLE",
            "blocker",
            "Cannot determine page count without the typst Python package.",
            owner="environment",
        )
    try:
        generated = typst.compile(str(entry_path), format="png", ppi=18.0)
        if isinstance(generated, bytes):
            page_count = 1
        elif generated is None:
            page_count = 0
        else:
            page_count = len(list(generated))
    except Exception as exc:
        detail = _exception_detail(exc)
        return None, make_diagnostic(
            "PAGE_COUNT_UNAVAILABLE",
            "blocker",
            "Could not determine page count: %s" % detail.splitlines()[0],
            detail=detail,
        )

    if page_count < 1:
        return None, make_diagnostic(
            "NO_RENDERED_PAGES",
            "blocker",
            "Compilation produced no rendered pages.",
        )
    return page_count, None


_LOCAL_IMPORT = re.compile(r'#(?:import|include)\s+"([^"\\]+)"')
_LOCAL_ASSET = re.compile(
    r'\b(?:image|read|csv|json|yaml|toml|xml|bibliography)\s*\(\s*"([^"\\]+)"'
)
_PNG_NAME = re.compile(r"slide_(\d+)\.png$")


def _without_typst_comments(content: str) -> str:
    """Remove Typst comments while preserving quoted paths for dependency parsing."""
    result: List[str] = []
    index = 0
    quote: Optional[str] = None
    while index < len(content):
        char = content[index]
        next_char = content[index + 1] if index + 1 < len(content) else ""
        if quote:
            result.append(char)
            if char == "\\" and index + 1 < len(content):
                result.append(content[index + 1])
                index += 2
                continue
            if char == quote:
                quote = None
            index += 1
            continue
        if char in {'"', "'"}:
            quote = char
            result.append(char)
            index += 1
            continue
        if char == "/" and next_char == "/":
            newline = content.find("\n", index)
            if newline == -1:
                break
            result.append("\n")
            index = newline + 1
            continue
        if char == "/" and next_char == "*":
            end = content.find("*/", index + 2)
            if end == -1:
                break
            result.extend("\n" for item in content[index:end + 2] if item == "\n")
            index = end + 2
            continue
        result.append(char)
        index += 1
    return "".join(result)


def _is_local_dependency(value: str) -> bool:
    return not (value.startswith("@") or "://" in value or value.startswith("data:"))


def _render_dependencies(entry_path: Path) -> List[Path]:
    """Find resolvable local Typst imports and common file dependencies.

    Package imports and URLs are excluded deliberately. Dynamic paths cannot be
    resolved statically and remain the compiler's responsibility.
    """
    pending = [entry_path.resolve()]
    sibling_template = (entry_path.parent / "template.typ").resolve()
    if sibling_template.is_file() and sibling_template != entry_path.resolve():
        pending.append(sibling_template)
    seen: Set[Path] = set()
    dependencies: Set[Path] = set()
    while pending:
        source = pending.pop()
        if source in seen:
            continue
        seen.add(source)
        if not source.is_file():
            continue
        dependencies.add(source)
        try:
            content = _without_typst_comments(source.read_text(encoding="utf-8"))
        except (OSError, UnicodeError):
            continue
        for match in _LOCAL_IMPORT.finditer(content):
            value = match.group(1)
            if not _is_local_dependency(value):
                continue
            imported = (source.parent / value).resolve()
            if imported.is_file():
                dependencies.add(imported)
                pending.append(imported)
        for match in _LOCAL_ASSET.finditer(content):
            value = match.group(1)
            if _is_local_dependency(value):
                asset = (source.parent / value).resolve()
                if asset.is_file():
                    dependencies.add(asset)
    return sorted(dependencies)


def _artifact_read_error(path: Path) -> Optional[str]:
    """Return an error when a canonical PDF/PNG artifact is not readable."""
    try:
        if path.suffix.lower() == ".pdf":
            if path.read_bytes()[:5] != b"%PDF-":
                return "file does not have a PDF header"
        elif path.suffix.lower() == ".png":
            from PIL import Image

            with Image.open(path) as image:
                image.verify()
    except ImportError:
        return "Pillow is unavailable, so PNG integrity cannot be verified"
    except (OSError, ValueError) as exc:
        return str(exc)
    return None


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _validate_compile_manifest(
    project: Path,
    entry_path: Path,
    page_count: int,
    artifact_paths: List[Path],
) -> List[Diagnostic]:
    """Verify that canonical artifacts came from one successful ``--all`` run."""
    manifest_path = project / "output" / "compile-manifest.json"
    if not manifest_path.is_file() or manifest_path.stat().st_size < 1:
        return [
            make_diagnostic(
                "MISSING_COMPILE_MANIFEST",
                "blocker",
                "compile-manifest.json is missing; rerun typst_compiler.py --all.",
                location=str(manifest_path),
            )
        ]
    try:
        payload = json.loads(manifest_path.read_text(encoding="utf-8"))
        expected_entry = str(entry_path.relative_to(project))
        if payload.get("schema_version") != 1:
            raise ValueError("unsupported manifest schema")
        if payload.get("entry") != expected_entry:
            raise ValueError(
                "manifest entry %r does not match %r"
                % (payload.get("entry"), expected_entry)
            )
        if payload.get("page_count") != page_count:
            raise ValueError(
                "manifest page count %r does not match rendered count %d"
                % (payload.get("page_count"), page_count)
            )
        if payload.get("entry_sha256") != _sha256_file(entry_path):
            raise ValueError("entry source hash changed after the recorded compile")

        records = payload.get("artifacts")
        if not isinstance(records, list):
            raise ValueError("manifest artifacts must be a list")
        recorded = {item.get("path"): item for item in records if isinstance(item, dict)}
        expected_paths = {str(path.relative_to(project)): path for path in artifact_paths}
        if set(recorded) != set(expected_paths):
            raise ValueError("manifest artifact set does not match canonical outputs")
        for relative, artifact in expected_paths.items():
            record = recorded[relative]
            if not artifact.is_file():
                raise ValueError("recorded artifact is missing: %s" % relative)
            if record.get("size") != artifact.stat().st_size:
                raise ValueError("artifact size changed: %s" % relative)
            if record.get("sha256") != _sha256_file(artifact):
                raise ValueError("artifact hash changed: %s" % relative)
    except (OSError, UnicodeError, ValueError, json.JSONDecodeError) as exc:
        return [
            make_diagnostic(
                "COMPILE_MANIFEST_MISMATCH",
                "blocker",
                "Canonical outputs do not match the last successful --all receipt: %s" % exc,
                location=str(manifest_path),
            )
        ]
    return []


def _validate_output_contract(
    project: Path,
    entry_path: Path,
    page_count: int,
) -> List[Diagnostic]:
    """Validate the artifacts produced by ``typst_compiler.py --all``.

    The checker intentionally never treats old PNG files as page-count evidence.
    It does, however, require the compiler's canonical overview and per-page
    files to exist, match the authoritative in-memory page count, and be no
    older than local render dependencies. This catches an interrupted/partial
    ``--all`` run without mutating the visual-review artifacts.
    """
    # typst_compiler exits at import time when its optional binding is absent,
    # so import its canonical filename collector only after compilation has
    # established that the binding is usable. This preserves this module's
    # import-safe taxonomy/static-analysis behavior.
    from typst_compiler import _collect_generated_pngs

    output_dir = project / "output"
    overview = output_dir / "overview.png"
    diagnostics: List[Diagnostic] = []
    try:
        dependencies = _render_dependencies(entry_path)
        newest_dependency = max(path.stat().st_mtime_ns for path in dependencies)
    except OSError as exc:
        return [
            make_diagnostic(
                "OUTPUT_FRESHNESS_UNAVAILABLE",
                "blocker",
                "Could not read render dependency timestamp for output validation: %s" % exc,
            )
        ]

    def check_file(path: Path, missing_code: str, label: str) -> None:
        if not path.is_file() or path.stat().st_size < 1:
            diagnostics.append(
                make_diagnostic(missing_code, "blocker", "%s is missing or empty: %s" % (label, path))
            )
            return
        read_error = _artifact_read_error(path)
        if read_error is not None:
            diagnostics.append(
                make_diagnostic(
                    "CORRUPT_RENDER_OUTPUT",
                    "blocker",
                    "%s cannot be decoded: %s" % (label, read_error),
                    location=str(path),
                )
            )
            return
        if path.stat().st_mtime_ns < newest_dependency:
            diagnostics.append(
                make_diagnostic(
                    "STALE_RENDER_OUTPUT",
                    "blocker",
                    "%s predates a local render dependency; rerun typst_compiler.py --all." % label,
                    location=str(path),
                )
            )

    check_file(output_dir / "slides.pdf", "MISSING_PDF_OUTPUT", "Slide PDF")
    check_file(overview, "MISSING_OVERVIEW_OUTPUT", "Overview image")
    png_pattern = output_dir / "pngs" / "slide_{n}.png"
    pngs = _collect_generated_pngs(png_pattern)
    if len(pngs) != page_count:
        diagnostics.append(
            make_diagnostic(
                "PNG_PAGE_COUNT_MISMATCH",
                "blocker",
                "Expected %d slide PNGs, found %d; rerun typst_compiler.py --all."
                % (page_count, len(pngs)),
                location=str(png_pattern.parent),
            )
        )
    page_numbers: List[int] = []
    invalid_names: List[str] = []
    for png in pngs:
        match = _PNG_NAME.fullmatch(png.name)
        if match is None:
            invalid_names.append(png.name)
        else:
            page_numbers.append(int(match.group(1)))
    if invalid_names or sorted(page_numbers) != list(range(1, page_count + 1)):
        observed = ", ".join(sorted(png.name for png in pngs)) or "none"
        diagnostics.append(
            make_diagnostic(
                "PNG_PAGE_SEQUENCE_MISMATCH",
                "blocker",
                "Expected slide PNG names for pages 1..%d, found: %s; rerun typst_compiler.py --all."
                % (page_count, observed),
                location=str(png_pattern.parent),
            )
        )
    for png in pngs:
        check_file(png, "MISSING_SLIDE_PNG", "Slide PNG")
    canonical_artifacts = [output_dir / "slides.pdf", overview] + pngs
    diagnostics.extend(
        _validate_compile_manifest(project, entry_path, page_count, canonical_artifacts)
    )
    return diagnostics


def audit_project(
    project_path: str,
    expected_pages: Optional[int] = None,
    entry: str = "main.typ",
    include_static: bool = True,
    fail_on: str = "blocker",
) -> Dict[str, Any]:
    """Compile in memory and audit existing project artifacts without writing them."""
    context = resolve_workspace_context(project_path, entry=entry)
    project = context.root
    entry = context.entry
    entry_path = context.entry_path
    output_pdf = project / "output" / "slides.pdf"
    diagnostics: List[Diagnostic] = []
    incomplete = False
    compile_success = False
    warning_capture = False
    page_count: Optional[int] = None

    if not project.is_dir():
        diagnostics.append(
            make_diagnostic(
                "PROJECT_NOT_FOUND",
                "blocker",
                "Project directory not found: %s" % project,
                owner="environment",
            )
        )
        incomplete = True
    elif not entry_path.is_file():
        diagnostics.append(
            make_diagnostic(
                "ENTRY_NOT_FOUND",
                "blocker",
                "Entry file not found: %s" % entry_path,
                location=str(entry_path),
            )
        )
        incomplete = True
    else:
        compilation = _compile_pdf(entry_path)
        compile_success = compilation["success"]
        warning_capture = compilation["warning_capture"]
        incomplete = compilation["incomplete"]
        diagnostics.extend(compilation["diagnostics"])

        if compile_success:
            page_count, page_error = _page_count(entry_path)
            if page_error is not None:
                diagnostics.append(page_error)
                incomplete = True
            elif expected_pages is not None and page_count != expected_pages:
                diagnostics.append(
                    make_diagnostic(
                        "EXPECTED_PAGE_COUNT_MISMATCH",
                        "blocker",
                        "Expected %d pages, rendered %d." % (expected_pages, page_count),
                    )
                )
            if page_count is not None:
                diagnostics.extend(
                    _validate_output_contract(project, entry_path, page_count)
                )

        if include_static:
            for issue in analyze_common_issues(str(entry_path)):
                location = str(entry_path)
                if issue.line is not None:
                    location = "%s:%d" % (entry_path, issue.line)
                diagnostics.append(
                    make_diagnostic(
                        issue.code,
                        issue.severity,
                        issue.message,
                        source="static-analysis",
                        location=location,
                    )
                )
                if issue.code == "STATIC_READ_ERROR":
                    incomplete = True
            template_path = project / "template.typ"
            if not template_path.is_file():
                template_path = entry_path.parent / "template.typ"
            if template_path.is_file() and template_path.resolve() != entry_path:
                for issue in analyze_template_spacing_file(str(template_path)):
                    location = str(template_path)
                    if issue.line is not None:
                        location = "%s:%d" % (template_path, issue.line)
                    diagnostics.append(
                        make_diagnostic(
                            issue.code,
                            issue.severity,
                            issue.message,
                            source="static-analysis",
                            location=location,
                        )
                    )

    diagnostics = sort_diagnostics(deduplicate_diagnostics(diagnostics))
    severity_summary = severity_counts(diagnostics)
    if incomplete:
        status = "incomplete"
    elif severity_summary["blocker"]:
        status = "fail"
    elif severity_summary["review"]:
        status = "review"
    elif severity_summary["advisory"]:
        status = "advisory"
    else:
        status = "pass"

    failed = incomplete or gate_failed(diagnostics, fail_on)
    return {
        "schema_version": SCHEMA_VERSION,
        "tool": "typst_quality_checker.py",
        "typst_python_version": _package_version(),
        "project": str(project),
        "entry": entry,
        "entry_path": str(entry_path),
        "output_pdf": str(output_pdf),
        "compile_success": compile_success,
        "warning_capture": warning_capture,
        "page_count": page_count,
        "expected_pages": expected_pages,
        "include_static": include_static,
        "status": status,
        "incomplete": incomplete,
        "quality_gate": {
            "fail_on": fail_on,
            "failed": failed,
        },
        "severity_counts": severity_summary,
        "code_counts": code_counts(diagnostics),
        "unique_diagnostic_count": len(diagnostics),
        "diagnostic_occurrence_count": sum(item.occurrences for item in diagnostics),
        "diagnostics": diagnostics,
    }


def result_to_dict(result: Dict[str, Any]) -> Dict[str, Any]:
    """Convert an audit result to a JSON-safe dictionary."""
    serialized = dict(result)
    serialized["diagnostics"] = [item.to_dict() for item in result["diagnostics"]]
    return serialized


def format_quality_report(result: Dict[str, Any]) -> str:
    """Render a concise human-readable report."""
    lines = [
        "=" * 72,
        "Typst Quality Report",
        "=" * 72,
        "Project: %s" % result["project"],
        "Entry: %s" % result["entry"],
        "Status: %s" % result["status"].upper(),
        "Compilation: %s" % ("OK" if result["compile_success"] else "FAILED"),
        "Warning capture: %s" % ("available" if result["warning_capture"] else "unavailable"),
    ]
    if result["page_count"] is not None:
        lines.append("Pages: %d" % result["page_count"])
    else:
        lines.append("Pages: unavailable")
    if result["expected_pages"] is not None:
        lines.append("Expected pages: %d" % result["expected_pages"])

    counts = result["severity_counts"]
    lines.extend(
        [
            "Diagnostics: %d blocker, %d review, %d advisory"
            % (counts["blocker"], counts["review"], counts["advisory"]),
            "-" * 72,
        ]
    )
    if not result["diagnostics"]:
        lines.append("No diagnostics.")
    else:
        for item in result["diagnostics"]:
            context = []
            if item.page is not None:
                context.append("page %d" % item.page)
            if item.owner:
                context.append(item.owner)
            if item.occurrences > 1:
                context.append("%d occurrences" % item.occurrences)
            suffix = " (%s)" % ", ".join(context) if context else ""
            lines.append(
                "[%s] %s%s: %s"
                % (item.severity.upper(), item.code, suffix, item.message)
            )
            if item.location:
                lines.append("  at %s" % item.location)

    gate = result["quality_gate"]
    lines.extend(
        [
            "-" * 72,
            "Quality gate (--fail-on %s): %s"
            % (gate["fail_on"], "FAIL" if gate["failed"] else "PASS"),
        ]
    )
    if counts["review"]:
        lines.append(
            "Review diagnostics require source/render disposition; they are not automatic visual failures."
        )
    return "\n".join(lines)


# Backward-compatible helpers for callers that imported the previous module.
def classify_warnings(warnings: List[str]) -> Dict[str, List[str]]:
    classified = {"overflow": [], "font": [], "other": []}
    for warning in warnings:
        diagnostic = classify_warning(warning)
        if diagnostic.code in {"CONTENT_OVERFLOW", "LAYOUT_NONCONVERGENCE"}:
            classified["overflow"].append(diagnostic.message)
        elif diagnostic.code == "FONT_FALLBACK":
            classified["font"].append(diagnostic.message)
        else:
            classified["other"].append(diagnostic.message)
    return classified


def check_compilation(
    project_path: str, entry: str = "main.typ"
) -> Tuple[bool, str, List[str]]:
    """Compile in memory for backward-compatible success/error checking."""
    project = Path(project_path).expanduser().resolve()
    entry_path = project / entry
    if not entry_path.is_file():
        return False, "%s not found in %s" % (entry, project), []
    result = _compile_pdf(entry_path)
    warning_messages = [
        item.message for item in result["diagnostics"] if item.source == "compiler"
    ]
    errors = [
        item.message
        for item in result["diagnostics"]
        if item.severity == "blocker" and item.code not in {"CONTENT_OVERFLOW", "LAYOUT_NONCONVERGENCE"}
    ]
    return result["success"], "\n".join(errors), warning_messages


def get_page_count(project_path: str, entry: str = "main.typ") -> int:
    entry_path = Path(project_path).expanduser().resolve() / entry
    if not entry_path.is_file():
        return 0
    count, error = _page_count(entry_path)
    return count if error is None and count is not None else -1


def generate_quality_report(
    project_path: str,
    expected_pages: Optional[int] = None,
    entry: str = "main.typ",
) -> str:
    result = audit_project(
        project_path,
        expected_pages=expected_pages,
        entry=entry,
    )
    return format_quality_report(result)


def _write_text(path: str, content: str) -> None:
    output = Path(path).expanduser()
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(content, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Audit a Typst project with a severity-aware quality gate",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 typst_quality_checker.py ./my-project
  python3 typst_quality_checker.py ./my-project --expected-pages 20
  python3 typst_quality_checker.py ./theme --entry demo.typ --json audit.json
  python3 typst_quality_checker.py ./my-project --fail-on review
        """,
    )
    parser.add_argument("project_path", help="Path to the project or theme directory")
    parser.add_argument(
        "--expected-pages",
        "-p",
        type=int,
        default=None,
        help="Expected physical page count (a mismatch is a blocker)",
    )
    parser.add_argument(
        "--output",
        "-o",
        default=None,
        help="Write the human-readable report to this file",
    )
    parser.add_argument(
        "--json",
        dest="json_output",
        default=None,
        help="Write a machine-readable JSON receipt to this file",
    )
    parser.add_argument(
        "--entry",
        default="main.typ",
        help="Entry .typ filename (use demo.typ for theme development)",
    )
    parser.add_argument(
        "--fail-on",
        choices=("blocker", "review", "advisory", "none"),
        default="blocker",
        help="Lowest diagnostic severity that fails the gate (default: blocker)",
    )
    parser.add_argument(
        "--no-static",
        action="store_true",
        help="Skip conservative entry-file source heuristics",
    )
    args = parser.parse_args()

    if args.expected_pages is not None and args.expected_pages < 1:
        parser.error("--expected-pages must be at least 1")

    result = audit_project(
        args.project_path,
        expected_pages=args.expected_pages,
        entry=args.entry,
        include_static=not args.no_static,
        fail_on=args.fail_on,
    )
    report = format_quality_report(result)
    print(report)

    if args.output:
        _write_text(args.output, report + "\n")
        print("Report saved to: %s" % args.output)
    if args.json_output:
        serialized = json.dumps(
            result_to_dict(result),
            ensure_ascii=False,
            indent=2,
            sort_keys=True,
        )
        _write_text(args.json_output, serialized + "\n")
        print("JSON receipt saved to: %s" % args.json_output)

    if result["incomplete"]:
        return 2
    return 1 if result["quality_gate"]["failed"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
