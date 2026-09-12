# Ukiyo-Wave Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Hiragino Sans GB"), size: 20pt)

#show: ukiyo-wave-theme.with(
  aspect-ratio: "16-9",
  align: top,
  footer: [Company Name],
  preset: "indigo",  // "indigo", "sunrise", or "storm"
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
  config-common(breakable: false),
)

#title-slide()
#outline-slide()

= Section Title
== Slide Title
- Content here
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page format (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default content alignment; use `top` for dense content decks |
| `footer` | content/none | `none` | Footer left text |
| `preset` | string | `"indigo"` | Color preset name |

## Presets

| Name | Background | Ink | Accent | Secondary | Mood |
|------|-----------|-----|--------|-----------|------|
| `indigo` | Deep indigo | Washi cream | Vermillion red | Wave blue | Night ocean |
| `sunrise` | Dark umber | Warm cream | Orange | Gold | Dawn glow |
| `storm` | Near-black | Silver-white | Oxblood | Storm teal | Tempest |

The theme entry applies the selected preset to slide chrome. Reusable component
defaults use the exported `palette` dictionary (indigo); pass exposed color
arguments or values from `build-palette(...)` when custom content must match a
different preset. Broader component palette injection is not automatic.

## Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual | Cover with great wave composition |
| `new-section-slide` | `= Heading` | Auto-triggered torii section marker |
| `slide` | `== Heading` | Standard content with wave foam |
| `dark-slide` | Manual | Deep background with a rendered title and wave decorations |
| `focus-slide` | Manual | Bold statement with wave crest |
| `ending-slide` | Manual | Mount Fuji farewell |
| `outline-slide` | Manual | Table of contents |

### dark-slide Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Rendered slide title; pass content to display it |
| `align` | auto/alignment | `auto` | Per-slide content alignment override |
| `header-left` | content/none | `none` | Left header label |
| `header-right` | content/none | `none` | Right header label |

## Components

### wave-card(title, body)
Content card with left accent border on surface background.

### edo-stat(label, value, description: none)
Centered value -> uppercase label -> accent rule -> description statistic stack.

### torii-divider(total-width: 100%)
Horizontal divider with centered torii gate icon.

### ukiyo-tag(body, accent: palette.secondary, text-color: palette.secondary-text)
Small pill-shaped category tag.

### scroll-quote(body, cite: none)
Quotation block with left border and optional citation.

### woodblock-panel(title, body, accent: palette.accent)
Two-part panel: accent-colored header + surface body. No rounded corners.

### ukiyo-data-table(align: left + horizon, headers, ..rows)
Native table with tracked uppercase headers, secondary color styling, and overridable cell alignment.

### wave-progress(value, total, label: none)
Flat progress bar with foam dot marker.

### kamon-icon(symbol, size: 36pt, color: palette.accent)
Circular family-crest style icon with double ring border.

### hanko-seal(label, color: palette.accent, size: 20pt)
Small vermillion square stamp mark.

## SVG Helpers

| Function | Parameters | Description |
|----------|-----------|-------------|
| `great-wave(color:, width:, height:)` | color, width: 400pt, height: 200pt | Hokusai wave crest |
| `kumo-cloud(color:, width:, height:)` | color, width: 200pt, height: 100pt | Japanese cloud pattern |
| `torii-gate(color:, width:, height:)` | color, width: 60pt, height: 72pt | Gate silhouette |
| `wave-foam(color:, width:, height:)` | color, width: 300pt, height: 60pt | Foam dots on curve |
| `fuji-silhouette(color:, width:, height:)` | color, width: 200pt, height: 120pt | Mount Fuji |

## Small Decoratives

| Function | Description |
|----------|-------------|
| `foam-dot(color:, size:)` | Single circle dot |
| `wave-accent(color:, width:)` | Thin colored bar |
| `hanko-seal(label, color:, size:)` | Red stamp square |

## Palette Access

`palette` is the default indigo dictionary. Use `build-palette("sunrise")` or
`build-palette("storm")` when custom inline styling must match another preset.

```
palette.bg, palette.ink, palette.accent, palette.accent-text
palette.secondary, palette.secondary-text, palette.surface
palette.ink-dim, palette.ink-muted, palette.ink-faint, palette.ink-ghost
palette.accent-dim, palette.accent-muted, palette.accent-faint, palette.accent-ghost
palette.secondary-dim, palette.secondary-muted, palette.secondary-faint, palette.secondary-ghost
palette.surface-light, palette.surface-dark
palette.meta-color
```

## Layout Patterns

### Height-equalized card row
```typst
== Two Cards
#cols(columns: (1fr, 1fr), gutter: 14pt, lazy-layout: true)[
  #wave-card([Title A], [Content A])
][
  #wave-card([Title B], [Content B])
]
```

Use lazy layout only when this is the slide's sole flexible group and each
column contains exactly one component. Omit `lazy-layout: true` for nested or
multi-component columns.

### Statistics row
```typst
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 14pt,
  edo-stat([LABEL], [42], description: [Detail]),
  edo-stat([LABEL], [87], description: [Detail]),
  edo-stat([LABEL], [12], description: [Detail]),
)
```

### Panel grid
```typst
#cols(columns: (1fr, 1fr), gutter: 14pt)[
  #woodblock-panel([Header], [Body content])
][
  #woodblock-panel([Header], [Body content])
]
```
