#!/usr/bin/env python3
"""
SeaSlides Typst Slides - Project Utilities Module

Provides common functions for project information parsing and validation,
reusable by other tools.
"""

import re
import shutil
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Optional, Tuple

try:
    from config import PAGE_FORMATS, PAGE_FORMAT_ALIASES, normalize_page_format
except ImportError:
    PAGE_FORMATS = {
        'ppt169': {'name': '16:9 Presentation', 'width': '1920pt', 'height': '1080pt', 'aspect_ratio': '16/9'},
        'ppt43': {'name': '4:3 Presentation', 'width': '1440pt', 'height': '1080pt', 'aspect_ratio': '4/3'},
    }
    PAGE_FORMAT_ALIASES = {}

    def normalize_page_format(format_key: str) -> str:
        if not format_key:
            return ''
        key = format_key.strip().lower()
        return PAGE_FORMAT_ALIASES.get(key, key)


# ============================================================
# Project Name Parsing
# ============================================================

def parse_project_name(dir_name: str) -> Dict[str, str]:
    """Parse project information from the project directory name.

    Expected format: ``<name>_<YYYYMMDD>``
    Legacy format: ``<name>_<format>_<YYYYMMDD>`` (still supported for backward compat)

    Returns a dict with keys: name, format, format_name, date, date_formatted.
    """
    result = {
        'name': dir_name,
        'format': 'unknown',
        'format_name': 'Unknown format',
        'date': 'unknown',
        'date_formatted': 'Unknown date'
    }

    # Extract date (format: _YYYYMMDD at end)
    date_match = re.search(r'_(\d{8})$', dir_name)
    if date_match:
        date_str = date_match.group(1)
        result['date'] = date_str
        try:
            date_obj = datetime.strptime(date_str, '%Y%m%d')
            result['date_formatted'] = date_obj.strftime('%Y-%m-%d')
        except ValueError:
            pass

    dir_name_lower = dir_name.lower()

    # Try legacy format: name_format_YYYYMMDD
    full_match = re.match(r'^(?P<name>.+)_(?P<format>[a-z0-9_-]+)_(?P<date>\d{8})$', dir_name_lower)
    if full_match:
        raw_format = full_match.group('format')
        normalized_format = normalize_page_format(raw_format)
        if normalized_format in PAGE_FORMATS:
            result['format'] = normalized_format
            result['format_name'] = PAGE_FORMATS[normalized_format]['name']
            result['name'] = dir_name[:len(full_match.group('name'))]
            return result

    # New format: name_YYYYMMDD (no format in directory name)
    new_match = re.match(r'^(.+)_(\d{8})$', dir_name)
    if new_match:
        result['name'] = new_match.group(1)
        return result

    # Fallback: try to find format anywhere (legacy compat)
    sorted_formats = sorted(PAGE_FORMATS.keys(), key=len, reverse=True)
    for fmt_key in sorted_formats:
        if re.search(rf'_{re.escape(fmt_key)}(?:_\d{{8}})?$', dir_name_lower):
            result['format'] = fmt_key
            result['format_name'] = PAGE_FORMATS[fmt_key]['name']
            break

    # Extract project name (remove trailing date and format suffix)
    name = re.sub(r'_\d{8}$', '', dir_name)
    if result['format'] != 'unknown':
        name = re.sub(rf'_{re.escape(result["format"])}$', '', name, flags=re.IGNORECASE)
    result['name'] = name

    return result


# ============================================================
# Project Information
# ============================================================

