#!/usr/bin/env python3
"""
Typst Compiler

Compiles Typst presentation files to PDF, PNG, PPTX, or overview grid image.
Runs independently — no dependency on project_utils.

Usage:
    python3 typst_compiler.py <project_path> --format pdf
    python3 typst_compiler.py <project_path> --format png --ppi 144
    python3 typst_compiler.py <project_path> --format pptx
    python3 typst_compiler.py <project_path> --format overview
    python3 typst_compiler.py <project_path> --all
    python3 typst_compiler.py <project_path> --format png --entry demo.typ
"""

import argparse
import datetime as dt
import hashlib
import json
import os
import re
import shutil
import sys
import tempfile
from pathlib import Path
from typing import List, Optional

from workspace_context import resolve_workspace_context


def _configure_utf8_stdio() -> None:
    """Avoid Windows console encoding crashes when diagnostics contain Unicode."""
    for stream_name in ("stdout", "stderr"):
        stream = getattr(sys, stream_name, None)
        if stream is None or not hasattr(stream, "reconfigure"):
            continue
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")
        except Exception:
            pass


_configure_utf8_stdio()

try:
    import typst
except ImportError:
    print("Error: typst Python package not found.")
    print("Install with: pip install typst")
    sys.exit(1)


# ============================================================
# Core compilation functions
# ============================================================


