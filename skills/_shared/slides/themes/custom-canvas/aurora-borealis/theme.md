# Aurora Borealis Theme -- API Reference

> Northern Lights aesthetic: shimmering curtains of green/purple/cyan against deep arctic night. Stars, ice crystals, mountain horizons.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#let pal = build-palette("arctic")

#show: aurora-theme.with(
  aspect-ratio: "16-9",
  preset: "arctic",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Optional subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 18pt)

#title-slide()

= Section Title
== Slide Title
- Content here
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page format (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content or `self => ...` function |
| `preset` | string | `"arctic"` | Color preset name |

## Presets

| Preset | Background | Ink | Accent | Secondary | Tertiary |
|--------|-----------|-----|--------|-----------|----------|
| `arctic` | #0B0E1F (arctic night) | #E8F0F2 (frost white) | #00E676 (aurora green) | #7C4DFF (aurora purple) | #00BCD4 (aurora cyan) |
| `solar-storm` | #0F0A1A (deep violet) | #FFF3E0 (warm white) | #FF6D00 (solar orange) | #E040FB (plasma pink) | #FFAB00 (amber) |
| `midnight` | #050A14 (true dark) | #B0BEC5 (silver) | #18FFFF (electric cyan) | #448AFF (blue) | #69F0AE (mint) |

## Slide Types

| Function | Purpose | Key Parameters |
|----------|---------|---------------|
| `title-slide()` | Cover slide with full aurora display | Reads from `config-info()` |
| `slide(title:)` | Standard content slide | `title: auto` |
| `dark-slide(title:, header-left:, header-right:)` | Dark variant with aurora curtain bg | Custom header labels |
| `new-section-slide` | Auto-triggered by `= Heading` | Section number + aurora sweep |
| `focus-slide[...]` | Centered statement on deep space | Width-constrained text |
| `ending-slide[...]` | Final farewell with full aurora | Crystal ornaments + ghost text |

## Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `aurora-card(title, body)` | Card with aurora-green left border | Primary content card |
| `frost-stat(label, value, description:)` | Centered ice crystal -> value -> label stack with shimmer underline | KPI/statistic display |
| `crystal-divider(total-width:)` | Line with ice crystal center | Section separator |
| `polar-tag(body)` | Small labeled badge | Inline tag/label |
| `shimmer-quote(body, cite:)` | Quote with ice crystal + purple border | Attribution quote |
| `horizon-panel(title, body)` | Panel with mountain silhouette at bottom | Location/context panel |
| `aurora-data-table(align:, headers, ..rows)` | Bare native table with opaque zebra rows; `align` defaults to `center + horizon` | Tabular data |
| `aurora-kicker(body)` | Uppercase accent label | Section labels above content |
| `frost-box(body)` | Opaque frost panel with a faint cyan border | Supplementary info box |
| `polar-badge(body)` | Purple inline badge | Category/status markers |

`aurora-card` retains a terminal `lazy-v(1fr)` as a reusable equal-height capability. The marker is inert in ordinary `cols`, composite columns, vertical stacks, and grids. Enable `cols(lazy-layout: true)` only when every column contains exactly one direct `aurora-card`; otherwise use ordinary `cols` or `grid`.

## SVG Decorations

| Function | Description | Parameters |
|----------|-------------|------------|
| `aurora-curtain(color:, width:, height:)` | Wavy vertical aurora bands | Organic bezier curves |
| `star-scatter(color:, width:, height:)` | Random dot star field | 30+ varied-size dots |
| `ice-crystal(color:, size:)` | Hexagonal snowflake ornament | 6-fold symmetry |
| `horizon-silhouette(color:, width:, height:)` | Mountain/tree silhouette line | Bottom-edge decoration |
| `shimmer-line(color:, width:)` | Wavy horizontal accent line | Underline decoration |

## Decorative Helpers

| Function | Description |
|----------|-------------|
| `aurora-dot(color:, size:)` | Small filled dot (star point) |
| `aurora-glow(color:, size:)` | Layered glow effect (3 circles) |

## Palette Access

```typst
#let pal = build-palette("arctic")
// Available keys: bg, ink, accent, secondary, tertiary,
// ink-dim, ink-muted, ink-faint, ink-ghost,
// accent-dim, accent-muted, accent-faint, accent-ghost,
// secondary-dim, secondary-faint, secondary-ghost,
// tertiary-dim, tertiary-faint,
// bg-deep, meta-color
```

## Typography Constants

```typst
typo.display  // 42pt - Cover titles
typo.h1       // 30pt - Section titles
typo.h2       // 22pt - Slide titles
typo.body     // 16pt - Body text
typo.small    // 12pt - Captions, labels
typo.tiny     // 9pt  - Kickers, metadata
typo.meta     // 8pt  - Fine print
```

## Font Constants

```typst
_mono-font  // ("IBM Plex Mono", "Menlo")
_sans-font  // ("IBM Plex Sans", "Arial", "PingFang SC")
```

## Canvas Usage Pattern

```typst
// Dark slide with custom composition
#dark-slide(
  header-left: [CATEGORY],
  header-right: [CONTEXT],
)[
  #stack(spacing: .8em,
    text(size: 32pt, weight: "bold")[Bold Statement],
    block(width: 50pt, height: 2pt, fill: gradient.linear(pal.accent, pal.tertiary)),
    cols(columns: (1fr, 1fr), gutter: 24pt,
      [#block(...)[...]],
      [#block(...)[...]],
    ),
  )
]
```
