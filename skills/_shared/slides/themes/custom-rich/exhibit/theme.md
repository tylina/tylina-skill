# Exhibit Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `exhibit-theme`
**Style**: Premium dark, conclusion-first consulting with gold accents
**Primary color**: `#D4AF37` (gold)
**Best For**: Strategic planning, executive reports, investment analysis, board presentations
**Style Objective**: MBB Consulting
**Complexity Level**: Rich

## Description

A premium, dark-themed presentation theme designed for authoritative, data-driven executive communications. Features a conclusion-first design philosophy with gold accents, blue-purple gradient top bars, and a CONFIDENTIAL footer on every content slide. Perfect for strategic planning, board presentations, and investment analysis.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC", "Arial"), size: 18pt)

#show: exhibit-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default content alignment |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Dark gradient cover with gold accents, centered title, grid-dot decorations, and CONFIDENTIAL label.

### `#slide(title: auto, align: auto)`
Content slide with a blue-purple gradient top bar, gold-accented title, subtle body-area dot grid, and CONFIDENTIAL footer with page numbers.

### `#new-section-slide[...]`
Dark section divider with large section number, gold underline, and CONFIDENTIAL label (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Full-screen dark slide with gold accent markers on left and right edges for key quotes or decisions.

### `#ending-slide[...]`
Closing slide with centered dark card, gold left border, decorative grid dots, and gold underline.

## Reusable Components

### `#takeaway-bar(content)`
Conclusion-first headline bar with gold left border and "KEY TAKEAWAY" label. Place at top of content slides.

```typst
#takeaway-bar[Revenue grew 26% YoY driven by enterprise adoption in APAC]
```

### `#kpi-card(label, value, trend: none, trend-color: none, accent: palette.gold)`
Metric card with a centered value→label→trend stack and colored top accent.

```typst
#kpi-card([Revenue], [\$33.1B], trend: [#sym.arrow.t 26%], trend-color: palette.success)
```

### `#insight-box(title, body)`
Blue/indigo-accented callout box for key insights and recommendations.

### `#risk-box(title, body)`
Red-accented callout box for risks and warnings.

### `#success-box(title, body)`
Green-accented callout box for positive outcomes and achievements.

### `#data-table(align: center + horizon, inset: (x: 0.8em, y: 0.5em), headers, rows)`
Styled table with dark blue header row and alternating dark row backgrounds. Override `inset` for intentionally dense exhibits.

```typst
#data-table(
  ([Metric], [FY2023], [FY2024], [Growth]),
  (([Revenue], [\$26.3B], [\$33.1B], [+26%]),),
)
```

### `#exhibit-card(number, title, description, accent: palette.gold)`
Numbered card with accent-colored badge for structured exhibits or strategic pillars.

### `#stat-row(..items)`
Horizontal row of key metrics with auto-cycling accent colors (gold, indigo, blue, purple).

```typst
#stat-row(
  (value: [42%], label: [Margin]),
  (value: [3,200], label: [Accounts]),
)
```

### `#phase-card(phase, title, items, accent: palette.gold)`
Timeline/phase card with colored top border for roadmaps and strategic planning.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Dark** | `#0D1117` | `palette.dark` | Near-black — page background, dark surfaces |
| **Blue** | `#1E40AF` | `palette.blue` | Deep blue — gradient bar, table headers |
| **Purple** | `#7C3AED` | `palette.purple` | Purple — gradient bar accent |
| **Gold** | `#D4AF37` | `palette.gold` | Gold — primary accent, takeaway bars |
| **Indigo** | `#6366F1` | `palette.indigo` | Indigo — gradient bar, insight boxes |
| **Background** | `#0D1117` | `palette.bg` | Dark page background |
| **Card Background** | `#161B22` | `palette.card-bg` | Dark card surfaces |
| **Border** | `#30363D` | `palette.border` | Dark border color |
| **Text White** | `#FFFFFF` | `palette.text-white` | White text on dark backgrounds |
| **Text Gray** | `#8B949E` | `palette.text-gray` | Gray text — body, labels |
| **Text Muted** | `#484F58` | `palette.text-muted` | Decorative dots and low-emphasis shapes only |
| **Success** | `#22C55E` | `palette.success` | Green — positive indicators |
| **Danger** | `#EF4444` | `palette.danger` | Red — risk boxes, negative indicators |
| **Warning** | `#F59E0B` | `palette.warning` | Amber — warning indicators |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.gold,
  neutral-lightest: palette.text-white,
  neutral-darkest: palette.dark,
)
```

## Canvas-Level Usage

Exhibit's premium dark-gold aesthetic is highly suited for Canvas-level editorial composition:

- **Dark/light rhythm**: Default is dark. Use `config-page(fill: palette.card-bg)` for elevated premium contrast pages.
- **Gold accents**: `palette.gold` on dark backgrounds creates a luxury editorial feel perfect for Canvas.
- **Hero pages**: Full-bleed images with dark scrim + gold text overlays.
- **Conclusion-first**: MBB consulting pattern — lead with the insight, support with evidence. This works at Canvas density.
- **Inline styling**: Canvas mode permits `block(fill:)`, `text(fill:)` directly in main.typ using `palette.xxx` values.
- **Recommended patterns**: Gold-accented statement pages, premium data dashboards, asymmetric thesis layouts, hero image compositions.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