def get_project_info(project_path: str) -> Dict:
    """Get detailed project information."""
    project_path = Path(project_path)
    parsed = parse_project_name(project_path.name)

    info = {
        'path': str(project_path),
        'dir_name': project_path.name,
        'name': parsed['name'],
        'format': parsed['format'],
        'format_name': parsed['format_name'],
        'date': parsed['date'],
        'date_formatted': parsed['date_formatted'],
        'exists': project_path.exists(),
        'typ_count': 0,
        'has_spec': False,
        'has_readme': False,
        'has_source': False,
        'source_count': 0,
        'spec_file': None,
        'typ_files': []
    }

    if not project_path.exists():
        return info

    info['has_readme'] = (project_path / 'README.md').exists()

    # Check design specification files
    spec_files = ['content_design_spec.md', 'design_spec.md', 'design_specification.md']
    for spec_file in spec_files:
        if (project_path / spec_file).exists():
            info['has_spec'] = True
            info['spec_file'] = spec_file
            break

    # Check source documents
    sources_dir = project_path / 'sources'
    assets_dir = project_path / 'assets'
    if sources_dir.is_dir():
        def is_source_file(path: Path) -> bool:
            try:
                relative = path.relative_to(sources_dir)
                return (
                    path.is_file()
                    and not path.name.endswith('.receipt.json')
                    and not path.name.endswith(('.tmp', '.temp', '.partial', '.part'))
                    and not path.name.startswith('~$')
                    and not any(part.startswith('.') for part in relative.parts)
                )
            except (OSError, ValueError):
                return False

        info['source_count'] = sum(
            1 for path in sources_dir.rglob('*') if is_source_file(path)
        )
    info['has_source'] = info['source_count'] > 0 or assets_dir.exists()

    # Count Typst files
    typ_files = sorted(project_path.glob('*.typ'))
    info['typ_count'] = len(typ_files)
    info['typ_files'] = [f.name for f in typ_files]

    return info


# ============================================================
# Project Validation
# ============================================================

def validate_project_structure(project_path: str, verbose: bool = False) -> Tuple[bool, List[str], List[str]]:
    """Validate project structure completeness.

    Returns (is_valid, error_list, warning_list).
    """
    project_path = Path(project_path)
    errors = []
    warnings = []

    if not project_path.exists():
        errors.append(f"Project directory does not exist: {project_path}")
        return False, errors, warnings

    if not project_path.is_dir():
        errors.append(f"Not a valid directory: {project_path}")
        return False, errors, warnings

    # Check Typst files (optional at init, required before compilation)
    main_typ = project_path / 'main.typ'
    if not main_typ.exists():
        warnings.append("Missing main.typ (created during theme selection, Step 3)")
    else:
        content = main_typ.read_text(encoding='utf-8')
        if '#import' not in content and '#show' not in content:
            warnings.append("main.typ appears to be empty or invalid (no #import or #show)")

    template_typ = project_path / 'template.typ'
    if not template_typ.exists():
        warnings.append("Missing template.typ (may use built-in, universe, or user theme)")

    # Check design specification
    spec_files = ['content_design_spec.md', 'design_spec.md', 'design_specification.md']
    has_spec = any((project_path / f).exists() for f in spec_files)
    if not has_spec:
        warnings.append("Missing design specification file (suggested: content_design_spec.md)")

    # Check required directories
    for dirname in ['assets', 'output']:
        if not (project_path / dirname).is_dir():
            warnings.append(f"Missing directory: {dirname}/")

    # Check directory naming format
    dir_name = project_path.name
    if not re.search(r'_\d{8}', dir_name):
        warnings.append(f"Directory name missing date suffix (_YYYYMMDD): {dir_name}")

    return len(errors) == 0, errors, warnings


# ============================================================
# Project Discovery
# ============================================================

def find_all_projects(base_dir: str) -> List[Path]:
    """Find all Typst/Touying projects under the specified directory."""
    base_path = Path(base_dir)
    if not base_path.exists():
        return []

    projects = []
    for item in base_path.iterdir():
        if item.is_dir() and not item.name.startswith('.'):
            has_main_typ = (item / 'main.typ').exists()
            has_spec = any((item / f).exists() for f in ['content_design_spec.md', 'design_spec.md', 'design_specification.md'])
            has_sources = (item / 'sources').is_dir()
            has_date_suffix = bool(re.search(r'_\d{8}$', item.name))
            if has_main_typ or has_spec or (has_sources and has_date_suffix):
                projects.append(item)

    return sorted(projects)


# ============================================================
# File Operations
# ============================================================

def create_directory_structure(base_path: str, directories: List[str]) -> None:
    """Create a directory structure under the base path."""
    base = Path(base_path)
    for directory in directories:
        (base / directory).mkdir(parents=True, exist_ok=True)

