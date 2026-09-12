# Lattice Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `lattice-theme`
**Style**: Technical, structured, modern, precision engineering / light theme
**Primary color**: `#2558A6` (Cobalt Blue)
**Best For**: Tech presentations, engineering talks, system architecture discussions, infrastructure reviews
**Style Objective**: Precision Engineering
**Complexity Level**: Rich
**Demo fonts**: Arial, Noto Sans SC (18pt base); IBM Plex Mono for raw text

## Description

A crystalline lattice / molecular structure presentation theme with cool white backgrounds, hexagonal grid patterns, and molecular node-connection SVG decorations. Evokes precision engineering with structured, interconnected, modern aesthetics. Features crystal facet borders, node connector dividers, and bond-style metric cards optimized for technical content.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lattice-theme.with(
  aspect-ratio: "16-9",
  footer: [Engineering Summit 2026 -- Distributed Systems Track],
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

// Keep document font selection in the deck, not the reusable theme.
#set text(font: ("Arial", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content-slide bodies |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Crystal facet border frame with hexagonal lattice background, centered cobalt blue title, node connector decoration, subtitle in emerald, author, institution, and date.

### `#slide(title: auto, align: auto)`
Cool white content slide with faint hexagonal grid, bold cobalt title with node connector underline, three-column footer with centered accent dot.

### `#new-section-slide[...]`
Section divider with left cobalt accent bar, large emerald section number, bold title, node connector decoration, and bottom border line.

### `#focus-slide[...]`
Deep cobalt background with crystal facet frame, centered white text, and node connector below.

### `#ending-slide[...]`
Cobalt background with hexagonal grid, crystal facet frame, node connector above centered white text, emerald accent line below.

## Reusable Components

### `#node-card(title, body, accent: palette.primary)`
Card with colored left border and node-dot indicator for structured technical content.
```typst
#node-card([Consistency], [Every read receives the most recent write.], accent: palette.primary)
```

### `#bond-stat(label, value, color: palette.primary)`
Metric card with one centered bond-node → value → label stack for KPIs and system metrics. It contains `lazy-v(1fr)` and is intended as the sole component in each `cols(lazy-layout: true)` column.
```typst
#bond-stat([p99 Latency], [2.3ms], color: palette.accent)
```

### `#crystal-box(title, body, accent: palette.accent)`
Highlighted content box with full accent border and tinted background.
```typst
#crystal-box([Delivery Guarantees], [- *At-most-once*: fire and forget], accent: palette.secondary)
```

### `#lattice-divider(color: palette.border, width: 80%)`
Horizontal separator with node dots at endpoints and center.
```typst
#lattice-divider(color: palette.border, width: 70%)
```

### `#atom-tag(content, color: palette.primary)`
Capsule-shaped tag with dot indicator for categorization.
```typst
#atom-tag([Kafka], color: palette.accent)
```

### `#structure-highlight(title, body)`
Key insight box with cobalt left border and light blue background.
```typst
#structure-highlight([Key Insight], [All consensus protocols trade latency for safety.])
```

### `#facet-grid(align: center + horizon, headers, rows)`
Bare native table with a cobalt header row, alternating backgrounds, and caller-configurable cell alignment.
```typst
#facet-grid(([Engine], [Write], [Read]), (([LSM], [Seq], [Merge]),))
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Cool White** | `#F5F7FA` | `palette.bg` | Background |
| **Cobalt Blue** | `#2558A6` | `palette.primary` | Titles, primary accents |
| **Emerald** | `#0D9488` | `palette.accent` | Secondary highlights |
| **Violet** | `#6D55A3` | `palette.secondary` | Tertiary emphasis |
| **Cool Gray** | `#D1D8E3` | `palette.border` | Borders, dividers |
| **Charcoal** | `#1E293B` | `palette.text` | Main body text |
| **Slate** | `#64748B` | `palette.text-muted` | Footers, captions |
| **White** | `#FFFFFF` | `palette.card-bg` | Card backgrounds |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.card-bg,
  neutral-darkest: palette.text,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example; its Codly imports and font choices are demo-owned rather than theme dependencies

## Demo

See `demo.typ` for a compilable example.
