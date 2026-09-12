#!/usr/bin/env python3
"""SeaSlides Typst Slides - Project Manager

Usage:
    python3 project_manager.py init <project_name> [--dir projects] [--exact-name]
    python3 project_manager.py workspace <workspace_path> [--entry main.typ] [--prepare] [--json]
    python3 project_manager.py import-sources <project_path> <source1> [<source2> ...] [--move | --copy]
    python3 project_manager.py copy-theme <project_path> <theme_name>
    python3 project_manager.py validate <project_path>
    python3 project_manager.py info <project_path>
"""

from __future__ import annotations

import re
import json
import shutil
import subprocess
import sys
from datetime import datetime
from pathlib import Path
from urllib.parse import urlparse

try:
    from config import PAGE_FORMATS, normalize_page_format
    from project_utils import (
        get_project_info,
        validate_project_structure,
    )
    from workspace_context import resolve_workspace_context
except ImportError:
    tools_dir = Path(__file__).resolve().parent
    if str(tools_dir) not in sys.path:
        sys.path.insert(0, str(tools_dir))
    from config import PAGE_FORMATS, normalize_page_format  # type: ignore
    from project_utils import (  # type: ignore
        get_project_info,
        validate_project_structure,
    )
    from workspace_context import resolve_workspace_context  # type: ignore

TOOLS_DIR = Path(__file__).resolve().parent
SKILL_DIR = TOOLS_DIR.parent
SOURCE_DIRNAME = "sources"
TEXT_SOURCE_SUFFIXES = {".md", ".markdown", ".txt"}
PDF_SUFFIXES = {".pdf"}
PRESENTATION_SUFFIXES = {".pptx", ".pptm", ".ppsx", ".ppsm", ".potx", ".potm"}
DOC_SUFFIXES = {
    ".docx", ".doc", ".odt", ".rtf",
    ".epub",
    ".html", ".htm",
    ".tex", ".latex", ".rst", ".org",
    ".ipynb",
    ".typ",
}
def is_url(value: str) -> bool:
    """Return whether a string looks like an HTTP(S) URL."""
    parsed = urlparse(value)
    return parsed.scheme in {"http", "https"} and bool(parsed.netloc)


def sanitize_name(value: str) -> str:
    """Sanitize a user-facing name into a filesystem-safe token."""
    safe = "".join(ch if ch.isalnum() or ch in "-_." else "_" for ch in value.strip())
    safe = safe.strip("._")
    while "__" in safe:
        safe = safe.replace("__", "_")
    return safe[:120] or "source"


def derive_url_basename(url: str) -> str:
    """Derive a stable base filename from a URL."""
    parsed = urlparse(url)
    parts = [sanitize_name(parsed.netloc)]
    if parsed.path and parsed.path != "/":
        path_part = sanitize_name(parsed.path.strip("/").replace("/", "_"))
        if path_part:
            parts.append(path_part)
    return "_".join(part for part in parts if part) or "web_source"


