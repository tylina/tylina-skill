#!/usr/bin/env python3
"""
SeaSlides Typst Slides - Unified Configuration Management Module

Centrally manages all project configuration items to ensure consistency and maintainability.

Usage:
    from config import PAGE_FORMATS, DESIGN_COLORS, INDUSTRY_COLORS

    # Get page format
    ppt169 = Config.get_page_format('ppt169')

    # Get color scheme
    colors = Config.get_color_scheme('consulting')
"""

import os
from pathlib import Path
from typing import Dict, List, Any, Optional

# ============================================================
# Path Configuration
# ============================================================

PROJECT_ROOT = Path(__file__).parent.parent
SCRIPTS_DIR = PROJECT_ROOT / 'scripts'
REFERENCES_DIR = PROJECT_ROOT / 'references'
TEMPLATES_DIR = PROJECT_ROOT / 'templates'
WORKFLOWS_DIR = PROJECT_ROOT / 'workflows'

REPO_ROOT = PROJECT_ROOT.parent.parent
EXAMPLES_DIR = REPO_ROOT / 'examples'
PROJECTS_DIR = REPO_ROOT / 'projects'

# ============================================================
# Environment Configuration
# ============================================================


def get_env_candidates() -> list[Path]:
    """Return the supported .env lookup order."""
    return [
        Path.cwd() / '.env',
        REPO_ROOT / '.env',
        Path.home() / '.seaslides-typst-slides-skill' / '.env',
    ]


def resolve_env_path() -> Path:
    """Return the first existing .env path, or CWD .env as default."""
    candidates = get_env_candidates()
    for candidate in candidates:
        if candidate.exists():
            return candidate
    return candidates[0]


def _strip_env_quotes(value: str) -> str:
    """Strip matching surrounding quotes from a .env value."""
    if len(value) >= 2 and value[0] == value[-1] and value[0] in ("'", '"'):
        return value[1:-1]
    return value


def _strip_inline_env_comment(value: str) -> str:
    """Strip an unquoted inline # comment from a .env value."""
    stripped = value.lstrip()
    if stripped.startswith(('"', "'")):
        quote = stripped[0]
        end = stripped.find(quote, 1)
        if end != -1:
            head = value[: len(value) - len(stripped) + end + 1]
            tail = value[len(head):]
            hash_pos = tail.find('#')
            if hash_pos == -1:
                return value
            return head + tail[:hash_pos]
        return value
    hash_pos = value.find('#')
    if hash_pos == -1:
        return value
    return value[:hash_pos]


def load_prefixed_env_file(
    prefixes: tuple[str, ...],
    *,
    deprecated_keys: Optional[dict[str, str]] = None,
) -> Optional[Path]:
    """Load matching keys from the first supported .env file.

    Existing process environment variables always win. Keys outside the
    requested prefixes are ignored so one shared .env can hold image, search,
    and narration credentials without leaking unrelated values.
    """
    env_path = resolve_env_path()
    if not env_path.exists():
        return None

    deprecated_keys = deprecated_keys or {}
    with env_path.open('r', encoding='utf-8') as fh:
        for lineno, raw_line in enumerate(fh, start=1):
            line = raw_line.strip()
            if not line or line.startswith('#'):
                continue
            if line.startswith('export '):
                line = line[7:].lstrip()
            if '=' not in line:
                continue

            key, value = line.split('=', 1)
            key = key.strip()
            if not key:
                continue
            if not any(key.startswith(prefix) for prefix in prefixes):
                continue
            if key in deprecated_keys:
                raise ValueError(
                    f"Unsupported key in {env_path}:{lineno}: {key}\n"
                    f"{deprecated_keys[key]}"
                )
            cleaned = _strip_inline_env_comment(value).strip()
            os.environ.setdefault(key, _strip_env_quotes(cleaned))

    return env_path


# ============================================================
# Page Format Configuration (Typst-native units)
# ============================================================

