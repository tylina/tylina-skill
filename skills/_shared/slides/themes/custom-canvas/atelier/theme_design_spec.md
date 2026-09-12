# Atelier Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | atelier |
| **Best For** | Creative agencies, design portfolios, art direction pitches, brand strategy presentations |
| **Style Objective** | Artistic / Studio Workshop |
| **Complexity Level** | Canvas |

An artist's studio / workshop aesthetic presentation theme inspired by oil painting palettes, canvas stretchers, paint splatter, and studio lighting. Features warm cream canvas-texture backgrounds with rich paint-stroke accents in cadmium red and ultramarine blue, loose gestural SVG brush strokes, and paint splatter decorations. The feeling: walking into an artist's studio -- creative, bold, intentional, warm.

## Design Philosophy

- **Canvas Texture Immersion**: Warm cream backgrounds with faint pencil marks create the sense of working on raw canvas
- **Paint Gesture Accents**: Organic brush strokes, splatter patterns, and palette knife textures add authentic studio energy
- **Structural Frame**: Canvas stretcher frame SVG provides architectural grounding and bookending
- **Color as Material**: Colors named after real pigments (cadmium red, ultramarine, raw umber) reinforce the studio metaphor
- **Imperfect Precision**: Organic, hand-made feeling with professional underlying grid structure

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Canvas Cream | `#FDF8EE` | Primary background |
| Cadmium Red | `#D42B2B` | Primary accent, brush strokes, emphasis |
| Ultramarine Blue | `#1A3A7A` | Secondary accent, cool contrast |
| Raw Umber | `#6B4C3B` | Earthy secondary, frames, borders |
| Charcoal | `#1C1C1C` | Primary text |
| Off-White | `#FFFEF9` | Card backgrounds |
| Dark Studio Wall | `#2A1F1A` | Dark slide background |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: atelier-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Studio Name],
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
Canvas stretcher frame cover with full-page frame SVG, paint splatter in cadmium red (top-right) and ultramarine (bottom-left), gestural brush stroke across center, pencil sketch marks, centered title with institution kicker and paint-stroke divider. Bookends with ending-slide.

### `slide(title: auto, ..args)`
Standard content slide with faint pencil marks background (persistent canvas atmosphere), subtle palette-knife paint marks at bottom-right edge, bold title with cadmium red accent bar, and footer with ATELIER label.

### `dark-slide(title: auto, header-left: none, header-right: none, ..args)`
Deep studio-wall dark background (`#2A1F1A`) with paint splatter decorations in corners (red top-right, blue bottom-left). Supports custom header labels. All text uses cream color.

### `new-section-slide(self: none, body)`
Section divider with pencil marks atmosphere, large gestural brush stroke behind section number, bold section number in cadmium red, accent lines, CHAPTER kicker label, and brush stroke accent at bottom. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Canvas background with paint splatter accents in corners (red top-left, blue bottom-right), brush stroke underline effect behind text area, corner paint marks forming bracket shapes, and centered italic text.

### `ending-slide(body)`
Farewell slide with canvas stretcher frame (bookend with title-slide), paint splatter (mirrored positions from title), ghost "FIN" text, cadmium red paint-stroke ornament above title, ultramarine accent divider below, and ATELIER label.

## Reusable Components

### `canvas-card(title, body)`
Card with 4pt cadmium red left border and off-white fill. Bold title with sans-serif body text. Subtle secondary-faint border on remaining sides.

```typst
#canvas-card([Card Title], [
  Card body content with description.
])
```

### `pigment-stat(label, value, description: none)`
Large bold number with paint-stroke accent underline. Monospace tracked kicker label in cadmium red above, thick red accent bar below value, and optional description.

```typst
#pigment-stat([BRAND RECALL], [89%], description: [Increase in brand recognition])
```

### `easel-box(body)`
Content area with layered canvas-texture background (simulated weave with nested blocks). Provides visual depth without competing with content.

```typst
#easel-box[
  Content displayed on a simulated canvas surface.
]
```

### `brushstroke-divider(color: palette.primary, total-width: 100%)`
Gestural SVG brush stroke used as a horizontal divider. Organic and imperfect, unlike a straight line.

```typst
#brushstroke-divider(color: palette.primary, total-width: 100%)
```

### `swatch-tag(body, color: palette.primary)`
Small pill/tag label styled like a paint tube tag. Transparent color fill with matching border.

```typst
#swatch-tag([Research])
#swatch-tag([Strategy], color: palette.accent)
```

### `palette-highlight(body, color: palette.accent)`
Emphasized content block with colored accent bar at the top edge. Subtle border framing.

```typst
#palette-highlight(color: palette.accent)[
  Highlighted content with top accent bar.
]
```

### `studio-note(body, cite: none)`
Quote/note block with raw umber left border and off-white fill. Italic text with optional tracked uppercase citation below.

```typst
#studio-note([
  A meaningful observation about the creative process.
], cite: "Creative Director, 2024")
```

### `gesso-badge(body)`
Dark label badge like a gesso-primed board label. Charcoal fill with cream text, tracked uppercase monospace.

```typst
#gesso-badge([CASE STUDY])
```

## SVG Decorations

| SVG | Description | Elements |
|-----|-------------|----------|
| Gestural Brush Stroke | Loose, organic paint stroke with 3 paths of varied thickness and opacity | 3 cubic bezier paths with rounded caps |
| Paint Splatter | Irregular drops and flicks of paint | 13 elements: circles, ellipse, organic drip paths |
| Canvas Stretcher Frame | Wooden frame with cross bars and corner joints | Outer/inner rectangles, corner diagonals, dashed center lines |
| Sketch Pencil Marks | Light pencil gesture lines and hatching | 7 elements: curved lines, hatching marks, circles |
| Palette Knife Texture | Broad textured strokes suggesting impasto | 4 elements: filled shapes and stroked curves |

## Persistent Atmosphere

- **Content slides**: Faint pencil marks SVG overlay + subtle palette-knife paint marks at bottom-right
- **All backgrounds**: Warm canvas cream (`#FDF8EE`) creates unified studio environment

## Bookending

- **Title slide** and **ending slide** share: canvas stretcher frame SVG, paint splatter decorations (mirrored positions), cadmium red accent elements
- Creates cohesive opening/closing visual bracket

## Demo

See `demo.typ` for a complete demonstration covering creative agency strategy, brand identity services, design process methodology, case studies, and deliverables.

## File Structure

```
atelier/
  template.typ         -- Theme definition (palette, SVGs, components, slides)
  demo.typ             -- Full demonstration presentation
  theme_design_spec.md -- This file (detailed specification)
  theme.md             -- Quick reference guide
```
