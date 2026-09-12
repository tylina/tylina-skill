# Gauge Panel Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `gauge-panel-theme`
**Style**: Data-focused dashboard, analog instrument aesthetic / light theme
**Primary color**: `#4A6FA5` (Steel Blue)
**Best For**: Project reviews, experiment reports, quarterly performance reviews, data dashboards
**Style Objective**: Technical / Scientific
**Complexity Level**: Rich

## Description

An analog instrument control panel theme designed for data-heavy presentations. Features a warm gray background with measurement-grid SVG atmosphere (oscilloscope-style), gauge-dial decorations, and ruler-tick dividers. Uses deep graphite for text, steel blue for primary accents, and warm copper for highlights and gauge elements. Optimized for KPI dashboards, model performance reports, and technical project reviews.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Arial Unicode MS"))

#show: gauge-panel-theme.with(
  aspect-ratio: "16-9",
  footer: [ML Platform -- Q3 2026 Review],
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
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Panel frame border with measurement-grid atmosphere, gauge-dial decorations in corners, centered title with copper accent line, subtitle, author, institution, and date.

### `#slide(title: auto)`
Standard content slide with measurement-grid background atmosphere, bold graphite title with copper accent underline, footer with copper dot separator and slide counter.

### `#new-section-slide[...]`
Section divider with steel blue section number, graphite title, ruler-tick separator, and gauge-dial decoration at bottom-right.

### `#focus-slide[...]`
Width-constrained centered statement with copper frame, measurement-grid background, and gauge-dial decoration above.

### `#ending-slide[...]`
Closing slide with panel frame border, gauge-dial decorations, centered text with copper accent line and ruler-tick decoration.

## Reusable Components

### `#gauge-card(label, value, unit: none, color: palette.accent)`
Metric card with small arc/dial SVG indicator at top, large monospace value, and label below.
```typst
#gauge-card([Accuracy], [91.2%], color: palette.accent)
```

### `#reading-block(label, value, delta: none, color: palette.ink)`
Data readout with monospace number and label. NO border — typography-only styling. Optional delta indicator.
```typst
#reading-block([Throughput], [2.4K rps], delta: [+18%])
```

### `#panel-section(title)`
Section header with horizontal gauge-mark SVG (ruler tick marks like a ruler).
```typst
#panel-section([Training Configuration])
```

### `#meter-tag(content, color: palette.accent)`
Inline status badge with colored dot indicator.
```typst
#meter-tag([On Track], color: palette.success)
```

### `#dial-divider(color: palette.copper, width: 80%)`
SVG measurement-tick divider line for separating content sections.
```typst
#dial-divider(width: 60%)
```

### `#instrument-quote(quote, author: none)`
Blockquote with copper left border (not a full box).
```typst
#instrument-quote([Key insight from training analysis.], author: [Log Entry])
```

### `#data-table-wrap(body, accent: palette.accent)`
Styled table wrapper with top accent line for data tables.
```typst
#data-table-wrap[
  #table(columns: (1fr, 1fr), [Header], [Value], [Row 1], [Data])
]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Warm Gray** | `#F5F4F2` | `palette.bg` | Slide background |
| **Deep Graphite** | `#2D2D2D` | `palette.ink` | Primary text |
| **Steel Blue** | `#4A6FA5` | `palette.accent` | Primary accent, charts |
| **Warm Copper** | `#B87333` | `palette.copper` | Highlights, gauge elements |
| **Muted Ink** | `#2D2D2D` (30% transparent) | `palette.ink-muted` | Accessible secondary text |
| **Card White** | `#FFFFFF` | `palette.bg-card` | Card backgrounds |
| **Grid Faint** | `#2D2D2D` (92% transparent) | `palette.grid-faint` | Grid lines |
| **Border Light** | `#2D2D2D` (80% transparent) | `palette.border-light` | Card borders |
| **Success Green** | `#4A8C5C` | `palette.success` | Positive indicators |
| **Warning Gold** | `#D4A943` | `palette.warning` | Warning indicators |
| **Danger Red** | `#C0504D` | `palette.danger` | Negative indicators |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