PAGE_FORMATS: Dict[str, Dict[str, Any]] = {
    'ppt169': {
        'name': '16:9 Presentation',
        'width': '1920pt',
        'height': '1080pt',
        'aspect_ratio': '16/9',
        'use_case': 'Modern projectors, online presentations'
    },
    'ppt43': {
        'name': '4:3 Presentation',
        'width': '1440pt',
        'height': '1080pt',
        'aspect_ratio': '4/3',
        'use_case': 'Traditional projectors'
    },
    'a4': {
        'name': 'A4 Document',
        'width': '595pt',
        'height': '842pt',
        'aspect_ratio': '297/210',
        'use_case': 'Print documents, PDF export'
    },
    'letter': {
        'name': 'US Letter',
        'width': '612pt',
        'height': '792pt',
        'aspect_ratio': '11/8.5',
        'use_case': 'US print documents'
    },
    'square': {
        'name': 'Square',
        'width': '1080pt',
        'height': '1080pt',
        'aspect_ratio': '1/1',
        'use_case': 'Social media square images'
    },
    'xiaohongshu': {
        'name': '小红书',
        'width': '1242pt',
        'height': '1660pt',
        'aspect_ratio': '3/4',
        'use_case': 'Knowledge sharing, product reviews'
    },
    'story': {
        'name': 'Story/Vertical',
        'width': '1080pt',
        'height': '1920pt',
        'aspect_ratio': '9/16',
        'use_case': 'Short video covers, stories'
    },
    'wechat': {
        'name': 'WeChat Article Header',
        'width': '900pt',
        'height': '383pt',
        'aspect_ratio': '2.35/1',
        'use_case': 'WeChat article cover images'
    },
}

# ============================================================
# Canvas Formats (pixel dimensions for image layout computation)
# ============================================================
# Typst pt maps 1:1 to pixels for layout computation.

CANVAS_FORMATS: Dict[str, Dict[str, Any]] = {
    'ppt169': {
        'name': 'PPT 16:9',
        'width': 1920,
        'height': 1080,
    },
    'ppt43': {
        'name': 'PPT 4:3',
        'width': 1440,
        'height': 1080,
    },
}

LAYOUT_MARGINS: Dict[str, Dict[str, int]] = {
    'ppt169': {
        'top': 60, 'right': 60, 'bottom': 60, 'left': 60,
        'content_width': 1800, 'content_height': 960,
    },
    'ppt43': {
        'top': 60, 'right': 60, 'bottom': 60, 'left': 60,
        'content_width': 1320, 'content_height': 960,
    },
}

PAGE_FORMAT_ALIASES: Dict[str, str] = {
    'xhs': 'xiaohongshu',
    'wechat_moment': 'square',
    'wechat-moment': 'square',
    'moments': 'square',
    '朋友圈': 'square',
    '小红书': 'xiaohongshu',
}

# ============================================================
# Design Color Configuration
# ============================================================

