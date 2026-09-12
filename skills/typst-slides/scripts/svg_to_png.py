#!/usr/bin/env python3
"""
SVG to PNG Converter

Converts SVG files to high-quality PNG images using the Typst rendering engine.
No external dependencies (Inkscape, cairosvg, etc.) needed — only typst + Pillow.

This uses Typst's native SVG rendering by embedding the SVG in a minimal Typst
document and compiling to PNG. The result is pixel-perfect, high-fidelity output.

Usage:
    # Single file
    python3 svg_to_png.py input.svg -o output.png

    # Multiple files (batch)
    python3 svg_to_png.py slide_01.svg slide_02.svg -o output_dir/

    # Entire directory
    python3 svg_to_png.py ./svg_final/ -o ./pngs/

    # Custom dimensions and PPI
    python3 svg_to_png.py input.svg --width 1280 --height 720 --ppi 2

    # Generate overview grid from multiple SVGs
    python3 svg_to_png.py ./svg_final/ -o overview.png --overview

    # With custom page dimensions (for non-16:9 SVGs)
    python3 svg_to_png.py input.svg --width 1280 --height 720 --ppi 3

Programmatic API:
    from svg_to_png import svg_to_png, svg_dir_to_pngs, svg_dir_to_overview

    # Single conversion
    png_bytes = svg_to_png("slide.svg", ppi=2)

    # Batch conversion
    results = svg_dir_to_pngs("./svgs/", "./pngs/", ppi=2)

    # Overview grid
    svg_dir_to_overview("./svgs/", "overview.png")
"""

import argparse
import sys
from pathlib import Path
from typing import List, Optional, Union

try:
    import typst
except ImportError:
    print("Error: typst Python package not found.")
    print("Install with: pip install typst")
    sys.exit(1)


# ============================================================
# Core conversion functions
# ============================================================

def svg_to_png(
    svg_path: Union[str, Path],
    output_path: Optional[Union[str, Path]] = None,
    width: int = 1280,
    height: int = 720,
    ppi: float = 2.0,
) -> bytes:
    """
    Convert a single SVG file to PNG using Typst's rendering engine.

    The SVG is embedded in a zero-margin Typst page sized to match the SVG's
    intended dimensions (default: 1280x720 for 16:9 slides). Typst renders the
    SVG at `ppi` multiplier (2.0 = 2x resolution = 2560x1440 output).

    Args:
        svg_path: Path to the input SVG file.
        output_path: Optional path to write the PNG file. If None, returns bytes.
        width: SVG logical width in points (default: 1280 for ppt-master 16:9).
        height: SVG logical height in points (default: 720 for ppt-master 16:9).
        ppi: Resolution multiplier. 1.0 = 1:1 pixel mapping, 2.0 = 2x retina.

    Returns:
        PNG file contents as bytes.
    """
    svg_path = Path(svg_path).resolve()
    if not svg_path.exists():
        raise FileNotFoundError(f"SVG not found: {svg_path}")

    # Read SVG content
    svg_content = svg_path.read_bytes()

    # Build a minimal Typst document that renders the SVG full-bleed
    # We use the `files` dict to pass the SVG as a virtual file
    typst_source = f'#set page(width: {width}pt, height: {height}pt, margin: 0pt, fill: none)\n#image("input.svg", width: 100%, height: 100%)\n'

    files = {
        "main.typ": typst_source.encode("utf-8"),
        "input.svg": svg_content,
    }

    # Compile to PNG via typst Python API
    # ppi here is a multiplier: 72 * ppi = actual DPI
    # e.g., ppi=2.0 → 144 DPI → 2560x1440 for a 1280x720 page
    actual_ppi = 72.0 * ppi
    try:
        result = typst.compile(files, format="png", ppi=actual_ppi)
    except typst.TypstError as exc:
        raise RuntimeError(f"Typst rendering failed for {svg_path.name}: {exc.message}")

    # typst.compile returns bytes (single page) or list of bytes (multi-page)
    if isinstance(result, list):
        png_bytes = result[0]
    else:
        png_bytes = result

    # Write to file if output_path specified
    if output_path is not None:
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_bytes(png_bytes)

    return png_bytes


