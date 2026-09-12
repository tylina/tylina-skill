#!/usr/bin/env python3
"""
Document to Markdown Converter (hybrid Python + Pandoc fallback)

Primary formats (pure Python, no external tools required):
    .docx   → mammoth
    .html   → markdownify + BeautifulSoup
    .epub   → ebooklib + markdownify
    .ipynb  → nbconvert

Fallback formats (require pandoc installed):
    .doc .odt .rtf .tex .latex .rst .org .typ

All paths produce the same output convention:
    <input>.md                     Markdown file
    <input>_files/<asset>          Extracted media (relative references in MD)
"""

from __future__ import annotations

import argparse
import base64
import mimetypes
import re
import shutil
import subprocess
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse

_SOURCE_TO_MD_DIR = Path(__file__).resolve().parent
if str(_SOURCE_TO_MD_DIR) not in sys.path:
    sys.path.insert(0, str(_SOURCE_TO_MD_DIR))

from conversion_receipt import (  # noqa: E402
    ConversionReceiptError,
    clear_receipts,
    OutputTransaction,
    snapshot_source,
    validate_markdown_output,
    write_success_receipt,
)

CONVERTER_VERSION = "1.0.0"

# ─────────────────────────────────────────────────────────────
# Format registry
# ─────────────────────────────────────────────────────────────

# Formats handled by pure-Python paths
NATIVE_FORMATS = {".docx", ".html", ".htm", ".epub", ".ipynb"}

# Formats handled by pandoc fallback: suffix → (pandoc input format, description)
PANDOC_FORMATS = {
    ".doc":   ("doc",    "Microsoft Word 97-2003"),
    ".odt":   ("odt",    "OpenDocument Text"),
    ".rtf":   ("rtf",    "Rich Text Format"),
    ".tex":   ("latex",  "LaTeX"),
    ".latex": ("latex",  "LaTeX"),
    ".rst":   ("rst",    "reStructuredText"),
    ".org":   ("org",    "Emacs Org-mode"),
    ".typ":   ("typst",  "Typst"),
}

# Formats pandoc should extract embedded media from
PANDOC_MEDIA_FORMATS = {".odt"}


# ─────────────────────────────────────────────────────────────
# Shared helpers
# ─────────────────────────────────────────────────────────────

def _format_size(size: int) -> str:
    for unit in ("B", "KB", "MB"):
        if size < 1024:
            return f"{size:.0f} {unit}"
        size /= 1024
    return f"{size:.1f} GB"


def _ensure_media_dir(out_file: Path) -> tuple[Path, str]:
    """Return (absolute media dir, relative dir name) and create the dir."""
    rel_media_dir = f"{out_file.stem}_files"
    media_dir = out_file.parent / rel_media_dir
    media_dir.mkdir(parents=True, exist_ok=True)
    return media_dir, rel_media_dir


_HTML_IMG_PATTERNS = (
    re.compile(
        r'<img\s[^>]*?src="(?P<src>[^"]+)"[^>]*?(?:alt="(?P<alt>[^"]*)")?[^>]*/?\s*>'
    ),
    re.compile(
        r'<img\s[^>]*?alt="(?P<alt>[^"]*)"[^>]*?src="(?P<src>[^"]+)"[^>]*/?\s*>'
    ),
)


def _html_img_to_md(markdown_content: str) -> str:
    """Convert any leftover <img> HTML tags to ![alt](src) syntax."""
    def _repl(match: re.Match[str]) -> str:
        src = match.group("src")
        alt = match.group("alt") or Path(src).stem
        return f"![{alt}]({src})"

    for pattern in _HTML_IMG_PATTERNS:
        markdown_content = pattern.sub(_repl, markdown_content)
    return markdown_content