DESIGN_COLORS: Dict[str, Dict[str, str]] = {
    'consulting': {
        'name': 'Consulting Style',
        'primary': '#005587',
        'secondary': '#0076A8',
        'accent': '#F5A623',
        'success': '#27AE60',
        'warning': '#E74C3C',
        'text_dark': '#1A252F',
        'text_light': '#FFFFFF',
        'text_muted': '#7F8C8D',
        'background': '#FFFFFF',
        'background_alt': '#F8F9FA'
    },
    'general': {
        'name': 'General Flexible Style',
        'primary': '#2196F3',
        'secondary': '#4CAF50',
        'accent': '#FF9800',
        'purple': '#9C27B0',
        'success': '#27AE60',
        'warning': '#E74C3C',
        'text_dark': '#2C3E50',
        'text_light': '#FFFFFF',
        'text_muted': '#7F8C8D',
        'background': '#FFFFFF',
        'background_alt': '#F8F9FA'
    },
    'tech': {
        'name': 'Tech Style',
        'primary': '#00D1FF',
        'secondary': '#7B61FF',
        'accent': '#00FF88',
        'success': '#00FF88',
        'warning': '#FF6B6B',
        'text_dark': '#0A0E17',
        'text_light': '#FFFFFF',
        'text_muted': '#8892A0',
        'background': '#0A0E17',
        'background_alt': '#1A1F2E'
    },
    'academic': {
        'name': 'Academic Style',
        'primary': '#8B0000',
        'secondary': '#1E3A5F',
        'accent': '#C9B037',
        'success': '#2E7D32',
        'warning': '#D32F2F',
        'text_dark': '#1A1A1A',
        'text_light': '#FFFFFF',
        'text_muted': '#666666',
        'background': '#FFFFFF',
        'background_alt': '#F5F5F5'
    },
    'government': {
        'name': 'Government Style',
        'primary': '#C41E3A',
        'secondary': '#1E3A5F',
        'accent': '#D4AF37',
        'success': '#2E7D32',
        'warning': '#B71C1C',
        'text_dark': '#1A1A1A',
        'text_light': '#FFFFFF',
        'text_muted': '#555555',
        'background': '#FFFFFF',
        'background_alt': '#FFF8E1'
    }
}

# ============================================================
# Industry Color Templates
# ============================================================

INDUSTRY_COLORS: Dict[str, Dict[str, str]] = {
    'finance': {
        'name': 'Finance/Banking',
        'primary': '#003366',
        'secondary': '#4A90D9',
        'accent': '#D4AF37'
    },
    'healthcare': {
        'name': 'Healthcare/Medical',
        'primary': '#00796B',
        'secondary': '#4DB6AC',
        'accent': '#FF7043'
    },
    'technology': {
        'name': 'Technology/Internet',
        'primary': '#1565C0',
        'secondary': '#42A5F5',
        'accent': '#00E676'
    },
    'education': {
        'name': 'Education/Training',
        'primary': '#5E35B1',
        'secondary': '#7E57C2',
        'accent': '#FFD54F'
    },
    'retail': {
        'name': 'Retail/Consumer',
        'primary': '#E53935',
        'secondary': '#EF5350',
        'accent': '#FFB300'
    },
    'manufacturing': {
        'name': 'Manufacturing/Industrial',
        'primary': '#455A64',
        'secondary': '#78909C',
        'accent': '#FF6F00'
    },
    'energy': {
        'name': 'Energy/Environmental',
        'primary': '#2E7D32',
        'secondary': '#66BB6A',
        'accent': '#FDD835'
    },
    'realestate': {
        'name': 'Real Estate/Construction',
        'primary': '#795548',
        'secondary': '#A1887F',
        'accent': '#4CAF50'
    },
    'legal': {
        'name': 'Legal/Compliance',
        'primary': '#37474F',
        'secondary': '#546E7A',
        'accent': '#8D6E63'
    },
    'media': {
        'name': 'Media/Entertainment',
        'primary': '#7B1FA2',
        'secondary': '#AB47BC',
        'accent': '#FF4081'
    },
    'logistics': {
        'name': 'Logistics/Supply Chain',
        'primary': '#F57C00',
        'secondary': '#FFB74D',
        'accent': '#0288D1'
    },
    'agriculture': {
        'name': 'Agriculture/Food',
        'primary': '#558B2F',
        'secondary': '#8BC34A',
        'accent': '#FFCA28'
    },
    'tourism': {
        'name': 'Tourism/Hospitality',
        'primary': '#00ACC1',
        'secondary': '#4DD0E1',
        'accent': '#FF7043'
    },
    'automotive': {
        'name': 'Automotive/Transportation',
        'primary': '#263238',
        'secondary': '#455A64',
        'accent': '#D32F2F'
    },
    'consulting': {
        'name': 'Consulting/Advisory',
        'primary': '#2c3e50',
        'secondary': '#34495e',
        'accent': '#7f8c8d'
    },
    'government': {
        'name': 'Government/Public Sector',
        'primary': '#2980b9',
        'secondary': '#34495e',
        'accent': '#c0392b'
    },
    'nonprofit': {
        'name': 'Nonprofit/NGO',
        'primary': '#27ae60',
        'secondary': '#16a085',
        'accent': '#f39c12'
    },
    'creative': {
        'name': 'Creative/Design',
        'primary': '#9b59b6',
        'secondary': '#e74c3c',
        'accent': '#f39c12'
    },
}

