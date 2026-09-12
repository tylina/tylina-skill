#!/usr/bin/env python3
"""
SeaSlides Typst Slides - Project Validator

Validates the structural and semantic presentation requirements defined in
SKILL.md. Use this after generation to verify completeness.
This structural/semantic validator does not replace typst_quality_checker.py,
which verifies artifact integrity and compile-receipt coherence.

Checks:
- Compilation output exists (slides.pdf, overview.png, per-page PNGs, compile manifest)
- Theme is appropriate (custom for ALL content unless user explicitly requests builtin)
- Complexity level meets minimum (Rich/Canvas unless user explicitly requests plain)
- Image usage is reviewed when sources/assets contain images
- Component usage is reviewed against the requested complexity
- content_design_spec.md is complete with all required sections in Full Mode
- Touying version is correct (0.7.4)
- Layout diversity (no monotonous bullet-only slides)
- Unsafe cols(lazy-layout: true) usage is rejected
- Speaker notes present

Usage:
    python3 validate_project.py <project_path>
    python3 validate_project.py <project_path> --entry slides/deck.typ
    python3 validate_project.py <project_path> --mode quick
    python3 validate_project.py <theme_path> --mode theme
    python3 validate_project.py <project_path> --strict

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
KNOWN LIMITATIONS / FALSE POSITIVE RISKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

The following checks are heuristic-based and may occasionally fire incorrectly.
When a reported heuristic warning seems inconsistent with what you see in the actual slides,
trust the visual output (overview.png / PDF) over the validator.

1. DENSITY REVIEW (check_layout_diversity)
   - The denominator `num_slides` counts BOTH `== heading` lines AND explicit
     `#slide(...)` calls. In Touying, a `== Heading` followed by a `#slide`
     body renders as ONE visual slide, but the validator may count it as two.
     This makes avg_lines/slide appear roughly half the true value.
   - Treat this as a prompt to inspect the render, not a source-code quota.

2. LOW VARIETY (check_layout_monotony)
   - This warning counts the fraction of "text-only" / "bullets-only" slides.
   - Slides with rich components like `#insight-box`, `#metric-card`, `#cols(`,
     `#slide(composer:...)`, or `#image(` are correctly classified as non-boring.
   - ⚠️  If the warning fires and your slides use rich components throughout,
     it may be a signature-classification miss. Check overview.png directly.

3. HEADER BAR WARNING (check_header_bars)
   - Detects `#block(fill: ..., width: 100%)` or `#rect(fill: ..., width: 100%)`.
   - Some legitimate theme components (accent stripes, footer bars, progress
     indicators) use full-width colored blocks intentionally.
   - ⚠️  This warning is advisory only (not an error). If the colored blocks
     are thin accent lines or structural chrome rather than chunky title bars,
     you can ignore it.

4. TYPOGRAPHY REVIEW (check_typography_weight)
   - Only fires when main.typ has 3+ explicit weight declarations and every
     explicit declaration across main.typ/template.typ is "bold".
   - It is an advisory prompt; intentional label-heavy systems may be valid.

5. COMPONENT REVIEW (check_component_usage)
   - Counts component patterns in main.typ using regex. Some components defined
     in template.typ and called indirectly (e.g. via show rules or wrappers)
     may not be detected.
   - If you have visually rich slides but this warning fires, check whether
     your components are called from template.typ helper functions rather than
     directly in main.typ.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"""

from __future__ import annotations

import argparse
import hashlib
import html
import json
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple

try:
    from typst_lazy_layout_check import find_unsafe_lazy_layout_cols_in_file
except ImportError:  # pragma: no cover - supports package-style imports
    from .typst_lazy_layout_check import find_unsafe_lazy_layout_cols_in_file

try:
    from workspace_context import resolve_workspace_context
except ImportError:  # pragma: no cover - supports package-style imports
    from .workspace_context import resolve_workspace_context


# ============================================================
# Constants
# ============================================================

VALID_COMPLEXITY_LEVELS = {"plain", "rich", "canvas"}
BUILTIN_THEMES = {"simple", "metropolis", "dewdrop", "university", "aqua", "stargazer"}
TOUYING_VERSION = "0.7.4"

# Old API patterns that indicate wrong version
OLD_API_PATTERNS = [
    r'#show:\s*slides\.with',
    r'#show:\s*touying\.with',
    r'@preview/touying:0\.[0-6]\.',
    r'@preview/touying:0\.5',
    r'@preview/touying:0\.4',
]

# Patterns indicating custom component usage
COMPONENT_PATTERNS = [
    r'#\w+-card',       # #kpi-card, #insight-card, etc.
    r'#\w+-box',        # #insight-box, #risk-box, etc.
    r'#\w+-bar',        # #takeaway-bar, #chrome-bar, etc.
    r'#\w+-table',      # #data-table, etc.
    r'#\w+-slide',      # #dark-slide, #focus-slide, etc.
    r'#\w+-block',      # #stat-block, etc.
    r'#\w+-row',        # #data-row, #stat-row, etc.
    r'#pillar-card',
    r'#kpi-card',
    r'#insight-box',
    r'#takeaway',
    r'#framework',
    r'#editorial',
    r'#pull-quote',
    r'#stat-',
    r'#cols\[',         # Multi-column layout
]

IMAGE_EXTENSIONS = {'.jpg', '.jpeg', '.png', '.gif', '.svg', '.webp', '.bmp', '.tiff'}
SOURCE_RECEIPT_SCHEMA = 'seaslides-source-conversion/v1'
SHA256_RE = re.compile(r'^[0-9a-f]{64}$')

# High-confidence rendered source/code leaks. These strings should almost never
# be visible in a finished slide unless the slide is explicitly teaching Typst.
RENDERED_RAW_CODE_ERROR_PATTERNS = [
    "if self.store",
    "utils.display-current-heading",
    "utils.call-or-display",
    "config-common(",
    '"SECTION " +',
    "|---|",
    "Gantt:",
]

# Broader advisory patterns. These can be legitimate in code-example slides, so
# keep them as warnings and ask the author to inspect the rendered output.
RENDERED_RAW_CODE_WARNING_PATTERNS = [
    "stack(",
    "block(",
    "cols(",
    "feature-item(",
    "sakura-card(",
    "sakura-quote(",
]


# ============================================================
# Validation Functions
# ============================================================

def sha256_file(path: Path) -> str:
    """Return a streaming SHA-256 fingerprint for a regular file."""
    digest = hashlib.sha256()
    with path.open('rb') as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def _receipt_file_path(raw_path, receipt_path: Path, sources_root: Path, label: str):
    """Resolve a receipt-local path, rejecting absolute paths and symlink escapes."""
    if not isinstance(raw_path, str) or not raw_path:
        return None, f"SOURCE RECEIPT INVALID: {label}.path must be a non-empty string."
    candidate = Path(raw_path)
    if candidate.is_absolute():
        return None, f"SOURCE RECEIPT INVALID: {label}.path must be relative to its receipt."
    try:
        resolved = (receipt_path.parent / candidate).resolve(strict=False)
        resolved.relative_to(sources_root)
    except (OSError, ValueError):
        return None, f"SOURCE RECEIPT UNSAFE: {label}.path escapes sources/: {raw_path!r}."
    return resolved, None


