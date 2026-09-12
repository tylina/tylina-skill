# Slate Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `slate-theme`
**Style**: Dark professional with amber accents
**Primary color**: `#FFB74D` (amber accent on `#1a1a2e` dark background)
**Best For**: Tech product launches, keynotes, sophisticated presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A sleek, dark professional theme with charcoal/slate gray tones and warm amber accents. Inspired by premium tech product launches and sophisticated keynote presentations. Features styled code blocks for dark backgrounds and clean amber accent lines.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: slate-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Optional left footer content; accepts content or `self => content` |

## Available Slide Types

### `#title-slide()`
Dramatic dark cover with left-aligned title, amber accent line, and subtle metadata.

### `#slide(title: auto)`
Dark slide with medium-weight heading, amber accent line, optional left footer content, and amber page counter at right.

### `#new-section-slide[...]`
Dark section divider with amber accent bar.

### `#focus-slide[...]`
Amber background with dark text for maximum emphasis.

### `#ending-slide[...]`
Dark background with amber accent decorations.

## Reusable Components

### `#slate-card(title, body, accent: none)`
Dark card with amber left border. Use `accent: palette.accent2` for the cyan variant. Place exactly one card per column in `#cols(lazy-layout: true)` when equal heights are desired.

### `#badge(label, color: none)`
Rounded badge/chip. Defaults to amber, supports custom colors.

### `#accent-line()`
Thin amber divider line.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#37474F` | `palette.primary` | Slate gray base tone |
| **Background** | `#1a1a2e` | `palette.bg` | Dark slate page background |
| **Card BG** | `#252540` | `palette.card-bg` | Card and component fills |
| **Accent** | `#FFB74D` | `palette.accent` | Amber highlight, accents |
| **Accent 2** | `#4DD0E1` | `palette.accent2` | Cyan secondary accent |
| **Border** | `#3a3a5c` | `palette.border` | Card border strokes |
| **Text** | `#ECEFF1` | `palette.text` | Primary text color |
| **Text Secondary** | `#90A4AE` | `palette.text-sec` | Subtle / secondary text |
| **Code BG** | `#0D1117` | `palette.code-bg` | Block and inline code background |
| **Code Text** | `#C9D1D9` | `palette.code-text` | Block code foreground |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.text,
  neutral-darkest: palette.bg,
)
```

## Plain-Tier Usage

Slate's dark professional aesthetic is intentionally content-led:

- Use native `#cols` for comparisons and `#slate-card` for grouped concepts.
- Reserve amber and cyan for semantic emphasis, rules, badges, and chart series.
- Keep custom styling in `template.typ`; ordinary deck content should use standard headings, lists, math, code, and the documented components.
- For equal-height cards, use one `slate-card` per column with `lazy-layout: true`; do not use lazy layout for mixed text/chart columns.

## Files

- `template.typ` — Theme definition
- `demo.typ` — Usage example (compilable)
