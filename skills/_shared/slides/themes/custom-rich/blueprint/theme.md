# Blueprint Theme — API Reference

## Overview

| Property | Value |
|----------|-------|
| Theme Name | Blueprint |
| Display Name | Blueprint |
| Style | Light, Technical, Architectural |
| Best For | Engineering, Architecture, Technical Presentations, Design Reviews |
| Complexity | Rich |
| Touying Version | 0.7.4 |

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Charter", "Arial Unicode MS"), size: 18pt)

#show: blueprint-theme.with(
  aspect-ratio: "16-9",
  footer: [Project Name — Phase],
  config-info(
    title: [Presentation Title],
    subtitle: [Technical Subtitle],
    author: [Author Name],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

= Section Title
== Slide Title
Content here...

#focus-slide[Key Message]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment |
| `footer` | content/none | `none` | Footer text |

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `palette.bg` | `#FAFCFF` | Page background (near-white) |
| `palette.ink` | `#111827` | Primary text |
| `palette.blue` | `#1D4ED8` | Blueprint blue — primary accent |
| `palette.gray` | `#6B7280` | Secondary text, captions |
| `palette.red` | `#DC2626` | Dimension markers, alerts |
| `palette.wash` | `#EFF6FF` | Light blue card fill |
| `palette.blue-light` | 80% transparent blue | Subtle accents |
| `palette.blue-faint` | 92% transparent blue | Very subtle fills |
| `palette.ink-muted` | 55% transparent ink | Muted text |
| `palette.grid-line` | 88% transparent blue | Grid background |
| `palette.construction` | 70% transparent blue | Construction lines |

## Slide Types

### `title-slide()`
Full technical drawing frame with registration marks, dimension arrows, title block zone. Bookend element.

### `new-section-slide`
Auto-triggered on `= Heading`. Large transparent section number, section divider SVG, grid background.

### `slide(title: auto, align: auto)`
Default content slide with blueprint grid atmosphere, construction lines, technical header accent.

### `focus-slide(body)`
Inverted blue background with white grid and registration marks. Centered emphasis text.

### `ending-slide(body)`
Matches title-slide bookend — same frame and registration marks with closing message.

## Reusable Components

### `concept-card(title, body, zone: none)`
Technical specification card with blue left border. Optional zone reference badge.

### `insight-box(body)`
Highlighted insight with dimension arrow decoration at top.

### `stat-card(value, caption, unit: none)`
Large metric display with measurement styling and divider line. Its value, divider, and caption are grouped in a vertical stack so the card can expand cleanly inside a column.

### `spec-card(title, body, rev: none)`
Card with colored header bar (blue). Optional revision number.

### `dimension-box(title, body)`
Callout with full-width dimension arrow at top. Red title.

### `quote-card(body, attribution: none)`
Quotation with blue left border, opening quote mark, optional attribution.

### `schematic-card(title, body)`
Dashed-border card evoking construction drawings. Circle bullet title.

### `callout-box(title, body, accent: palette.red)`
Warning/note with configurable accent color. Red by default.

## Decorative Elements

### `blueprint-tag(label, accent: palette.blue)`
Inline tag/badge in technical style. All-caps monospace.

### `blueprint-divider()`
SVG-based section divider with zone marker (not just a line).

### `dimension-arrow(width: 100%)`
Inline red dimension arrow with endpoint markers.

### `section-divider(width: 70%)`
Technical section break with center zone marker.

### `grid-ref(label)`
Small monospace zone reference badge.

## Layout Patterns Used in Demo

1. **4-column stats row** — one `stat-card` per `cols(lazy-layout: true)` column
2. **3-column concept cards** — one `concept-card` with a zone ref per `cols(lazy-layout: true)` column
3. **2-column split** — specs + schematics side by side
4. **Quote + stats** — `quote-card` paired with metrics
5. **Spec sequence** — `spec-card` with revision tracking
6. **Tags row** — inline `blueprint-tag` elements
7. **Divider-separated sections** — `blueprint-divider()` between content blocks
8. **Dedicated carbon profile** — standalone chart slide sized to remain clear of the technical footer

## SVG Decorations

| SVG | Purpose | Coverage |
|-----|---------|----------|
| Blueprint grid | Full-page minor/major grid pattern | All content slides |
| Construction lines | Diagonal + center guides | All content slides |
| Registration marks | Corner + center crosshair marks | Title/ending (bookend) |
| Title frame | Technical drawing border with title block | Title/ending (bookend) |
| Dimension arrow | Measurement indicator | Components + inline |
| Section divider | Zone-marked separator | Section breaks |
