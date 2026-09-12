# Quill Ink Theme — API Reference

## Overview

A calligraphic ink-on-parchment theme for Touying 0.7.4. Deep indigo ink strokes on warm ivory paper evoking a scholar's writing desk. Elegant, literary, and timeless. Suitable for humanities, philosophy, literature, and history presentations.

## Import & Setup

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: quill-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Department Name],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)
```

## Theme Entry Function

### `quill-ink-theme`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content or function `(self) => content` |
| `..args` | any | — | Additional Touying config arguments |

## Slide Functions

### `title-slide(..args)`

Cover slide with ink border frame, quill pen ornament, and calligraphic flourish. Displays title, subtitle, author, institution, and date from `config-info`.

### `slide(title: auto, ..args)`

Standard content slide with parchment texture background atmosphere, indigo header with ink accent rule, and footer with page numbers.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title (auto uses heading) |

### `new-section-slide`

Automatically inserted at `= Heading` markers. Shows section title with indigo accent, large faint section number, and calligraphic flourish.

### `outline-slide(title: content)`

Table of contents slide with two-column layout.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `[Contents]` | TOC heading |

### `focus-slide(body)`

Deep indigo background with cream text for key statements or quotations.

### `ending-slide(body)`

Closing slide with ink border frame (bookending with title slide), quill ornament, and calligraphic flourish.

## Components

### `manuscript-card[title][body]`

Card with calligraphic header accent and aged paper feel. Top-bordered with indigo accent.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card heading |
| `body` | content | required | Card content |
| `accent` | color | `palette.primary` | Accent color |

### `marginalia[body]`

Side-note style block without border. Indented with quill nib SVG mark. Italic text.

### `ink-quote[body][attribution]`

Quotation block with SVG ink-drawn quote marks, left sepia border, and attribution line.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `body` | content | required | Quote text |
| `attribution` | content | required | Source attribution |

### `quill-tag[label]`

Small inline tag/badge with pen-nib icon.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Tag text |
| `color` | color | `palette.primary` | Tag color |

### `theorem-block[title][body]`

Formal proposition block with colored header bar and tinted body. Uses `stack(spacing: 0pt)` for adjacent colored blocks.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Theorem/proposition title |
| `body` | content | required | Statement content |
| `accent` | color | `palette.tertiary` | Block color |

### `annotation-card[title][body]`

Scholarly annotation style with left accent bar and section symbol prefix.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Annotation heading |
| `body` | content | required | Annotation content |
| `accent` | color | `palette.secondary` | Accent color |

### `stat-card[value][label]`

Key figure display with ink drop SVG decoration.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | content | required | Large display value |
| `label` | content | required | Description label |
| `accent` | color | `palette.primary` | Value color |

### `comparison-table(headers, rows)`

Parchment-styled academic table with alternating row backgrounds.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `headers` | array | required | Column headers (array of content) |
| `rows` | array | required | Table rows (array of arrays) |

### `codex-box[title][body]`

Bordered manuscript-style container with double-rule top accent.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box heading |
| `body` | content | required | Box content |
| `accent` | color | `palette.primary` | Border/accent color |

### `colophon[body]`

Attribution/credits block with subtle muted styling.

## Color Palette

Access via `palette.*`:

| Key | Hex | Description |
|-----|-----|-------------|
| `bg` | `#FBF9F4` | Warm ivory/parchment background |
| `primary` | `#2C3E6B` | Deep indigo ink |
| `secondary` | `#8B4513` | Warm sienna/sepia |
| `tertiary` | `#4A6741` | Forest green ink |
| `text-dark` | `#1A1A2E` | Near-black ink |
| `text-body` | `#3D3D5C` | Dark indigo body text |
| `text-muted` | `#7A7A99` | Muted indigo-gray |
| `card-bg` | `#FFFEF9` | Cream white cards |
| `border` | `#D4C5A9` | Aged paper edge |
| `accent-muted` | `#E8DCC8` | Parchment accent |

## SVG Decorations

The theme includes the following SVG decorations accessible as helper functions:

- `parchment-texture(color)` — Full-page aged paper grain
- `calligraphic-flourish(color, width)` — Ornamental swash divider
- `ink-drops(color, size)` — Scattered ink splatter
- `quill-pen(color, height)` — Feather quill ornament
- `ink-border-frame(color)` — Full-page decorative frame
- `quote-marks(color, size)` — Calligraphic quotation marks
- `quill-nib-icon(color, size)` — Small pen nib icon

## Background Atmosphere

Every content slide automatically includes `_bg-atmosphere()` which renders:
1. Full-page parchment paper grain texture
2. Small ink drops in bottom-right corner
3. Faint quill pen accent in top-right

## Bookending

Title and ending slides share the ink border frame with calligraphic corner accents, creating visual symmetry. Content slides do not have this frame.

## Usage Tips

- Use `#cols(columns: (...))[ ... ][ ... ]` for multi-column layouts
- Components use content-block API: `#component[title][body]`
- All card-type components include `lazy-v(1fr)` for height equalization in columns
- Set fonts in your demo.typ: `#set text(font: ("Baskerville", "Songti SC", "Arial Unicode MS"))`
- The theme sets `text(size: 20pt)` by default