def _receipt_fingerprint(row, label: str):
    """Validate a receipt fingerprint before any filesystem comparison."""
    if not isinstance(row, dict):
        return None, [f"SOURCE RECEIPT INVALID: {label} must be an object."]
    errors = []
    if not isinstance(row.get('sha256'), str) or not SHA256_RE.fullmatch(row['sha256']):
        errors.append(f"SOURCE RECEIPT INVALID: {label}.sha256 must be 64 lowercase hex characters.")
    size = row.get('size_bytes')
    if isinstance(size, bool) or not isinstance(size, int) or size < 0:
        errors.append(f"SOURCE RECEIPT INVALID: {label}.size_bytes must be a non-negative integer.")
    return (row if not errors else None), errors


def _fingerprint_matches(path: Path, row: dict):
    """Compare a fingerprint while turning concurrent filesystem failures into diagnostics."""
    try:
        return (
            row['sha256'] == sha256_file(path) and row['size_bytes'] == path.stat().st_size,
            None,
        )
    except OSError as error:
        return False, str(error)


def check_source_conversion_receipts(project_path: Path) -> Tuple[List[str], List[str]]:
    """Validate optional source-conversion receipts below ``sources/``.

    Receipts use ``seaslides-source-conversion/v1``. Local records are checked
    against their captured fingerprints; URL records are deliberately not fetched.
    """
    errors: List[str] = []
    warnings: List[str] = []
    sources_dir = project_path / 'sources'
    if not sources_dir.is_dir():
        return errors, warnings
    try:
        sources_root = sources_dir.resolve(strict=True)
        receipt_paths = sorted(
            path for path in sources_dir.rglob('*')
            if path.name.endswith('.receipt.json') and path.is_file()
        )
    except OSError as error:
        return [f"SOURCE RECEIPT UNREADABLE: sources/: {error}."], warnings

    for receipt_path in receipt_paths:
        try:
            display = receipt_path.relative_to(project_path).as_posix()
            receipt_path.resolve(strict=True).relative_to(sources_root)
        except (OSError, ValueError):
            errors.append(f"SOURCE RECEIPT UNSAFE: receipt escapes sources/: {receipt_path}.")
            continue
        try:
            receipt = json.loads(receipt_path.read_text(encoding='utf-8'))
        except (OSError, UnicodeError, json.JSONDecodeError) as error:
            errors.append(f"SOURCE RECEIPT INVALID: {display}: {error}.")
            continue
        if not isinstance(receipt, dict):
            errors.append(f"SOURCE RECEIPT INVALID: {display}: top-level JSON must be an object.")
            continue
        if receipt.get('schema') != SOURCE_RECEIPT_SCHEMA:
            errors.append(f"SOURCE RECEIPT INVALID: {display}: unsupported schema {receipt.get('schema')!r}.")
        status = receipt.get('status')
        if status not in {'pass', 'pass_with_warnings'}:
            errors.append(f"SOURCE RECEIPT INVALID: {display}: status must be pass or pass_with_warnings.")
        converter = receipt.get('converter')
        if not isinstance(converter, dict):
            errors.append(f"SOURCE RECEIPT INVALID: {display}: converter must be an object.")
        else:
            for field in ('name', 'version'):
                if not isinstance(converter.get(field), str) or not converter[field].strip():
                    errors.append(f"SOURCE RECEIPT INVALID: {display}: converter.{field} must be a non-empty string.")

        receipt_warnings = receipt.get('warnings')
        if not isinstance(receipt_warnings, list) or not all(
            isinstance(item, str) and item.strip() for item in receipt_warnings
        ):
            errors.append(f"SOURCE RECEIPT INVALID: {display}: warnings must be an array of non-empty strings.")
            receipt_warnings = None
        elif len(receipt_warnings) != len(set(receipt_warnings)):
            errors.append(f"SOURCE RECEIPT INVALID: {display}: warnings must not contain duplicates.")
        if receipt_warnings is not None:
            if status == 'pass' and receipt_warnings:
                errors.append(f"SOURCE RECEIPT INVALID: {display}: pass status cannot contain warnings.")
            elif status == 'pass_with_warnings' and not receipt_warnings:
                errors.append(f"SOURCE RECEIPT INVALID: {display}: pass_with_warnings requires at least one warning.")
            elif status == 'pass_with_warnings':
                warnings.append(f"SOURCE CONVERSION REVIEW: {display} records {len(receipt_warnings)} warning(s).")

        output, output_errors = _receipt_fingerprint(receipt.get('output'), 'output')
        errors.extend(f"{display}: {error}" for error in output_errors)
        if output is not None:
            if output.get('kind') != 'file':
                errors.append(f"SOURCE RECEIPT INVALID: {display}: output.kind must be 'file'.")
            output_path, path_error = _receipt_file_path(output.get('path'), receipt_path, sources_root, 'output')
            if path_error:
                errors.append(f"{display}: {path_error}")
            elif output_path is not None:
                try:
                    exists = output_path.is_file()
                except OSError as error:
                    errors.append(f"SOURCE RECEIPT UNREADABLE: {display}: output: {error}.")
                    continue
                if not exists:
                    errors.append(f"SOURCE RECEIPT STALE: {display}: output no longer exists: {output.get('path')!r}.")
                elif output['size_bytes'] == 0:
                    errors.append(f"SOURCE RECEIPT INVALID: {display}: output is empty.")
                else:
                    matches, read_error = _fingerprint_matches(output_path, output)
                    if read_error:
                        errors.append(f"SOURCE RECEIPT UNREADABLE: {display}: output: {read_error}.")
                    elif not matches:
                        errors.append(f"SOURCE RECEIPT STALE: {display}: output changed after conversion.")

        source, source_errors = _receipt_fingerprint(receipt.get('source'), 'source')
        errors.extend(f"{display}: {error}" for error in source_errors)
        if source is None:
            continue
        if source.get('kind') == 'file':
            source_path, path_error = _receipt_file_path(source.get('path'), receipt_path, sources_root, 'source')
            if path_error:
                errors.append(f"{display}: {path_error}")
            elif source_path is not None:
                try:
                    exists = source_path.is_file()
                except OSError as error:
                    errors.append(f"SOURCE RECEIPT UNREADABLE: {display}: source: {error}.")
                    continue
                if not exists:
                    errors.append(f"SOURCE RECEIPT STALE: {display}: source no longer exists: {source.get('path')!r}.")
                else:
                    matches, read_error = _fingerprint_matches(source_path, source)
                    if read_error:
                        errors.append(f"SOURCE RECEIPT UNREADABLE: {display}: source: {read_error}.")
                    elif not matches:
                        errors.append(f"SOURCE RECEIPT STALE: {display}: source changed after conversion.")
        elif source.get('kind') == 'url':
            if not isinstance(source.get('uri'), str) or not source['uri'].strip():
                errors.append(f"SOURCE RECEIPT INVALID: {display}: URL source.uri must be a non-empty string.")
        else:
            errors.append(f"SOURCE RECEIPT INVALID: {display}: source.kind must be 'file' or 'url'.")
    return errors, warnings

