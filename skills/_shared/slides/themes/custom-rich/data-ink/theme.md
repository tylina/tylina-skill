# Data-Ink Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `data-ink-theme`
**Style**: Minimalist, data-focused, Tufte-inspired / light theme
**Primary color**: `#111111` (Near Black Ink)
**Best For**: Financial reports, economic dashboards, quantitative research, data-heavy presentations
**Style Objective**: Data-Driven
**Complexity Level**: Rich

## Description

A Tufte-inspired presentation theme that maximizes the data-ink ratio while minimizing chart junk. Features inline SVG sparklines for trend visualization, margin annotations mimicking sidenotes, hairline rules instead of heavy borders, and dense data layouts using small multiples. Only five colors are used: off-white paper, near-black ink, gray, light gray, and red for critical emphasis. Every element exists to communicate data.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: data-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Global Economic Indicators],
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
  ),
)

// Choose deck fonts after the show rule; the reusable theme owns no font family.
#set text(font: ("Libertinus Serif", "Songti SC"), size: 18pt)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical content alignment |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Minimal left-aligned title in regular weight, hairline rule, subtitle and author in gray. Framed by top and bottom hairlines.

### `#slide(title: auto, align: auto)`
Ultra-clean content slide with bold title, 0.5pt hairline below, three-column footer with page number.

### `#new-section-slide[...]`
Left gray panel (40%) with large white section number, right area with tracked "SECTION" label, bold title, and short rule.

### `#focus-slide[...]`
Centered text on paper background within a hairline rectangle frame.

### `#ending-slide[...]`
Minimal centered farewell text between hairline rules.

## Reusable Components

### `#tufte-stat(value, label, trend: "up", accent: palette.ink)`
Large number with inline sparkline and small label. The signature component.
```typst
#tufte-stat([3.2%], [GDP Growth YoY], trend: "up")
```

### `#sparkline(trend: "up", color: rgb("#111111"), width: 60pt)`
Inline SVG sparkline. Trends: "up", "down", "volatile", "plateau", "recovery".
```typst
#sparkline(trend: "volatile", color: palette.red, width: 80pt)
```

### `#margin-note(body)`
Small italic gray sidenote placed at right margin.
```typst
#margin-note[Non-farm payrolls revised upward by 42K.]
```

### `#data-card(title, body)`
Ultra-clean card with 0.5pt hairline border, no fill.
```typst
#data-card([Employment by Sector])[Healthcare: +58K, Tech: +42K]
```

### `#evidence-box(title, body)`
Red left-line callout for key findings and critical emphasis.
```typst
#evidence-box([Key Finding])[Wage growth decelerated to 3.8% YoY.]
```

### `#small-multiple(..items)`
Grid of tiny stat blocks with optional sparklines (Tufte's small multiples).
```typst
#small-multiple(
  (label: "ISM Mfg", value: "52.4", trend: "up"),
  (label: "PMI Svcs", value: "54.1", trend: "up"),
)
```

### `#data-table(headers, rows)`
Clean table: no vertical rules, hairline horizontals only.
```typst
#data-table(([Sector], [Jobs], [MoM]), (([Healthcare], [+58], [+0.4%]),))
```

### `#stat-row(..items)`
Horizontal layout of tufte-stat blocks from dictionary items.
```typst
#stat-row((value: "3.2%", label: "GDP", trend: "up"))
```

### `#hairline-divider()`
Thin 0.5pt gray horizontal divider line.
```typst
#hairline-divider()
```

### `#annotation(body)`
Small gray italic text for source citations.
```typst
#annotation[Source: Bureau of Economic Analysis.]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Paper** | `#FFFFF8` | `palette.paper` | Tufte's signature off-white background |
| **Ink** | `#111111` | `palette.ink` | Primary text, near-black |
| **Gray** | `#5E5E5E` | `palette.gray` | Secondary info, labels, annotations |
| **Light Gray** | `#D0D0D0` | `palette.light-gray` | Hairline rules, borders, grid lines |
| **Red** | `#BE2D26` | `palette.red` | Sparingly used for critical emphasis |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.ink,
  neutral-lightest: palette.paper,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