def svg_dir_to_pngs(
    svg_dir: Union[str, Path],
    output_dir: Union[str, Path],
    width: int = 1280,
    height: int = 720,
    ppi: float = 2.0,
    pattern: str = "*.svg",
) -> List[Path]:
    """
    Convert all SVGs in a directory to PNGs.

    Args:
        svg_dir: Directory containing SVG files.
        output_dir: Directory to write PNG files.
        width: SVG logical width in points.
        height: SVG logical height in points.
        ppi: Resolution multiplier.
        pattern: Glob pattern for SVG files (default: "*.svg").

    Returns:
        List of output PNG file paths.
    """
    svg_dir = Path(svg_dir)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    svg_files = sorted(svg_dir.glob(pattern))
    if not svg_files:
        print(f"No SVG files found in {svg_dir} matching '{pattern}'")
        return []

    results = []
    for svg_file in svg_files:
        png_name = svg_file.stem + ".png"
        png_path = output_dir / png_name
        try:
            svg_to_png(svg_file, png_path, width=width, height=height, ppi=ppi)
            results.append(png_path)
            print(f"  {svg_file.name} → {png_name}")
        except Exception as e:
            print(f"  ERROR: {svg_file.name}: {e}")

    print(f"\nConverted {len(results)}/{len(svg_files)} SVGs → {output_dir}/")
    return results


def svg_dir_to_overview(
    svg_dir: Union[str, Path],
    output_path: Union[str, Path],
    width: int = 1280,
    height: int = 720,
    ppi: float = 1.5,
    max_width: int = 2000,
    max_height: int = 2000,
    pattern: str = "*.svg",
) -> str:
    """
    Convert all SVGs in a directory into a single overview grid image.

    Args:
        svg_dir: Directory containing SVG files.
        output_path: Path for the output overview PNG.
        width: SVG logical width in points.
        height: SVG logical height in points.
        ppi: Resolution multiplier for individual slides.
        max_width: Maximum overview image width.
        max_height: Maximum overview image height.
        pattern: Glob pattern for SVG files.

    Returns:
        Path to the generated overview image.
    """
    try:
        from PIL import Image
    except ImportError:
        print("Error: Pillow not found. Install with: pip install Pillow")
        sys.exit(1)

    import io
    import math

    svg_dir = Path(svg_dir)
    output_path = Path(output_path)
    svg_files = sorted(svg_dir.glob(pattern))

    if not svg_files:
        print(f"No SVG files found in {svg_dir}")
        return ""

    total = len(svg_files)

    # Convert all SVGs to PNG bytes
    png_bytes_list = []
    for svg_file in svg_files:
        try:
            png_bytes = svg_to_png(svg_file, width=width, height=height, ppi=ppi)
            png_bytes_list.append(png_bytes)
        except Exception as e:
            print(f"  Warning: skipping {svg_file.name}: {e}")

    if not png_bytes_list:
        print("No SVGs could be converted")
        return ""

    # Open as PIL images
    images = [Image.open(io.BytesIO(b)).convert("RGB") for b in png_bytes_list]
    page_w = max(img.width for img in images)
    page_h = max(img.height for img in images)

    # Find optimal grid layout
    GUTTER = 8
    best_columns = 3
    best_scale = 1.0
    best_thumb_w = 0

    for columns in range(2, min(total + 1, 7)):
        rows = math.ceil(total / columns)
        available_w = max_width - (columns + 1) * GUTTER
        scale_from_w = available_w / (columns * page_w)
        available_h = max_height - (rows + 1) * GUTTER
        scale_from_h = available_h / (rows * page_h)
        scale = min(scale_from_w, scale_from_h, 1.0)
        thumb_w = page_w * scale
        if thumb_w > best_thumb_w:
            best_thumb_w = thumb_w
            best_columns = columns
            best_scale = scale

    # Resize and stitch
    if best_scale < 1.0:
        new_w = int(page_w * best_scale)
        new_h = int(page_h * best_scale)
        images = [img.resize((new_w, new_h), Image.LANCZOS) for img in images]
        page_w, page_h = new_w, new_h

    rows = math.ceil(total / best_columns)
    canvas_w = best_columns * page_w + (best_columns + 1) * GUTTER
    canvas_h = rows * page_h + (rows + 1) * GUTTER
    canvas = Image.new("RGB", (canvas_w, canvas_h), (200, 200, 200))

    for idx, img in enumerate(images):
        row, col = divmod(idx, best_columns)
        x = GUTTER + col * (page_w + GUTTER)
        y = GUTTER + row * (page_h + GUTTER)
        canvas.paste(img, (x, y))

    output_path.parent.mkdir(parents=True, exist_ok=True)
    canvas.save(str(output_path), "PNG")
    print(f"Overview: {total} slides ({best_columns}col) → {output_path} ({canvas_w}x{canvas_h})")
    return str(output_path)


