# Solarpunk

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `solarpunk-theme`
**Style**: Optimistic green future, organic technology fusion. Art Nouveau curves meet sustainable engineering.
**Primary color**: `#2D8A4E` (Verdant Green)
**Best For**: Sustainability presentations, green tech pitches, urban planning, regenerative design, climate-positive initiatives
**Style Objective**: General Versatile
**Complexity Level**: Canvas

## Description

A solarpunk city in 2060 brought to life on every slide. Buildings covered in living plants, solar panels integrated with garden rooftops, organic curves meeting clean technology. The theme creates a persistent living world with Art Nouveau vine tendrils, warm golden light, and nature-technology fusion motifs. Every slide feels alive and growing.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: solarpunk-theme.with(
  aspect-ratio: "16-9",
  footer: [Green Futures Lab],
  preset: "dawn",
  config-info(
    title: [Building the Living City],
    subtitle: [Urban Architecture for a Regenerative Future],
    author: [Dr. Maya Greenwood],
    date: datetime.today(),
    institution: [Institute for Regenerative Urbanism],
  ),
)

#set text(font: ("Avenir Next", "Arial", "Noto Sans SC"), size: 20pt)

#title-slide()

= First Section

== First Slide

Content goes here.

#ending-slide[A Future Worth Growing]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be function `self => ...` |
| `preset` | string | `"dawn"` | Page/chrome color preset: `"dawn"`, `"canopy"`, or `"harvest"` |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("Avenir Next", "Arial", "Noto Sans SC"), size: 20pt)
```

The theme internally uses:
- `"Menlo"` for kickers, metadata, counters, and labels

The entry function deliberately does not set a font family, so downstream decks retain control of their own verified font stack.

## Available Slide Types

### Standard Types

### `#title-slide()`
Full-page solarpunk dawn scene. Sun ray burst from top-right, growing vines along both sides, solar cell pattern at bottom, organic asymmetric border frame with seed/glow dot corner markers. Reads from `config-info()`.

### `#slide(title: auto)`
Content slide with persistent living atmosphere: growing vine along left edge (10% opacity), warm golden gradient from top, leaf-circuit motif in bottom-right. Header with bold title + rounded green accent bar. Footer with configured footer text (or "SOLARPUNK") | seed dot | page number.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Geodesic dome SVG behind content, enhanced vine at 30% opacity, section number decorated with leaf-circuit ornament, eco coordinate label.

### `#focus-slide[...]`
Deep green background with radial warm glow, vine accents, scattered bioluminescent dots. Large white-green centered text.

### `#ending-slide[...]`
Bookends with title slide: same vine framing, sun burst, organic border, corner markers. "GROW" ghost text, leaf-circuit ornament, organic divider, "THE FUTURE IS GROWING" tagline.

### Additional Slide Types (Canvas)

### `#dark-slide(title:, header-left:, header-right:, ...)`

Warm dark forest-at-night background (`#1A2A1A`). Bioluminescent vine (glowing green), scattered glow dots as spores, "GROW" ghost text at 4% opacity. Green-tinted chrome.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content/none | `auto` | Slide title |
| `header-left` | content/none | `none` | Custom left header content |
| `header-right` | content/none | `none` | Custom right header content |

```typst
#dark-slide(title: [The Night Garden])[
  After sunset, the city glows with bioluminescence.
]
```

## Reusable Components

### `#canopy-card(title, body)`
Primary content card with organically rounded corners (asymmetric radii), seed dot accent in top-left, subtle green top bar. Use for main informational content.

```typst
#canopy-card([Biophilic Design], [
  Every building surface becomes habitat for living systems.
])
```

### `#solar-stat(label, value, description: none)`
Centered metric display with a strict sun icon -> value -> label -> description sequence and a gold closing rule. All vertical relationships live in one `stack(spacing:)`.

```typst
#solar-stat([Energy Output], [4.2 TWh], description: [per district annually])
```

### `#seed-quote(body, cite: none)`
Quotation block with growing vine SVG emerging from the left border. Large decorative quote mark, organic rounded right corners.

```typst
#seed-quote([The city does not consume nature -- it *is* nature.], cite: "Lena Okoro")
```

### `#biome-box(title, body)`
Content box with hexagonal solar-cell pattern in the header band, rounded bottom corners. Good for categorized or classified information.

```typst
#biome-box([Canopy District], [
  High-rise food forests integrated with residential towers.
])
```

### `#spore-tag(body)`
Organic pill-shaped inline tag with subtle green gradient fill and rounded border.

```typst
#spore-tag[Renewable] #h(4pt) #spore-tag[Resilient]
```

### `#vine-divider(total-width: 100%)`
Horizontal organic divider with gradient line and leaf-like seed dots at intervals. NOT a straight rule.

