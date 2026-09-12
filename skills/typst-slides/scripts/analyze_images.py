#!/usr/bin/env python3
"""
Image Size Analysis Tool
========================
Analyzes width, height, and aspect ratio of all images in a specified folder,
and outputs PPT layout recommendations with computed dimensions.

Usage:
    python scripts/analyze_images.py <images_folder_path>
    python scripts/analyze_images.py projects/xxx/images
    python scripts/analyze_images.py projects/xxx/images --canvas ppt43

Output:
    - Analysis report displayed in console
    - Generates image_analysis.csv in the parent directory of the images folder
"""

from __future__ import annotations

import argparse
import os
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Union

try:
    from PIL import Image
except ImportError:
    print("Error: PIL/Pillow not installed. Run: pip install Pillow")
    sys.exit(1)

try:
    from config import CANVAS_FORMATS, LAYOUT_MARGINS
except ImportError:
    CANVAS_FORMATS = {
        'ppt169': {
            'name': 'PPT 16:9',
            'width': 1280,
            'height': 720,
        },
    }
    LAYOUT_MARGINS = {
        'ppt169': {
            'top': 60, 'right': 60, 'bottom': 60, 'left': 60,
            'content_width': 1160, 'content_height': 600
        },
    }

IMAGE_EXTENSIONS = {
    ".jpg", ".jpeg", ".png", ".gif", ".webp", ".bmp", ".tiff", ".tif", ".svg"
}
REPORT_WIDTH = 100
CATEGORY_WIDTH = 50

# Title area height and gap between image/text areas (px)
TITLE_HEIGHT = 60
LAYOUT_GAP = 20
# Minimum text area dimensions (px)
MIN_TEXT_HEIGHT = 150
MIN_TEXT_WIDTH = 280

ImageAnalysis = dict[str, Union[str, float, int]]
SVG_LENGTH_RE = re.compile(
    r"^\s*(?P<value>\d+(?:\.\d+)?|\.\d+)\s*(?P<unit>px|pt|pc|in|cm|mm|q)?\s*$",
    re.IGNORECASE,
)
SVG_UNIT_TO_PX = {
    "": 1.0,
    "px": 1.0,
    "pt": 96.0 / 72.0,
    "pc": 16.0,
    "in": 96.0,
    "cm": 96.0 / 2.54,
    "mm": 96.0 / 25.4,
    "q": 96.0 / 101.6,
}


def _svg_length_to_px(value: str | None) -> float | None:
    """Resolve an absolute SVG length; percentages have no intrinsic size."""
    if not value:
        return None
    match = SVG_LENGTH_RE.fullmatch(value)
    if not match:
        return None
    unit = (match.group("unit") or "").lower()
    pixels = float(match.group("value")) * SVG_UNIT_TO_PX[unit]
    return pixels if pixels > 0 else None


def _svg_dimensions(path: Path) -> tuple[float | int, float | int]:
    """Read intrinsic SVG dimensions without rasterizing the asset."""
    root = ET.parse(path).getroot()
    width = _svg_length_to_px(root.get("width"))
    height = _svg_length_to_px(root.get("height"))

    viewbox_width = viewbox_height = None
    raw_viewbox = root.get("viewBox") or root.get("viewbox")
    if raw_viewbox:
        parts = re.split(r"[\s,]+", raw_viewbox.strip())
        if len(parts) == 4:
            try:
                candidate_width = float(parts[2])
                candidate_height = float(parts[3])
            except ValueError:
                pass
            else:
                if candidate_width > 0 and candidate_height > 0:
                    viewbox_width, viewbox_height = candidate_width, candidate_height

    if width is None and height is not None and viewbox_width and viewbox_height:
        width = height * viewbox_width / viewbox_height
    if height is None and width is not None and viewbox_width and viewbox_height:
        height = width * viewbox_height / viewbox_width
    if width is None or height is None:
        width, height = viewbox_width, viewbox_height
    if width is None or height is None:
        raise ValueError("SVG has no positive absolute width/height or valid viewBox")

    def compact(number: float) -> float | int:
        return int(round(number)) if abs(number - round(number)) < 1e-9 else number

    return compact(width), compact(height)


