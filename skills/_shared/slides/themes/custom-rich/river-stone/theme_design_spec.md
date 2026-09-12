# River Stone Theme — Visual Design Specification

## Theme Identity

| Attribute | Value |
|-----------|-------|
| **Name** | river-stone |
| **Style Objective** | Grounded Calm / Natural Authority |
| **Complexity Level** | Rich |
| **Inspiration** | Smooth river stones, zen rock gardens, natural mineral textures |
| **Mood** | Stable, grounded, quietly confident, organic |
| **Best For** | Executive presentations, strategy consulting, sustainable business, architecture firms, real estate |

## Color Palette

| Color | Hex | RGB | Role | Usage |
|-------|-----|-----|------|-------|
| Stone BG | `#F8F6F3` | 248, 246, 243 | Main background | Slide backgrounds, base layer |
| Slate | `#5B6770` | 91, 103, 112 | Primary accent | Headers, primary cards, main accent |
| Moss | `#7A8B6F` | 122, 139, 111 | Secondary accent | Nature accents, secondary cards |
| Clay | `#B8856C` | 184, 133, 108 | Tertiary accent | Warm highlights, terracotta touches |
| Dark Text | `#2C3338` | 44, 51, 56 | Heading text | Titles, headings, emphasis |
| Body Text | `#4A5259` | 74, 82, 89 | Body copy | Paragraph text, descriptions |
| Pebble | `#E8E4DF` | 232, 228, 223 | Card fill | Card backgrounds, elevated surfaces |
| Sand | `#EDE9E3` | 237, 233, 227 | Subtle fills | Secondary card fills, quote backgrounds |
| Border | `#D4CFC8` | 212, 207, 200 | Borders | Card strokes, separators |
| Water | `#8FAAB4` | 143, 170, 180 | Highlight accent | Water ripples, flow indicators |

### Color Relationships

- **Background hierarchy**: Stone BG > Sand > Pebble > White (increasing elevation)
- **Accent gradient**: Slate (primary) -> Moss (secondary) -> Clay (warm) -> Water (cool)
- **Text contrast**: Dark Text on Stone BG = 8.2:1 ratio (WCAG AAA)
- **Card legibility**: Body Text on Pebble fill = 5.8:1 ratio (WCAG AA)

## Typography

| Element | Weight | Size | Color |
|---------|--------|------|-------|
| Slide Title | Semibold | 1.3em | Dark Text |
| Title Slide Heading | Bold | 2.3em | Dark Text |
| Section Number | Bold | 3.5em | Slate (70% transparent) |
| Section Title | Semibold | 1.8em | Dark Text |
| Card Title | Semibold | 0.95em | Accent color |
| Body Text | Regular | 0.82em | Body Text |
| Stats Value | Bold | 2em | Accent color |
| Stats Label | Regular | 0.78em | Body Text |
| Tags | Medium | 0.75em | Accent (darkened 10%) |
| Footer | Regular | 0.65em | Body Text (30% transparent) |

## SVG Decorations

### 1. Pebble Cluster (Bookending)
- **Elements**: 7-10 smooth overlapping ellipses of varying sizes
- **Sizes**: rx 14-55pt, ry 10-38pt
- **Rotation**: varied (-12 to +25 degrees) for organic feel
- **Opacity**: 0.06-0.12 (very subtle, atmospheric)
- **Usage**: Title slide (center-left), Ending slide (right)

### 2. Water Ripple
- **Elements**: 6 concentric ellipses + center point + distortion arcs
- **Spacing**: Evenly decreasing radii (85, 70, 55, 40, 26, 14)
- **Stroke width**: Increasing toward center (0.8 to 1.3pt)
- **Opacity**: Increasing toward center (0.06 to 0.20)
- **Usage**: Title slide corner, focus slide corners, ripple-box component

### 3. Stone Texture (Persistent Atmosphere)
- **Elements**: 30+ mineral specks + 3 subtle grain lines
- **Distribution**: Even scatter across 840x474 viewport
- **Speck sizes**: 0.6-1.2pt radius
- **Opacity**: 0.03-0.04 (barely visible, adds texture depth)
- **Usage**: Every content slide background

### 4. Zen Raked-Sand Lines (Bookending)
- **Elements**: 8 curved parallel paths (5 bottom, 3 top)
- **Curvature**: Gentle Q-curves mimicking flowing water around stones
- **Stroke width**: 0.5-1.2pt
- **Opacity**: 0.03-0.08 (ethereal, atmospheric)
- **Usage**: Title slide, ending slide (bookending pair)

### 5. Corner Pebble Motif
- **Elements**: 3 ellipses + shadow + highlight (5 total)
- **Scale**: 80x60 viewport, rendered at 60x45pt
- **Opacity**: 0.04-0.06
- **Usage**: Bottom-right and top-left of every content slide

### 6. Moss Accent
- **Elements**: 8 circles of varying sizes clustered organically
- **Sizes**: 3.5-8pt radius
- **Opacity**: 0.15-0.35
- **Usage**: Section slides, outline decoration, moss-quote component

### 7. Large Pebble Silhouette
- **Elements**: 2 nested ellipses + 4 surface texture curves + mineral vein + highlight
- **Scale**: 200x300 viewport, rendered at panel height
- **Usage**: New-section-slide left panel