def _write_bytes_atomic(data: bytes, output_path: Path) -> None:
    """Publish bytes only after a complete write in the target directory."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=".%s." % output_path.name,
        suffix=".tmp",
        dir=str(output_path.parent),
    )
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, output_path)
    finally:
        if temporary.exists():
            temporary.unlink()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _write_compile_manifest(
    project_path: Path,
    entry_path: Path,
    results: dict,
) -> str:
    """Record one successful canonical ``--all`` publication."""
    artifact_paths = [Path(results["pdf"]), Path(results["overview"])]
    artifact_paths.extend(Path(item) for item in results["png"])
    artifacts = []
    for artifact in artifact_paths:
        artifacts.append(
            {
                "path": str(artifact.relative_to(project_path)),
                "size": artifact.stat().st_size,
                "sha256": _sha256_file(artifact),
            }
        )
    payload = {
        "schema_version": 1,
        "tool": "typst_compiler.py",
        "completed_at": dt.datetime.now().astimezone().isoformat(),
        "entry": str(entry_path.relative_to(project_path)),
        "entry_sha256": _sha256_file(entry_path),
        "page_count": len(results["png"]),
        "artifacts": artifacts,
    }
    manifest = project_path / "output" / "compile-manifest.json"
    _write_bytes_atomic(
        (json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n").encode("utf-8"),
        manifest,
    )
    print(f"Manifest: {manifest}")
    return str(manifest)


def compile_to_pdf(main_typ: Path, output_path: Path) -> str:
    """Compile Typst file to PDF."""
    try:
        generated = typst.compile(str(main_typ), format="pdf")
        if not isinstance(generated, bytes) or not generated:
            raise OSError("Typst produced no PDF bytes")
        _write_bytes_atomic(generated, output_path)
    except typst.TypstError as exc:
        print(f"Error compiling to PDF: {exc.message}")
        print(exc.diagnostic)
        if exc.hints:
            print(f"Hints: {exc.hints}")
        if exc.trace:
            print(f"Trace: {exc.trace}")
        sys.exit(1)
    except OSError as exc:
        print(f"Error writing PDF {output_path}: {exc}")
        sys.exit(1)
    except Exception as exc:
        print(f"Error compiling PDF: {exc}")
        sys.exit(1)
    print(f"PDF: {output_path}")
    return str(output_path)


def compile_to_png(main_typ: Path, output_path: Path, ppi: float = 144.0) -> List[str]:
    """
    Compile Typst file to PNG images (one per page).

    output_path should contain {n} as page number placeholder,
    e.g. 'output/pngs/slide_{n}.png'.
    """
    # Generate outside the live directory.  A failed compile must not erase a
    # previously usable slide set, and files such as notes.png are user-owned.
    pngs_dir = output_path.parent
    try:
        pngs_dir.mkdir(parents=True, exist_ok=True)
        temp_dir = Path(tempfile.mkdtemp(prefix=".typst-png-", dir=str(pngs_dir.parent)))
    except OSError as exc:
        print(f"Error preparing PNG output directory {pngs_dir}: {exc}")
        sys.exit(1)
    temp_pattern = temp_dir / output_path.name
    try:
        typst.compile(str(main_typ), output=str(temp_pattern), format="png", ppi=ppi)
    except typst.TypstError as exc:
        print(f"Error compiling to PNG: {exc.message}")
        print(exc.diagnostic)
        if exc.hints:
            print(f"Hints: {exc.hints}")
        if exc.trace:
            print(f"Trace: {exc.trace}")
        shutil.rmtree(temp_dir, ignore_errors=True)
        sys.exit(1)
    except OSError as exc:
        print(f"Error compiling PNGs: {exc}")
        shutil.rmtree(temp_dir, ignore_errors=True)
        sys.exit(1)
    except Exception as exc:
        print(f"Error compiling PNGs: {exc}")
        shutil.rmtree(temp_dir, ignore_errors=True)
        sys.exit(1)

    page_files = _collect_generated_pngs(temp_pattern)
    if not page_files:
        print("Error compiling PNGs: Typst produced no pages; existing PNGs were preserved")
        shutil.rmtree(temp_dir, ignore_errors=True)
        sys.exit(1)

    backups_dir = temp_dir / "previous"
    moved_old: List[tuple[Path, Path]] = []
    published_new: List[Path] = []
    try:
        backups_dir.mkdir()
        # Only files matching this compiler's configured pattern are managed.
        for old_png in _collect_generated_pngs(output_path):
            backup = backups_dir / old_png.name
            os.replace(old_png, backup)
            moved_old.append((backup, old_png))
        for new_png in page_files:
            published = pngs_dir / new_png.name
            os.replace(new_png, published)
            published_new.append(published)
    except OSError as exc:
        # Restore the old complete set if publication fails part-way through.
        for new_png in published_new:
            try:
                new_png.unlink()
            except OSError:
                pass
        for backup, original in moved_old:
            try:
                os.replace(backup, original)
            except OSError:
                pass
        print(f"Error publishing PNGs; previous PNGs were restored where possible: {exc}")
        shutil.rmtree(temp_dir, ignore_errors=True)
        sys.exit(1)
    shutil.rmtree(temp_dir, ignore_errors=True)
    page_files = _collect_generated_pngs(output_path)
    print(f"PNG: {len(page_files)} page(s) at {ppi} PPI → {output_path.parent}/")
    return [str(p) for p in page_files]


def compile_to_pptx(main_typ: Path, output_path: Path, root: Path = None, force: bool = False) -> str:
    """
    Export Typst presentation to PPTX via typ2pptx Python API.

    Includes a timestamp-based protection mechanism:
    - After generating a PPTX, writes a .pptx_timestamp file recording the mtime.
    - On subsequent runs, if the PPTX exists and its mtime differs from the
      recorded timestamp (i.e. user edited it externally), refuses to overwrite
      unless --force is passed.
    - If mtime matches the timestamp, overwrites automatically.

    Requires: pip install typ2pptx
    """
    try:
        from typ2pptx.core import converter as typ2pptx_converter
    except ImportError:
        print("Error: typ2pptx not found. Install with: pip install typ2pptx")
        sys.exit(1)

    original_subprocess = typ2pptx_converter.subprocess

    def run_with_utf8(*args, **kwargs):
        if kwargs.get("text") or kwargs.get("universal_newlines"):
            kwargs.setdefault("encoding", "utf-8")
            kwargs.setdefault("errors", "replace")
        return original_subprocess.run(*args, **kwargs)

    class Utf8SubprocessProxy:
        """Override run() without mutating the shared subprocess module."""

        run = staticmethod(run_with_utf8)

        def __getattr__(self, name):
            return getattr(original_subprocess, name)

    try:
        output_path.parent.mkdir(parents=True, exist_ok=True)
    except OSError as exc:
        print(f"Error preparing PPTX output directory {output_path.parent}: {exc}")
        sys.exit(1)
    timestamp_path = output_path.with_name(f".{output_path.name}_timestamp")

    # Never overwrite a pre-existing presentation without provenance.  A missing
    # or malformed sidecar means we cannot establish that this tool owns it.
    if output_path.exists():
        if not timestamp_path.exists():
            if not force:
                print(f"Error: {output_path.name} already exists but has no compiler timestamp. "
                      "Refusing to overwrite an untracked PPTX; use --force after checking it.")
                sys.exit(1)
            print(f"Warning: Overwriting untracked {output_path.name} (--force)")
        else:
            try:
                recorded_mtime = float(timestamp_path.read_text().strip())
                actual_mtime = output_path.stat().st_mtime
            except (OSError, ValueError) as exc:
                if not force:
                    print(f"Error: cannot verify {output_path.name} timestamp ({exc}). "
                          "Refusing to overwrite; use --force after checking it.")
                    sys.exit(1)
                print(f"Warning: Overwriting {output_path.name} with an unreadable timestamp (--force)")
            else:
                if abs(actual_mtime - recorded_mtime) > 0.01:
                    if not force:
                        import datetime
                        recorded_time = datetime.datetime.fromtimestamp(recorded_mtime).strftime("%Y-%m-%d %H:%M:%S")
                        actual_time = datetime.datetime.fromtimestamp(actual_mtime).strftime("%Y-%m-%d %H:%M:%S")
                        print(f"Error: {output_path.name} has been modified externally. "
                              "You need to check whether it is safe to overwrite.")
                        print(f"  Generated at: {recorded_time}")
                        print(f"  Modified at:  {actual_time}")
                        print(f"  Use --force to overwrite.")
                        sys.exit(1)
                    print(f"Warning: Overwriting externally modified {output_path.name} (--force)")

    temporary_pptx: Optional[Path] = None
    try:
        descriptor, temporary_name = tempfile.mkstemp(
            prefix=".%s." % output_path.name,
            suffix=".pptx",
            dir=str(output_path.parent),
        )
        os.close(descriptor)
        temporary_pptx = Path(temporary_name)
        temporary_pptx.unlink()
        # Older typ2pptx releases leave subprocess decoding to the host locale.
        # Keep the compatibility wrapper scoped to the conversion call so an
        # earlier overwrite-protection exit cannot leak global monkeypatches.
        typ2pptx_converter.subprocess = Utf8SubprocessProxy()
        try:
            typ2pptx_converter.convert_typst_to_pptx(
                str(main_typ),
                str(temporary_pptx),
                root=str(root) if root else None,
            )
        finally:
            typ2pptx_converter.subprocess = original_subprocess
        if not temporary_pptx.is_file() or temporary_pptx.stat().st_size < 1:
            raise OSError("typ2pptx produced no presentation file")
        os.replace(temporary_pptx, output_path)
        # Write timestamp after successful generation
        new_mtime = output_path.stat().st_mtime
        timestamp_path.write_text(str(new_mtime))
        print(f"PPTX: {output_path}")
        return str(output_path)
    except Exception as exc:
        print(f"Error: typ2pptx failed: {exc}")
        sys.exit(1)
    finally:
        if temporary_pptx is not None and temporary_pptx.exists():
            temporary_pptx.unlink()


def compile_to_overview(
    main_typ: Path,
    output_path: Path,
    max_width: int = 2000,
    max_height: int = 2000,
) -> str:
    """
    Compile slides and stitch into a single overview grid image for LLM visual review.

    Always produces exactly one overview.png. Dynamically adjusts columns and PPI
    to keep the output within max_width x max_height pixels, ensuring:
    - Each thumbnail is large enough to check layout/overflow (min ~300px wide)
    - Total image stays within LLM vision model limits

    All processing happens in memory — no temporary files needed.
    """
    try:
        from PIL import Image
    except ImportError:
        print("Error: Pillow not found. Install with: pip install Pillow")
        sys.exit(1)

    import io
    import math

    try:
        output_path.parent.mkdir(parents=True, exist_ok=True)
    except OSError as exc:
        print(f"Error preparing overview output directory {output_path.parent}: {exc}")
        sys.exit(1)

    # Compile at a moderate PPI first just to count pages
    probe_ppi = 36.0
    try:
        result = typst.compile(str(main_typ), format="png", ppi=probe_ppi)
    except typst.TypstError as exc:
        print(f"Error compiling overview (probe): {exc.message}")
        print(exc.diagnostic)
        if exc.hints:
            print(f"Hints: {exc.hints}")
        if exc.trace:
            print(f"Trace: {exc.trace}")
        sys.exit(1)
    except Exception as exc:
        print(f"Error compiling overview (probe): {exc}")
        sys.exit(1)
    if result is None:
        print("Error: No pages compiled for overview")
        sys.exit(1)

    if isinstance(result, bytes):
        page_bytes_list = [result]
    else:
        page_bytes_list = list(result)

    total_pages = len(page_bytes_list)
    if total_pages == 0:
        print("Error: No pages compiled for overview")
        sys.exit(1)

    if total_pages == 1:
        try:
            single_page = Image.open(io.BytesIO(page_bytes_list[0])).convert("RGB")
            single_page.thumbnail((max_width, max_height), Image.Resampling.LANCZOS)
            encoded = io.BytesIO()
            single_page.save(encoded, "PNG")
            _write_bytes_atomic(encoded.getvalue(), output_path)
        except OSError as exc:
            print(f"Error writing overview {output_path}: {exc}")
            sys.exit(1)
        print(f"Overview: 1 page → {output_path}")
        return str(output_path)

    # Measure actual page dimensions from the probe compilation
    probe_img = Image.open(io.BytesIO(page_bytes_list[0]))
    probe_page_w, probe_page_h = probe_img.width, probe_img.height

    # Find optimal columns and scale factor based on actual pixel sizes
    GUTTER = 8
    try:
        best_columns, scale = _find_best_grid_layout(
            total_pages, probe_page_w, probe_page_h, GUTTER, max_width, max_height,
        )
    except ValueError as exc:
        print(f"Error: {exc}")
        sys.exit(1)
    target_ppi = probe_ppi * scale

    # Re-compile at the target PPI if scale differs significantly
    if abs(scale - 1.0) > 0.05:
        try:
            result = typst.compile(str(main_typ), format="png", ppi=target_ppi)
        except typst.TypstError as exc:
            print(f"Error compiling overview (target): {exc.message}")
            print(exc.diagnostic)
            if exc.hints:
                print(f"Hints: {exc.hints}")
            if exc.trace:
                print(f"Trace: {exc.trace}")
            sys.exit(1)
        except Exception as exc:
            print(f"Error compiling overview (target): {exc}")
            sys.exit(1)
        if isinstance(result, bytes):
            page_bytes_list = [result]
        else:
            page_bytes_list = list(result)
        if not page_bytes_list:
            print("Error: No pages compiled for overview")
            sys.exit(1)

    # Stitch to a sibling temporary file, then publish atomically.
    temporary_overview: Optional[Path] = None
    try:
        descriptor, temporary_name = tempfile.mkstemp(
            prefix=".%s." % output_path.name,
            suffix=".png",
            dir=str(output_path.parent),
        )
        os.close(descriptor)
        temporary_overview = Path(temporary_name)
        _stitch_overview_grid(page_bytes_list, temporary_overview, best_columns, GUTTER)
        os.replace(temporary_overview, output_path)
    except Exception as exc:
        print(f"Error writing overview {output_path}: {exc}")
        sys.exit(1)
    finally:
        if temporary_overview is not None and temporary_overview.exists():
            temporary_overview.unlink()

    info = Image.open(output_path)
    megapixels = info.width * info.height / 1_000_000
    print(
        f"Overview: {total_pages} pages ({best_columns}col) → {output_path} "
        f"({info.width}x{info.height}, {megapixels:.1f}MP, {target_ppi:.0f}ppi)"
    )
    return str(output_path)


def _find_best_grid_layout(
    total_pages: int,
    probe_page_w: int,
    probe_page_h: int,
    gutter: int,
    max_width: int,
    max_height: int,
) -> tuple:
    """
    Find the best (columns, scale_factor) that:
    1. Strictly fits within max_width x max_height
    2. Maximizes thumbnail size for readability

    Uses actual probe pixel dimensions (not inch-based estimates) to avoid
    mismatch between calculated and real typst output sizes.

    Returns (columns, scale) where scale is relative to probe PPI.
    """
    import math

    best_columns = 3
    best_scale = 1.0
    best_thumb_w = 0

    for columns in range(2, min(total_pages + 1, 7)):
        rows = math.ceil(total_pages / columns)

        # Max scale from width constraint
        available_w = max_width - (columns + 1) * gutter
        scale_from_w = available_w / (columns * probe_page_w)

        # Max scale from height constraint
        available_h = max_height - (rows + 1) * gutter
        scale_from_h = available_h / (rows * probe_page_h)

        # Strictly respect both constraints
        scale = min(scale_from_w, scale_from_h, 2.0)  # Cap at 2x probe
        thumb_w = probe_page_w * scale

        if thumb_w > best_thumb_w:
            best_thumb_w = thumb_w
            best_columns = columns
            best_scale = scale

    if best_scale <= 0:
        raise ValueError("Overview bounds are too small for the requested page grid")

    return best_columns, best_scale


def _stitch_overview_grid(
    page_bytes_list: list,
    output_path: Path,
    columns: int,
    gutter: int,
) -> None:
    """Stitch a list of PNG byte buffers into a single grid image."""
    from PIL import Image
    import io

    BACKGROUND = (200, 200, 200)

    images = [Image.open(io.BytesIO(b)).convert("RGB") for b in page_bytes_list]
    page_w = max(img.width for img in images)
    page_h = max(img.height for img in images)
    rows = (len(images) + columns - 1) // columns
    canvas_w = columns * page_w + (columns + 1) * gutter
    canvas_h = rows * page_h + (rows + 1) * gutter
    canvas = Image.new("RGB", (canvas_w, canvas_h), BACKGROUND)

    for idx, img in enumerate(images):
        row, col = divmod(idx, columns)
        x = gutter + col * (page_w + gutter) + (page_w - img.width) // 2
        y = gutter + row * (page_h + gutter) + (page_h - img.height) // 2
        canvas.paste(img, (x, y))

    canvas.save(str(output_path), "PNG")

    return str(output_path)


# ============================================================
# Helpers
# ============================================================

def _collect_generated_pngs(pattern: Path) -> List[Path]:
    """
    Collect PNG files generated by typst.compile() from a {n} pattern.

    typst.compile() writes files to disk and returns None when output is specified.
    This function globs the parent directory to find the generated files.
    """
    parent = pattern.parent
    # Pattern like ``slide_{n}.png`` becomes a numeric full-match. This avoids
    # claiming or deleting user files such as ``slide_notes.png``.
    escaped_name = re.escape(pattern.name).replace(re.escape("{n}"), r"(\d+)")
    page_name = re.compile(r"^%s$" % escaped_name)
    numbered = []
    for candidate in parent.iterdir() if parent.is_dir() else []:
        match = page_name.fullmatch(candidate.name)
        if match and candidate.is_file():
            numbered.append((int(match.group(1)), candidate))
    return [candidate for _, candidate in sorted(numbered)]


# ============================================================
# Project-level compilation
# ============================================================

def compile_project(
    project_path: Path,
    output_format: str = "pdf",
    output_path: Optional[str] = None,
    ppi: float = 144.0,
    max_width: int = 2000,
    max_height: int = 2000,
    force: bool = False,
    entry: str = "main.typ",
) -> dict:
    """
    Compile a Typst project to the specified format(s).

    Args:
        project_path: Project directory containing the entry file
        output_format: 'pdf', 'png', 'pptx', 'overview', or 'all'
        output_path: Custom output path (optional)
        ppi: Pixels per inch for PNG output
        max_width: Max overview image width in pixels
        max_height: Max overview image height in pixels
        force: Force overwrite externally modified PPTX files
        entry: Entry .typ file name (default: main.typ)

    Returns:
        Dictionary mapping format names to output paths
    """
    context = resolve_workspace_context(project_path, entry=entry)
    project_path = context.root
    main_typ = context.entry_path
    output_dir = context.output_dir
    results = {}

    if output_format == "all":
        # --all generates PDF, PNG, and overview. PPTX is excluded by default
        # because it is a final export step that should run after all reviews.
        formats = ["pdf", "png", "overview"]
    else:
        formats = [output_format]

    for fmt in formats:
        if fmt == "pdf":
            target = Path(output_path) if output_path and len(formats) == 1 else output_dir / "slides.pdf"
            results["pdf"] = compile_to_pdf(main_typ, target)
        elif fmt == "png":
            target = Path(output_path) if output_path and len(formats) == 1 else output_dir / "pngs" / "slide_{n}.png"
            results["png"] = compile_to_png(main_typ, target, ppi=ppi)
        elif fmt == "pptx":
            target = Path(output_path) if output_path and len(formats) == 1 else output_dir / "slides.pptx"
            results["pptx"] = compile_to_pptx(main_typ, target, root=project_path, force=force)
        elif fmt == "overview":
            target = Path(output_path) if output_path and len(formats) == 1 else output_dir / "overview.png"
            results["overview"] = compile_to_overview(main_typ, target, max_width=max_width, max_height=max_height)

    if output_format == "all" and output_path is None:
        try:
            results["manifest"] = _write_compile_manifest(project_path, main_typ, results)
        except (OSError, ValueError) as exc:
            print(f"Error writing compile manifest: {exc}")
            sys.exit(1)

    return results


def main():
    parser = argparse.ArgumentParser(
        description="Compile Typst presentation files to PDF, PNG, PPTX, or overview grid",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 typst_compiler.py ./my-project --all              # PDF + PNG + overview
  python3 typst_compiler.py ./my-project --format pdf
  python3 typst_compiler.py ./my-project --format png --ppi 144
  python3 typst_compiler.py ./my-project --format pptx      # Final export (after review)
  python3 typst_compiler.py ./my-project --format pptx --force  # Overwrite modified PPTX
  python3 typst_compiler.py ./my-project --format overview
  python3 typst_compiler.py ./my-project --format png --entry demo.typ  # Theme dev
        """,
    )

    parser.add_argument(
        "project_path",
        help="Path to the project directory containing the entry .typ file",
    )
    parser.add_argument(
        "--format", "-f",
        choices=["pdf", "png", "pptx", "overview", "all"],
        default="pdf",
        help="Output format (default: pdf)",
    )
    parser.add_argument(
        "--output", "-o",
        help="Output path (for single format only)",
        default=None,
    )
    parser.add_argument(
        "--ppi",
        type=float,
        default=144.0,
        help="Pixels per inch for PNG output (default: 144)",
    )
    parser.add_argument(
        "--max-width",
        type=int,
        default=2000,
        help="Max overview image width in pixels (default: 2000)",
    )
    parser.add_argument(
        "--max-height",
        type=int,
        default=2000,
        help="Max overview image height in pixels (default: 2000)",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Force overwrite externally modified PPTX files",
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Compile to PDF, PNG, and overview (excludes PPTX — use --format pptx separately)",
    )
    parser.add_argument(
        "--entry",
        default="main.typ",
        help="Entry .typ file name (default: main.typ). Use --entry demo.typ for theme development.",
    )

    args = parser.parse_args()

    if args.ppi <= 0:
        parser.error("--ppi must be greater than zero")
    if args.max_width <= 0 or args.max_height <= 0:
        parser.error("--max-width and --max-height must be greater than zero")

    format_was_supplied = any(
        arg == "--format" or arg == "-f" or arg.startswith("--format=")
        or (arg.startswith("-f") and not arg.startswith("--"))
        for arg in sys.argv[1:]
    )
    if args.all and format_was_supplied:
        parser.error("--all cannot be combined with --format; use one selection mechanism")
    if (args.all or args.format == "all") and args.output:
        parser.error("--output is only supported for a single --format, not all formats")

    project_path = Path(args.project_path).expanduser().resolve()
    if not project_path.exists():
        print(f"Error: Project directory not found: {project_path}")
        sys.exit(1)

    output_format = "all" if args.all else args.format
    results = compile_project(
        project_path, output_format, args.output, args.ppi,
        max_width=args.max_width, max_height=args.max_height,
        force=args.force, entry=args.entry,
    )

    format_count = len([key for key in results if key != "manifest"])
    if format_count > 1:
        print(f"\nAll {format_count} format(s) compiled successfully!")


if __name__ == "__main__":
    main()
