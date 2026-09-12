# Celestial Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `celestial-theme`
**Style**: Astronomical / celestial map aesthetic -- deep space with gold star-chart accents
**Primary color**: `#C9A961` (Antique Gold, default observatory preset)
**Best For**: Astronomy, astrophysics, space science, observatory publications, celestial navigation
**Style Objective**: Scientific / Astronomical
**Complexity Level**: Canvas

## Description

A dark-space presentation theme inspired by antique star charts, celestial coordinate systems, and observatory publications. Features deep navy-black backgrounds with gold constellation lines, starburst ornaments, orbital rings, and celestial grid arcs. Ships with 3 presets (observatory, dawn, polar) switchable via a single parameter. Includes specialized dark-slide, ephemeris tables, and constellation-themed decorative components.

The active preset propagates to every reusable component and to helper calls that omit an explicit `color`.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Heiti SC"), size: 18pt)

#let pal = build-palette("observatory")

#show: celestial-theme.with(
  aspect-ratio: "16-9",
  preset: "observatory",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here.
```

Fonts are configured in `main.typ`, not by the reusable theme entry. The verified demo uses `("Arial", "Heiti SC")`; the theme uses `("Menlo", "Courier New")` internally for coordinate labels, tags, metadata, and footer chrome.

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `preset` | string | `"observatory"` | Color preset: `"observatory"`, `"dawn"`, `"polar"` |
| `footer` | content/function | `none` | Footer content or function |

## Available Slide Types

### `#title-slide()`
Constellation-framed cover slide with deep space background, celestial grid arcs, constellation patterns, orbital ring, gold frame border, and corner star markers.

### `#slide(title: auto)`
Standard content slide with faint celestial grid background, gold accent bar below title, and corner star-point decorations.

### `#dark-slide(title: auto, header-left: none, header-right: none)`
Deeper dark variant with scattered star-point decorations and custom header labels.

### `#new-section-slide[...]`
Section divider with celestial grid, starburst ornament with section number, and coordinate labels. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Deep space background with scattered star points, corner accent lines, and centered italic text.

### `#ending-slide[...]`
Farewell slide with fading constellation patterns, ghost "AD ASTRA" text, starburst ornament, and gold frame.

## Reusable Components

### `#star-card(title, body)`
Card with star-point markers at corners and thin gold border.
```typst
#star-card([Radial Velocity], [Measures Doppler shift in stellar spectra...])
```

### `#magnitude-stat(label, value, description: none)`
Centered vertical stat with a starburst ornament, large value, tracked label, and optional description.
```typst
#magnitude-stat([CONFIRMED], [5,800+], description: [Total exoplanets confirmed])
```

### `#constellation-divider(total-width: 100%)`
Horizontal line with star-dots at varying positions.
```typst
#constellation-divider(total-width: 100%)
```

### `#ephemeris-table(headers, ..rows)`
Astronomical ephemeris-styled data table with monospace headers and data rows.
```typst
#ephemeris-table(
  ("Name", "Period", "Radius"),
  ([Kepler-442b], [112.31], [1.34 R_E]),
)
```

### `#nebula-box(body)`
Content area with simulated radial gradient glow effect.
```typst
#nebula-box[Content with nebula background glow.]
```

### `#orbit-tag(body)`
Small pill-shaped label in accent color.
```typst
#orbit-tag([NIRSpec]) #orbit-tag([MIRI])
```

### `#celestial-quote(body, cite: none)`
Quote with accent left border, starburst markers, and optional citation.
```typst
#celestial-quote([A bold claim about the cosmos.], cite: "Author, 2023")
```

## Color Scheme

### Preset Dictionary

| Preset | Background | Ink | Accent | Secondary |
|--------|-----------|-----|--------|-----------|
| `observatory` | `#0A0E1A` | `#E8E4D9` | `#C9A961` | `#4A7FC1` |
| `dawn` | `#1A0A2E` | `#F0EBE0` | `#FF6B4A` | `#B197FC` |
| `polar` | `#0D1B2A` | `#E0FBFC` | `#64FFDA` | `#5EEAD4` |

### Derived Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Page background |
| `palette.ink` | Primary text |
| `palette.accent` | Gold accents, constellation lines |
| `palette.secondary` | Grid arcs, secondary decorations |
| `palette.ink-dim` | Slightly transparent text |
| `palette.ink-muted` | 50% transparent text |
| `palette.ink-faint` | 75% transparent text |
| `palette.ink-ghost` | 90% transparent (ghost text) |
| `palette.accent-dim` | Accent at 30% transparent |
| `palette.accent-muted` | Accent at 50% transparent |
| `palette.accent-faint` | Accent at 80% transparent |
| `palette.accent-ghost` | Accent at 92% transparent |
| `palette.bg-deep` | Darkened background for dark-slide/focus |
| `palette.meta-color` | Footer/metadata text (60% transparent ink) |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.ink,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (palette, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase (exoplanet detection topic)

## Demo

See `demo.typ` for a compilable example.
