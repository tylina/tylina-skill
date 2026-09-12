# Atelier Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `atelier-theme`
**Style**: Artist's studio / workshop aesthetic -- warm canvas with paint-stroke accents
**Primary color**: `#D42B2B` (Cadmium Red)
**Best For**: Creative agencies, design portfolios, art direction pitches, brand strategy
**Style Objective**: Artistic / Studio Workshop
**Complexity Level**: Canvas

## Description

An artist's studio presentation theme featuring warm cream canvas-texture backgrounds with cadmium red and ultramarine blue paint-stroke accents. Includes gestural brush strokes, paint splatter, canvas stretcher frames, pencil sketch marks, and palette knife textures as SVG decorations. The aesthetic evokes walking into a working artist's studio -- creative, bold, intentional, and warm.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 18pt)

#show: atelier-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Studio Name],
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
Canvas stretcher frame cover with paint splatter, brush strokes, and pencil marks. Bookends with ending-slide.

### `#slide(title: auto)`
Standard content slide with faint pencil marks atmosphere and palette-knife paint accents at edges.

### `#dark-slide(title: auto, header-left: none, header-right: none)`
Deep studio-wall dark variant with paint splatter decorations and custom header labels.

### `#new-section-slide[...]`
Section divider with brush stroke behind section number and pencil marks atmosphere. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Canvas background with paint splatter corners, brush stroke underline, and centered italic text.

### `#ending-slide[...]`
Farewell slide with stretcher frame and splatter (mirrors title-slide), ghost "FIN" text, and ATELIER label.

## Reusable Components

### `#canvas-card(title, body)`
Card with cadmium red left border and off-white fill.
```typst
#canvas-card([Brand Identity], [Logo systems, color palettes, typography selection...])
```

### `#pigment-stat(label, value, description: none)`
Large bold number with paint-stroke accent underline and tracked kicker label.
```typst
#pigment-stat([PROJECTS], [47], description: [Brand identities delivered])
```

### `#easel-box(body)`
Content area with layered canvas-texture background.
```typst
#easel-box[Content on simulated canvas surface.]
```

### `#brushstroke-divider(color: palette.primary, total-width: 100%)`
Gestural SVG brush stroke horizontal separator.
```typst
#brushstroke-divider(color: palette.primary, total-width: 100%)
```

### `#swatch-tag(body, color: palette.primary)`
Small color swatch label like a paint tube tag.
```typst
#swatch-tag([Research]) #swatch-tag([Strategy], color: palette.accent)
```

### `#palette-highlight(body, color: palette.accent)`
Emphasized block with color accent bar at top.
```typst
#palette-highlight(color: palette.accent)[Highlighted content here.]
```

### `#studio-note(body, cite: none)`
Quote/note with umber left border and optional citation.
```typst
#studio-note([A meaningful observation.], cite: "Director, 2024")
```

### `#gesso-badge(body)`
Dark label badge with tracked uppercase text.
```typst
#gesso-badge([CASE STUDY])
```

## Color Scheme

| Color | Hex | Role |
|-------|-----|------|
| Canvas Cream | `#FDF8EE` | Background |
| Cadmium Red | `#D42B2B` | Primary accent |
| Ultramarine Blue | `#1A3A7A` | Secondary accent |
| Raw Umber | `#6B4C3B` | Earthy secondary |
| Charcoal | `#1C1C1C` | Text |
| Off-White | `#FFFEF9` | Card fill |
| Dark Studio Wall | `#2A1F1A` | Dark slide bg |

### Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Page background (canvas cream) |
| `palette.primary` | Cadmium red accents |
| `palette.accent` | Ultramarine blue accents |
| `palette.secondary` | Raw umber frames/borders |
| `palette.ink` | Charcoal text |
| `palette.card` | Off-white card fill |
| `palette.primary-dim/muted/faint/ghost` | Red at various transparencies |
| `palette.accent-dim/muted/faint/ghost` | Blue at various transparencies |
| `palette.ink-dim/muted/faint/ghost` | Text at various transparencies |
| `palette.secondary-dim/faint/ghost` | Umber at various transparencies |
| `palette.bg-dark` | Dark studio wall for dark-slide |
| `palette.meta-color` | Footer/metadata text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.ink,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## SVG Decorations

| SVG | Use |
|-----|-----|
| Gestural Brush Stroke | Dividers, section accents, focus-slide underline |
| Paint Splatter | Title/ending bookend, dark-slide corners, focus corners |
| Canvas Stretcher Frame | Title/ending full-page frame |
| Sketch Pencil Marks | Persistent atmosphere on content slides |
| Palette Knife Texture | Subtle edge accents on content slides |

## Files

- `template.typ` -- Theme definition (palette, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase (creative agency topic)
- `theme_design_spec.md` -- Detailed design specification
- `theme.md` -- This file (quick reference)

## Demo

See `demo.typ` for a compilable example covering brand strategy, design process, and creative direction.
