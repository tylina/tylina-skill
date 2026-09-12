# Celestial Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | celestial |
| **Best For** | Astronomy, space science, astrophysics, observatory publications, celestial navigation |
| **Style Objective** | Scientific / Astronomical |
| **Complexity Level** | Canvas |

A dark-space presentation theme inspired by antique star charts, celestial coordinate systems, and observatory publications. Features deep navy-black backgrounds with gold constellation lines, star-point decorations, orbital rings, and celestial grid arcs. Ships with 3 presets (observatory, dawn, polar) switchable via a single parameter.

The active preset propagates to every reusable component and to helper calls that omit an explicit `color`.

## Design Philosophy

- **Deep Space Immersion**: Dark backgrounds with subtle celestial grid arcs create depth and cosmic atmosphere
- **Gold Accent System**: Constellation lines, star points, and starburst ornaments provide visual anchors in gold tones
- **Scientific Precision**: Ephemeris tables, coordinate labels, and monospace metadata evoke astronomical data catalogs
- **Layered SVG Decorations**: Constellation patterns, celestial grids, orbital rings, and starburst ornaments add canvas-level visual richness

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Deep Navy (observatory bg) | `#0A0E1A` | Primary background |
| Warm Ivory (observatory ink) | `#E8E4D9` | Primary text |
| Antique Gold (observatory accent) | `#C9A961` | Accents, constellation lines, dividers |
| Celestial Blue (observatory secondary) | `#4A7FC1` | Grid arcs, secondary decorations |
| Dawn Purple (dawn bg) | `#1A0A2E` | Dawn preset background |
| Sunset Orange (dawn accent) | `#FF6B4A` | Dawn preset accent |
| Polar Dark (polar bg) | `#0D1B2A` | Polar preset background |
| Polar Teal (polar accent) | `#64FFDA` | Polar preset accent |

## Typography

- **Document font**: configured by `demo.typ` / downstream `main.typ`; the verified demo stack is `("Arial", "Heiti SC")`.
- **Internal technical font**: `("Menlo", "Courier New")` for coordinate labels, metadata, tags, and footer chrome.
- **Theme entry boundary**: `celestial-theme` sets size and color only and does not override the document font.

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: celestial-theme.with(
  aspect-ratio: "16-9",
  preset: "observatory",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | `string` | `"observatory"` | Color preset: `"observatory"`, `"dawn"`, `"polar"` |
| `footer` | `content/function` | `none` | Footer content or function |

## Slide Functions

### `title-slide(..args)`
Constellation-framed cover slide with deep space background, celestial grid arcs, constellation patterns in corners, orbital ring decoration, thin gold frame border, corner star markers, and centered title content with institution kicker and constellation divider.

### `slide(title: auto, ..args)`
Standard content slide with faint celestial grid background, gold accent bar below title, corner star-point decorations, and monospace footer with star symbol separator and slide counter.

### `dark-slide(title: auto, header-left: none, header-right: none, ..args)`
Deeper dark variant with scattered star-point decorations. Supports custom header-left/right labels. All text automatically uses ink color.

### `new-section-slide(self: none, body)`
Section divider with celestial grid background, large starburst ornament containing the section number, celestial coordinate labels (decorative RA/DEC), accent lines, and SECTION kicker label. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Deep space background with scattered star points around edges, corner accent lines forming bracket shapes, and centered italic text for impactful quotes or key statements.

### `ending-slide(body)`
Farewell slide with fading constellation patterns, ghost "AD ASTRA" text, thin gold frame, corner star markers, starburst ornament above title, and constellation divider below.

## Reusable Components

### `star-card(title, body)`
Card with star-point markers at all four corners and thin gold border. Bold title with sans-serif body text.

```typst
#star-card([Card Title], [
  Card body content here with sans-serif text.
])
```

### `magnitude-stat(label, value, description: none)`
Centered vertical stat with a starburst ornament, large value, monospace tracked label, accent underline, and optional description below. The icon, value, label, rule, and description use one consistent stack.

```typst
#magnitude-stat([CONFIRMED PLANETS], [5,800+], description: [Total exoplanets confirmed])
```

### `constellation-divider(total-width: 100%)`
Horizontal line with star-dots placed at varying positions along it. Creates a decorative separator evoking constellation lines.

```typst
#constellation-divider(total-width: 100%)
```

### `ephemeris-table(headers, ..rows)`
Data table styled like astronomical ephemeris with monospace tracked headers in accent color on ghost-tinted background, and alternating data rows with thin accent separators.

```typst
#ephemeris-table(
  ("Designation", "Period", "Radius", "Method"),
  ([Kepler-442b], [112.31], [1.34 R_E], [Transit]),
  ([Proxima Cen b], [11.19], [~1.1 R_E], [RV]),
)
```

### `nebula-box(body)`
Content area with simulated radial gradient (concentric translucent rectangles in secondary color) creating a nebula glow effect behind the content.

```typst
#nebula-box[
  Content with nebula-like background glow effect.
]
```

### `orbit-tag(body)`
Small pill-shaped label with accent-faint fill and accent-muted border. Monospace text in accent color. Resembles an orbital parameter tag.

```typst
#orbit-tag([NIRSpec])
#orbit-tag([MIRI])
```

### `celestial-quote(body, cite: none)`
Quote block with accent left border, starburst ornaments as opening/closing markers flanking the italic text, and optional tracked uppercase citation below.

```typst
#celestial-quote([
  The detection of CO2 marked a watershed moment for the field.
], cite: "JWST ERS Team, 2023")
```

## Helper Functions

### `star-point(color: auto, size: 3pt)`
Small precise dot representing a star.

### `star-marker(color: auto, size: 5pt)`
Slightly larger star with glow effect (two layered circles).

### `constellation-pattern(color: auto, size-w, size-h)`
Renders an SVG constellation pattern (connected star dots).

### `celestial-grid(color: auto, width, height)`
Renders curved celestial coordinate grid arcs.

### `starburst(color: auto, size)`
Renders an 8-pointed starburst ornament SVG.

### `orbital-ring(color: auto, width, height)`
Renders dashed elliptical orbital path decoration.

## Available Colors

All colors accessed via `build-palette(preset-name)`:

```typst
#let pal = build-palette("observatory")
// Access: pal.bg, pal.ink, pal.accent, pal.secondary
// Derived: pal.ink-dim, pal.ink-muted, pal.ink-faint, pal.ink-ghost
// Accent: pal.accent-dim, pal.accent-muted, pal.accent-faint, pal.accent-ghost
// Secondary: pal.secondary-dim, pal.secondary-faint
// Special: pal.bg-deep, pal.meta-color
```

## Preset Dictionary

| Preset | Background | Ink | Accent | Secondary | Best For |
|--------|-----------|-----|--------|-----------|----------|
| `observatory` | `#0A0E1A` | `#E8E4D9` | `#C9A961` | `#4A7FC1` | Classic astronomy, star charts |
| `dawn` | `#1A0A2E` | `#F0EBE0` | `#FF6B4A` | `#B197FC` | Planetary science, exoplanets |
| `polar` | `#0D1B2A` | `#E0FBFC` | `#64FFDA` | `#5EEAD4` | Arctic research, aurora themes |

## Demo

See `demo.typ` for a complete demonstration covering exoplanet detection methods, atmospheric characterization, future missions, and biosignature searches.

## File Structure

```
celestial/
  template.typ   -- Theme definition (palette, SVGs, components, slides)
  demo.typ       -- Full demonstration presentation
```