def check_output_files(project_path: Path) -> Tuple[List[str], List[str]]:
    """Check that compilation output exists."""
    errors = []
    warnings = []

    output_dir = project_path / 'output'
    if not output_dir.exists():
        errors.append("CRITICAL: output/ directory does not exist — compilation was never run")
        return errors, warnings

    pdf = output_dir / 'slides.pdf'
    pptx = output_dir / 'slides.pptx'
    overview = output_dir / 'overview.png'
    pngs_dir = output_dir / 'pngs'
    manifest = output_dir / 'compile-manifest.json'

    if not pdf.exists():
        errors.append("CRITICAL: output/slides.pdf missing — compilation failed or was never run")

    if not overview.exists():
        errors.append("CRITICAL: output/overview.png missing — compile with --all flag")

    if not pngs_dir.exists() or not list(pngs_dir.glob('slide_*.png')):
        errors.append("CRITICAL: output/pngs/ missing or empty — compile with --all flag")

    if not manifest.is_file() or manifest.stat().st_size < 1:
        errors.append(
            "CRITICAL: output/compile-manifest.json missing or empty — compile with --all flag"
        )

    primary_outputs = [path for path in [pdf, overview] if path.exists()]
    if pptx.exists() and primary_outputs:
        primary_mtime = max(path.stat().st_mtime for path in primary_outputs)
        if pptx.stat().st_mtime < primary_mtime - 600:
            warnings.append(
                "output/slides.pptx is older than the current PDF/overview output. "
                "If PPTX is needed, rerun typst_compiler.py --format pptx after the final PDF/PNG compile."
            )

    return errors, warnings


def _entry_file(project_path: Path, entry_path: Path | None = None) -> Path:
    return entry_path if entry_path is not None else project_path / 'main.typ'


