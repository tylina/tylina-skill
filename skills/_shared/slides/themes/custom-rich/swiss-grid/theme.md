# Swiss Grid Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `swiss-grid-theme`
**Style**: Modernist, geometric, grid-based, typographic / light theme
**Primary color**: `#FF0000` (Signal Red)
**Best For**: Design systems presentations, architecture talks, modernist portfolios, corporate identity, typography lectures
**Style Objective**: Modernist
**Complexity Level**: Rich

## Description

An International Typographic Style (Swiss Design) theme influenced by Josef Mueller-Brockmann and the Zurich school of graphic design. Features strict mathematical grid systems with the grid visible as a background element, asymmetric flush-left layouts, large bold sans-serif headings, generous whitespace as an active design choice, and red as the sole accent color against white and black. Every design decision references the principles of systematic visual communication.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: swiss-grid-theme.with(
  aspect-ratio: "16-9",
  footer: [Grid Systems in Visual Communication],
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
  ),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

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
Enormous medium-weight flush-left title with visible grid background, red circle accent top-right, asymmetric SVG decoration bottom-right, red rule, and small author/date at bottom.

### `#slide(title: auto, align: auto)`
White background with visible grid SVG, bold flush-left title with 1pt black rule below, three-column footer with red dot separator.

### `#new-section-slide[...]`
Visible grid background, enormous medium-weight red section number (8em), "SECTION" index label, medium-weight flush-left title, short red accent rule.

### `#focus-slide[...]`
Centered large medium-weight black text with a red period automatically appended. Grid background visible.

### `#ending-slide[...]`
Flush-left enormous medium-weight text with red circle inline and black rule below. Grid background visible.

## Reusable Components

### `#grid-card(title, body, accent-top: false)`
Opaque white card with thin black border and an optional red top-accent line for primary emphasis.
```typst
#grid-card([Modular Grid], [A modular grid subdivides the page...], accent-top: true)
```

### `#swiss-stat(value, caption)`
Centered vertical metric with a red indicator, large bold value, and uppercase caption.
```typst
#swiss-stat([12], [Columns])
```

### `#color-swatch(label, color, code, outline: false)`
Palette sample with a tracked label, fixed-height color field, and printed color code.
```typst
#color-swatch([Accent], palette.accent, [\#FF0000])
```

### `#swiss-quote(body, attribution: none)`
Large quotation with oversized red opening quote mark and optional attribution.
```typst
#swiss-quote(attribution: "Brockmann")[Typography has one plain duty...]
```

### `#rule-divider()`
Full-width 1pt black horizontal rule.
```typst
#rule-divider()
```

### `#index-label(body)`
Small all-caps tracked label for categorization headers.
```typst
#index-label[Design Principle]
```

### `#poster-block(body, size: 1.4em)`
Large bold text block for impactful flush-left statements.
```typst
#poster-block[The grid system is an aid, not a guarantee.]
```

## Layout Guidance

Use Touying's native `cols` primitive for column composition. Declare the complete ratio tuple and gutter explicitly:

```typst
#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true,
  grid-card([Primary], [One flexible card per column], accent-top: true),
  grid-card([Secondary], [One flexible card per column]),
  grid-card([Tertiary], [One flexible card per column]),
)
```

Enable `lazy-layout` only when each column contains exactly one component with a `lazy-v` marker, such as `grid-card`. Leave it disabled for plain content or columns that stack multiple independent components.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **White** | `#FFFFFF` | `palette.bg` | Clean white background |
| **Near Black** | `#1A1A1A` | `palette.ink` | Primary text, structural lines |
| **Signal Red** | `#FF0000` | `palette.accent` | Sole accent color, importance indicator |
| **Grid Gray** | `#E5E5E5` | `palette.grid-line` | Visible grid lines, subtle structure |
| **Ink Light** | `#1A1A1A` (70% transparent) | `palette.ink-light` | Date text, subtle elements |
| **Ink Muted** | `#1A1A1A` (50% transparent) | `palette.ink-muted` | Subtitles, captions, secondary text |

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
