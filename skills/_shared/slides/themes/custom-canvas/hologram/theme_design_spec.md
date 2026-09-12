# Hologram Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | hologram |
| **Best For** | Tech demos, AI presentations, futuristic product launches, data visualization, sci-fi aesthetics |
| **Style Objective** | Futuristic / Holographic |
| **Complexity Level** | Canvas |

A futuristic holographic projection presentation theme inspired by sci-fi command center interfaces. Features translucent UI panels, HUD-style corner brackets, holographic grid floors, scan-line overlays, and data stream decorations. Light silvery backgrounds for content slides with electric blue and cyan holographic accents; dark mode slides simulate a holographic projection environment.

## Design Philosophy

- **Holographic Atmosphere**: Persistent scan-lines, HUD corners, and grid floors create an immersive projection feel on every slide
- **Glass-Like Panels**: Content cards use opaque white with glowing border accents, preserving the floating-panel metaphor while shielding copy from the persistent background grid
- **Data-Rich Aesthetic**: Monospace readouts, matrix tables, and data stream SVGs evoke real-time information displays
- **Bookend Framing**: Title and ending slides share the full projection frame SVG, creating a cohesive open/close bracket around the presentation
- **Dual Mode**: Light silvery content slides for readability; dark holographic slides for dramatic impact

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Light Silver (bg) | `#F4F6FA` | Primary background for content slides |
| Electric Blue (primary) | `#0094FF` | Primary accent, borders, grid lines |
| Holographic Cyan (accent) | `#00E5FF` | Secondary accent, glow effects, highlights |
| Violet Glow (secondary) | `#7C4DFF` | Tertiary accent, subtle data streams |
| Dark Text (ink) | `#0D1B2A` | Primary text color |
| Frosted White (card) | `#FFFFFF` | Opaque card backgrounds for reliable contrast |

## Typography

