# Hologram Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `hologram-theme`
**Style**: Futuristic holographic projection -- sci-fi command center with translucent panels and glowing edges
**Primary color**: `#0094FF` (Electric Blue)
**Best For**: Tech demos, AI presentations, futuristic product launches, data visualization
**Style Objective**: Futuristic / Holographic
**Complexity Level**: Canvas

## Description

A futuristic holographic projection presentation theme inspired by sci-fi command center interfaces. Features translucent UI panels floating in space, HUD-style corner brackets, holographic grid floors, light-blue scan-line overlays, and data stream decorations. Light silvery backgrounds for readable content slides; dark holographic slides for dramatic impact. Includes 5 complex SVGs, 9 reusable components, persistent slide atmosphere, and bookended title/ending frames.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#let pal = build-palette()

#show: hologram-theme.with(
  aspect-ratio: "16-9",
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

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content or function |

## Available Slide Types

### `#title-slide()`
Full holographic projection frame with dark background, 5-layer SVG composition (projection frame, grid floor, scan-lines, data streams, HUD corners), and centered title content.

### `#slide(title: auto)`
Standard content slide with persistent holographic atmosphere (faint grid, scan-lines, HUD corners) on light silvery background.

### `#dark-slide(align: auto, header-left: none, header-right: none)`
Deep dark holographic mode with bright glow accents, grid floor, data stream decorations, and custom header labels.

### `#new-section-slide[...]`
Section transition with holographic grid, concentric circles containing section number, and readout labels. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Centered statement on dark background with scan-lines, HUD bracket corners, glow dots, and italic text.

### `#ending-slide[...]`
Farewell slide mirroring title structure (bookend) with projection frame, ghost text, and "TRANSMISSION COMPLETE" label.

## Reusable Components

### `#holo-card(title, body)`
Opaque glass-like card with glowing border and HUD bracket accents at its outer corners. The opaque surface protects copy from the persistent page atmosphere.
```typst
#holo-card([Dense Transformer], [Standard attention over all tokens...])
```

### `#readout-stat(label, value, description: none)`
Large bold numeric readout with tracked label and accent underline. Label, value, rule, and description use one centered `stack(spacing: .8em)` for predictable KPI alignment.
```typst
#readout-stat([PARAMETERS], [405B], description: [Largest open-weight model])
```

### `#projection-box(body)`
Content area with three nested, opaque pale-blue projection layers.
```typst
#projection-box[Content with holographic projection glow.]
```

### `#scanline-divider(total-width: 100%)`
Horizontal divider with holographic glow dots.
```typst
#scanline-divider(total-width: 100%)
```

### `#beacon-tag(body)`
Small pill-shaped holographic tag in electric blue.
```typst
#beacon-tag([Tool Use]) #beacon-tag([Memory])
```

### `#interface-highlight(body, cite: none)`
Highlighted block with left cyan accent border and optional citation.
```typst
#interface-highlight([Key insight here.], cite: "Author, 2025")
```

### `#datastream-note(body)`
Data transmission readout callout in monospace.
```typst
#datastream-note[Agent loop: Observe > Think > Act > Reflect]
```

### `#terminal-badge(body)`
Small dark monospace badge for labels.
```typst
#terminal-badge([ACTIVE]) #terminal-badge([v2.1])
```

### `#matrix-grid(headers, align: center + horizon, ..rows)`
Native holographic data table with semantic `table.header`, opaque alternating rows, and caller-configurable alignment.
```typst
#matrix-grid(
  ("Model", "Params", "Score"),
  ([GPT-4o], [~200B], [88.7%]),
)
```

## Color Scheme

| Role | Hex | Description |
|------|-----|-------------|
| Background | `#F4F6FA` | Light silvery for content slides |
| Primary | `#0094FF` | Electric blue accents |
| Primary Text | `#006FBF` | Accessible blue for small text on light surfaces |
| Accent | `#00E5FF` | Holographic cyan glow |
| Secondary | `#7C4DFF` | Violet glow accents |
| Ink | `#0D1B2A` | Dark text |
| Dark BG | `#0A0F1E` | Dark slide backgrounds |
| Dark Ink | `#E0F0FF` | Text on dark backgrounds |

### Derived Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Page background |
| `palette.ink` | Primary text |
| `palette.primary` | Electric blue accents |
| `palette.primary-text` | Contrast-safe electric blue text on light surfaces |
| `palette.accent` | Holographic cyan |
| `palette.secondary` | Violet glow |
| `palette.card` | Card background (white) |
| `palette.primary-dim/muted/faint/ghost` | Primary at various transparencies |
| `palette.accent-dim/muted/faint/ghost` | Accent at various transparencies |
| `palette.dark-bg` | Dark mode background |
| `palette.dark-ink` | Dark mode text |
| `palette.meta-color` | Footer/metadata text |

## Files

- `template.typ` -- Theme definition (palette, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase (AI/tech topic)
- `theme_design_spec.md` -- Detailed design specification
- `theme.md` -- This file (quick reference)

## Demo

See `demo.typ` for a compilable example covering neural architecture search, autonomous agents, AI infrastructure, and safety alignment.