def _report_result(
    out_file: Path,
    media_dir: Path | None,
    warnings: list[str] | None = None,
) -> None:
    size = out_file.stat().st_size
    label = "[WARN]" if warnings else "[OK]"
    detail = f" with {len(warnings)} warning(s)" if warnings else ""
    print(f"{label} Saved Markdown{detail} to: {out_file} ({_format_size(size)})")
    if media_dir and media_dir.exists():
        files = [f for f in media_dir.rglob("*") if f.is_file()]
        if files:
            print(f"   Extracted {len(files)} media file(s) → {media_dir}")


# ─────────────────────────────────────────────────────────────
# DOCX → Markdown (mammoth)
# ─────────────────────────────────────────────────────────────

def _convert_docx(
    input_file: Path,
    out_file: Path,
    warnings: list[str] | None = None,
) -> str:
    try:
        import mammoth
    except ImportError:
        print("[ERROR] mammoth not installed. Run: pip install mammoth")
        return ""

    media_dir, rel_media_dir = _ensure_media_dir(out_file)
    counter = {"n": 0}

    def _save_image(image):
        counter["n"] += 1
        ext = mimetypes.guess_extension(image.content_type) or ".bin"
        # Normalize common JPEG extension
        if ext == ".jpe":
            ext = ".jpg"
        filename = f"image_{counter['n']:03d}{ext}"
        with image.open() as stream:
            (media_dir / filename).write_bytes(stream.read())
        return {"src": f"{rel_media_dir}/{filename}"}

    with input_file.open("rb") as f:
        result = mammoth.convert_to_markdown(
            f,
            convert_image=mammoth.images.img_element(_save_image),
        )

    markdown = _html_img_to_md(result.value)
    out_file.write_text(markdown, encoding="utf-8")

    if not any(media_dir.iterdir()):
        media_dir.rmdir()
        media_dir = None  # type: ignore[assignment]

    for msg in result.messages:
        if msg.type == "warning":
            print(f"   [warn] {msg.message}")
            if warnings is not None:
                warnings.append(f"mammoth: {msg.message}")

    return markdown


# ─────────────────────────────────────────────────────────────
# HTML → Markdown (markdownify + BeautifulSoup)
# ─────────────────────────────────────────────────────────────

def _save_data_uri(
    data_uri: str,
    media_dir: Path,
    index: int,
    warnings: list[str] | None = None,
) -> str | None:
    """Decode data:image/...;base64,... into a file; return filename or None."""
    match = re.match(r"data:(?P<mime>[^;]+);base64,(?P<data>.+)", data_uri)
    if not match:
        return None
    mime = match.group("mime")
    ext = mimetypes.guess_extension(mime) or ".bin"
    if ext == ".jpe":
        ext = ".jpg"
    filename = f"image_{index:03d}{ext}"
    try:
        (media_dir / filename).write_bytes(base64.b64decode(match.group("data")))
    except Exception as exc:
        if warnings is not None:
            warnings.append(f"Embedded image {index} could not be decoded: {exc}")
        return None
    return filename


def _copy_local_image(
    src: str,
    base_dir: Path,
    media_dir: Path,
    index: int,
    warnings: list[str] | None = None,
) -> str | None:
    """Copy a local image (relative or file://) into media_dir."""
    parsed = urlparse(src)
    if parsed.scheme in ("http", "https"):
        return None
    path_str = unquote(parsed.path if parsed.scheme == "file" else src)
    candidate = Path(path_str)
    if not candidate.is_absolute():
        candidate = (base_dir / candidate).resolve()
    if not candidate.is_file():
        if warnings is not None:
            warnings.append(f"Local image was not found and was left unresolved: {src}")
        return None
    ext = candidate.suffix or ".bin"
    filename = f"image_{index:03d}{ext}"
    shutil.copy2(candidate, media_dir / filename)
    return filename