def classify_ratio(aspect_ratio: float) -> str:
    """Classify image aspect ratio into layout category.

    Thresholds aligned with shared-standards.md:
      >2.0 ultra-wide, 1.5-2.0 wide, 1.2-1.5 standard landscape,
      0.8-1.2 square, <0.8 portrait.
    """
    if aspect_ratio > 2.0:
        return "Ultra-wide"
    elif aspect_ratio > 1.5:
        return "Wide landscape"
    elif aspect_ratio > 1.2:
        return "Standard landscape"
    elif aspect_ratio > 0.8:
        return "Near square"
    else:
        return "Portrait"


def compute_layout_dimensions(
    ratio: float,
    content_w: int,
    content_h: int,
    gap: int = LAYOUT_GAP,
) -> dict:
    """Compute image and text area dimensions following shared-standards.md.

    Returns dict with layout_type, image_w, image_h, text_w, text_h.
    """
    # Effective content height (below title)
    H = content_h
    W = content_w

    def _try_top_bottom() -> dict | None:
        img_w = W
        img_h = int(round(W / ratio))
        text_h = H - img_h - gap
        if text_h >= MIN_TEXT_HEIGHT:
            return {
                'layout_type': 'top-bottom',
                'image_w': img_w,
                'image_h': img_h,
                'text_w': W,
                'text_h': text_h,
            }
        return None

    def _try_left_right_height_first() -> dict | None:
        img_h = H
        img_w = int(round(H * ratio))
        text_w = W - img_w - gap
        if text_w >= MIN_TEXT_WIDTH:
            return {
                'layout_type': 'left-right',
                'image_w': img_w,
                'image_h': img_h,
                'text_w': text_w,
                'text_h': H,
            }
        return None

    def _try_left_right_width_constrained() -> dict:
        img_w = int(round(W * 0.7))
        img_h = int(round(img_w / ratio))
        text_w = W - img_w - gap
        return {
            'layout_type': 'left-right',
            'image_w': img_w,
            'image_h': min(img_h, H),
            'text_w': max(text_w, MIN_TEXT_WIDTH),
            'text_h': H,
        }

    # Decision tree per shared-standards.md
    if ratio > 1.5:
        # Ultra-wide or wide → try top-bottom first
        result = _try_top_bottom()
        if result:
            return result
        # Fallback to left-right (wide-constrained)
        return _try_left_right_width_constrained()
    else:
        # Standard landscape, square, portrait → try left-right (height-first)
        result = _try_left_right_height_first()
        if result:
            return result
        # Fallback to left-right (width-constrained)
        return _try_left_right_width_constrained()


def analyze_images(images_dir: str, *, recursive: bool = False) -> list[ImageAnalysis]:
    """Analyze all image files in a directory.

    Args:
        images_dir: Directory that contains image files.
        recursive: If True, scan subdirectories recursively.

    Returns:
        A list of image analysis records sorted by filename.
    """

    results: list[ImageAnalysis] = []
    base = Path(images_dir)
    base_root = base.resolve()

    if recursive:
        file_iter = sorted(f for f in base.rglob("*") if f.is_file())
    else:
        file_iter = sorted(f for f in base.iterdir() if f.is_file())

    for filepath in file_iter:
        if filepath.suffix.lower() not in IMAGE_EXTENSIONS:
            continue
        try:
            resolved = filepath.resolve(strict=True)
            resolved.relative_to(base_root)
        except (OSError, ValueError):
            print(f"[WARN] Skipping image outside inventory root: {filepath}", file=sys.stderr)
            continue
        if filepath.is_symlink():
            print(f"[WARN] Skipping symlinked image: {filepath}", file=sys.stderr)
            continue
        try:
            if filepath.suffix.lower() == ".svg":
                width, height = _svg_dimensions(filepath)
            else:
                with Image.open(filepath) as img:
                    width, height = img.size
            aspect_ratio = width / height
            layout_hint = classify_ratio(aspect_ratio)

            name = str(filepath.relative_to(base)) if recursive else filepath.name

            results.append({
                'filename': name,
                'width': width,
                'height': height,
                'aspect_ratio': aspect_ratio,
                'layout_hint': layout_hint,
                'filesize_kb': filepath.stat().st_size / 1024,
            })
        except Exception as e:
            print(f"[WARN] Cannot read {filepath}: {e}", file=sys.stderr)

    return results


