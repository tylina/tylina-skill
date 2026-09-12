# Neon-Grid Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `neon-grid-theme`
**Style**: Retro-futuristic wireframe grid / 80s tech magazine aesthetic
**Primary color**: Light gray `#F2F0F5` bg, charcoal `#1A1A2A` ink, hot magenta `#E91E8C` accent, electric cyan `#00BCD4` secondary
**Best For**: Tech presentations, spatial computing, 3D/graphics talks, product launches, innovation showcases
**Style Objective**: Retro-futuristic wireframe grid aesthetic
**Complexity Level**: Canvas

## Description

A retro-futuristic wireframe grid presentation theme inspired by 80s/90s tech magazine illustrations. Features perspective grids with vanishing points, wireframe 3D objects, neon accent lines (hot magenta and electric cyan) on light gray backgrounds. The aesthetic is earnest retro-futurism -- forward-looking, geometric, energetic.

Key features: built-in **dark-slide** with full wireframe atmosphere, persistent perspective grid + neon corner accents on all content slides, 5 SVG assets (perspective grid, wireframe sphere, corner brackets, triangle clusters, scanline texture), and title/ending bookend with shared wireframe frame.

Design philosophy: "Every surface begins as a wireframe."

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#let pal = build-palette("light")

#show: neon-grid-theme.with(
  aspect-ratio: "16-9",
  preset: "light",
  footer: self => self.info.institution,
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle text],
    author: [Author Name],
    date: datetime.today(),
    institution: [YOUR ORG],
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content goes here.

// Dark slide with wireframe atmosphere
#dark-slide(header-left: [TOPIC], header-right: [2025])[
  #text(size: 36pt, weight: "bold", fill: rgb("#FFFFFF"))[A bold statement.]
]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | string | `"light"` | Color preset name |
| `footer` | content/function | `none` | Footer content or function |

## Available Slide Types

### `#slide(title: auto)`

Standard content slide with faint perspective grid background and neon corner accents. Bold title with magenta accent rule below. Title auto-detects from `== Heading`.

```typst
== My Slide Title
Content here...
```

### `#dark-slide(title: auto, ...)`

Dark charcoal background with full wireframe atmosphere: perspective grid, scanline texture, wireframe sphere, neon corner brackets. Ideal for data displays and vision statements.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title (set to `none` for no title) |
| `header-left` | none/content | `none` | Custom left header text |
| `header-right` | none/content | `none` | Custom right header text |

```typst
#dark-slide(
  header-left: [SYSTEM METRICS],
  header-right: [Q4 2025],
)[
  #text(size: 36pt, weight: "bold", fill: rgb("#FFFFFF"))[Rendering at Scale]
]
```

### `#title-slide()`

Full-page cover with perspective grid, corner brackets wireframe frame, triangle clusters, wireframe sphere, scanline texture. Centered title with neon divider.

```typst
#title-slide()
```

### `#new-section-slide[...]`

Section divider with perspective grid, triangle cluster decoration, ghost section number, corner brackets. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`

Full-page centered statement with L-bracket corners in alternating magenta/cyan colors. Subtle perspective grid background.

```typst
#focus-slide[
  The wireframe is not the prototype.
  The wireframe is the product.
]
```

### `#ending-slide[...]`

Closing page sharing full wireframe frame with title-slide (bookending). Perspective grid, corner brackets, wireframe sphere, triangle cluster, ghost "END" text.

```typst
#ending-slide[Thank You]
```

## Reusable Components

### `#wire-card(title, body)`

Content card with white background, magenta top accent line, and faint border. Clean container for structured content.

```typst
#wire-card([Geometry Pipeline], [
  Mesh generation from point clouds. Adaptive tessellation.
])
```

### `#pixel-stat(label, value, description: none)`

Large numeric stat with mono label above and cyan underline below. Optional description text.

```typst
#pixel-stat([RENDER NODES], [128], description: [Distributed across 4 continents])
```

### `#vector-box(body)`

Content block with subtle surface fill and magenta left border. For specifications and code-like content.

```typst
#vector-box[
  *Input*: 10K points from LiDAR scan \
  *Output*: Watertight mesh, 50K polygons
]
```

### `#grid-divider(total-width: 100%)`

Horizontal line with crosshair marks and neon dots at intervals. Geometric section separator.

```typst
#grid-divider()
```

### `#glow-tag(body, color: palette.accent)`

Translucent pill-shaped tag with neon border. Uppercase mono text.

```typst
#glow-tag[GPU CLUSTER]
#glow-tag(color: pal.secondary)[EDGE COMPUTE]
```

### `#frame-highlight(body)`

Bordered content block with corner bracket accents (magenta L-shapes). Draws attention to key content.

```typst
#frame-highlight[
  #text(weight: "bold")[Key Insight]
  Neural mesh generates production wireframes in real-time.
]
```

### `#render-note(body)`

Aside/note styled like a render log entry. Deep purple tint with NOTE prefix.

```typst
#render-note[All subsystems maintain < 16ms frame budget.]
```

