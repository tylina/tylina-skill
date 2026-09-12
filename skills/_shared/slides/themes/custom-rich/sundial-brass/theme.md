# Sundial Brass Theme — API Documentation

## Overview

The **Sundial Brass** theme draws inspiration from astronomical instruments, horology, sundial engravings, armillary spheres, and celestial clockwork. It combines the precision of timekeeping with celestial beauty, using warm ivory backgrounds, aged brass/bronze primary colors, deep navy secondary tones, and patina green accents.

**Best for:** Academic research, time-series analysis, historical studies, philosophy, physics presentations.

## Installation

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *
```

## Theme Entry Point

### `sundial-brass-theme`

```typst
#show: sundial-brass-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  footer: [Your Footer Text],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)
```

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `palette.bg` | `#FDFAF3` | Warm ivory background |
| `palette.ivory` | `#F8F5EC` | Slightly deeper ivory for cards |
| `palette.ink` | `#2D2A26` | Primary text (warm charcoal) |
| `palette.brass` | `#8B6914` | Primary accent (aged brass/bronze) |
| `palette.navy` | `#1B2B4A` | Secondary accent (deep navy) |
| `palette.patina` | `#4A7C59` | Tertiary accent (patina green) |
| `palette.charcoal` | `#2D2A26` | Same as ink |
| `palette.brass-light` | `#B8941F` | Light brass variant |
| `palette.navy-muted` | `#3B4D6B` | Muted navy for subtitles |
| `palette.card-bg` | `#FFFDF7` | Card background |
| `palette.border` | `#E8DFC8` | Card/component borders |
| `palette.text-muted` | `#6B6560` | Secondary text |
| `palette.shadow-warm` | `#D4C9A8` | Warm shadow tone |

## Slide Functions

### `title-slide()`
Title slide with bookend frame, armillary sphere ornament, and radiating sundial background. Shares the bookend frame with `ending-slide`.

### `slide(title: auto)`
Standard content slide with persistent sundial hour-line atmosphere, brass header divider, and footer with slide numbers.

### `new-section-slide`
Auto-generated section divider with Roman numeral section number, gear-teeth top border, and gnomon pointer decoration.

### `focus-slide(body)`
Emphasis slide with centered content and radiating sundial atmosphere. Use for key quotes or statements.

### `ending-slide(body)`
Closing slide with bookend frame (shared with title slide), armillary rings ornament, and centered farewell text.

## Components

### `hour-card(title, body, accent: palette.brass)`
Card with radiating hour-line accent from top-left corner. Primary content card for the theme.

**Parameters:**
- `title` (content): Card heading
- `body` (content): Card content
- `accent` (color): Left border and indicator color

### `gnomon-stat(label, value, description: none, color: palette.brass)`
Metric display with sundial shadow-angle pointer indicator. Use for KPIs and statistics.

**Parameters:**
- `label` (content): Metric label
- `value` (content): Large metric value
- `description` (content, optional): Small description text
- `color` (color): Accent color

### `gear-box(title, body, accent: palette.brass)`
Highlighted content box with gear-teeth borders at top and bottom. Use for equations, code, or important definitions.

**Parameters:**
- `title` (content): Box heading
- `body` (content): Box content
- `accent` (color): Title accent color

### `meridian-quote(body, attribution: none)`
Quote block with celestial arc decoration and navy left border.

**Parameters:**
- `body` (content): Quote text
- `attribution` (content, optional): Attribution text

### `epoch-tag(content, color: palette.brass)`
Time-period style inline tag with Roman numeral aesthetic. Use for categories, labels, or era markers.

**Parameters:**
- `content` (content): Tag text
- `color` (color): Tag color

### `dial-divider(color: palette.brass, width: 80%)`
Radiating line separator with tick marks. A visual break between content sections.

**Parameters:**
- `color` (color): Divider color
- `width` (length): Divider width

### `armillary-box(title, body, accent: palette.navy)`
Feature box with concentric ring decoration in the top-right corner. Use for highlights, insights, or key concepts.

**Parameters:**
- `title` (content): Box heading
- `body` (content): Box content
- `accent` (color): Border and title color

### `chronometer-list(items, accent: palette.brass)`
Numbered list with clock-position circle indicators. Use for ordered steps, timelines, or processes.

**Parameters:**
- `items` (array of content): List items
- `accent` (color): Numbered circle color

### `engraving-card(title, body, accent: palette.brass)`
Card with subtle cross-hatch texture background evoking brass engraving. Use for technical details or craftsmanship notes.

**Parameters:**
- `title` (content): Card heading
- `body` (content): Card content
- `accent` (color): Left border color

## SVG Decorative Helpers

These lower-level helpers are available for custom layouts:

- `sundial-bg()` — Full-page radiating hour lines background
- `bookend-frame()` — Ornate brass border with gear teeth and armillary rings
- `dial-divider-render(width)` — Inline dial divider SVG
- `gnomon-pointer(size)` — Sundial shadow pointer ornament
- `gear-border-render(width)` — Gear-teeth line segment
- `armillary-rings(size)` — Concentric sphere rings ornament
- `celestial-arc-render(width)` — Curved celestial arc decoration

## Layout Tips

- Use `cols(columns: (..), gutter: .., lazy-layout: true, ..)` only when every column contains exactly one direct stretchable component. The components' terminal `lazy-v(1fr)` is inert outside lazy layout.
- Combine `epoch-tag` elements in a `stack(dir: ltr, spacing: ..)` for tag rows
- Use `gnomon-stat` in grid layouts (`cols` with 3-4 columns) for dashboards
- Headers use `stack(spacing:)` — never use `v()` in headers
