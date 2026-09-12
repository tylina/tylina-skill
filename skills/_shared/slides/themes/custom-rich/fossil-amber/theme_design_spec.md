# Fossil Amber Theme - Design Specification

## Design Concept

**Metaphor**: Viewing amber inclusions under a microscope — warm honey-gold tones, layered geological strata patterns, fossilized leaf impressions as decorative elements, and sedimentary cross-sections as dividers.

**Mood**: Scholarly warmth, deep time, natural preservation, layered history, quiet reverence for the past.

**Target audience**: Academic presentations, research talks, scientific conferences, natural history lectures, geological surveys, and any presentation that benefits from a warm, authoritative aesthetic without the clinical coldness of typical academic themes.

## Color System

### Primary Palette

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Warm cream | `#FDF8F0` | Evokes aged parchment and limestone |
| Primary text | Dark umber | `#3D2B1F` | Rich readability without harsh black |
| Accent decoration | Honey gold | `#D4920B` | True amber color for rules, dots, borders, and SVGs |
| Accent text | Dark amber | `#8A5A00` | Text-safe amber for labels and emphasis on light surfaces |
| Secondary | Warm brown | `#8B5E3C` | Sedimentary earth tone |
| Highlight | Bright amber | `#F5C842` | Glowing amber for emphasis |

### Extended Palette

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Card BG | Near-white cream | `#FFFDF7` | Subtle separation from page bg |
| Borders | Wheat | `#E8D5B7` | Soft, warm boundary lines |
| Light amber | Pale gold | `#FAEAC8` | Inclusion-box background |
| Dark strata | Deep brown | `#4A3728` | Focus slide background |
| Sediment | Chocolate | `#6B4423` | Deep earth accent |
| Resin | Dark amber | `#C87F0A` | Technical/code accent |
| Resin text | Deep resin | `#8F5200` | Text-safe resin tone on light surfaces |
| Leaf green | Olive | `#5C7A3D` | Fossilized plant color |
| Leaf text | Deep olive | `#49652E` | Text-safe leaf tone on light surfaces |
| Muted text | Warm gray | `#6F6252` | Footer, captions |

### Color Relationships

- **Contrast ratio**: ink-on-bg is approximately 12.7:1; all normal text tokens meet at least 4.5:1 on their intended light surfaces
- **Accent hierarchy**: bright amber/resin/leaf tokens are decorative; `accent-text`, `resin-text`, and `leaf-text` carry text semantics
- **Temperature**: All colors lean warm; no cool blues or grays in the palette
- **The amber-glow color is reserved** for focus slide text and special highlights

## Typography

| Element | Font | Size | Weight | Color |
|---------|------|------|--------|-------|
| Slide title | Project font | 1.3em (23.4pt) | Bold | `ink` |
| Body text | Project font | 18pt | Regular | `ink` |
| Card title | Project font | 0.92em | Bold | text-safe accent mapping |
| Card body | Project font | 0.82em | Regular | `ink` |
| Stat value | Project font | 1.35em | Bold | text-safe accent mapping |
| Stat label | Project font | 0.75em | Regular | `text-muted` |
| Code/tech | Project monospace | inherits | Regular | `ink` |
| Footer | Project font | 0.65em | Regular | `text-muted` |
| Epoch label | Project font | 0.68em | Bold | text-safe accent mapping |
| Tag text | Project font | 0.75em | Semibold | text-safe accent mapping |

The reusable theme owns size and hierarchy, not font families. The demo verifies `("IBM Plex Serif", "Noto Serif SC")` for body text and `"IBM Plex Mono"` for raw code.

## SVG Asset Design

### Geological Strata Background (`_strata-bg-svg`)
- **Purpose**: Full-page atmosphere for content slides
- **Design**: Layered horizontal bands at bottom 30% of slide with varying opacity (0.03-0.15)
- **Elements**: 4 rectangular strata layers + 4 wavy boundary paths + 8 scattered mineral dots
- **Colors**: Amber, brown, chocolate, resin with very low opacity
- **Effect**: Subtle geological layering that does not compete with content

### Fossilized Fern (`_fossil-fern-svg`)
- **Purpose**: Decorative corner element for title/ending slides
- **Design**: Symmetric fern frond with central rachis and paired pinnae
- **Elements**: 1 central stem + 12 paired leaf paths at varying opacity (0.12-0.30)
- **Color**: `leaf-green` at low opacity for subtle organic texture
- **Scale**: 120x160 viewBox, rendered at 60-90pt height

### Amber Inclusion Frame (`_amber-frame-svg`)
- **Purpose**: Bookend element shared between title and ending slides
- **Design**: Triple-layered rounded rectangle border simulating amber chunk edges
- **Elements**: 3 border rectangles + 8 bubble circles + 4 corner resin brackets
- **Colors**: Amber gold at varying opacity (0.15-0.60)
- **Effect**: Creates impression of viewing slide content through amber

### Cross-Section Divider (`_cross-section-svg`)
- **Purpose**: Horizontal separator between content sections
- **Design**: 4 thin layered rectangles representing strata + 5 mineral grain dots
- **Dimensions**: 300x12 viewBox, rendered at 10pt height
- **Colors**: Amber to brown gradient across layers

### Resin Drip (`_resin-drip-svg`)
- **Purpose**: Corner decoration for content slide atmosphere
- **Design**: Vertical drip path with bulbous end (trapped droplet)
- **Elements**: 2 drip paths + 1 droplet shape + 4 small bubbles
- **Colors**: Amber gold with translucent highlights