```typst
#vine-divider()
```

### `#solarium-highlight(body)`
Featured content block with warm golden glow gradient background and sun glow dot accent in top-right.

```typst
#solarium-highlight[
  *Key Insight:* Cities can generate 140% of their energy needs.
]
```

### `#ecosystem-grid(..items)`
Multi-item layout where items are displayed in organic cards connected by a vine-like gradient line below. Takes positional arguments.

```typst
#ecosystem-grid(
  [*Sunlight* captured by organic PV],
  [*Water* filtered through wetlands],
  [*Nutrients* cycled via compost],
)
```

### `#photosynthesis-card(title, body)`
Card with an opaque gradient from green (left) to gold (right) representing energy conversion. Small gradient energy-flow bar at top.

```typst
#photosynthesis-card([Artificial Leaf Cells], [
  Bio-mimetic solar cells replicating chloroplast efficiency.
])
```

### `#community-label(body)`
Warm rounded inline label styled like a seed packet or community garden sign. Gold top border accent.

```typst
#community-label[Community Owned Infrastructure]
```

### `#night-card(title, body)`
Opaque bioluminescent card for `dark-slide` rows. Its green label and pale body text are contrast-safe on the forest-night surface and it supports height equalization.

```typst
#night-card([Algae Lanes], [Bio-lit pathways using dinoflagellate cultures])
```

## Color Scheme

### Palette System (Canvas)

**Factory function**: `build-palette(preset-name)`
**Variable name**: `palette`

#### Presets

| Preset | BG | Ink | Accent | Secondary | Best For |
|--------|-----|------|--------|-----------|----------|
| dawn (default) | `#FDF8F0` | `#1A2A1A` | `#2D8A4E` | `#E8A838` | Warm optimistic |
| canopy | `#F0F7F2` | `#1B3A2A` | `#1B5E3A` | `#D4A020` | Environmental science |
| harvest | `#FBF7F0` | `#2A2010` | `#8B6914` | `#5A8A4A` | Agriculture, community |

#### Derived Palette Keys

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `pal.bg` | Base background | Page fill |
| `pal.ink` | Base ink | Primary text |
| `pal.accent` | Green accent | Headers, emphasis, borders |
| `pal.secondary` | Gold secondary | Warmth, highlights, stats |
| `pal.secondary-text` | Preset-specific dark secondary | Small gold/green text on light backgrounds |
| `pal.ink-dim` | ink @ 25% transparent | Dimmed body text |
| `pal.ink-muted` | ink @ 30% transparent | Secondary text |
| `pal.ink-faint` | ink @ 75% transparent | Subtle borders |
| `pal.ink-ghost` | ink @ 92% transparent | Ghost background elements |
| `pal.accent-muted` | accent @ 45% transparent | Soft green borders |
| `pal.accent-faint` | accent @ 75% transparent | Card borders |
| `pal.accent-ghost` | accent @ 90% transparent | Background fills |
| `pal.secondary-muted` | secondary @ 50% transparent | Gold borders |
| `pal.bg-dark` | `#1A2A1A` | Dark slide background |
| `pal.meta-color` | ink @ 25% transparent | Footer/chrome text |
| `pal.night-text` / `pal.night-muted` / `pal.night-accent` | Fixed forest-night tokens | Dark-slide text and chrome |
| `pal.focus-text` / `pal.focus-accent` | Fixed focus tokens | Focus-slide body and emphasized text |

### Typography Constants

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 42pt | Title slide hero text |
| `typo.h1` | 28pt | Slide titles |
| `typo.h2` | 22pt | Card headings |
| `typo.body` | 16pt | Body text |
| `typo.small` | 12pt | Tags, captions |
| `typo.tiny` | 9pt | Kickers, metadata |
| `typo.meta` | 8pt | Footer chrome |

## Layout Patterns

### Two-Column Cards

```typst
#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  canopy-card([Title A], [Content A]),
  canopy-card([Title B], [Content B]),
)
```

### Stats Row

```typst
#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  solar-stat([Label 1], [Value], description: [desc]),
  solar-stat([Label 2], [Value], description: [desc]),
  solar-stat([Label 3], [Value], description: [desc]),
)
```

### Highlight + Quote

```typst
#solarium-highlight[Key insight text here.]
#v(0.5em)
#seed-quote([Supporting quotation.], cite: "Source")
```

### Dark Slide for Emphasis

```typst
#dark-slide(title: [Night Theme])[
  Content with bioluminescent atmosphere.
]
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (900+ lines, 5 SVGs, 11 components)
- `demo.typ` -- Compilable usage example (15 slides)

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with realistic solarpunk urbanism content.