class ProjectManager:
    """Create, inspect, validate, and populate Typst/Touying project folders."""

    PAGE_FORMATS = PAGE_FORMATS

    def __init__(self, base_dir: str = "projects") -> None:
        self.base_dir = Path(base_dir)

    # ------------------------------------------------------------------ init
    def init_project(
        self,
        project_name: str,
        base_dir: str | None = None,
        exact_name: bool = False,
    ) -> str:
        """Initialize a new Touying project with minimal directory structure.

        Creates: assets/, output/, sources/
        Theme files (main.typ, template.typ) are generated during theme selection (Step 3).
        """
        base_path = Path(base_dir) if base_dir else self.base_dir
        safe_project_name = sanitize_name(project_name)

        date_str = datetime.now().strftime("%Y%m%d")
        project_dir_name = safe_project_name if exact_name else f"{safe_project_name}_{date_str}"
        project_path = base_path / project_dir_name

        if project_path.exists():
            raise FileExistsError(f"Project directory already exists: {project_path}")

        for rel_path in ("assets", "output", SOURCE_DIRNAME):
            (project_path / rel_path).mkdir(parents=True, exist_ok=True)

        # Auto-generate README.md
        readme_path = project_path / "README.md"
        readme_path.write_text(
            f"# {project_name}\n\n"
            f"Created: {date_str}\n\n"
            f"## Directory Structure\n\n"
            f"- `main.typ` — Main presentation entry point (created during theme selection)\n"
            f"- `template.typ` — Theme template file (created during theme selection)\n"
            f"- `assets/` — Images and other media assets\n"
            f"- `output/` — Compiled output (PDF, PNG, PPTX)\n"
            f"- `sources/` — Source reference materials\n",
            encoding="utf-8",
        )

        print(f"Project created: {project_path}")
        return str(project_path)

    def attach_workspace(
        self,
        workspace_path: str,
        *,
        entry: str = "main.typ",
        prepare: bool = False,
    ) -> dict[str, object]:
        """Attach SeaSlides tooling to an existing Typst workspace in place."""
        context = resolve_workspace_context(
            workspace_path,
            entry=entry,
            prepare=prepare,
        )
        return {
            "workspace": str(context.root),
            "entry": context.entry,
            "entry_path": str(context.entry_path),
            "prepared": prepare,
            "assets": str(context.assets_dir),
            "output": str(context.output_dir),
            "sources": str(context.sources_dir),
        }

    # --------------------------------------------------------- source helpers
    def _source_dir(self, project_path: Path) -> Path:
        sources_dir = project_path / SOURCE_DIRNAME
        sources_dir.mkdir(parents=True, exist_ok=True)
        return sources_dir

    def _ensure_unique_path(self, path: Path) -> Path:
        if not path.exists():
            return path
        suffix = path.suffix
        stem = path.stem
        counter = 2
        while True:
            candidate = path.with_name(f"{stem}_{counter}{suffix}")
            if not candidate.exists():
                return candidate
            counter += 1

    def _copy_or_move_file(self, source: Path, destination: Path, move: bool) -> Path:
        try:
            if source.resolve() == destination.resolve():
                return destination
        except FileNotFoundError:
            pass
        destination = self._ensure_unique_path(destination)
        if move:
            shutil.move(str(source), str(destination))
        else:
            shutil.copy2(source, destination)
        return destination

    def _copy_or_move_tree(self, source: Path, destination: Path, move: bool) -> Path:
        try:
            if source.resolve() == destination.resolve():
                return destination
        except FileNotFoundError:
            pass
        destination = self._ensure_unique_path(destination)
        if move:
            shutil.move(str(source), str(destination))
        else:
            shutil.copytree(source, destination)
        return destination

    def _run_tool(self, args: list[str], *, cwd: Path) -> None:
        try:
            result = subprocess.run(
                args,
                cwd=cwd,
                check=True,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
            )
        except FileNotFoundError as exc:
            raise RuntimeError(f"Missing executable: {args[0]}") from exc
        except subprocess.CalledProcessError as exc:
            details = (exc.stderr or exc.stdout or "").strip()
            raise RuntimeError(details or "tool execution failed") from exc

        if result.stdout.strip():
            print(result.stdout.strip())

    # --------------------------------------------------------- converters
    def _import_pdf(
        self,
        pdf_path: Path,
        markdown_path: Path,
        workspace_root: Path,
    ) -> None:
        self._run_tool([
            sys.executable,
            str(TOOLS_DIR / "source_to_md" / "pdf_to_md.py"),
            str(pdf_path), "-o", str(markdown_path),
        ], cwd=workspace_root)

    def _import_doc(
        self,
        doc_path: Path,
        markdown_path: Path,
        workspace_root: Path,
    ) -> None:
        self._run_tool([
            sys.executable,
            str(TOOLS_DIR / "source_to_md" / "doc_to_md.py"),
            str(doc_path), "-o", str(markdown_path),
        ], cwd=workspace_root)

    def _import_presentation(
        self,
        presentation_path: Path,
        markdown_path: Path,
        workspace_root: Path,
    ) -> None:
        self._run_tool([
            sys.executable,
            str(TOOLS_DIR / "source_to_md" / "ppt_to_md.py"),
            str(presentation_path), "-o", str(markdown_path),
        ], cwd=workspace_root)

    def _import_url(
        self,
        url: str,
        markdown_path: Path,
        workspace_root: Path,
    ) -> None:
        # The Python converter owns its curl_cffi -> requests fallback. Do not
        # dispatch to an absent second implementation with different receipts.
        command = [
            sys.executable,
            str(TOOLS_DIR / "source_to_md" / "web_to_md.py"),
            url, "-o", str(markdown_path),
        ]
        self._run_tool(command, cwd=workspace_root)

    def _archive_url_record(self, sources_dir: Path, url: str) -> Path:
        file_path = self._ensure_unique_path(sources_dir / f"{derive_url_basename(url)}.url.txt")
        file_path.write_text(
            f"URL: {url}\nImported: {datetime.now().isoformat(timespec='seconds')}\n",
            encoding="utf-8",
        )
        return file_path

    def _normalize_text_source(self, source_path: Path, sources_dir: Path) -> Path:
        target = self._ensure_unique_path(sources_dir / f"{source_path.stem}.md")
        content = source_path.read_text(encoding="utf-8", errors="replace")
        target.write_text(content, encoding="utf-8")
        return target

    # --------------------------------------------------------- dedup helpers
    def _canonicalize_markdown_content(self, content: str) -> str:
        canonical = content.replace("\r\n", "\n")
        canonical = re.sub(r"(?m)^(\s*Crawled:\s+).*$", r"\1__IGNORED__", canonical)
        canonical = re.sub(r"(?m)^(\s*Imported:\s+).*$", r"\1__IGNORED__", canonical)
        canonical = re.sub(r"([^\s\]()/]+_files)/", "__ASSET_DIR__/", canonical)
        return canonical.strip()

    def _find_equivalent_markdown(self, source_path: Path, sources_dir: Path) -> Path | None:
        source_content = source_path.read_text(encoding="utf-8", errors="replace")
        canonical_source = self._canonicalize_markdown_content(source_content)

        for existing in sorted(sources_dir.iterdir()):
            if existing.suffix.lower() not in {".md", ".markdown"}:
                continue
            try:
                if existing.resolve() == source_path.resolve():
                    continue
            except FileNotFoundError:
                pass
            existing_content = existing.read_text(encoding="utf-8", errors="replace")
            if self._canonicalize_markdown_content(existing_content) == canonical_source:
                return existing
        return None

    def _companion_asset_dir(self, source_path: Path) -> Path | None:
        candidate = source_path.with_name(f"{source_path.stem}_files")
        if candidate.exists() and candidate.is_dir():
            return candidate
        return None

    def _rewrite_markdown_asset_refs(
        self,
        markdown_path: Path,
        original_asset_dirname: str,
        imported_asset_dirname: str,
    ) -> None:
        if original_asset_dirname == imported_asset_dirname:
            return
        content = markdown_path.read_text(encoding="utf-8", errors="replace")
        updated = content.replace(f"{original_asset_dirname}/", f"{imported_asset_dirname}/")
        if updated != content:
            markdown_path.write_text(updated, encoding="utf-8")

    def _import_markdown_with_assets(
        self,
        source_path: Path,
        sources_dir: Path,
        move: bool,
    ) -> tuple[Path, Path | None, str | None]:
        archived_markdown = self._copy_or_move_file(
            source_path, sources_dir / source_path.name, move=move,
        )

        asset_dir = self._companion_asset_dir(source_path)
        if asset_dir is None:
            return archived_markdown, None, None

        imported_asset_dir = self._copy_or_move_tree(
            asset_dir, sources_dir / f"{archived_markdown.stem}_files", move=move,
        )
        self._rewrite_markdown_asset_refs(
            archived_markdown,
            original_asset_dirname=asset_dir.name,
            imported_asset_dirname=imported_asset_dir.name,
        )

        note = None
        if archived_markdown.stem != source_path.stem:
            note = (
                f"{source_path}: renamed imported markdown to {archived_markdown.name} "
                f"and rewrote asset references to {imported_asset_dir.name}/"
            )
        return archived_markdown, imported_asset_dir, note

    # --------------------------------------------------------- import_sources
    def import_sources(
        self,
        project_path: str,
        source_items: list[str],
        move: bool = False,
        copy: bool = False,
    ) -> dict[str, list[str]]:
        """Import source files/URLs into the project sources/ directory.

        Supports: Markdown, PDF, PPTX, DOCX, HTML, URLs (including WeChat).
        Features: deduplication, auto-conversion to Markdown, asset directory handling.
        """
        project_dir = Path(project_path)
        if not project_dir.exists() or not project_dir.is_dir():
            raise FileNotFoundError(f"Project directory not found: {project_dir}")
        if not source_items:
            raise ValueError("At least one source path or URL is required")

        sources_dir = self._source_dir(project_dir)
        summary: dict[str, list[str]] = {
            "archived": [],
            "markdown": [],
            "assets": [],
            "notes": [],
            "skipped": [],
        }
        explicit_markdown_stems = {
            Path(item).stem
            for item in source_items
            if not is_url(item)
            and Path(item).exists()
            and Path(item).is_file()
            and Path(item).suffix.lower() in {".md", ".markdown"}
        }

        for item in source_items:
            # --- URL sources ---
            if is_url(item):
                archived = self._archive_url_record(sources_dir, item)
                markdown_path = self._ensure_unique_path(
                    sources_dir / f"{derive_url_basename(item)}.md"
                )
                try:
                    self._import_url(item, markdown_path, project_dir)
                except Exception as exc:
                    summary["skipped"].append(f"{item}: {exc}")
                    continue
                summary["archived"].append(str(archived))
                summary["markdown"].append(str(markdown_path))
                continue

            # --- File sources ---
            source_path = Path(item)
            if not source_path.exists():
                summary["skipped"].append(f"{item}: path not found")
                continue
            if source_path.is_dir():
                summary["skipped"].append(f"{item}: directories are not supported")
                continue

            # Importing is non-destructive by default. ``--move`` is the only
            # opt-in path that may relocate a user source, including sources
            # that happen to live inside this repository.
            effective_move = move
            suffix = source_path.suffix.lower()

            # Markdown files (with dedup and asset handling)
            if suffix in {".md", ".markdown"}:
                duplicate_markdown = self._find_equivalent_markdown(source_path, sources_dir)
                if duplicate_markdown is not None:
                    summary["markdown"].append(str(duplicate_markdown))
                    summary["notes"].append(
                        f"{item}: skipped duplicate — equivalent content exists as {duplicate_markdown.name}"
                    )
                    continue

                archived_markdown, asset_dir, note = self._import_markdown_with_assets(
                    source_path, sources_dir, move=effective_move,
                )
                summary["archived"].append(str(archived_markdown))
                summary["markdown"].append(str(archived_markdown))
                if asset_dir is not None:
                    summary["assets"].append(str(asset_dir))
                if note:
                    summary["notes"].append(note)
                continue

            # Archive the original file
            archived_path = self._copy_or_move_file(
                source_path, sources_dir / source_path.name, move=effective_move,
            )
            summary["archived"].append(str(archived_path))

            # Auto-convert based on file type
            canonical_markdown_path = sources_dir / f"{archived_path.stem}.md"

            if suffix in PDF_SUFFIXES:
                if archived_path.stem in explicit_markdown_stems:
                    summary["notes"].append(f"{item}: skipped PDF auto-conversion (same-stem Markdown provided)")
                    continue
                if canonical_markdown_path.exists():
                    summary["markdown"].append(str(canonical_markdown_path))
                    summary["notes"].append(f"{item}: skipped PDF auto-conversion ({canonical_markdown_path.name} exists)")
                    continue
                try:
                    self._import_pdf(
                        archived_path,
                        canonical_markdown_path,
                        project_dir,
                    )
                    summary["markdown"].append(str(canonical_markdown_path))
                except Exception as exc:
                    summary["skipped"].append(f"{item}: PDF conversion failed ({exc})")

            elif suffix in PRESENTATION_SUFFIXES:
                if archived_path.stem in explicit_markdown_stems:
                    summary["notes"].append(f"{item}: skipped presentation auto-conversion (same-stem Markdown provided)")
                    continue
                if canonical_markdown_path.exists():
                    summary["markdown"].append(str(canonical_markdown_path))
                    summary["notes"].append(f"{item}: skipped presentation auto-conversion ({canonical_markdown_path.name} exists)")
                    continue
                try:
                    self._import_presentation(
                        archived_path,
                        canonical_markdown_path,
                        project_dir,
                    )
                    summary["markdown"].append(str(canonical_markdown_path))
                except Exception as exc:
                    summary["skipped"].append(f"{item}: presentation conversion failed ({exc})")

            elif suffix in DOC_SUFFIXES:
                if archived_path.stem in explicit_markdown_stems:
                    summary["notes"].append(f"{item}: skipped document auto-conversion (same-stem Markdown provided)")
                    continue
                if canonical_markdown_path.exists():
                    summary["markdown"].append(str(canonical_markdown_path))
                    summary["notes"].append(f"{item}: skipped document auto-conversion ({canonical_markdown_path.name} exists)")
                    continue
                try:
                    self._import_doc(
                        archived_path,
                        canonical_markdown_path,
                        project_dir,
                    )
                    summary["markdown"].append(str(canonical_markdown_path))
                except Exception as exc:
                    summary["skipped"].append(f"{item}: document conversion failed ({exc})")

            elif suffix == ".txt":
                # Check for duplicate content before normalizing
                source_content = source_path.read_text(encoding="utf-8", errors="replace")
                canonical_source = self._canonicalize_markdown_content(source_content)
                duplicate = None
                for existing in sorted(sources_dir.iterdir()):
                    if existing.suffix.lower() not in {".md", ".markdown"}:
                        continue
                    existing_content = existing.read_text(encoding="utf-8", errors="replace")
                    if self._canonicalize_markdown_content(existing_content) == canonical_source:
                        duplicate = existing
                        break
                if duplicate is not None:
                    summary["markdown"].append(str(duplicate))
                    summary["notes"].append(
                        f"{item}: skipped duplicate — equivalent content exists as {duplicate.name}"
                    )
                    continue
                markdown_path = self._normalize_text_source(archived_path, sources_dir)
                summary["markdown"].append(str(markdown_path))

            else:
                summary["notes"].append(f"{item}: archived only, no automatic conversion")

        return summary

    # --------------------------------------------------------- copy-theme
    def copy_theme(self, project_path: str, theme_name: str) -> dict[str, object]:
        """Copy a theme directory into the project.

        Accepts both plain names (e.g. 'aurora') and category-prefixed names
        (e.g. 'user/my-theme', 'custom-plain/aurora', 'custom-rich/corporate', 'custom-canvas/guizang-swiss', 'builtin/metropolis', 'universe/touying-endfield').

        Searches all categories (user, custom-plain, custom-rich, custom-canvas, builtin, universe) and copies
        the theme files into the project root. Existing files are NOT
        overwritten.

        Returns dict with: category, copied (list), skipped (list).
        """
        project_dir = Path(project_path)
        if not project_dir.exists():
            raise FileNotFoundError(f"Project directory not found: {project_dir}")

        themes_root = SKILL_DIR / "templates" / "themes"
        theme_dir = None
        category = None

        # Support "category/name" syntax (e.g. "custom-plain/aurora")
        if "/" in theme_name:
            cat, name = theme_name.split("/", 1)
            candidate = themes_root / cat / name
            if candidate.exists():
                theme_dir = candidate
                category = cat
            else:
                raise FileNotFoundError(
                    f"Theme '{theme_name}' not found at {candidate}"
                )
        else:
            # Search order: user first (most personalized), then custom tiers, builtin, universe
            for cat in ("user", "custom-plain", "custom-rich", "custom-canvas", "builtin", "universe"):
                candidate = themes_root / cat / theme_name
                if candidate.exists():
                    theme_dir = candidate
                    category = cat
                    break

        if theme_dir is None:
            available = {}
            for cat in ("user", "custom-plain", "custom-rich", "custom-canvas", "builtin", "universe"):
                cat_dir = themes_root / cat
                if cat_dir.exists():
                    available[cat] = sorted(d.name for d in cat_dir.iterdir() if d.is_dir())
            lines = []
            for cat, names in available.items():
                lines.append(f"  {cat}: {', '.join(names)}")
            raise FileNotFoundError(
                f"Theme '{theme_name}' not found.\nAvailable themes:\n" + "\n".join(lines)
            )

        copied = []
        skipped = []
        for src_file in sorted(theme_dir.iterdir()):
            if src_file.name.startswith("."):
                continue
            dest = project_dir / src_file.name
            if dest.exists():
                skipped.append(src_file.name)
                continue
            if src_file.is_dir():
                shutil.copytree(src_file, dest)
            else:
                shutil.copy2(src_file, dest)
            copied.append(src_file.name)

        return {"category": category, "copied": copied, "skipped": skipped}

    # --------------------------------------------------------- validate / info
    def validate_project(self, project_path: str) -> tuple[bool, list[str], list[str]]:
        """Validate project structure."""
        return validate_project_structure(project_path)

    def get_project_info_summary(self, project_path: str) -> dict[str, object]:
        """Get a summary of project information."""
        shared = get_project_info(project_path)
        return {
            "name": shared.get("name", Path(project_path).name),
            "path": shared.get("path", str(project_path)),
            "exists": shared.get("exists", False),
            "typ_count": shared.get("typ_count", 0),
            "has_spec": shared.get("has_spec", False),
            "has_source": shared.get("has_source", False),
            "source_count": shared.get("source_count", 0),
            "page_format": shared.get("format_name", "Unknown"),
            "create_date": shared.get("date_formatted", "Unknown"),
        }


