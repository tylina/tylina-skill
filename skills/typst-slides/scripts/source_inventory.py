#!/usr/bin/env python3
"""
Source Inventory Tool
=====================
Scans a project's sources/ directory and produces a complete inventory
including file listings, markdown content, and image analysis with
Typst layout hints.

Output is a Markdown document on stdout suitable for LLM prompt embedding.

Usage:
    python scripts/source_inventory.py <sources_dir>
"""

import argparse
import sys
from pathlib import Path

# Ensure scripts dir is importable
_scripts_dir = Path(__file__).resolve().parent
if str(_scripts_dir) not in sys.path:
    sys.path.insert(0, str(_scripts_dir))

from analyze_images import analyze_images  # noqa: E402

IMAGE_EXTS = {".png", ".jpg", ".jpeg", ".gif", ".svg", ".webp", ".bmp", ".tiff", ".tif"}
MD_EXTS = {".md", ".markdown"}
PDF_EXTS = {".pdf"}
TEMPORARY_SUFFIXES = (".tmp", ".temp", ".partial", ".part")


def is_inventory_file(path: Path, sources_dir: Path) -> bool:
    """Return whether ``path`` is a visible, durable source input."""
    try:
        relative = path.relative_to(sources_dir)
        return (
            path.is_file()
            and not path.name.endswith(".receipt.json")
            and not path.name.endswith(TEMPORARY_SUFFIXES)
            and not path.name.startswith("~$")
            and not any(part.startswith(".") for part in relative.parts)
        )
    except (OSError, ValueError):
        return False


def _typst_layout_hint(rel: str, orient: str) -> str:
    """Generate a Typst-specific layout recommendation string."""
    orient_lower = orient.lower()
    if "portrait" in orient_lower:
        return (
            "Side column: "
            f"`#slide(composer: (1fr, auto))[content]"
            f"[#image(\"sources/{rel}\", height: 100%, fit: \"cover\")]`"
        )
    elif "ultra" in orient_lower or "wide" in orient_lower:
        return (
            "Full-width banner or background: "
            f"`#image(\"sources/{rel}\", width: 100%)` or "
            f"`config-page(background: image(\"sources/{rel}\", width: 100%, height: 100%, fit: \"cover\"))`"
        )
    elif "standard" in orient_lower:
        return (
            "Side-by-side: "
            f"`#slide(composer: (auto, 1fr))"
            f"[#image(\"sources/{rel}\", height: 100%, fit: \"cover\")][content]`"
        )
    else:
        return (
            "Inline or column: "
            f"`#image(\"sources/{rel}\", width: 60%)`"
        )


def build_inventory(sources_dir: Path) -> str:
    """Build a complete source inventory as markdown.

    Returns the inventory string, or empty string if no files found.
    """
    all_files = sorted(
        f for f in sources_dir.rglob("*") if is_inventory_file(f, sources_dir)
    )
    if not all_files:
        return ""

    md_files = []
    image_files = []
    pdf_files = []
    other_files = []

    for f in all_files:
        ext = f.suffix.lower()
        rel = f.relative_to(sources_dir)
        if ext in MD_EXTS:
            md_files.append((f, rel))
        elif ext in IMAGE_EXTS:
            image_files.append((f, rel))
        elif ext in PDF_EXTS:
            pdf_files.append((f, rel))
        else:
            other_files.append((f, rel))

    sections = []

    # Section 1: File inventory listing
    inventory_lines = ["## Source File Inventory\n"]
    if md_files:
        inventory_lines.append("### Markdown Files")
        for _, rel in md_files:
            inventory_lines.append(f"- `sources/{rel}`")
    if image_files:
        inventory_lines.append("\n### Image Files (available for use in slides)")
        for _, rel in image_files:
            inventory_lines.append(f"- `sources/{rel}`")
    if pdf_files:
        inventory_lines.append("\n### PDF Files (converted to markdown above)")
        for _, rel in pdf_files:
            inventory_lines.append(f"- `sources/{rel}`")
    if other_files:
        inventory_lines.append("\n### Other Files")
        for _, rel in other_files:
            inventory_lines.append(f"- `sources/{rel}`")
    sections.append("\n".join(inventory_lines))

    # Section 2: Full markdown content
    md_parts = []
    for md_file, rel in md_files:
        content = md_file.read_text(encoding="utf-8", errors="replace")
        if content.strip():
            md_parts.append(f"### Source: {rel}\n\n{content.strip()}")
    if md_parts:
        sections.append("## Source Content\n\n" + "\n\n---\n\n".join(md_parts))

    # Section 3: Image inventory with dimensions + layout hints
    if image_files:
        img_lines = [
            "## Source Images\n",
            "The following images are available in the project's `sources/` directory. "
            "Use `image(\"sources/<path>\")` in Typst to include them in slides.\n",
            "| Image | Path | Size | Orientation | Recommended Layout |",
            "|-------|------|------|-------------|-------------------|",
        ]

        # Use analyze_images for dimension reading and classification
        results = analyze_images(str(sources_dir), recursive=True)
        analyzed = {r['filename']: r for r in results}

        for _, rel in image_files:
            rel_str = str(rel)
            info = analyzed.get(rel_str)
            if info:
                w, h = info['width'], info['height']
                orient = info['layout_hint']
                hint = _typst_layout_hint(rel_str, orient)
                img_lines.append(
                    f"| {rel.stem} | `sources/{rel}` | {w}x{h} | {orient.lower()} | {hint} |"
                )
            else:
                img_lines.append(
                    f"| {rel.stem} | `sources/{rel}` | unknown | — | "
                    f"`#image(\"sources/{rel}\", width: 60%)` |"
                )
        sections.append("\n".join(img_lines))

    return "\n\n" + "\n\n".join(sections)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate a source file inventory with image analysis"
    )
    parser.add_argument("sources_dir", help="Path to the sources directory")
    args = parser.parse_args()

    sources_dir = Path(args.sources_dir).resolve()
    if not sources_dir.exists() or not sources_dir.is_dir():
        print(f"Error: Directory not found: {sources_dir}", file=sys.stderr)
        sys.exit(1)

    inventory = build_inventory(sources_dir)
    if inventory:
        print(inventory)
    else:
        print("No source files found.", file=sys.stderr)


if __name__ == "__main__":
    main()