# ============================================================
# Font Configuration
# ============================================================

FONT_PRESETS: Dict[str, Dict[str, str]] = {
    'P1': {
        'title': 'Roboto',
        'body': 'Open Sans',
        'code': 'Fira Code',
        'math': 'Latin Modern Math'
    },
    'P2': {
        'title': 'Montserrat',
        'body': 'Lato',
        'code': 'Fira Code',
        'math': 'Latin Modern Math'
    },
    'P3': {
        'title': 'Playfair Display',
        'body': 'Source Sans Pro',
        'code': 'Source Code Pro',
        'math': 'Latin Modern Math'
    },
    'P4': {
        'title': 'Oswald',
        'body': 'Roboto',
        'code': 'JetBrains Mono',
        'math': 'Latin Modern Math'
    },
    'P5': {
        'title': 'Noto Sans SC',
        'body': 'Noto Serif SC',
        'code': 'Noto Sans Mono SC',
        'math': 'Latin Modern Math'
    }
}

FONT_SIZES: Dict[str, int] = {
    'title_large': 48,
    'title': 36,
    'title_small': 28,
    'heading': 24,
    'subheading': 20,
    'body': 18,
    'body_small': 16,
    'caption': 14,
    'footnote': 12
}

# ============================================================
# Typst-Specific Configuration
# ============================================================

DEFAULT_PACKAGES: List[str] = [
    '@preview/touying:0.7.4',
    '@preview/ctex:0.8.0',
    '@preview/fletcher:0.5.8',
    '@preview/showybox:1.0.2'
]

COMPILATION_SETTINGS: Dict[str, Any] = {
    'default_format': 'pdf',
    'default_ppi': 144,
    'pdf_engine': 'typst',
}

QUALITY_THRESHOLDS: Dict[str, Any] = {
    'max_overflow_warnings': 0,
    'min_page_count': 1,
    'max_file_size_mb': 50
}

# ============================================================
# Image Settings
# ============================================================

IMAGE_SETTINGS: Dict[str, Any] = {
    'supported_formats': ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.svg'],
    'max_width': 3840,
    'max_height': 2160,
    'default_aspect_ratio': '16:9',
    'default_size': '1024x1024'
}

# ============================================================
# Export Settings
# ============================================================

EXPORT_SETTINGS: Dict[str, Any] = {
    'pdf': {
        'compression': True,
        'embed_fonts': True
    },
    'png': {
        'ppi': 144,
        'transparency': False
    },
}

# ============================================================
# Helper Functions
# ============================================================

def normalize_page_format(format_key: str) -> str:
    """Normalize page format key name (supports common aliases)."""
    if not format_key:
        return ''
    key = format_key.strip().lower()
    return PAGE_FORMAT_ALIASES.get(key, key)

def get_page_format(format_name: str) -> Dict[str, Any]:
    """Get page format configuration."""
    normalized = normalize_page_format(format_name)
    return PAGE_FORMATS.get(normalized, PAGE_FORMATS['ppt169'])

def get_industry_colors(industry: str) -> Dict[str, str]:
    """Get color scheme for a specific industry."""
    return INDUSTRY_COLORS.get(industry.lower(), INDUSTRY_COLORS['technology'])

def get_design_colors(style: str) -> Dict[str, str]:
    """Get design color scheme for a presentation style."""
    return DESIGN_COLORS.get(style.lower(), DESIGN_COLORS['general'])