def _download_remote_image(
    url: str,
    media_dir: Path,
    index: int,
    warnings: list[str] | None = None,
) -> str | None:
    """Best-effort download of a remote image, recording degradation."""
    try:
        import requests
    except ImportError:
        if warnings is not None:
            warnings.append("Remote images were not downloaded because requests is unavailable")
        return None
    try:
        resp = requests.get(url, timeout=10, stream=True)
        resp.raise_for_status()
    except Exception as exc:
        if warnings is not None:
            warnings.append(f"Remote image was not downloaded: {url} ({exc})")
        return None
    content_type = resp.headers.get("Content-Type", "").split(";")[0].strip()
    ext = mimetypes.guess_extension(content_type) if content_type else None
    if not ext:
        ext = Path(urlparse(url).path).suffix or ".bin"
    if ext == ".jpe":
        ext = ".jpg"
    filename = f"image_{index:03d}{ext}"
    (media_dir / filename).write_bytes(resp.content)
    return filename


def _process_html_images(
    html: str,
    base_dir: Path,
    media_dir: Path,
    rel_media_dir: str,
    warnings: list[str] | None = None,
) -> str:
    """Extract & rewrite all <img> srcs in an HTML string."""
    try:
        from bs4 import BeautifulSoup
    except ImportError:
        print("[ERROR] beautifulsoup4 not installed. Run: pip install beautifulsoup4")
        return html

    soup = BeautifulSoup(html, "html.parser")
    index = 0
    for img in soup.find_all("img"):
        src = img.get("src", "")
        if not src:
            continue
        index += 1
        if src.startswith("data:"):
            filename = _save_data_uri(src, media_dir, index, warnings)
        elif urlparse(src).scheme in ("http", "https"):
            filename = _download_remote_image(src, media_dir, index, warnings)
        else:
            filename = _copy_local_image(src, base_dir, media_dir, index, warnings)
        if filename:
            img["src"] = f"{rel_media_dir}/{filename}"
    return str(soup)


def _convert_html(
    input_file: Path,
    out_file: Path,
    warnings: list[str] | None = None,
) -> str:
    try:
        from markdownify import markdownify
    except ImportError:
        print("[ERROR] markdownify not installed. Run: pip install markdownify")
        return ""

    try:
        from bs4 import BeautifulSoup
    except ImportError:
        print("[ERROR] beautifulsoup4 not installed. Run: pip install beautifulsoup4")
        return ""

    media_dir, rel_media_dir = _ensure_media_dir(out_file)
    raw_html = input_file.read_text(encoding="utf-8", errors="replace")

    # Strip non-content elements (head/style/script) so metadata doesn't leak into MD
    soup = BeautifulSoup(raw_html, "html.parser")
    for tag in soup(["head", "style", "script", "noscript"]):
        tag.decompose()
    html = str(soup)
    html = _process_html_images(
        html, input_file.parent, media_dir, rel_media_dir, warnings
    )

    markdown = markdownify(html, heading_style="ATX", bullets="-")
    # Collapse 3+ blank lines to 2 for tidier output
    markdown = re.sub(r"\n{3,}", "\n\n", markdown).strip() + "\n"
    out_file.write_text(markdown, encoding="utf-8")

    if not any(media_dir.iterdir()):
        media_dir.rmdir()
        media_dir = None  # type: ignore[assignment]

    return markdown


# ─────────────────────────────────────────────────────────────
# EPUB → Markdown (ebooklib + markdownify)
# ─────────────────────────────────────────────────────────────