# ============================================================
# CLI
# ============================================================

def main():
    parser = argparse.ArgumentParser(
        description="Convert SVG files to PNG using Typst rendering engine",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 svg_to_png.py slide.svg -o slide.png
  python3 svg_to_png.py ./svg_final/ -o ./pngs/
  python3 svg_to_png.py ./svg_final/ -o overview.png --overview
  python3 svg_to_png.py slide.svg --width 1280 --height 720 --ppi 2
        """,
    )

    parser.add_argument(
        "input",
        nargs="+",
        help="SVG file(s) or directory containing SVGs",
    )
    parser.add_argument(
        "-o", "--output",
        required=True,
        help="Output PNG file or directory",
    )
    parser.add_argument(
        "--width",
        type=int,
        default=1280,
        help="SVG logical width in pt (default: 1280 for 16:9 slides)",
    )
    parser.add_argument(
        "--height",
        type=int,
        default=720,
        help="SVG logical height in pt (default: 720 for 16:9 slides)",
    )
    parser.add_argument(
        "--ppi",
        type=float,
        default=2.0,
        help="Resolution multiplier (default: 2.0 = 2x retina quality)",
    )
    parser.add_argument(
        "--overview",
        action="store_true",
        help="Generate a single overview grid image instead of individual PNGs",
    )
    parser.add_argument(
        "--max-width",
        type=int,
        default=2000,
        help="Max overview width in pixels (default: 2000)",
    )
    parser.add_argument(
        "--max-height",
        type=int,
        default=2000,
        help="Max overview height in pixels (default: 2000)",
    )

    args = parser.parse_args()

    input_path = Path(args.input[0])
    output_path = Path(args.output)

    # Case 1: Directory input
    if input_path.is_dir():
        if args.overview:
            svg_dir_to_overview(
                input_path, output_path,
                width=args.width, height=args.height, ppi=args.ppi,
                max_width=args.max_width, max_height=args.max_height,
            )
        else:
            svg_dir_to_pngs(
                input_path, output_path,
                width=args.width, height=args.height, ppi=args.ppi,
            )
        return

    # Case 2: Multiple files
    if len(args.input) > 1:
        output_path.mkdir(parents=True, exist_ok=True)
        for svg_file in args.input:
            svg_file = Path(svg_file)
            png_path = output_path / (svg_file.stem + ".png")
            try:
                svg_to_png(svg_file, png_path, width=args.width, height=args.height, ppi=args.ppi)
                print(f"  {svg_file.name} → {png_path.name}")
            except Exception as e:
                print(f"  ERROR: {svg_file.name}: {e}")
        return

    # Case 3: Single file
    if not output_path.suffix:
        output_path = output_path / (input_path.stem + ".png")
    svg_to_png(input_path, output_path, width=args.width, height=args.height, ppi=args.ppi)
    print(f"{input_path.name} → {output_path}")


if __name__ == "__main__":
    main()
