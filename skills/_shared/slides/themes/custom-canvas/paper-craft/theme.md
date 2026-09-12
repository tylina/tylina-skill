# Paper Craft

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `paper-craft-theme`
**Style**: Tactile paper collage -- layered paper with drop shadows, torn edges, origami cranes
**Primary color**: `#FF6B6B` (Coral -- origami preset)
**Best For**: Education, creative workshops, design portfolios, arts & crafts, maker spaces
**Style Objective**: General Versatile
**Complexity Level**: Canvas

## Description

A joyful, dimensional presentation theme inspired by paper craft art (kirigami, paper cutting, layered paper collage). Features colored paper layers with visible drop shadows creating physical depth, torn paper edges as decorative elements, and playful SVG decorations (scissors, paper clips, origami cranes). Every slide feels like a craft table with layered paper compositions. Background is warm cream (never pure white) to simulate real paper.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: paper-craft-theme.with(
  aspect-ratio: "16-9",
  preset: "origami",  // or "confetti", "kraft"
  footer: [My Workshop],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#title-slide()

= First Section

== First Slide

Content goes here.

#focus-slide[Key Takeaway]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer content for dark slides |
| `preset` | string | `"origami"` | Color preset: `"origami"`, `"confetti"`, `"kraft"` |

## Fonts

The theme deliberately does not set a font family in `template.typ`. Set an installed font stack in the main file. The demo uses:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)
```

## Available Slide Types

### `#title-slide()`
Craft table composition with origami crane hero decorations, layered paper rectangles with shadows, paper clips, torn edge strips, scissors divider. Central card reads from `config-info()`.

### `#slide(title: auto)`
Standard content slide with persistent paper-craft atmosphere (paper texture, fold crease in corner, paper clip holding header, torn edge at bottom). Bold title with torn-edge underline.

### `= Heading` (new-section-slide, auto-triggered)
Section divider with circular cutout badge (section number), torn edge revealing colored layer beneath, paper clip on badge, small origami crane.

### `#dark-slide(title: auto, header-left: none, header-right: none)`
Deep navy (`#1A1A2E`) paper with ghost origami crane at 5%, scattered lighter paper fragments, paper texture. For contrast and emphasis.

```typst
#dark-slide(title: [Night Studio])[
  Content with inverted colors.
]
```

### `#focus-slide[...]`
Accent-colored (coral) background with torn edges, paper fragments, paper clip. Bold white text centered.

### `#ending-slide[...]`
Bookends with title-slide (same cranes, clips, paper stacks). Central card with crane ornament, scissors divider, "PAPER-CRAFT" label.

## Reusable Components

### `#paper-card(title, body, accent: palette.accent)`
Content card with torn-edge SVG top border, drop shadow behind, clean paper fill.

```typst
#paper-card([Card Title], [
  Card body content.
], accent: palette.secondary)
```

### `#cutout-stat(label, value, description: none, accent: palette.accent)`
Circular punched-out paper shape with shadow, bold number centered, label kicker above.

```typst
#cutout-stat([METRIC], [92%], description: [satisfaction rate])
```

### `#note-quote(body, cite: none)`
Warm sticky-note colored block with folded corner triangle and shadow offset.

```typst
#note-quote([
  Quote text here.
], cite: [Author Name])
```

### `#folder-box(title, body, accent: palette.secondary)`
Paper folder with trapezoid tab above content area, shadow behind.

```typst
#folder-box([Section Title], [
  - Bullet point one
  - Bullet point two
], accent: palette.tertiary)
```

### `#stamp-tag(body, color: palette.accent)`
Inline rubber stamp tag -- bordered rounded rect, uppercase mono text.

```typst
#stamp-tag([New], color: palette.secondary)
```

### `#scissors-divider(color: palette.ink-muted)`
Full-width scissors SVG + dashed cut line divider.

```typst
#scissors-divider()
```

### `#collage-highlight(body, colors: (palette.accent, palette.secondary, palette.tertiary))`
2-3 rotated paper rectangles behind a main content card with shadow.

```typst
#collage-highlight([
  Featured content with layered paper background.
])
```

### `#envelope-card(title, body, accent: palette.accent)`
Card with triangular flap top (opened envelope shape), drop shadow.

```typst
#envelope-card([Title], [
  Content inside the envelope.
], accent: palette.secondary)
```

### `#tape-strip(body, color: palette.tertiary)`
Content card with diagonal washi tape SVG strip across corner.

```typst
#tape-strip([
  Content with washi tape decoration.
])
```

### `#origami-label(body, color: palette.accent)`
Small inline folded-corner bookmark label.

```typst
#origami-label([Beginner], color: palette.secondary)
```

## SVG Render Helpers (for custom compositions)

| Function | Parameters | Description |
|----------|-----------|-------------|
| `torn-edge` | `color:, width:, height:` | Irregular ripped paper edge line |
| `paper-clip` | `color:, size:` | Bent wire paper clip |
| `scissors-line` | `color:, width:, height:` | Scissors + dashed cut line |
| `fold-crease` | `color:, size:` | Diagonal fold with shadow |
| `origami-crane` | `color:, width:, height:` | Geometric folded crane |
| `paper-texture` | `color:, width:, height:` | Subtle paper fiber texture |
| `washi-tape` | `color:, width:, height:` | Decorative tape pattern |
| `craft-grid` | `color:, width:, height:` | Cutting-mat grid pattern |

## Color Palette

### Palette System (Canvas)

**Factory function**: `build-palette(preset)`
**Default export**: `palette = build-palette("origami")`

#### Presets

| Preset | Background | Ink | Accent | Secondary | Tertiary |
|--------|-----------|-----|--------|-----------|----------|
| origami | `#FFFDF8` | `#2C2C2C` | `#FF6B6B` | `#4ECDC4` | `#F7B731` |
| confetti | `#FFFFFE` | `#1A1A2E` | `#FF69B4` | `#9B59B6` | `#2ECC71` |
| kraft | `#F5E6D3` | `#3D2B1F` | `#FFFFFF` | `#8FBC8F` | `#D4956A` |

#### Key Palette Fields

| Field | Purpose |
|-------|---------|
| `palette.bg` | Page background (warm cream) |
| `palette.ink` | Primary text color |
| `palette.accent` | Primary accent (coral) |
| `palette.secondary` | Secondary accent (teal) |
| `palette.tertiary` | Tertiary accent (mustard) |
| `palette.paper-1/2/3` | Paper layer tones (progressively darker) |
| `palette.ink-dim/muted/faint/ghost` | Ink transparency variants |
| `palette.shadow` | Standard drop shadow color |
| `palette.dark-bg` | Dark slide background |
| `palette.dark-ink` | Dark slide text color |

## Layout Patterns

### Two-Column Cards
```typst
#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 20pt,
  paper-card([Left Title], [Content], accent: palette.accent),
  paper-card([Right Title], [Content], accent: palette.secondary),
)
```

### Stats Row
```typst
#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 16pt,
  cutout-stat([LABEL], [85%], accent: palette.accent),
  cutout-stat([LABEL], [3x], accent: palette.secondary),
  cutout-stat([LABEL], [12], accent: palette.tertiary),
)
```

### Folder Pairs
```typst
#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 18pt,
  folder-box([Title A], [Content], accent: palette.secondary),
  folder-box([Title B], [Content], accent: palette.tertiary),
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (993 lines)
- `demo.typ` -- Compilable usage example (19 slides)
