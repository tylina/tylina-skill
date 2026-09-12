# Topographic Theme -- API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Hiragino Sans GB"), size: 20pt)

#show: topographic-theme.with(
  aspect-ratio: "16-9",
  footer: [TERRAIN SURVEY 2026],
  preset: "forest",
  config-info(
    title: [My Presentation],
    author: [Author Name],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

= Section Title
== Slide Title
- Content here
```

## Theme Parameters

| Parameter | Default | Options |
|-----------|---------|---------|
| aspect-ratio | "16-9" | "16-9", "4-3" |
| align | horizon | top, horizon, bottom |
| footer | none | Content for footer left |
| preset | "forest" | "forest", "ocean", "desert" |

## Presets

- **forest**: Green contours on cream paper (default, earth-tone)
- **ocean**: Blue contours on light blue-gray (marine/coastal)
- **desert**: Brown contours on sand (arid terrain)

## Slide Types

### Standard Slides

```typst
== Slide Title       // Standard slide with contour decoration
Content here

#dark-slide(title: [Dark Title])[
  Content on terrain-dark background
]
```

### Special Slides

```typst
#title-slide()                    // Cover with dense contour pattern
#focus-slide[Statement text]      // Water blue, white text
#ending-slide[Thank You]          // Paper bg, survey marker, farewell
#hero-slide(bg-color: color)[     // Full color + contour overlay
  Content
]
```

### Section Slides (auto-triggered)

```typst
= Section Name    // Auto-creates section divider with ghost number + marker
```

## Components

### elevation-card(title, body, accent: palette.contour)
Card with colored top border, earth-tone fill.

### depth-stat(value, label, unit: none)
Large number display with monospace unit annotation (like "+1,200m").

### coordinate-tag(body, accent: palette.grid-brown)
Monospace tag styled like map coordinates.

### terrain-quote(body, cite: none)
Quote block with contour-green left border.

### contour-divider(color: palette.contour, width: 100%)
SVG contour lines as content separator.

### survey-note(label, body)
Callout with survey-marker orange left bar + monospace label.

### contour-decoration(color, width, height, dense: false)
Renders SVG contour lines directly (for custom placement).

### survey-marker(color: palette.marker, size: 20pt)
Renders the crosshair + circle survey marker SVG.

## Color Scheme (forest preset)

| Token | Value | Usage |
|-------|-------|-------|
| palette.terrain | #2D3B2D | Primary text, dark bg |
| palette.paper | #F7F4EF | Light backgrounds |
| palette.contour | #5B7553 | Lines, borders, accents |
| palette.contour-text | derived | Accessible contour-colored text |
| palette.water | #4A90A4 | Focus slide, water elements |
| palette.marker | #E85D04 | Survey marker orange |
| palette.marker-text | derived | Accessible marker-colored labels |
| palette.grid-brown | #8B7355 | Coordinates, grid annotations |
| palette.grid-text | derived | Accessible coordinate/meta text |
| palette.terrain-light | -- | 25% transparent terrain |
| palette.terrain-faint | -- | 80% transparent terrain |
| palette.terrain-ghost | -- | 94% transparent terrain |
| palette.terrain-muted | -- | 28% transparent terrain |
| palette.contour-light | -- | 50% transparent contour |
| palette.meta-color | -- | 25% transparent terrain |