- **Demo / consumer base stack**: `("IBM Plex Sans", "Noto Sans SC")`
- **Monospace readouts**: `"DejaVu Sans Mono"`
- **Boundary**: `hologram-theme` sets size and color only; the document font remains consumer-controlled in `demo.typ` or downstream content.
| Dark Mode BG | `#0A0F1E` | Background for dark/title/ending slides |
| Dark Mode Ink | `#E0F0FF` | Text color on dark backgrounds |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: hologram-theme.with(
  aspect-ratio: "16-9",
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
| `footer` | `content/function` | `none` | Footer content or function |

## Slide Functions

### `title-slide(..args)`
Full holographic projection frame (bookend). Dark background with projection frame SVG, holographic grid floor, scan-line overlay, data stream decorations, HUD corner brackets, and centered title content with institution kicker and holographic divider.

### `slide(title: auto, ..args)`
Standard content slide on light silvery background. Persistent atmosphere: faint holographic grid at bottom, scan-line overlay, HUD corner brackets. Electric-blue accent bar below the title in the header.

### `dark-slide(align: auto, header-left: none, header-right: none, ..args)`
Deep dark holographic mode with bright glow accents. Holographic grid floor, data stream decoration top-right, HUD corners with stronger opacity. Supports custom header-left/right labels.

### `new-section-slide(self: none, body)`
Section transition on dark background with holographic grid, HUD corners, large section number inside concentric circles (holographic readout style), accent lines, and SECTION kicker label. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Centered statement on dark background with scan-line overlay, HUD bracket corners at all four edges, scattered holographic glow dots, and centered italic text.

### `ending-slide(body)`
Farewell slide mirroring title-slide structure (bookend). Full projection frame, holographic grid floor, scan-lines, HUD corners, ghost "END" text, data streams, diamond accent, holographic divider, and "TRANSMISSION COMPLETE" label.

## Reusable Components

### `holo-card(title, body)`
Opaque glass-like card with glowing primary border and cyan HUD brackets placed on all four outer corners. The opaque surface prevents the page grid from bleeding through copy.

```typst
#holo-card([Card Title], [
  Card body content with frosted glass appearance.
])
```

### `readout-stat(label, value, description: none)`
Large bold numeric readout with tracked monospace kicker label above, cyan accent underline, and optional description below. All regions share one centered `stack(spacing: .8em)` with no intervening `v()` calls.

```typst
#readout-stat([PARAMETERS], [405B], description: [Largest open-weight model])
```

### `projection-box(body)`
Content area with three nested opaque projection fields in pale primary and accent colors.

```typst
#projection-box[
  Content with holographic projection glow behind it.
]
```

### `scanline-divider(total-width: 100%)`
Horizontal divider line with holographic glow dots placed at intervals, creating a scan-line aesthetic separator.

```typst
#scanline-divider(total-width: 100%)
```

### `beacon-tag(body)`
Small pill-shaped holographic tag with opaque pale-primary fill, primary-muted border, and contrast-safe monospace blue text.

```typst
#beacon-tag([Tool Use]) #beacon-tag([Memory])
```

### `interface-highlight(body, cite: none)`
Highlighted text block with left accent border in cyan, italic text, and optional tracked uppercase citation.

```typst
#interface-highlight([
  A key insight about the technology.
], cite: "Research Team, 2025")
```

### `datastream-note(body)`
Callout styled like a data transmission readout with opaque pale-primary fill, left primary border, and monospace text.

```typst
#datastream-note[
  Agent loop: Observe > Think > Act > Reflect
]
```

### `terminal-badge(body)`
Small dark monospace badge for labels/categories with dark fill and light text.

```typst
#terminal-badge([ACTIVE]) #terminal-badge([v2.1])
```

### `matrix-grid(headers, align: center + horizon, ..rows)`
Bare native `table()` with holographic styling, semantic `table.header`, a contrast-safe tracked header, opaque alternating body rows, thin primary-faint borders, and caller-configurable alignment.

```typst
#matrix-grid(
  ("Model", "Params", "Score"),
  ([GPT-4o], [~200B], [88.7%]),
  ([Claude 3.5], [~175B], [88.3%]),
)
```

## Helper Functions

### `holo-dot(color: palette.primary, size: 4pt)`
Glowing dot with outer ring (two layered circles).

### `holo-grid(color, width, height)`
Renders perspective holographic grid floor SVG.

### `hud-corners(color, width, height)`
Renders HUD corner brackets SVG (four L-shaped brackets).

### `scanlines(color, width, height)`
Renders horizontal scan-line pattern SVG.

### `datastream(color, width, height)`
Renders diagonal flowing data stream lines SVG.

### `projection-frame(color, width, height)`
Renders full holographic projection border SVG with tick marks.

## SVG Assets (5 SVGs)

| SVG | Elements | Purpose |
|-----|----------|---------|
| `_holo-grid-svg` | 13 (8 lines + 4 lines + 1 circle) | Perspective grid floor with vanishing point |
| `_hud-corners-svg` | 12 (8 paths + 4 circles) | Four L-shaped HUD bracket corners |
| `_scanline-svg` | 13 lines | Horizontal scan-line pattern at varying opacities |
| `_datastream-svg` | 11 (3 paths + 4 circles + 2 paths + 2 rects) | Diagonal data transmission lines with nodes |
| `_projection-frame-svg` | 16 (2 rects + 8 lines + 6 tick lines) | Full border frame with corner emphasis and tick marks |

## Available Colors

All colors accessed via `build-palette()`:

```typst
#let pal = build-palette()
// Core: pal.bg, pal.ink, pal.primary, pal.primary-text, pal.accent, pal.secondary, pal.card
// Ink derived: pal.ink-dim, pal.ink-muted, pal.ink-faint, pal.ink-ghost
// Primary derived: pal.primary-dim, pal.primary-muted, pal.primary-faint, pal.primary-ghost
// Accent derived: pal.accent-dim, pal.accent-muted, pal.accent-faint, pal.accent-ghost
// Secondary derived: pal.secondary-dim, pal.secondary-muted, pal.secondary-faint
// Dark mode: pal.dark-bg, pal.dark-ink, pal.dark-ink-dim, pal.dark-ink-muted
// Special: pal.meta-color
```

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Canvas-Level Features

- **Persistent Atmosphere**: Every content slide has faint holographic grid, scan-lines, and HUD corners
- **Dark-Slide Function**: Dedicated `dark-slide` with deep background and enhanced glow effects
- **5 SVGs (10+ elements each)**: Grid floor, HUD corners, scan-lines, data streams, projection frame
- **Full-Page SVG**: Projection frame covers entire slide on title/ending
- **Component Structural Diversity**: 9 distinct components (cards, stats, boxes, dividers, tags, quotes, notes, badges, tables)
- **Bookending**: Title and ending slides share full projection frame + grid + scan-lines + HUD corners
- **Wow Moment**: Title slide combines 5 SVG layers creating a convincing holographic projection aesthetic

## Demo

See `demo.typ` for a complete demonstration covering AI/ML topics: foundation models, autonomous agents, infrastructure, safety, and emerging capabilities.

## File Structure

```
hologram/
  template.typ          -- Theme definition (palette, SVGs, components, slides)
  demo.typ              -- Full demonstration presentation
  theme_design_spec.md  -- This file (detailed specification)
  theme.md              -- Quick reference documentation
```