### `#vertex-badge(body, color: palette.accent)`

Circular badge with number/icon inside. Neon stroke on translucent fill.

```typst
#vertex-badge([1])
#vertex-badge([A], color: pal.secondary)
```

### `#polygon-list(..items)`

Numbered list with vertex-badge numbering. Clean geometric list style.

```typst
#polygon-list(
  [First milestone achieved],
  [Second phase in progress],
  [Third target identified],
)
```

## Palette System

### `build-palette(preset-name)`

Exposed factory function. Returns a full palette dictionary from a preset name.

```typst
#let pal = build-palette("light")
// Access: pal.bg, pal.ink, pal.accent, pal.secondary, pal.card, pal.deep-purple, etc.
```

### Preset Dictionary

| Preset | Background | Ink | Accent | Secondary | Best For |
|--------|-----------|-----|--------|-----------|----------|
| `light` | `#F2F0F5` light gray | `#1A1A2A` charcoal | `#E91E8C` hot magenta | `#00BCD4` electric cyan | Default, tech presentations |
| `dark` | `#1A1A2A` charcoal | `#F2F0F5` light gray | `#E91E8C` hot magenta | `#00BCD4` electric cyan | Dark mode, evening events |
| `vapor` | `#F5F0FA` lavender | `#2A1A3A` deep charcoal | `#9C27B0` purple | `#00E5FF` bright cyan | Creative, artistic |

### Derived Palette Keys

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `palette.bg` | base | Page background |
| `palette.ink` | base | Primary text |
| `palette.accent` | base | Hot magenta neon accent |
| `palette.secondary` | base | Electric cyan neon accent |
| `palette.card` | `#FFFFFF` | Card backgrounds |
| `palette.deep-purple` | `#4A148C` | Tertiary emphasis |
| `palette.ink-light` | ink @ 20% transparent | Secondary text |
| `palette.ink-muted` | ink @ 50% transparent | Labels, metadata |
| `palette.ink-faint` | ink @ 75% transparent | Faint elements |
| `palette.ink-ghost` | ink @ 90% transparent | Ghost text |
| `palette.accent-light` | accent @ 30% transparent | Light accent |
| `palette.accent-muted` | accent @ 50% transparent | Mid accent |
| `palette.accent-faint` | accent @ 75% transparent | Faint accent |
| `palette.accent-ghost` | accent @ 92% transparent | Ghost accent |
| `palette.secondary-light` | secondary @ 30% transparent | Light secondary |
| `palette.secondary-muted` | secondary @ 50% transparent | Mid secondary |
| `palette.secondary-faint` | secondary @ 75% transparent | Faint secondary |
| `palette.surface` | ink @ 94% transparent | Subtle fills |
| `palette.divider` | ink @ 80% transparent | Dividers |
| `palette.meta-color` | ink @ 60% transparent | Meta text |

## Typography Constants

Available via the `typo` dictionary:

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 44pt | Hero/cover text |
| `typo.h1` | 30pt | Main title |
| `typo.h2` | 22pt | Subtitle, card titles |
| `typo.body` | 16pt | Body text |
| `typo.small` | 12pt | Small text |
| `typo.tiny` | 9pt | Kickers, labels |
| `typo.meta` | 8pt | Metadata |
| `typo.stat` | 48pt | Stat numbers |

## SVG Assets

5 inline SVG definitions rendered via `image(bytes(...))`:

| Helper Function | SVG | Purpose |
|----------------|-----|---------|
| `perspective-grid(color, width, height)` | Converging perspective lines | Background atmosphere |
| `wireframe-sphere(color, size)` | Geodesic wireframe ball | Decorative 3D element |
| `corner-brackets(color, width, height)` | L-shaped frame corners | Wireframe frame border |
| `triangle-cluster(color, size)` | Overlapping wireframe triangles | Geometric accent |
| `scanline-texture(color, width, height)` | Horizontal scan lines | CRT/retro overlay |

## Fonts

Configure the primary font in your document:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)
```

The theme internally uses `"IBM Plex Mono"` for kickers, metadata, labels, and stats.
Set the document font in the deck entry; the supplied demo uses `("IBM Plex Sans", "Noto Sans SC")`.

## Design Principles

1. **Perspective grids** -- Converging lines create depth and spatial computing atmosphere
2. **Wireframe geometry** -- SVG wireframes (sphere, triangles) reinforce the 3D theme
3. **Neon accents** -- Hot magenta + electric cyan on light gray for retro-futurist energy
4. **Corner brackets** -- L-shaped framing elements create wireframe border language
5. **Bookending** -- Title and ending slides share the same full wireframe frame
6. **Persistent atmosphere** -- Every content slide has faint perspective grid + corner accents
7. **Light foundation** -- Clean light gray base keeps content readable
8. **Earnest futurism** -- Optimistic, forward-looking, technical (not ironic/nostalgic)

## Files

- `template.typ` -- Theme definition (palette, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase demonstrating all slide types and components
- `theme_design_spec.md` -- Full design specification
- `theme.md` -- This API reference

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