def _convert_epub(
    input_file: Path,
    out_file: Path,
    warnings: list[str] | None = None,
) -> str:
    try:
        import ebooklib
        from ebooklib import epub
        from markdownify import markdownify
        from bs4 import BeautifulSoup
    except ImportError as e:
        print(f"[ERROR] Missing dependency: {e.name}. "
              f"Run: pip install ebooklib markdownify beautifulsoup4")
        return ""

    media_dir, rel_media_dir = _ensure_media_dir(out_file)
    book = epub.read_epub(str(input_file))

    # Extract images, remembering original path → new filename mapping
    img_map: dict[str, str] = {}
    index = 0
    for item in book.get_items_of_type(ebooklib.ITEM_IMAGE):
        index += 1
        ext = Path(item.file_name).suffix or ".bin"
        filename = f"image_{index:03d}{ext}"
        (media_dir / filename).write_bytes(item.get_content())
        # Map both full and basename for robust lookup
        img_map[item.file_name] = filename
        img_map[Path(item.file_name).name] = filename

    # Iterate document items in spine order
    html_parts: list[str] = []
    spine_ids = [sid for sid, _ in book.spine]
    id_to_item = {it.get_id(): it for it in book.get_items_of_type(ebooklib.ITEM_DOCUMENT)}
    for sid in spine_ids:
        item = id_to_item.get(sid)
        if item is None:
            continue
        soup = BeautifulSoup(item.get_content(), "html.parser")
        for img in soup.find_all("img"):
            src = img.get("src", "")
            if not src:
                continue
            # Try exact match, then basename, then normalized path
            candidates = [src, Path(src).name, unquote(src), Path(unquote(src)).name]
            resolved = next((img_map[c] for c in candidates if c in img_map), None)
            if resolved:
                img["src"] = f"{rel_media_dir}/{resolved}"
        body = soup.find("body") or soup
        html_parts.append(str(body))

    combined_html = "\n\n".join(html_parts)
    markdown = markdownify(combined_html, heading_style="ATX", bullets="-")
    markdown = re.sub(r"\n{3,}", "\n\n", markdown).strip() + "\n"
    out_file.write_text(markdown, encoding="utf-8")

    if not any(media_dir.iterdir()):
        media_dir.rmdir()
        media_dir = None  # type: ignore[assignment]

    return markdown


# ─────────────────────────────────────────────────────────────
# IPYNB → Markdown (nbconvert)
# ─────────────────────────────────────────────────────────────

def _convert_ipynb(
    input_file: Path,
    out_file: Path,
    warnings: list[str] | None = None,
) -> str:
    try:
        import nbformat
        from nbconvert import MarkdownExporter
        from nbconvert.writers import FilesWriter
    except ImportError:
        print("[ERROR] nbconvert not installed. Run: pip install nbconvert")
        return ""

    # Pre-process cell-level markdown attachments: nbconvert leaves
    # `attachment:<name>` references intact but doesn't write the files.
    # Extract them into our outputs dict so FilesWriter picks them up.
    nb = nbformat.read(str(input_file), as_version=4)
    extra_outputs: dict[str, bytes] = {}
    rel_media_dir = f"{out_file.stem}_files"

    attach_counter = 0
    for cell in nb.cells:
        if cell.cell_type != "markdown":
            continue
        attachments = getattr(cell, "attachments", None) or {}
        if not attachments:
            continue
        for att_name, mime_data in attachments.items():
            for mime, b64 in mime_data.items():
                attach_counter += 1
                ext = mimetypes.guess_extension(mime) or ".bin"
                if ext == ".jpe":
                    ext = ".jpg"
                filename = f"attachment_{attach_counter:03d}{ext}"
                out_path = f"{rel_media_dir}/{filename}"
                try:
                    extra_outputs[out_path] = base64.b64decode(b64)
                except Exception as exc:
                    if warnings is not None:
                        warnings.append(
                            f"Notebook attachment could not be decoded: {att_name} ({exc})"
                        )
                    continue
                # Rewrite source references: attachment:<name> → <rel_path>
                src = cell.source if isinstance(cell.source, str) else "".join(cell.source)
                src = src.replace(f"attachment:{att_name}", out_path)
                cell.source = src

    exporter = MarkdownExporter()
    body, resources = exporter.from_notebook_node(nb)

    # Merge attachment outputs with whatever nbconvert collected
    resources.setdefault("outputs", {}).update(extra_outputs)
    resources["output_extension"] = ".md"

    writer = FilesWriter(build_directory=str(out_file.parent))
    writer.write(body, resources, notebook_name=out_file.stem)

    markdown = out_file.read_text(encoding="utf-8") if out_file.exists() else body
    media_dir = out_file.parent / rel_media_dir
    return markdown