### Amber Pulse (`_amber-pulse-svg`)
- **Purpose**: Inline decoration for section headers
- **Design**: ECG-style pulse line with amber/brown terminal nodes
- **Elements**: 1 pulse path + 4 endpoint/peak circles
- **Dimensions**: 120x16 viewBox, rendered at 12pt height

## Component Architecture

### Layout Rules

1. **Flexible card components end with `lazy-v(1fr)`** for use in eligible `cols(lazy-layout: true)` rows; tags, dividers, and the regular `sediment-grid` matrix do not
2. **Stack spacing (not fixed `v()`)** for headers, component regions, and metric internals
3. **Footer uses `grid(columns: (1fr, auto, 1fr))`** for proper alignment
4. **Adjacent blocks use `stack(spacing: 0pt)` with `clip: true`** where needed
5. **No `height: 100%` in grid cells** to avoid layout overflow
6. **Metrics use one centered stack** in marker -> value -> label order; the stat component uses a consistent 88pt height

### Component Naming Convention

All components derive from the geological/paleontological vocabulary:
- `stratum-card`: Named for geological strata (layers)
- `inclusion-box`: Named for amber inclusions (trapped specimens)
- `fossil-tag`: Named for fossil labels/identification tags
- `specimen-card`: Named for museum specimen display
- `cross-section-divider`: Named for geological cross-sections
- `amber-stat`: Named for amber's characteristic golden color
- `epoch-card`: Named for geological time periods
- `sediment-grid`: Named for sedimentary deposits
- `resin-box`: Named for tree resin (amber precursor)
- `discovery-note`: Named for field discovery annotations

### Component Visual Patterns

| Component | Border Style | Background | Accent Position |
|-----------|-------------|------------|-----------------|
| stratum-card | Left 3pt + thin rest | card-bg | Left border + layered dots |
| inclusion-box | Left 4pt | amber-light | Left border + pulse |
| fossil-tag | 1pt all sides | light tinted | Layered dot + text |
| specimen-card | Top 3pt + thin rest | card-bg | Top stripe |
| amber-stat | 1pt all sides | card-bg | Center marker above value and label |
| epoch-card | Left 3pt + thin rest | card-bg | Left border |
| sediment-grid | 1pt outer | card-bg per cell | Per-cell layout |
| resin-box | Left 3pt + thin rest | warm off-white | Left border + square dot |
| discovery-note | 1.5pt all sides | tinted to accent | Full border |

## Slide Architecture

### Content Slide Structure

```
+--------------------------------------------------+
| [Title]                                    [drip] |
| [cross-section-divider]                          |
|                                                  |
|    Content area with strata bg atmosphere        |
|    (full-page SVG + corner accents)              |
|                                                  |
+--------------------------------------------------+
| [footer] ........... [dot] ........... [page #]  |
+--------------------------------------------------+
```

### Title Slide Structure

```
+==================================================+
||  [fern]                                        ||
||                                                ||
||           [Title - 2.4em bold]                 ||
||           [cross-section-divider]              ||
||           [subtitle]                           ||
||           [author]                             ||
||           [institution]                        ||
||           [date]                               ||
||                                        [fern]  ||
+==================================================+
  ^ amber frame border (bookend)
  ^ strata background
```

### Section Slide Structure

```
+--------------------------------------------------+
|█                                          [drip] |
|█    [Section Number - 3.5em]                     |
|█    [amber-pulse]                                |
|█    [Section Title - 2em]                        |
|█                                                 |
+--------------------------------------------------+
  ^ 5pt amber bar                 ^ strata bg
```

### Focus Slide Structure

```
+--------------------------------------------------+
| [drip]                                    [drip] |
|                                                  |
|        [Emphasized text - amber-glow]            |
|        [cross-section-divider]                   |
|                                                  |
| [dot]                                     [dot]  |
+--------------------------------------------------+
  ^ dark strata background
```

## Design Principles

1. **Warmth over sterility**: Every element uses warm tones; no pure white or pure black
2. **Layered depth**: Multiple overlapping semi-transparent elements create geological depth
3. **Restraint in decoration**: SVGs are subtle (low opacity) and confined to edges/corners
4. **Academic but not boring**: The paleontological vocabulary adds personality without whimsy
5. **Consistent atmosphere**: Every content slide has the same strata background + corner accents
6. **Bookend symmetry**: Title and ending slides share the amber frame element for cohesion
7. **Natural hierarchy**: Font sizes and weights create clear information hierarchy
8. **Fossil record metaphor**: Information is preserved, layered, and revealed systematically

## Spacing System

| Context | Value | Rationale |
|---------|-------|-----------|
| Page margin (top) | 4em | Room for header |
| Page margin (bottom) | 2em | Room for footer |
| Page margin (x) | 2.2em | Content breathing room |
| Column gutter | 1-1.2em | Card separation |
| Card inset (x) | 1em | Internal padding |
| Card inset (y) | 0.8em | Internal padding |
| Title to divider | 8pt (stack spacing) | Tight connection |
| Component vertical gap | 0.4-0.6em | Between components |

## Accessibility Considerations

- All normal text maintains at least 4.5:1 contrast against its intended background
- Primary text (ink on bg) is approximately 12.7:1
- Bright amber, resin, and leaf tokens remain decorative; darker semantic counterparts are used for text
- SVG decorations are purely atmospheric and carry no semantic information
- Card borders provide non-color-dependent structure
- Focus slide uses bright amber-glow on dark background for maximum contrast
- Font sizes never drop below 0.65em (approximately 12pt) for readability
