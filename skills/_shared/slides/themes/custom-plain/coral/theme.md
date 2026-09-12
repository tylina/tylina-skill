# Coral Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `coral-theme`
**Style**: Warm, vibrant, modern — coral/salmon tones with teal accent
**Primary color**: `#C43C4A` (deep coral red)
**Best For**: Marketing, creative pitches, startup presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A warm, vibrant custom theme designed for marketing, creative, and startup presentations. Features coral and salmon tones with a complementary teal accent for visual contrast. Includes gradient headers, decorative background shapes, and a rich set of reusable components like highlight boxes, metric rows, and inline tags.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: coral-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [My Presentation],
    subtitle: [Subtitle Here],
    author: [Author Name],
    date: datetime.today(),
    institution: [Company Name],
    contact: [email@example.com],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for ordinary slide content |
| `footer` | content/function | `none` | Footer content or function receiving `self` |

## Available Slide Types

### `#title-slide()`
Vibrant cover slide with decorative coral and teal circles in the background. Displays title, subtitle, author, institution, date, and contact with a coral accent line.

### `#slide(title: auto)`
Standard content slide with a coral-to-salmon gradient header bar. One explicit stack keeps the section name above the slide title. The three-track footer shows custom content at left and a coral dot plus the `N / M` slide counter at right.

### `#new-section-slide[...]`
Section divider with large coral text and decorative lines. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with coral-to-salmon gradient background and white text. Perfect for quotes or key takeaways.

### `#ending-slide[...]`
Closing slide with coral-to-teal gradient background, decorative translucent circles, and bold white text.

## Reusable Components

### `#highlight-box(title, body, variant: "primary")`
Colored callout box with left accent border. Supports three variants:

- `"primary"` — Coral red (default)
- `"accent"` — Teal
- `"neutral"` — Gray

```typst
#highlight-box[Key Insight][
  Important information here.
]

#highlight-box(variant: "accent")[Pro Tip][
  A teal-accented tip.
]

#highlight-box(variant: "neutral")[Note][
  Secondary information.
]
```

### `#metric-row(items)`
Horizontal row of metric/stat items displayed in a card. Each item is a dictionary with `label` and `value` keys; its value and label use one centered vertical `stack`.

```typst
#metric-row((
  (label: "Users", value: "12K"),
  (label: "Revenue", value: "$2.4M"),
  (label: "Growth", value: "+68%"),
))
```

### Native semantic columns
Use Touying's native `cols` directly for semantic side-by-side content. Give the containing block a definite width and align both columns to the top.

```typst
#block(width: 30em)[
  #cols(columns: (2fr, 1fr), gutter: 2em, align: top)[
    Left content
  ][
    Right content
  ]
]
```

### `#tag(label, color: none)`
Inline tag/badge component. Defaults to coral primary color.

```typst
#tag[Marketing]
#tag(color: palette.accent)[Growth]
#tag(color: palette.secondary)[Priority]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#C43C4A` | `palette.primary` | Deep coral red, main brand color |
| **Secondary** | `#B64F3D` | `palette.secondary` | Deep salmon, gradients, accents |
| **Accent** | `#177D78` | `palette.accent` | Deep teal, complementary contrast |
| **Background** | `#FFF5F5` | `palette.bg` | Very light pink page background |
| **Card BG** | `#FFFFFF` | `palette.card-bg` | White card backgrounds |
| **Dark** | `#2D3436` | `palette.dark` | Charcoal body text |
| **Light** | `#636E72` | `palette.light` | Gray secondary text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: white,
  neutral-darkest: palette.dark,
)
```

## Key API Patterns

This theme uses the correct Touying 0.7.4 API patterns:

```typst
// Slide wrapper pattern
#let slide(title: auto, ..args) = touying-slide-wrapper(self => {
  // ...
  touying-slide(self: self, ..args)
})

// Config pattern
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 0pt,
  footer-descent: 0pt,
  margin: (top: 4em, bottom: 2em, x: 2em),
  fill: palette.bg,
)
```

## Layout Semantics

- Sequential header, title, section, callout, and metric internals use explicit `stack(spacing: ...)` composition.
- `metric-row` uses a native `grid` for its uniform one-row matrix; every value-to-label sequence is one centered stack with no manual `v()` spacing.
- Semantic prose columns use native `cols`, not a generic layout wrapper. The demo's fixed `30em` ancestor is intentional: it gives top-aligned columns a definite width under Touying's centered content flow.
- The demo currently uses ordinary flow. `highlight-box` still retains a terminal `lazy-v(1fr)`, which is inert there; enable `cols(lazy-layout: true)` only when every column contains exactly one direct `highlight-box`.
- Full-slide decorative `place()` calls are intentional overlays on a page-bounded canvas; no ordinary-flow component uses `height: 100%`.
- Typography is set by the demo (`IBM Plex Sans`, with verified fallbacks); the reusable template remains font-agnostic.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)
- `theme.md` — This documentation file
- `theme_design_spec.md` — Detailed visual and layout specification

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