# ─────────────────────────────────────────────────────────────
# Pandoc fallback
# ─────────────────────────────────────────────────────────────

def _check_pandoc() -> bool:
    return shutil.which("pandoc") is not None


def _convert_with_pandoc(
    input_file: Path,
    out_file: Path,
    suffix: str,
    warnings: list[str] | None = None,
) -> str:
    if not _check_pandoc():
        print(f"[ERROR] Format '{suffix}' requires pandoc. Install it:")
        print("   macOS:   brew install pandoc")
        print("   Ubuntu:  sudo apt install pandoc")
        print("   Windows: https://pandoc.org/installing.html")
        return ""

    input_format, _ = PANDOC_FORMATS[suffix]
    rel_media_dir = f"{out_file.stem}_files"
    media_dir = out_file.parent / rel_media_dir

    cmd = [
        "pandoc",
        "-f", input_format,
        "-t", "gfm",
        str(input_file.resolve()),
        "-o", str(out_file.resolve()),
        "--wrap", "none",
        "--strip-comments",
    ]
    if suffix in PANDOC_MEDIA_FORMATS:
        cmd.extend(["--extract-media", rel_media_dir])

    result = subprocess.run(cmd, capture_output=True, text=True,
                            cwd=str(out_file.parent))
    if result.returncode != 0:
        print(f"[ERROR] Pandoc conversion failed:\n{result.stderr}")
        return ""
    if result.stderr.strip() and warnings is not None:
        warnings.append(f"pandoc: {result.stderr.strip()}")
    if not out_file.exists():
        print("[ERROR] Conversion completed but no output file was generated")
        return ""

    markdown = out_file.read_text(encoding="utf-8")

    # Flatten nested media/ subdir that pandoc creates
    nested_media = media_dir / "media"
    if nested_media.exists():
        for f in nested_media.iterdir():
            if f.is_file():
                shutil.move(str(f), str(media_dir / f.name))
        try:
            nested_media.rmdir()
        except OSError:
            pass
        markdown = markdown.replace(f"{rel_media_dir}/media/", f"{rel_media_dir}/")

    # Normalize absolute paths to relative
    for abs_str in (str(media_dir.resolve()).replace("\\", "/"),
                    str(media_dir.resolve())):
        if abs_str in markdown:
            markdown = markdown.replace(abs_str, rel_media_dir)

    markdown = _html_img_to_md(markdown)
    out_file.write_text(markdown, encoding="utf-8")

    return markdown


# ─────────────────────────────────────────────────────────────
# Dispatcher
# ─────────────────────────────────────────────────────────────

_FORMAT_DESC = {
    ".docx":  "Microsoft Word (mammoth)",
    ".html":  "HTML (markdownify)",
    ".htm":   "HTML (markdownify)",
    ".epub":  "EPUB (ebooklib)",
    ".ipynb": "Jupyter Notebook (nbconvert)",
}