def check_touying_version(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check that Touying 0.7.4 is used correctly."""
    errors = []
    warnings = []

    source_files = []
    for path in (
        _entry_file(project_path, entry_path),
        project_path / 'demo.typ',
        project_path / 'template.typ',
    ):
        if path.exists() and path not in source_files:
            source_files.append(path)
    if not source_files:
        errors.append("CRITICAL: Neither main.typ nor template.typ exists")
        return errors, warnings

    # Theme-owned projects normally import Touying from template.typ, while
    # main.typ imports that template. Both files define the effective version.
    content = "\n".join(path.read_text(encoding='utf-8') for path in source_files)

    is_universe_theme = "themes" in project_path.parts and "universe" in project_path.parts

    # Owned themes and generated deliveries use 0.7.4. Universe themes may be
    # pinned to an older package API and are reviewed rather than rewritten.
    if f'@preview/touying:{TOUYING_VERSION}' not in content:
        if '@preview/touying:' in content:
            version_match = re.search(r'@preview/touying:([\d.]+)', content)
            if version_match:
                message = (
                    f"Touying {version_match.group(1)} detected; SeaSlides-owned themes "
                    f"and generated projects use {TOUYING_VERSION}."
                )
                if is_universe_theme:
                    warnings.append(
                        "UNIVERSE VERSION REVIEW: " + message +
                        " Preserve the package-supported version unless a tested migration exists."
                    )
                else:
                    errors.append("WRONG VERSION: " + message)
        else:
            warnings.append("No direct touying import found in main.typ, demo.typ, or template.typ")

    # Check for old API patterns
    for pattern in OLD_API_PATTERNS:
        if re.search(pattern, content):
            message = f"Legacy Touying pattern '{pattern}' found."
            if is_universe_theme:
                warnings.append(
                    "UNIVERSE API REVIEW: " + message +
                    " Treat it as a package compatibility boundary, not an automatic migration."
                )
            else:
                errors.append(
                    "OLD API DETECTED: " + message +
                    " SeaSlides-owned code must use the tested 0.7.4 API."
                )
            break

    return errors, warnings


def check_theme_selection(
    project_path: Path,
    mode: str = "delivery",
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check that theme selection follows enforcement rules."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')

    # Determine if using builtin or custom theme
    uses_builtin = False
    builtin_name = None
    for theme in BUILTIN_THEMES:
        if f'themes.{theme}' in content:
            uses_builtin = True
            builtin_name = theme
            break

    uses_custom = (project_path / 'template.typ').exists() and '#import "template.typ"' in content

    # Check spec for complexity
    spec_path = project_path / 'content_design_spec.md'
    complexity = "unknown"

    if spec_path.exists():
        spec_content = spec_path.read_text(encoding='utf-8').lower()
        # Try to extract complexity level (line-by-line to avoid cross-line matching)
        for line in spec_content.split('\n'):
            if 'complexity' in line:
                complexity_match = re.search(r'\b(plain|rich|canvas)\b', line)
                if complexity_match:
                    complexity = complexity_match.group(1).lower()
                    break

    # Enforce rules
    if uses_builtin:
        message = (
            f"THEME REVIEW: Builtin theme '{builtin_name}' detected. "
            "Confirm that the user requested it."
        )
        if mode == "delivery":
            message += " Confirm that the design spec records that decision."
        warnings.append(message)

    if complexity == 'plain':
        message = (
            "COMPLEXITY REVIEW: Plain complexity detected. It is valid when explicitly requested; "
            "confirm that it matches the user's intent."
        )
        if mode == "delivery":
            message += " Confirm that the design spec records that decision."
        warnings.append(message)

    if not uses_builtin and not uses_custom:
        warnings.append(
            "Cannot determine theme type — no builtin import or template.typ import found"
        )

    return errors, warnings


def check_component_usage(
    project_path: Path,
    mode: str = "delivery",
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check that custom theme components are actually used."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')

    # Count component usages
    component_count = 0
    used_components = set()
    for pattern in COMPONENT_PATTERNS:
        matches = re.findall(pattern, content)
        if matches:
            component_count += len(matches)
            used_components.add(pattern)

    # Check spec complexity
    spec_path = project_path / 'content_design_spec.md'
    complexity = "unknown" if mode == "quick" else "rich"
    if spec_path.exists():
        spec_content = spec_path.read_text(encoding='utf-8').lower()
        for line in spec_content.split('\n'):
            if 'complexity' in line:
                level_match = re.search(r'\b(plain|rich|canvas)\b', line)
                if level_match:
                    complexity = level_match.group(1)
                    break

    if complexity in ('rich', 'canvas') and component_count < 3:
        warnings.append(
            f"COMPONENT REVIEW: Only {component_count} recognized component usage(s) found in main.typ. "
            f"Confirm that the selected component vocabulary expresses the content and matches "
            f"the requested Rich/Canvas complexity; do not add components merely to reach a quota. "
            f"[FALSE POSITIVE RISK: If components are called via template.typ helper wrappers "
            f"rather than directly in main.typ, they won't be detected — verify visually.]"
        )

    return errors, warnings


def check_image_usage(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check that images are used when available."""
    errors = []
    warnings = []

    # Check if images are available
    assets_dir = project_path / 'assets'
    sources_dir = project_path / 'sources'

    available_images = []
    for search_dir in [assets_dir, sources_dir]:
        if search_dir.exists():
            for f in search_dir.rglob('*'):
                if f.is_file() and f.suffix.lower() in IMAGE_EXTENSIONS:
                    available_images.append(f)

    if not available_images:
        return errors, warnings  # No images available, not a violation

    # Check if images are referenced in main.typ
    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    source_files = [main_typ]
    template_typ = project_path / 'template.typ'
    if template_typ.exists():
        source_files.append(template_typ)
    content = '\n'.join(path.read_text(encoding='utf-8') for path in source_files)
    # Match both markup-context `#image(` and bare `image(` used anywhere inside
    # a code expression such as `#stack(..., image(...), ...)`.  The previous
    # lookbehind only recognized a call immediately after `(` and missed valid
    # calls after commas/newlines.  Mask strings, raw blocks, and comments first
    # so examples or comments do not count as actual image use.
    searchable = _mask_typst_comments_strings_and_raw(content)
    image_refs = re.findall(r'(?<![\w-])#?image\s*\(', searchable)

    if not image_refs and len(available_images) > 0:
        warnings.append(
            f"IMAGE REVIEW: {len(available_images)} image(s) are available but main.typ/template.typ "
            f"contain no image() calls. Confirm that the assets are intentionally excluded "
            f"or add the relevant/user-required images."
        )

    return errors, warnings


def _mask_typst_comments_strings_and_raw(content: str) -> str:
    """Replace non-code Typst regions with spaces while preserving newlines."""
    masked = list(content)
    index = 0
    length = len(content)

    def hide(start: int, end: int) -> None:
        for position in range(start, end):
            if masked[position] != '\n':
                masked[position] = ' '

    while index < length:
        if content.startswith('//', index):
            end = content.find('\n', index + 2)
            if end == -1:
                end = length
            hide(index, end)
            index = end
            continue
        if content.startswith('/*', index):
            start = index
            index += 2
            depth = 1
            while index < length and depth:
                if content.startswith('/*', index):
                    depth += 1
                    index += 2
                elif content.startswith('*/', index):
                    depth -= 1
                    index += 2
                else:
                    index += 1
            hide(start, index)
            continue
        if content[index] == '"':
            start = index
            index += 1
            while index < length:
                if content[index] == '\\':
                    index = min(length, index + 2)
                elif content[index] == '"':
                    index += 1
                    break
                else:
                    index += 1
            hide(start, index)
            continue
        if content[index] == '`':
            start = index
            tick_count = 1
            while start + tick_count < length and content[start + tick_count] == '`':
                tick_count += 1
            delimiter = '`' * tick_count
            end = content.find(delimiter, start + tick_count)
            index = length if end == -1 else end + tick_count
            hide(start, index)
            continue
        index += 1

    return ''.join(masked)


def check_design_spec(project_path: Path) -> Tuple[List[str], List[str]]:
    """Check that content_design_spec.md is complete."""
    errors = []
    warnings = []

    spec_path = project_path / 'content_design_spec.md'
    if not spec_path.exists():
        # Check alternatives
        alt_names = ['design_spec.md', 'design_specification.md']
        found = False
        for alt in alt_names:
            if (project_path / alt).exists():
                spec_path = project_path / alt
                found = True
                break
        if not found:
            errors.append("CRITICAL: No content_design_spec.md found — Strategist phase was skipped")
            return errors, warnings

    content = spec_path.read_text(encoding='utf-8')

    # Check required sections
    required_indicators = {
        'Project Information': [r'(?:project\s+information|section\s+i)', 'Section I — Project Information'],
        'Theme Selection': [r'(?:theme\s+selection|section\s+ii)', 'Section II — Theme Selection'],
        'Content Outline': [r'(?:content\s+outline|section\s+iv|slide\s+type|page\s*#)', 'Section IV — Content Outline'],
        'Color/Typography': [r'(?:color|palette|typography|font|#[0-9a-fA-F]{6})', 'Color/Typography specification'],
    }

    content_lower = content.lower()
    for section_name, (pattern, display_name) in required_indicators.items():
        if not re.search(pattern, content_lower):
            errors.append(f"SPEC INCOMPLETE: Missing {display_name}")

    # Check for "default" lazy values
    default_patterns = [
        (r'color[^:]*:\s*default', "Color set to 'default' — must specify actual hex values"),
        (r'typography[^:]*:\s*default', "Typography set to 'default' — must specify font families"),
        (r'palette[^:]*:\s*default', "Palette set to 'default' — must specify actual hex values"),
    ]
    for pattern, message in default_patterns:
        if re.search(pattern, content_lower):
            errors.append(f"SPEC LAZY VALUE: {message}")

    # Check for valid complexity level (line-by-line to avoid cross-line matching)
    complexity_found = False
    for line in content.split('\n'):
        if 'complexity' in line.lower():
            level_match = re.search(r'\b(plain|rich|canvas)\b', line.lower())
            if level_match:
                complexity_found = True
                break
            # Check for invalid levels on the same line
            value_match = re.search(r'complexity[^|]*\|\s*(\w+)', line.lower())
            if value_match:
                level = value_match.group(1)
                if level not in VALID_COMPLEXITY_LEVELS:
                    errors.append(
                        f"INVALID COMPLEXITY: '{level}' is not a valid level. "
                        f"Must be one of: plain, rich, canvas"
                    )
                complexity_found = True
                break

    # Check minimum length (a proper spec should be substantial)
    if len(content) < 500:
        warnings.append(
            f"Spec is very short ({len(content)} chars) — likely incomplete. "
            f"Verify that project, theme, content-outline, and design decisions are still complete."
        )

    return errors, warnings


def check_layout_diversity(
    project_path: Path,
    mode: str = "delivery",
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check that slides have layout diversity."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')
    lines = content.split('\n')

    # Count slides (headings or #slide calls)
    slide_markers = []
    for i, line in enumerate(lines):
        if re.match(r'^==\s+', line) or re.match(r'^#slide', line):
            slide_markers.append(i)

    num_slides = len(slide_markers)
    if num_slides < 3:
        return errors, warnings  # Too few slides to check diversity

    # Calculate average lines per slide
    total_content_lines = len([l for l in lines if l.strip() and not l.strip().startswith('//')])
    avg_lines = total_content_lines / max(num_slides, 1)

    # Check spec complexity
    spec_path = project_path / 'content_design_spec.md'
    complexity = "unknown" if mode == "quick" else "rich"
    if spec_path.exists():
        spec_content = spec_path.read_text(encoding='utf-8').lower()
        complexity_match = re.search(r'complexity[^:]*:\s*(plain|rich|canvas)', spec_content)
        if complexity_match:
            complexity = complexity_match.group(1).lower()

    # Check lines per slide
    if complexity == 'rich' and avg_lines < 15:
        warnings.append(
            f"DENSITY REVIEW: Average {avg_lines:.0f} lines/slide for Rich complexity. "
            f"Source line count is only a heuristic; inspect overview.png for unintended emptiness. "
            f"[FALSE POSITIVE RISK: num_slides counts BOTH '== heading' lines AND '#slide(...)' calls. "
            f"If a '== Heading' is immediately followed by a '#slide' body, that renders as ONE "
            f"visual slide but is counted as two here — making avg_lines appear ~half the true value. "
            f"If your slides are visually rich and component-heavy, verify with overview.png before fixing.]"
        )
    elif complexity == 'canvas' and avg_lines < 30:
        warnings.append(
            f"DENSITY REVIEW: Average {avg_lines:.0f} lines/slide for Canvas complexity. "
            f"Source line count is only a heuristic. "
            f"[FALSE POSITIVE RISK: Same double-counting issue as above — '== heading' + '#slide' "
            f"pairs are counted as 2 nodes but render as 1 slide. Verify visually first.]"
        )

    # Whether a manual section slide duplicates an automatic one is specific to
    # the selected theme, so require rendered inspection rather than rejecting it.
    new_section_calls = re.findall(r'#new-section-slide\[', content)
    if new_section_calls:
        warnings.append(
            f"SECTION SLIDE REVIEW: {len(new_section_calls)} manual #new-section-slide call(s) found. "
            "Inspect the rendered deck for duplicate section transitions."
        )

    # Check for speaker notes
    speaker_notes = re.findall(r'#speaker-note', content)
    if len(speaker_notes) < num_slides * 0.5:
        warnings.append(
            f"Only {len(speaker_notes)} speaker notes for {num_slides} slides. "
            f"Recommended: speaker notes on every slide."
        )

    return errors, warnings


def check_markup_mode(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check for bare function calls inside [...] markup blocks (missing # prefix)."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')
    lines = content.split('\n')

    # Common function calls that are often written bare by mistake
    bare_call_pattern = re.compile(
        r'^\s+(v|text|block|grid|stack|align|place|rect|circle|line|image|table|columns)\s*\('
    )

    # Track bracket depth to determine if we're in [...] markup mode
    # Simplified heuristic: look for lines that are clearly inside [...] blocks
    # (after #slide[, #block[, #dark-slide[, etc.) and NOT inside { } or (...) code blocks
    in_markup = 0  # depth of [...] nesting
    in_code = 0    # depth of {...} nesting
    in_paren = 0   # depth of (...) nesting — also code context in Typst
    violations = []

    for i, line in enumerate(lines, 1):
        stripped = line.strip()

        # Track nesting (simplified — counts brackets on each line)
        for ch in line:
            if ch == '[':
                in_markup += 1
            elif ch == ']':
                in_markup = max(0, in_markup - 1)
            elif ch == '{':
                in_code += 1
            elif ch == '}':
                in_code = max(0, in_code - 1)
            elif ch == '(':
                in_paren += 1
            elif ch == ')':
                in_paren = max(0, in_paren - 1)

        # If we're inside [...] markup AND NOT inside {...} or (...) code, check for bare calls
        if in_markup > 0 and in_code == 0 and in_paren == 0:
            if bare_call_pattern.match(line):
                # Exclude lines that start with # (correct) or are comments
                if not stripped.startswith('#') and not stripped.startswith('//'):
                    violations.append((i, stripped[:60]))

    if violations:
        sample = violations[:3]
        sample_str = '; '.join(f"line {ln}: `{code}`" for ln, code in sample)
        errors.append(
            f"MARKUP MODE VIOLATION: {len(violations)} bare function call(s) inside [...] markup blocks "
            f"(missing '#' prefix). These render as literal text, not executed code. "
            f"Examples: {sample_str}"
        )

    return errors, warnings


def check_lazy_layout_cols(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check definite lazy-column violations and surface uncertain cases."""
    errors = []
    warnings = []

    source_files = []
    for path in (
        _entry_file(project_path, entry_path),
        project_path / 'demo.typ',
        project_path / 'template.typ',
    ):
        if path.exists() and path not in source_files:
            source_files.append(path)
    if not source_files:
        return errors, warnings

    findings = [
        finding
        for source_file in source_files
        for finding in find_unsafe_lazy_layout_cols_in_file(source_file)
    ]

    def format_findings(items):
        sample = items[:5]
        sample_str = '; '.join(
            f"{finding.file.name}: line {finding.line}, col {finding.column}, "
            f"column #{finding.block_index} ({finding.block_kind}): {finding.reason}"
            for finding in sample
        )
        extra = ""
        if len(items) > len(sample):
            extra = f"; plus {len(items) - len(sample)} more"
        return sample_str + extra

    blockers = [finding for finding in findings if finding.severity == "blocker"]
    reviews = [finding for finding in findings if finding.severity != "blocker"]
    if blockers:
        errors.append(
            f"LAZY LAYOUT VIOLATION: {len(blockers)} definite unsafe "
            "cols(lazy-layout: true) column(s) detected. Every lazy column must "
            "contain exactly one direct stretchable component. Use ordinary cols "
            "for multi-component columns, or move the complete composition into "
            "one reusable component that retains terminal lazy-v(1fr). Do not hide "
            "multiple direct items behind a generic layout wrapper. Examples: "
            f"{format_findings(blockers)}"
        )
    if reviews:
        warnings.append(
            f"LAZY LAYOUT REVIEW: {len(reviews)} column(s) could not be verified "
            "structurally (for example dynamic expansion, control flow, or a "
            "generic layout wrapper). Confirm one direct stretchable component per "
            "column and its terminal lazy-v(1fr). Examples: "
            f"{format_findings(reviews)}"
        )

    return errors, warnings


def check_layout_monotony(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check for 3+ consecutive slides with identical layout structure."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')
    lines = content.split('\n')

    # Identify slide boundaries: track type ('heading' or 'slide') separately
    # so we can merge a == heading with its immediately following #slide body.
    SLIDE_BODY_RE = re.compile(
        r'^#(?:slide|dark-slide|focus-slide|thesis-slide|kpi-slide|plain-slide)\b'
    )
    HEADING_RE = re.compile(r'^==\s+')

    raw_starts = []  # list of (line_idx, kind)
    for i, line in enumerate(lines):
        if HEADING_RE.match(line):
            raw_starts.append((i, 'heading'))
        elif SLIDE_BODY_RE.match(line):
            raw_starts.append((i, 'slide'))

    if len(raw_starts) < 4:
        return errors, warnings  # Too few slides to check

    # --- Bug fix 1: merge a 'heading' with its immediately following 'slide' body ---
    # In Touying, "== Title\n\n#slide(...)[...]" renders as ONE visual slide.
    # Treating them as two separate nodes inflates consecutive-identical counts.
    # Strategy: if a heading is immediately followed (no other heading/slide in between)
    # by a #slide body, absorb the body into the heading's range so the heading
    # gets the richer signature of the combined block.
    merged_starts = []  # list of (line_idx, end_hint) where end_hint is None = use next boundary
    i = 0
    while i < len(raw_starts):
        line_idx, kind = raw_starts[i]
        if kind == 'heading' and i + 1 < len(raw_starts) and raw_starts[i + 1][1] == 'slide':
            # Merge: use heading line_idx but extend range to cover the slide body too.
            # The end of this merged node is the start of the node after the slide body.
            next_next_start = raw_starts[i + 2][0] if i + 2 < len(raw_starts) else len(lines)
            merged_starts.append((line_idx, next_next_start))
            i += 2  # skip both heading and its slide body
        else:
            next_start = raw_starts[i + 1][0] if i + 1 < len(raw_starts) else len(lines)
            merged_starts.append((line_idx, next_start))
            i += 1

    # Extract layout "signature" for each (merged) slide
    def get_layout_signature(start_idx: int, end_idx: int) -> str:
        """Create a simplified signature of the slide's layout pattern."""
        slide_lines = lines[start_idx:end_idx]
        slide_text = '\n'.join(slide_lines)

        features = []

        # --- Multi-column layout detection ---
        # Recognise all common forms:
        #   #cols[...][...]          — bracket style (Typst markup context)
        #   #cols(...)[...][...]     — paren-arg style
        #   #grid(columns: ...)      — explicit grid
        #   #slide(composer: ...)    — Touying composer multi-column
        has_multicol = (
            '#grid(' in slide_text
            or re.search(r'#cols\s*[\(\[]', slide_text)   # #cols( OR #cols[
            or re.search(r'#slide\s*\(.*?composer\s*:', slide_text, re.DOTALL)
        )
        if has_multicol:
            # Try to count columns from columns: (...) or composer: (...)
            col_match = re.search(r'(?:columns|composer)\s*:\s*\(([^)]+)\)', slide_text)
            if col_match:
                n = col_match.group(1).count('fr') + col_match.group(1).count(',') + 1
                features.append(f'grid-{n}col')
            else:
                features.append('grid')

        # Cards: #\w+-card (covers insight-card, kpi-card, pillar-card, etc.)
        if re.search(r'#\w+-card', slide_text):
            features.append('cards')

        # Boxes / named blocks: #\w+-box, #\w+-block, etc.
        if re.search(r'#\w+-box\s*[\(\[]', slide_text):
            features.append('rich-box')
        if re.search(r'#\w+-block\s*[\(\[]', slide_text):
            features.append('rich-box')
        if re.search(r'#\w+-table\s*\(', slide_text):
            features.append('table')

        # Image detection: both `#image(` (markup context) and bare `image(`
        # inside #figure(...) / argument context — both are equally valid Typst.
        if re.search(r'(?:#image|(?<=\()image)\s*\(', slide_text):
            features.append('image')

        if '#table(' in slide_text or '#data-table(' in slide_text:
            features.append('table')
        if '#stat-' in slide_text or '#kpi-' in slide_text:
            features.append('stats')

        # Academic / technical rich components (math decks, CS decks, etc.)
        # These are visually rich even without custom card components.
        # Note: #mono-card etc. are already caught by #\w+-card above.
        if re.search(r'#(?:pseudocode-list|pseudocode)\s*[\(\[]', slide_text):
            features.append('pseudocode')
        if re.search(r'#(?:mitex|mi)\s*[\(`]', slide_text):
            features.append('math')
        if re.search(r'#figure\s*[\(\[]', slide_text):
            features.append('figure')

        # Bullet-only detection (only meaningful when nothing richer was found)
        if not features:
            bullet_lines = [l for l in slide_lines if l.strip().startswith('- ') or l.strip().startswith('+ ')]
            non_empty = [l for l in slide_lines if l.strip() and not l.strip().startswith('//')]
            if non_empty and len(bullet_lines) / len(non_empty) > 0.6:
                features.append('bullets-only')

        if not features:
            features.append('text-only')

        return '|'.join(sorted(features))

    # Get signatures for merged slide list
    signatures = []
    for (start_idx, end_idx) in merged_starts:
        sig = get_layout_signature(start_idx, end_idx)
        signatures.append(sig)

    # Check for 3+ consecutive identical signatures
    # IMPORTANT: Only flag truly monotonous patterns (text-only / bullets-only).
    # Rich signatures like 'cards|grid-4col|rich-box' already indicate visual
    # diversity in components even if the high-level category label repeats —
    # flagging those would be a false positive.
    BORING_SIGS = {'text-only', 'bullets-only'}

    max_consecutive = 1
    current_run = 1
    worst_sig = ''
    for i in range(1, len(signatures)):
        if signatures[i] == signatures[i - 1]:
            current_run += 1
            if current_run > max_consecutive:
                max_consecutive = current_run
                worst_sig = signatures[i]
        else:
            current_run = 1

    # Repetition is a review signal; stable comparison/sequence layouts can be intentional.
    if max_consecutive >= 3 and worst_sig in BORING_SIGS:
        warnings.append(
            f"LAYOUT MONOTONY: {max_consecutive} consecutive slides share the same layout pattern "
            f"('{worst_sig}'). Confirm that the repetition supports the narrative; otherwise "
            f"consider a more suitable layout."
        )

    # Only warn about dominance for boring patterns (rich combos dominating is fine)
    from collections import Counter
    sig_counts = Counter(signatures)
    total = len(signatures)
    boring_count = sum(sig_counts.get(s, 0) for s in BORING_SIGS)
    if total >= 6 and boring_count / total > 0.5:
        warnings.append(
            f"LOW VARIETY: Plain/bullet-only layouts appear on {boring_count}/{total} slides "
            f"({boring_count*100//total}%). For diverse decks, use more rich components. "
            f"[FALSE POSITIVE RISK: The layout classifier uses heuristic regex — slides with "
            f"rich components (e.g. #\\w+-box, #cols, composer:) may be misclassified if the "
            f"pattern doesn't match. Always verify by inspecting overview.png visually.]"
        )

    return errors, warnings


def _rendered_svg_candidates(project_path: Path) -> List[Path]:
    """Return SVG files that represent rendered slides, not source assets."""
    candidates = []

    output_dir = project_path / 'output'
    if output_dir.exists():
        candidates.extend(output_dir.glob('svgs/slide_*.svg'))
        candidates.extend(output_dir.glob('**/slide_*.svg'))

    # `*.artifact.svg` is produced by the PPTX export path. Treat it as a
    # PPTX-specific intermediate, not as evidence for the current PDF/PNG run.
    # In repaired benchmark projects, PDF/overview may be regenerated later
    # while the old PPTX artifact remains. Scan the root artifact only when the
    # PPTX itself is current relative to the primary visual outputs.
    pptx = output_dir / 'slides.pptx'
    primary_outputs = [
        output_dir / 'slides.pdf',
        output_dir / 'overview.png',
    ]
    primary_mtime = max((path.stat().st_mtime for path in primary_outputs if path.exists()), default=None)
    pptx_is_current = (
        pptx.exists()
        and (primary_mtime is None or pptx.stat().st_mtime >= primary_mtime - 600)
    )
    if pptx_is_current:
        pptx_mtime = pptx.stat().st_mtime
        for artifact in project_path.glob('*.artifact.svg'):
            if abs(artifact.stat().st_mtime - pptx_mtime) <= 600:
                candidates.append(artifact)

    unique = []
    seen = set()
    for candidate in candidates:
        resolved = candidate.resolve()
        if resolved in seen or not candidate.is_file():
            continue
        seen.add(resolved)
        unique.append(candidate)
    return unique


def _read_text_lossy(path: Path) -> str:
    with path.open('r', encoding='utf-8', errors='ignore') as handle:
        return handle.read()


def _format_rendered_leak_hits(hits: List[Tuple[Path, str]], project_path: Path) -> str:
    examples = []
    for path, pattern in hits[:6]:
        try:
            rel = path.relative_to(project_path)
        except ValueError:
            rel = path
        examples.append(f"{rel}: `{pattern}`")
    return '; '.join(examples)


def check_rendered_raw_code_leaks(project_path: Path) -> Tuple[List[str], List[str]]:
    """Scan rendered SVG artifacts for visible Typst/template/Markdown source leaks.

    This complements source heuristics: a mixed-mode mistake may compile while
    rendering strings like `if self.store...` or Markdown table separators on a
    slide. We only scan rendered slide SVGs or root Typst artifact SVGs to avoid
    source assets.
    """
    errors = []
    warnings = []

    candidates = _rendered_svg_candidates(project_path)
    if not candidates:
        return errors, warnings

    error_hits = []
    warning_hits = []

    for svg in candidates:
        text = html.unescape(_read_text_lossy(svg))

        for pattern in RENDERED_RAW_CODE_ERROR_PATTERNS:
            if pattern in text:
                error_hits.append((svg, pattern))

        for pattern in RENDERED_RAW_CODE_WARNING_PATTERNS:
            if pattern in text:
                warning_hits.append((svg, pattern))

    if error_hits:
        errors.append(
            "RENDERED RAW-CODE LEAK: high-confidence Typst/template/Markdown source text "
            f"appears in rendered SVG output. Fix markup/code mode boundaries or convert "
            f"Markdown residue, then recompile. Examples: "
            f"{_format_rendered_leak_hits(error_hits, project_path)}"
        )

    if warning_hits:
        warnings.append(
            "POSSIBLE RENDERED RAW-CODE LEAK: code-like text appears in rendered SVG output. "
            "This is valid only on slides that intentionally show code examples. Inspect the "
            f"PNG/PDF before accepting. Examples: "
            f"{_format_rendered_leak_hits(warning_hits, project_path)}"
        )

    return errors, warnings


def check_typography_weight(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Review projects whose explicit typography weights are all bold."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    main_content = main_typ.read_text(encoding='utf-8')
    template_typ = project_path / 'template.typ'
    template_content = (
        template_typ.read_text(encoding='utf-8') if template_typ.exists() else ''
    )
    weight_pattern = re.compile(r'weight:\s*(?:"([a-z-]+)"|(\d{3}))', re.IGNORECASE)

    def weights(source: str) -> List[str]:
        return [
            (named or numeric).lower()
            for named, numeric in weight_pattern.findall(source)
        ]

    main_weights = weights(main_content)
    all_weights = main_weights + weights(template_content)
    if len(main_weights) >= 3 and all_weights and set(all_weights) == {'bold'}:
        warnings.append(
            f"TYPOGRAPHY REVIEW: All {len(all_weights)} explicit weight declaration(s) "
            "across main.typ and template.typ use \"bold\". Inspect the rendered hierarchy; "
            "vary weights only if headings, labels, and emphasis are visually indistinct."
        )

    return errors, warnings


def check_inline_mitex(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check for #mitex(...) used inline inside text/list lines (should be #mi(...) instead).

    In the mitex package:
      - #mi(...)    = inline LaTeX (renders inline, like $...$)
      - #mitex(...) = block LaTeX (renders as a display block, like $$...$$)

    Using #mitex() inside a bullet point or prose line causes the formula to
    break out as a separate paragraph, pushing content below it off the slide.
    Those should be #mi() instead.

    Detection heuristic: a line contains #mitex(...) AND has non-whitespace
    content before the #mitex call (i.e. it is embedded mid-line).
    Fenced code blocks are excluded.
    """
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')
    lines = content.split('\n')

    violations = []
    in_code_block = False

    for lineno, line in enumerate(lines, 1):
        stripped = line.strip()

        # Track fenced code blocks
        if re.match(r'^```', stripped) or re.match(r'^~~~', stripped):
            in_code_block = not in_code_block
            continue
        if in_code_block:
            continue

        # Skip lines without #mitex
        if '#mitex(' not in line:
            continue

        # Skip comments
        if stripped.startswith('//'):
            continue

        prefix = stripped.split('#mitex(', 1)[0]

        # A bare display formula or one nested only in a layout wrapper remains
        # block content.  For example, #align(center)[#mitex(...)] is not inline
        # prose and must not be reported.
        wrapper_prefix = re.compile(
            r'^(?:#[A-Za-z][\w-]*\s*(?:\([^\]]*\))?\s*\[\s*)+$'
        )
        if not prefix or wrapper_prefix.fullmatch(prefix):
            continue

        # Otherwise: #mitex is embedded after some other content → inline misuse
        violations.append((lineno, stripped[:100]))

    if violations:
        sample = violations[:3]
        sample_str = '; '.join(f"line {ln}: `{code}`" for ln, code in sample)
        warnings.append(
            f"INLINE MITEX REVIEW: {len(violations)} #mitex() call(s) appear inside "
            "text/list lines. #mitex() normally produces a display block; inspect the "
            "render and use #mi() when an inline formula was intended. "
            f"Examples: {sample_str}"
        )

    return errors, warnings


def check_em_dash(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Review inline ``---`` that can be interpreted as a Touying slide break.

    SeaSlides source uses the literal Unicode em dash (—). ``---`` in slide
    content is ambiguous with Touying's slide-break syntax and merits review.

    Legitimate uses that are NOT flagged:
      - Lines that begin with '---' (attribution signatures like '--- Author')
      - '|---|---' style table separator rows (GitHub Markdown tables in raw blocks)
      - Any line inside a fenced code block (``` ... ```)
      - Lines inside raw strings (between `...`)
    """
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')
    lines = content.split('\n')

    violations = []
    in_code_block = False  # inside ``` fenced block

    for lineno, line in enumerate(lines, 1):
        stripped = line.strip()

        # Track fenced code blocks (``` or ~~~)
        if re.match(r'^```', stripped) or re.match(r'^~~~', stripped):
            in_code_block = not in_code_block
            continue

        if in_code_block:
            continue  # skip everything inside code blocks (mermaid, pseudocode, etc.)

        if stripped.startswith('//'):
            continue

        # Skip lines that don't contain '---' at all
        if '---' not in line:
            continue

        # Skip table separator rows: lines where content (ignoring | and -) is only | and -
        # e.g. |---|---| or |-----------|--------|
        if re.match(r'^\s*\|[-|: ]+\|\s*$', line):
            continue

        # Skip lines where '---' appears only at the very start (after optional whitespace)
        # These are attribution lines like '--- Author Name' or '[--- Author Name]'
        # Pattern: optional whitespace, optional '[', then '---'
        if re.match(r'^\s*\[?\s*---', line):
            continue

        # Also skip lines where the ONLY non-whitespace content before '---' is '#text(...)['
        # e.g. '  #text(size: 0.7em)[--- Lagrange, 1788]'
        # These are attribution/citation signatures — intentional em-dash use.
        if re.match(r'^\s*#\w[\w.-]*\s*\([^)]*\)\s*\[---', line):
            continue

        # Skip lines inside raw inline spans (backtick code) — simplified heuristic:
        # if the line has an even number of backticks before the ---, it's likely outside raw.
        # Full implementation: just skip lines that look like Typst raw content.
        # (We accept the rare false negative here for simplicity.)

        # Now check: does '---' appear somewhere that is NOT at line start?
        # We look for '---' that is preceded by at least one non-whitespace character.
        inline_matches = re.findall(r'\S.*?---', line)
        if inline_matches:
            violations.append((lineno, line.strip()[:80]))

    if violations:
        sample = violations[:3]
        sample_str = '; '.join(f"line {ln}: `{code}`" for ln, code in sample)
        warnings.append(
            f"SLIDE-BREAK REVIEW: {len(violations)} inline '---' usage(s) found. "
            f"In SeaSlides/Touying content this can become a slide break. "
            f"Use the literal '—' for an em dash or '--' for an en dash. "
            f"(Exempt: line-start '--- Author' attribution, table separators, code blocks.) "
            f"Examples: {sample_str}"
        )

    return errors, warnings


def check_header_bars(
    project_path: Path,
    entry_path: Path | None = None,
) -> Tuple[List[str], List[str]]:
    """Check for full-width solid-color header bar anti-pattern."""
    errors = []
    warnings = []

    main_typ = _entry_file(project_path, entry_path)
    if not main_typ.exists():
        return errors, warnings

    content = main_typ.read_text(encoding='utf-8')

    # Detect full-width colored blocks at top of slides (common header bar pattern)
    header_bar_pattern = re.compile(
        r'#block\(\s*fill:\s*[^,]+,\s*(?:width:\s*100%|width:\s*1fr)',
        re.MULTILINE
    )
    matches = header_bar_pattern.findall(content)

    # Also check for rect with 100% width and fill at top of slides
    rect_bar_pattern = re.compile(
        r'#rect\(\s*fill:\s*[^,]+,\s*width:\s*100%',
        re.MULTILINE
    )
    rect_matches = rect_bar_pattern.findall(content)

    total = len(matches) + len(rect_matches)
    if total >= 3:
        warnings.append(
            f"HEADER BAR WARNING: {total} full-width colored blocks detected. "
            f"If these are title header bars, they create an 'AI slop' look. "
            f"Prefer: title on background with thin accent underline (30-60pt, 2-3pt tall). "
            f"[FALSE POSITIVE RISK: Thin accent stripes, footer bars, progress indicators, and "
            f"structural chrome in theme templates also match this pattern. This warning is "
            f"advisory only — if the visual result looks professional, you can ignore it.]"
        )

    return errors, warnings


# ============================================================
# Main
# ============================================================

def validate_project(
    project_path: str,
    strict: bool = False,
    mode: str = "delivery",
    entry: str = "main.typ",
) -> Tuple[bool, Dict]:
    """Run all validations on a project.

    Returns (passed, results_dict).
    """
    if mode not in {"delivery", "quick", "theme"}:
        raise ValueError(f"Unsupported validation mode: {mode}")

    path = Path(project_path).expanduser().resolve()
    if not path.exists():
        return False, {'errors': [f"Project path does not exist: {project_path}"], 'warnings': []}
    selected_entry = entry
    if (
        mode == "theme"
        and entry == "main.typ"
        and not (path / entry).is_file()
        and (path / "demo.typ").is_file()
    ):
        selected_entry = "demo.typ"
    context = None
    if not (
        mode == "theme"
        and selected_entry == "main.typ"
        and not (path / selected_entry).is_file()
    ):
        try:
            context = resolve_workspace_context(path, entry=selected_entry)
        except FileNotFoundError as error:
            return False, {
                'project': str(path),
                'entry': selected_entry,
                'mode': mode,
                'passed': False,
                'error_count': 1,
                'warning_count': 0,
                'errors': [str(error)],
                'warnings': [],
                'checks': {},
            }
        path = context.root
    entry_path = context.entry_path if context is not None else None

    all_errors = []
    all_warnings = []

    # Quick projects retain the delivery bundle but intentionally omit the
    # Strategist specification. Theme-development projects require neither.
    requires_delivery_outputs = mode in {"delivery", "quick"}
    requires_design_spec = mode == "delivery"
    checks = [
        ("Source Conversion Receipts", check_source_conversion_receipts),
        *([("Output Files", check_output_files)] if requires_delivery_outputs else []),
        ("Touying Version", lambda project: check_touying_version(project, entry_path)),
        ("Theme Selection", lambda project: check_theme_selection(
            project, mode=mode, entry_path=entry_path,
        )),
        ("Component Usage", lambda project: check_component_usage(
            project, mode=mode, entry_path=entry_path,
        )),
        ("Image Usage", lambda project: check_image_usage(project, entry_path)),
        *([("Design Spec", check_design_spec)] if requires_design_spec else []),
        ("Layout Diversity", lambda project: check_layout_diversity(
            project, mode=mode, entry_path=entry_path,
        )),
        ("Markup Mode", lambda project: check_markup_mode(project, entry_path)),
        ("Lazy Layout Columns", lambda project: check_lazy_layout_cols(project, entry_path)),
        ("Layout Monotony", lambda project: check_layout_monotony(project, entry_path)),
        ("Rendered Raw Code", check_rendered_raw_code_leaks),
        ("Typography Weight", lambda project: check_typography_weight(project, entry_path)),
        ("Header Bars", lambda project: check_header_bars(project, entry_path)),
        ("Em-Dash Usage", lambda project: check_em_dash(project, entry_path)),
        ("Inline Mitex", lambda project: check_inline_mitex(project, entry_path)),
    ]

    results_by_check = {}
    for check_name, check_fn in checks:
        errors, warnings = check_fn(path)
        results_by_check[check_name] = {'errors': errors, 'warnings': warnings}
        all_errors.extend(errors)
        all_warnings.extend(warnings)

    passed = len(all_errors) == 0
    if strict:
        passed = passed and len(all_warnings) == 0

    return passed, {
        'project': str(path),
        'entry': context.entry if context is not None else None,
        'mode': mode,
        'passed': passed,
        'error_count': len(all_errors),
        'warning_count': len(all_warnings),
        'errors': all_errors,
        'warnings': all_warnings,
        'checks': results_by_check,
    }


def print_results(results: Dict) -> None:
    """Print validation results in a readable format."""
    project = results['project']
    passed = results['passed']

    if passed:
        print(f"✅ PASSED: {project}")
    else:
        print(f"❌ FAILED: {project}")

    if results['errors']:
        print(f"\n  Errors ({results['error_count']}):")
        for err in results['errors']:
            print(f"    ❌ {err}")

    if results['warnings']:
        print(f"\n  Warnings ({results['warning_count']}):")
        for warn in results['warnings']:
            print(f"    ⚠️  {warn}")

    if not results['errors'] and not results['warnings']:
        print("  All checks passed with no issues.")

    print()


def main():
    parser = argparse.ArgumentParser(
        description="Validate a SeaSlides Typst Slides presentation project"
    )
    parser.add_argument("project_path", help="Path to the project directory")
    parser.add_argument(
        "--strict", action="store_true",
        help=(
            "Treat every warning as a failure; this blunt maintenance mode "
            "does not consume visual-review disposition receipts"
        )
    )
    parser.add_argument(
        "--json", action="store_true",
        help="Output results as JSON"
    )
    parser.add_argument(
        "--quiet", action="store_true",
        help="Only output pass/fail status"
    )
    parser.add_argument(
        "--mode", choices=("delivery", "quick", "theme"), default="delivery",
        help=(
            "Validation scope: Full Mode delivery (default), Quick Mode delivery without a "
            "design spec, or theme development"
        )
    )
    parser.add_argument(
        "--entry",
        default="main.typ",
        help="Workspace-relative Typst entry file (default: main.typ)",
    )

    args = parser.parse_args()

    passed, results = validate_project(
        args.project_path,
        strict=args.strict,
        mode=args.mode,
        entry=args.entry,
    )

    if args.json:
        import json
        print(json.dumps(results, indent=2, ensure_ascii=False))
    elif args.quiet:
        print("PASS" if passed else "FAIL")
    else:
        print_results(results)
        # Summary line
        if passed:
            print("Result: PASS ✅")
        else:
            print(f"Result: FAIL ❌ ({results['error_count']} errors, {results['warning_count']} warnings)")

    sys.exit(0 if passed else 1)


if __name__ == "__main__":
    main()