def get_font_preset(preset: str) -> Dict[str, str]:
    """Get font preset by name (P1-P5)."""
    return FONT_PRESETS.get(preset, FONT_PRESETS['P1'])

def list_industries() -> List[str]:
    """Get list of available industry color schemes."""
    return list(INDUSTRY_COLORS.keys())

def list_font_presets() -> List[str]:
    """Get list of available font presets."""
    return list(FONT_PRESETS.keys())

def list_page_formats() -> List[str]:
    """Get list of available page formats."""
    return list(PAGE_FORMATS.keys())

def export_config() -> Dict[str, Any]:
    """Export all configuration as a single dictionary (useful for JSON export)."""
    return {
        "page_formats": PAGE_FORMATS,
        "canvas_formats": CANVAS_FORMATS,
        "layout_margins": LAYOUT_MARGINS,
        "design_colors": DESIGN_COLORS,
        "industry_colors": INDUSTRY_COLORS,
        "font_presets": FONT_PRESETS,
        "font_sizes": FONT_SIZES,
        "default_packages": DEFAULT_PACKAGES,
        "compilation_settings": COMPILATION_SETTINGS,
        "quality_thresholds": QUALITY_THRESHOLDS,
        "image_settings": IMAGE_SETTINGS,
        "export_settings": EXPORT_SETTINGS,
    }


# ============================================================
# CLI Entry Point
# ============================================================

def main() -> None:
    """CLI entry point for inspecting configuration."""
    import sys
    import json

    commands = {
        "list-formats": "List available page formats",
        "list-colors": "List design color schemes",
        "list-industries": "List industry color palettes",
        "list-fonts": "List font presets",
        "export": "Export all configuration as JSON",
    }

    if len(sys.argv) < 2 or sys.argv[1] in ("-h", "--help"):
        print("SeaSlides Typst Slides - Configuration Inspector\n")
        print("Usage: python3 config.py <command>\n")
        print("Commands:")
        for cmd, desc in commands.items():
            print(f"  {cmd:<20} {desc}")
        print(f"\n  <format_name>        Show details for a specific format (e.g. ppt169)")
        return

    command = sys.argv[1]

    if command == "list-formats":
        print("Available page formats:\n")
        for key, fmt in PAGE_FORMATS.items():
            print(f"  {key:<14} {fmt['name']:<25} {fmt['width']}x{fmt['height']}  ({fmt['use_case']})")

    elif command == "list-colors":
        print("Design color schemes:\n")
        for key, scheme in DESIGN_COLORS.items():
            print(f"  {key:<14} {scheme['name']:<25} primary={scheme['primary']}")

    elif command == "list-industries":
        print("Industry color palettes:\n")
        for key, palette in INDUSTRY_COLORS.items():
            print(f"  {key:<16} {palette['name']:<25} primary={palette['primary']}  accent={palette['accent']}")

    elif command == "list-fonts":
        print("Font presets:\n")
        for key, preset in FONT_PRESETS.items():
            print(f"  {key}: title={preset['title']}, body={preset['body']}, code={preset['code']}")

    elif command == "export":
        print(json.dumps(export_config(), indent=2, ensure_ascii=False))

    elif command in PAGE_FORMATS:
        fmt = PAGE_FORMATS[command]
        print(f"Format: {command}")
        for k, v in fmt.items():
            print(f"  {k}: {v}")

    else:
        normalized = normalize_page_format(command)
        if normalized in PAGE_FORMATS:
            fmt = PAGE_FORMATS[normalized]
            print(f"Format: {normalized} (alias of '{command}')")
            for k, v in fmt.items():
                print(f"  {k}: {v}")
        else:
            print(f"Unknown command or format: {command}")
            print(f"Run 'python3 config.py --help' for usage.")
            sys.exit(1)


if __name__ == "__main__":
    main()