# ============================================================
# CLI
# ============================================================

def print_usage() -> None:
    """Print CLI usage information."""
    print(__doc__)


def main() -> None:
    """Run the CLI entry point."""
    if len(sys.argv) < 2:
        print_usage()
        sys.exit(1)

    if len(sys.argv) == 2 and sys.argv[1] in {"-h", "--help"}:
        print_usage()
        return

    command = sys.argv[1]
    manager = ProjectManager()

    try:
        if command == "init":
            if len(sys.argv) < 3:
                raise ValueError("Project name is required")
            project_name = sys.argv[2]
            base_dir = "projects"
            exact_name = False
            i = 3
            while i < len(sys.argv):
                if sys.argv[i] == "--dir":
                    if i + 1 >= len(sys.argv) or sys.argv[i + 1].startswith("-"):
                        raise ValueError("--dir requires a directory path")
                    base_dir = sys.argv[i + 1]
                    i += 2
                elif sys.argv[i] == "--exact-name":
                    exact_name = True
                    i += 1
                else:
                    raise ValueError(f"Unknown init option: {sys.argv[i]}")

            project_path = manager.init_project(
                project_name,
                base_dir=base_dir,
                exact_name=exact_name,
            )
            print(f"[OK] Project initialized: {project_path}")
            print("Next:")
            print("1. Import source files (use import-sources)")
            print("2. Select a theme (Step 3)")
            print("3. Choose Quick Mode or run the Strategist phase (Step 4)")
            return

        if command == "workspace":
            if len(sys.argv) < 3:
                raise ValueError("Workspace path is required")
            workspace_path = sys.argv[2]
            entry = "main.typ"
            prepare = False
            json_output = False
            i = 3
            while i < len(sys.argv):
                if sys.argv[i] == "--entry":
                    if i + 1 >= len(sys.argv) or sys.argv[i + 1].startswith("-"):
                        raise ValueError("--entry requires a workspace-relative .typ path")
                    entry = sys.argv[i + 1]
                    i += 2
                elif sys.argv[i] == "--prepare":
                    prepare = True
                    i += 1
                elif sys.argv[i] == "--json":
                    json_output = True
                    i += 1
                else:
                    raise ValueError(f"Unknown workspace option: {sys.argv[i]}")
            summary = manager.attach_workspace(
                workspace_path,
                entry=entry,
                prepare=prepare,
            )
            if json_output:
                print(json.dumps(summary, ensure_ascii=False, sort_keys=True))
            else:
                print(f"[OK] Workspace attached: {summary['workspace']}")
                print(f"Entry: {summary['entry']}")
                print(f"Prepared: {'yes' if summary['prepared'] else 'no'}")
            return

        if command == "import-sources":
            if len(sys.argv) < 4:
                raise ValueError("Project path and at least one source are required")
            project_path = sys.argv[2]
            move = False
            copy = False
            sources: list[str] = []
            for arg in sys.argv[3:]:
                if arg == "--move":
                    move = True
                elif arg == "--copy":
                    copy = True
                else:
                    sources.append(arg)
            if move and copy:
                raise ValueError("--move and --copy are mutually exclusive")
            # --copy remains as an explicit, backwards-compatible spelling of
            # the default non-destructive behavior.
            if copy:
                move = False

            summary = manager.import_sources(project_path, sources, move=move, copy=copy)
            has_failures = bool(summary["skipped"])
            status = "[WARN] Imported sources with failures into" if has_failures else "[OK] Imported sources into"
            print(f"{status}: {project_path}")
            if summary["archived"]:
                print("\nArchived originals / URL records:")
                for item in summary["archived"]:
                    print(f"  - {item}")
            if summary["markdown"]:
                print("\nNormalized markdown:")
                for item in summary["markdown"]:
                    print(f"  - {item}")
            if summary["assets"]:
                print("\nImported asset directories:")
                for item in summary["assets"]:
                    print(f"  - {item}")
            if summary["notes"]:
                print("\nNotes:")
                for item in summary["notes"]:
                    print(f"  - {item}")
            if summary["skipped"]:
                print("\nSkipped:")
                for item in summary["skipped"]:
                    print(f"  - {item}")
                print("\n[ERROR] One or more requested sources were not imported.")
                sys.exit(1)
            return

        if command == "copy-theme":
            if len(sys.argv) < 4:
                raise ValueError("Project path and theme name are required")
            project_path = sys.argv[2]
            theme_name = sys.argv[3]
            result = manager.copy_theme(project_path, theme_name)
            cat = result["category"]
            display_name = theme_name.split("/")[-1] if "/" in theme_name else theme_name
            if result["copied"]:
                print(f"[OK] Copied {cat} theme '{display_name}' to {project_path}:")
                for f in result["copied"]:
                    print(f"  + {f}")
            if result["skipped"]:
                print(f"\nSkipped (already exist):")
                for f in result["skipped"]:
                    print(f"  - {f}")
            if not result["copied"] and result["skipped"]:
                print(f"\n[WARN] All theme files already exist. No files copied.")
            return

        if command == "validate":
            if len(sys.argv) < 3:
                raise ValueError("Project path is required")
            project_path = sys.argv[2]
            is_valid, errors, warnings = manager.validate_project(project_path)

            print(f"\nProject validation: {project_path}")
            print("=" * 60)
            if errors:
                print("\n[ERROR]")
                for error in errors:
                    print(f"  - {error}")
            if warnings:
                print("\n[WARN]")
                for warning in warnings:
                    print(f"  - {warning}")
            if is_valid and not warnings:
                print("\n[OK] Project structure is complete.")
            elif is_valid:
                print("\n[OK] Project structure is valid, with warnings.")
            else:
                print("\n[ERROR] Project structure is invalid.")
                sys.exit(1)
            return

        if command == "info":
            if len(sys.argv) < 3:
                raise ValueError("Project path is required")
            project_path = sys.argv[2]
            info = manager.get_project_info_summary(project_path)

            print(f"\nProject info: {info['name']}")
            print("=" * 60)
            print(f"Path: {info['path']}")
            print(f"Exists: {'Yes' if info['exists'] else 'No'}")
            print(f"Typst files: {info['typ_count']}")
            print(f"Design spec: {'Yes' if info['has_spec'] else 'No'}")
            print(f"Source materials: {'Yes' if info['has_source'] else 'No'}")
            print(f"Source count: {info['source_count']}")
            print(f"Page format: {info['page_format']}")
            print(f"Created: {info['create_date']}")
            return

        raise ValueError(f"Unknown command: {command}")
    except Exception as exc:
        print(f"[ERROR] {exc}")
        print_usage()
        sys.exit(1)


if __name__ == "__main__":
    main()