def enrich_with_layout(
    results: list[ImageAnalysis],
    canvas_key: str,
) -> None:
    """Add computed layout dimensions to each result in-place."""
    fmt = CANVAS_FORMATS.get(canvas_key, {})
    margins = LAYOUT_MARGINS.get(canvas_key)

    if not margins:
        print(f"[WARN] No layout margins for canvas '{canvas_key}', skipping dimension calculation")
        return

    content_w = margins['content_width']
    content_h = margins['content_height']

    for img in results:
        dims = compute_layout_dimensions(img['aspect_ratio'], content_w, content_h)
        img.update(dims)


def print_results(results: list[ImageAnalysis]) -> None:
    """Print the analysis report to stdout."""

    print("\n" + "=" * REPORT_WIDTH)
    print("Image Size Analysis Report")
    print("=" * REPORT_WIDTH)

    has_layout = 'layout_type' in results[0] if results else False

    if has_layout:
        print(f"\n{'No.':<4} {'Width':<7} {'Height':<7} {'Ratio':<7} {'Size':<10} {'Category':<20} {'Layout':<12} {'ImgArea':<14} {'Filename'}")
    else:
        print(f"\n{'No.':<4} {'Width':<7} {'Height':<7} {'Ratio':<7} {'Size':<10} {'Category':<20} {'Filename'}")
    print("-" * REPORT_WIDTH)

    for i, img in enumerate(results, 1):
        base = f"{i:<4} {img['width']:<7} {img['height']:<7} {img['aspect_ratio']:<7.2f} {img['filesize_kb']:<10.1f}KB {img['layout_hint']:<20}"
        if has_layout:
            img_area = f"{img['image_w']}x{img['image_h']}"
            print(f"{base} {img['layout_type']:<12} {img_area:<14} {img['filename'][:35]}")
        else:
            print(f"{base} {img['filename'][:40]}")

    print("-" * REPORT_WIDTH)
    print(f"Total: {len(results)} images\n")

    # Group statistics by aspect ratio (aligned with shared-standards.md thresholds)
    print("\nGroup by Aspect Ratio:")
    print("-" * CATEGORY_WIDTH)

    categories = {
        "Ultra-wide (>2.0)": [],
        "Wide (1.5-2.0)": [],
        "Standard (1.2-1.5)": [],
        "Square (0.8-1.2)": [],
        "Portrait (<0.8)": [],
    }

    for img in results:
        ar = img['aspect_ratio']
        if ar > 2.0:
            categories["Ultra-wide (>2.0)"].append(img)
        elif ar > 1.5:
            categories["Wide (1.5-2.0)"].append(img)
        elif ar > 1.2:
            categories["Standard (1.2-1.5)"].append(img)
        elif ar > 0.8:
            categories["Square (0.8-1.2)"].append(img)
        else:
            categories["Portrait (<0.8)"].append(img)

    for cat, imgs in categories.items():
        if imgs:
            print(f"\n{cat}: {len(imgs)} images")
            for img in imgs[:5]:  # Show only the first 5
                print(f"  - {img['width']}x{img['height']} (ratio {img['aspect_ratio']:.2f}) - {img['filename'][:35]}...")
            if len(imgs) > 5:
                print(f"  ... and {len(imgs) - 5} more")