def convert_to_markdown(
    input_path: str,
    output_path: str | None = None,
    *,
    emit_receipt: bool = True,
    receipt_path: str | None = None,
) -> str:
    input_file = Path(input_path)
    out_file = Path(output_path) if output_path else input_file.with_suffix(".md")
    try:
        clear_receipts(out_file, receipt_path, protected_paths=[input_file])
    except ConversionReceiptError as exc:
        print(f"[ERROR] Document conversion failed: {exc}")
        return ""

    if not input_file.is_file():
        print(f"[ERROR] File not found: {input_path}")
        return ""
    try:
        source_snapshot = snapshot_source(input_file)
    except ConversionReceiptError as exc:
        print(f"[ERROR] Document conversion failed: {exc}")
        return ""

    suffix = input_file.suffix.lower()
    if suffix not in NATIVE_FORMATS and suffix not in PANDOC_FORMATS:
        supported = ", ".join(sorted(NATIVE_FORMATS | PANDOC_FORMATS.keys()))
        print(f"[ERROR] Unsupported format: {suffix}")
        print(f"   Supported: {supported}")
        return ""

    out_file.parent.mkdir(parents=True, exist_ok=True)
    warnings: list[str] = []

    transaction = OutputTransaction(out_file, source_snapshot=source_snapshot)
    staged_file = transaction.staged_output
    try:
        if suffix in NATIVE_FORMATS:
            desc = _FORMAT_DESC[suffix]
            print(f"[INFO] Converting {desc}: {input_file.name}")
            if suffix == ".docx":
                markdown = _convert_docx(input_file, staged_file, warnings)
            elif suffix in (".html", ".htm"):
                markdown = _convert_html(input_file, staged_file, warnings)
            elif suffix == ".epub":
                markdown = _convert_epub(input_file, staged_file, warnings)
            else:
                markdown = _convert_ipynb(input_file, staged_file, warnings)
        else:
            _, format_desc = PANDOC_FORMATS[suffix]
            print(f"[INFO] Converting {format_desc} via pandoc: {input_file.name}")
            markdown = _convert_with_pandoc(input_file, staged_file, suffix, warnings)

        if not markdown.strip():
            raise ConversionReceiptError("converter produced no Markdown content")
        validate_markdown_output(staged_file, markdown)
        def issue_receipt():
            write_success_receipt(
                source_snapshot=source_snapshot,
                output_path=out_file,
                converter="doc_to_md",
                version=CONVERTER_VERSION,
                warnings=warnings,
                receipt_path=receipt_path,
                expected_output=markdown,
            )
        transaction.publish(markdown, issue_receipt if emit_receipt else None)
    except Exception as exc:
        try:
            clear_receipts(out_file, receipt_path, protected_paths=[input_file])
        except ConversionReceiptError as cleanup_exc:
            print(f"[ERROR] Document receipt cleanup failed: {cleanup_exc}")
        finally:
            transaction.__exit__()
        print(f"[ERROR] Document conversion failed: {exc}")
        return ""

    transaction.__exit__()
    _report_result(
        out_file,
        out_file.parent / f"{out_file.stem}_files",
        warnings,
    )
    return markdown


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Convert documents to Markdown "
                    "(pure-Python for common formats, pandoc fallback for the rest)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python doc_to_md.py lecture.docx                # Word → Markdown (mammoth)
  python doc_to_md.py article.html                # HTML → Markdown (markdownify)
  python doc_to_md.py book.epub                   # EPUB → Markdown (ebooklib)
  python doc_to_md.py notebook.ipynb              # Jupyter → Markdown (nbconvert)
  python doc_to_md.py manuscript.tex              # LaTeX → Markdown (pandoc fallback)

Native formats (no pandoc required):
  .docx  .html/.htm  .epub  .ipynb

Pandoc fallback formats (require system pandoc):
  .doc  .odt  .rtf  .tex/.latex  .rst  .org  .typ
        """,
    )
    parser.add_argument("input", help="Input document file")
    parser.add_argument("-o", "--output", help="Output Markdown file path")
    receipt_group = parser.add_mutually_exclusive_group()
    receipt_group.add_argument(
        "--receipt",
        metavar="PATH",
        help="Write the success receipt to PATH (default: <output>.receipt.json)",
    )
    receipt_group.add_argument(
        "--no-receipt",
        action="store_true",
        help="Do not write a conversion receipt",
    )
    args = parser.parse_args()

    result = convert_to_markdown(
        args.input,
        args.output,
        emit_receipt=not args.no_receipt,
        receipt_path=args.receipt,
    )
    sys.exit(0 if result else 1)


if __name__ == "__main__":
    main()