def copy_or_move_files(source_files: List[str], dest_dir: str, move: bool = False) -> None:
    """Copy or move files to a destination directory."""
    dest = Path(dest_dir)
    dest.mkdir(parents=True, exist_ok=True)

    for source_path in source_files:
        source = Path(source_path)
        if not source.exists():
            print(f"Warning: Source file not found: {source_path}")
            continue

        dest_file = dest / source.name
        if move:
            shutil.move(str(source), str(dest_file))
        else:
            if source.is_dir():
                shutil.copytree(source, dest_file, dirs_exist_ok=True)
            else:
                shutil.copy2(source, dest_file)

def list_projects(base_dir: str = '.') -> None:
    """List all Typst/Touying projects in the base directory."""
    projects = find_all_projects(base_dir)

    print("Typst/Touying Projects:")
    print("-" * 50)

    if not projects:
        print("No projects found.")
        return

    for project_dir in projects:
        is_valid, errors, warnings = validate_project_structure(str(project_dir))
        if is_valid and not warnings:
            status = "✓ Valid"
        elif is_valid:
            status = f"⚠ {len(warnings)} warning(s)"
        else:
            status = f"✗ {len(errors)} error(s)"
        print(f"{project_dir.name}: {status}")

def clean_output_directory(project_path: str) -> None:
    """Clean the output directory of a project."""
    output_dir = Path(project_path) / 'output'
    if output_dir.exists():
        for item in output_dir.iterdir():
            if item.is_file():
                item.unlink()
            elif item.is_dir():
                shutil.rmtree(item)
        print(f"Cleaned output directory: {output_dir}")
    else:
        print(f"Output directory does not exist: {output_dir}")


# ============================================================
# Path Utilities
# ============================================================

def resolve_path(path: str) -> Path:
    """Resolve a path, handling ~ expansion and relative paths."""
    return Path(path).expanduser().resolve()

def ensure_directory(path: str) -> Path:
    """Ensure a directory exists, creating it if necessary."""
    dir_path = Path(path)
    dir_path.mkdir(parents=True, exist_ok=True)
    return dir_path

def format_file_size(size_bytes: int) -> str:
    """Format file size in human-readable format."""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size_bytes < 1024.0:
            return f"{size_bytes:.1f} {unit}"
        size_bytes /= 1024.0
    return f"{size_bytes:.1f} TB"

def get_project_stats(project_path: str) -> Dict:
    """Get project statistics."""
    project_path = Path(project_path)
    stats = {
        'total_files': 0,
        'typ_files': 0,
        'md_files': 0,
        'image_files': 0,
        'total_size': 0,
    }

    if not project_path.exists():
        return stats

    image_suffixes = {'.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.svg'}
    for file in project_path.rglob('*'):
        if file.is_file():
            stats['total_files'] += 1
            stats['total_size'] += file.stat().st_size
            if file.suffix == '.typ':
                stats['typ_files'] += 1
            elif file.suffix == '.md':
                stats['md_files'] += 1
            elif file.suffix.lower() in image_suffixes:
                stats['image_files'] += 1

    return stats


if __name__ == '__main__':
    import sys

    if len(sys.argv) > 1:
        project_path = sys.argv[1]
        info = get_project_info(project_path)

        print(f"\nProject Info: {info['dir_name']}")
        print("=" * 60)
        print(f"Project Name: {info['name']}")
        print(f"Page Format: {info['format_name']} ({info['format']})")
        print(f"Created: {info['date_formatted']}")
        print(f"Typst Files: {info['typ_count']}")
        print(f"README: {'Yes' if info['has_readme'] else 'No'}")
        print(f"Design Spec: {'Yes' if info['has_spec'] else 'No'}")

        print("\nValidation Results:")
        print("-" * 60)
        is_valid, errors, warnings = validate_project_structure(project_path)

        if errors:
            print("[ERROR]")
            for error in errors:
                print(f"  - {error}")
        if warnings:
            print("[WARN]")
            for warning in warnings:
                print(f"  - {warning}")
        if is_valid and not warnings:
            print("[OK] Project structure is complete, no issues found")
    else:
        print("Usage: python3 project_utils.py <project_path>")