def generate_markdown(results: list[ImageAnalysis], canvas_key: str) -> None:
    """Print a Markdown-ready image inventory section."""
    print("\n" + "=" * REPORT_WIDTH)
    print("Markdown Snippet for Strategist (Copy & Paste)")
    print("=" * REPORT_WIDTH)

    has_layout = 'layout_type' in results[0] if results else False
    fmt_name = CANVAS_FORMATS.get(canvas_key, {}).get('name', canvas_key)

    print(f"\n## Image Resource Inventory (Auto-scan Results — {fmt_name})\n")

    if has_layout:
        print("| Filename | Size | Ratio | Layout | Image Area | Text Area | Usage | Type | Status | Generation Description |")
        print("|----------|------|-------|--------|------------|-----------|-------|------|--------|-----------------------|")
    else:
        print("| Filename | Size | Ratio | Layout Suggestion | Usage | Type | Status | Generation Description |")
        print("|----------|------|-------|-------------------|-------|------|--------|-----------------------|")

    for img in results:
        ratio_str = f"{img['aspect_ratio']:.2f}"

        if has_layout:
            img_area = f"{img['image_w']}x{img['image_h']}"
            text_area = f"{img['text_w']}x{img['text_h']}"
            print(f"| {img['filename']} | {img['width']}x{img['height']} | {ratio_str} | {img['layout_type']} | {img_area} | {text_area} | (to be filled) | | Existing | - |")
        else:
            layout_desc = img['layout_hint']
            if img['aspect_ratio'] > 2.0:
                layout_desc += " (top-bottom, full-width)"
            elif img['aspect_ratio'] > 1.5:
                layout_desc += " (top-bottom)"
            elif img['aspect_ratio'] > 1.2:
                layout_desc += " (left-right split)"
            elif img['aspect_ratio'] > 0.8:
                layout_desc += " (left-right split)"
            else:
                layout_desc += " (left-right, image on left)"
            print(f"| {img['filename']} | {img['width']}x{img['height']} | {ratio_str} | {layout_desc} | (to be filled) | | Existing | - |")

    print("\n" + "=" * REPORT_WIDTH + "\n")


def save_csv(results: list[ImageAnalysis], csv_path: str) -> None:
    """Save analysis results to a CSV file."""
    has_layout = 'layout_type' in results[0] if results else False

    with open(csv_path, 'w', encoding='utf-8') as f:
        if has_layout:
            f.write("No,Filename,Width,Height,AspectRatio,SizeKB,Category,LayoutType,ImageArea,TextArea\n")
            for i, img in enumerate(results, 1):
                f.write(f"{i},{img['filename']},{img['width']},{img['height']},{img['aspect_ratio']:.2f},{img['filesize_kb']:.1f},{img['layout_hint']},{img['layout_type']},{img['image_w']}x{img['image_h']},{img['text_w']}x{img['text_h']}\n")
        else:
            f.write("No,Filename,Width,Height,AspectRatio,SizeKB,Category\n")
            for i, img in enumerate(results, 1):
                f.write(f"{i},{img['filename']},{img['width']},{img['height']},{img['aspect_ratio']:.2f},{img['filesize_kb']:.1f},{img['layout_hint']}\n")
    print(f"\nCSV saved to: {csv_path}")


def main() -> None:
    """Run the CLI entry point."""
    parser = argparse.ArgumentParser(
        description="Analyze image sizes and compute PPT layout dimensions"
    )
    parser.add_argument(
        "images_dir",
        help="Path to the images directory"
    )
    parser.add_argument(
        "--canvas",
        default="ppt169",
        help=f"Canvas format key (default: ppt169). Available: {', '.join(sorted(CANVAS_FORMATS.keys()))}"
    )

    args = parser.parse_args()

    images_dir = os.path.abspath(args.images_dir)

    if not os.path.exists(images_dir):
        print(f"Error: Directory not found: {images_dir}")
        sys.exit(1)

    if not os.path.isdir(images_dir):
        print(f"Error: Not a directory: {images_dir}")
        sys.exit(1)

    canvas_key = args.canvas
    if canvas_key not in CANVAS_FORMATS:
        print(f"Error: Unknown canvas format '{canvas_key}'. Available: {', '.join(sorted(CANVAS_FORMATS.keys()))}")
        sys.exit(1)

    fmt = CANVAS_FORMATS[canvas_key]
    print(f"Analyzing: {images_dir}")
    print(f"Canvas: {fmt.get('name', canvas_key)} ({fmt.get('width', '?')}x{fmt.get('height', '?')})")

    results = analyze_images(images_dir)

    if results:
        enrich_with_layout(results, canvas_key)
        print_results(results)
        generate_markdown(results, canvas_key)

        # Save to CSV file (saved in the parent directory of the images folder)
        parent_dir = os.path.dirname(images_dir)
        csv_path = os.path.join(parent_dir, "image_analysis.csv")
        save_csv(results, csv_path)
    else:
        print("No image files found in the directory.")


if __name__ == "__main__":
    main()
