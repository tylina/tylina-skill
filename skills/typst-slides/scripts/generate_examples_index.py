#!/usr/bin/env python3
"""
Generate index for example Typst projects.

This script scans the examples/ directory and generates an index of all example
projects with metadata. It's the seaslides-typst-slides-skill equivalent of ppt-master's
generate_examples_index.py, adapted for Typst/Touying workflow.

Usage:
    python generate_examples_index.py --output examples_index.json
"""

import argparse
import json
import os
import re
import subprocess
from pathlib import Path
from typing import Dict, List, Optional


def extract_metadata_from_main(main_typ_path: Path) -> Dict[str, str]:
    """
    Extract metadata from main.typ file.

    Args:
        main_typ_path: Path to main.typ file

    Returns:
        Dictionary containing extracted metadata
    """
    metadata = {
        'title': 'Untitled',
        'author': 'Unknown',
        'description': '',
        'tags': []
    }

    if not main_typ_path.exists():
        return metadata

    try:
        with open(main_typ_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Extract title from show or #title directives
        title_match = re.search(r'#(?:show\s+)?title\s*\(\s*"([^"]+)"', content)
        if title_match:
            metadata['title'] = title_match.group(1)

        # Extract author
        author_match = re.search(r'author\s*:\s*"([^"]+)"', content)
        if author_match:
            metadata['author'] = author_match.group(1)

        # Extract description from comments
        desc_match = re.search(r'//\s*(?:description|desc):\s*(.+)', content, re.IGNORECASE)
        if desc_match:
            metadata['description'] = desc_match.group(1).strip()

        # Extract tags
        tags_match = re.search(r'//\s*tags:\s*(.+)', content, re.IGNORECASE)
        if tags_match:
            tags_str = tags_match.group(1).strip()
            metadata['tags'] = [t.strip() for t in tags_str.split(',')]

    except Exception as e:
        print(f"Warning: Could not read {main_typ_path}: {e}")

    return metadata


def count_pages(project_dir: Path) -> int:
    """
    Count pages in a compiled Typst PDF.

    Args:
        project_dir: Path to the project directory

    Returns:
        Number of pages, or 0 if PDF doesn't exist
    """
    pdf_path = project_dir / "main.pdf"

    if not pdf_path.exists():
        return 0

    try:
        # Try to use pdfinfo if available
        result = subprocess.run(
            ['pdfinfo', str(pdf_path)],
            capture_output=True,
            text=True,
            timeout=5
        )

        if result.returncode == 0:
            pages_match = re.search(r'Pages:\s*(\d+)', result.stdout)
            if pages_match:
                return int(pages_match.group(1))
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        pass

    return 0


def detect_theme(project_dir: Path) -> str:
    """
    Detect the Touying theme used in the project.

    Args:
        project_dir: Path to the project directory

    Returns:
        Theme name or 'custom'
    """
    template_typ = project_dir / "template.typ"

    if not template_typ.exists():
        return "unknown"

    try:
        with open(template_typ, 'r', encoding='utf-8') as f:
            content = f.read()

        # Look for Touying theme imports
        theme_match = re.search(r'#import\s+.*?touying\s+theme:\s*(\w+)', content)
        if theme_match:
            return theme_match.group(1)

        # Look for show directives
        show_match = re.search(r'show:\s*(\w+)', content)
        if show_match:
            return show_match.group(1)

    except Exception:
        pass

    return "custom"


def scan_examples_dir(examples_dir: Path) -> List[Dict]:
    """
    Scan examples directory for Typst projects.

    Args:
        examples_dir: Path to examples directory

    Returns:
        List of example metadata dictionaries
    """
    examples = []

    if not examples_dir.exists():
        return examples

    for item in sorted(examples_dir.iterdir()):
        if item.is_dir() and not item.name.startswith('.'):
            main_typ = item / "main.typ"

            if main_typ.exists():
                # Extract metadata
                metadata = extract_metadata_from_main(main_typ)

                example = {
                    'name': item.name,
                    'path': str(item),
                    'title': metadata['title'],
                    'author': metadata['author'],
                    'description': metadata['description'],
                    'tags': metadata['tags'],
                    'theme': detect_theme(item),
                    'page_count': count_pages(item),
                    'has_assets': (item / "assets").exists()
                }

                examples.append(example)

    return examples


def generate_json_index(examples: List[Dict], output_path: Path):
    """
    Generate JSON index file.

    Args:
        examples: List of example metadata
        output_path: Path to output JSON file
    """
    index = {
        'version': '1.0',
        'count': len(examples),
        'examples': examples,
        'categories': {}
    }

    # Group by tags
    for example in examples:
        for tag in example['tags']:
            if tag not in index['categories']:
                index['categories'][tag] = []
            index['categories'][tag].append(example['name'])

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(index, f, indent=2, ensure_ascii=False)

    print(f"Generated JSON index: {output_path}")


def generate_markdown_index(examples: List[Dict], output_path: Path):
    """
    Generate Markdown README index.

    Args:
        examples: List of example metadata
        output_path: Path to output Markdown file
    """
    lines = [
        "# Examples Index",
        "",
        f"Total examples: **{len(examples)}**",
        "",
        "## All Examples",
        "",
        "| Name | Title | Author | Theme | Pages | Tags |",
        "|------|-------|--------|-------|-------|------|"
    ]

    for example in examples:
        tags_str = ', '.join(example['tags']) if example['tags'] else '-'
        lines.append(
            f"| [{example['name']}]({example['path']}) | {example['title']} | "
            f"{example['author']} | {example['theme']} | {example['page_count']} | {tags_str} |"
        )

    # Add category sections
    lines.extend(["", "## By Category", ""])

    all_tags = set()
    for example in examples:
        all_tags.update(example['tags'])

    for tag in sorted(all_tags):
        lines.append(f"### {tag}")
        lines.append("")

        tagged_examples = [e for e in examples if tag in e['tags']]
        for example in tagged_examples:
            lines.append(f"- **[{example['name']}]({example['path']})**: {example['description']}")
        lines.append("")

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    print(f"Generated Markdown index: {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="Generate index for Typst example projects",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python generate_examples_index.py --output examples_index.json
  python generate_examples_index.py --dir ../examples --output index.json
  python generate_examples_index.py --format both
        """
    )

    parser.add_argument(
        "--dir",
        type=str,
        default="examples",
        help="Examples directory to scan (default: examples)"
    )

    parser.add_argument(
        "--output",
        type=str,
        default="examples_index",
        help="Output file path without extension (default: examples_index)"
    )

    parser.add_argument(
        "--format",
        type=str,
        choices=['json', 'markdown', 'both'],
        default='both',
        help="Output format (default: both)"
    )

    args = parser.parse_args()

    examples_dir = Path(args.dir)

    if not examples_dir.exists():
        print(f"Error: Examples directory '{args.dir}' does not exist", file=sys.stderr)
        sys.exit(1)

    print(f"Scanning examples directory: {examples_dir}")
    examples = scan_examples_dir(examples_dir)

    if not examples:
        print("No examples found")
        sys.exit(0)

    print(f"Found {len(examples)} example(s)")

    # Generate outputs
    if args.format in ['json', 'both']:
        json_output = Path(f"{args.output}.json")
        generate_json_index(examples, json_output)

    if args.format in ['markdown', 'both']:
        md_output = Path(f"{args.output}.md")
        generate_markdown_index(examples, md_output)

    print("\nIndex generation complete!")


if __name__ == "__main__":
    import sys
    main()