### 8. Sediment Divider
- **Elements**: 3 wavy horizontal paths + 5 mineral dots
- **Width**: Configurable (default 80%)
- **Height**: 8pt rendered
- **Usage**: Content separators between sections

### 9. Cairn Icon
- **Elements**: 4 stacked ellipses + shadow + 2 highlights
- **Scale**: 40x60 viewport, rendered at 28-40pt height
- **Usage**: mineral-stat component, cairn-card component

### 10. Zen Rake Small
- **Elements**: 3 gently curved parallel paths
- **Scale**: 300x20 viewport
- **Usage**: zen-card bottom decoration, section slide accent

## Slide Layouts

### Title Slide
```
+------------------------------------------------------+
|                              [Water Ripple]          |
|  [Pebble                                            |
|   Cluster]         TITLE TEXT                       |
|                    ___gradient line___               |
|                    Subtitle                          |
|                    Author                            |
|  [Moss]            Institution                      |
|  ~~~~~~~~ zen lines ~~~~~~~~ zen lines ~~~~~~~~~    |
+------------------------------------------------------+
```

### Content Slide
```
+------------------------------------------------------+
| [corner pebble]                                      |
|  Title Text                                         |
|  o────gradient────o                                 |
|                                                      |
|  [Content area with stone texture atmosphere]       |
|                                                      |
|                                                      |
|                           [corner pebble]           |
|  Footer Left    o o o    Page X / Y                 |
+------------------------------------------------------+
```

### New Section Slide
```
+------------------------------------------------------+
|                |                                      |
|  [Large       |  01                                  |
|   Pebble      |                                      |
|   Silhouette] |  Section Title                       |
|               |  ___slate bar___                     |
|               |  [moss accent]                       |
|               |         ~~~~zen rake lines~~~~       |
+------------------------------------------------------+
```

### Focus Slide
```
+------------------------------------------------------+
|  [Ripple]                                            |
|                                                      |
|          Centered quote or statement                 |
|          in cream text on slate bg                   |
|                                                      |
|                                   [Ripple]          |
+------------------------------------------------------+
```

### Ending Slide
```
+------------------------------------------------------+
|  ~~~~~~~~ zen lines ~~~~~~~~                         |
|                                                      |
|         THANK YOU              [Pebble              |
|         ___gradient___          Cluster]            |
|         Grounded in clarity                         |
|                                                      |
|  [Water Ripple]                                     |
|  ~~~~~~~~ zen lines ~~~~~~~~                        |
+------------------------------------------------------+
```

## Component Specifications

### stone-card
- **Border radius**: 12pt (organic feel)
- **Fill**: Pebble (`#E8E4DF`)
- **Stroke**: 0.5pt Border
- **Top accent**: 4pt solid bar with top-radius matching card
- **Inset**: 14pt all sides
- **Clip**: true (for accent overflow)

### ripple-box
- **Fill**: Sand (`#EDE9E3`)
- **Left border**: 3pt accent
- **Right radius**: 8pt
- **Ripple decoration**: 50pt water-ripple at 50% opacity in top-right

### mineral-stat
- **Layout**: Centered vertical stack
- **Icon**: Cairn (28pt height)
- **Value**: 2em bold in accent color
- **Label**: 0.78em body text

### moss-quote
- **Fill**: Sand
- **Left bar**: 3.5pt moss accent
- **Text style**: Italic body text
- **Organic accent**: Moss blob shapes at 40% opacity

### zen-card
- **Fill**: Pebble
- **Stroke**: 0.5pt border
- **Bottom decoration**: Full-width zen-rake-small at 30% transparency

### pebble-tag
- **Shape**: Pill (99pt radius)
- **Fill**: Accent at 85% transparency
- **Stroke**: 0.75pt accent at 40% transparency
- **Text**: 0.75em medium weight

### stream-entry
- **Step circle**: 14pt radius, accent stroke, transparent fill
- **Connector**: 2pt width gradient (accent to transparent)
- **Layout**: Grid with auto + 1fr columns

### bedrock-table
- **Header row**: Slate at 85% transparency fill
- **Alternating rows**: Pebble / Sand
- **Stroke**: 0.5pt border
- **Inset**: x: 1em, y: 0.3em

### cairn-card
- **Layout**: Grid with cairn icon left (36pt) + content right
- **Fill**: Pebble
- **Radius**: 10pt

### sediment-divider
- **SVG elements**: 3 wavy lines + 5 mineral dots
- **Height**: 8pt rendered
- **Default width**: 80%

## Design Principles

1. **Organic over geometric**: Rounded corners, ellipses, curves — no sharp angles
2. **Layered depth**: Multiple opacity levels create atmospheric depth
3. **Warm neutrals**: Earth tones prevent clinical coldness while maintaining professionalism
4. **Subtle motion**: Water ripples and zen lines suggest calm flow without animation
5. **Natural hierarchy**: Stone size/weight creates visual importance ordering
6. **Bookending symmetry**: Title and ending slides share motifs (zen lines, pebble clusters)
7. **Persistent atmosphere**: Every content slide breathes with stone texture and corner pebbles
8. **Readable surfaces**: Opaque card fills ensure text legibility over atmospheric backgrounds
