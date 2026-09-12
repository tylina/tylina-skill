# Terrace Garden

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `terrace-garden-theme`
**Style**: Warm Mediterranean academic, limestone textures, olive botanical elements
**Primary color**: `#7B6B4E` (warm olive/stone)
**Best For**: Architecture, art history, archaeology, cultural studies, classical humanities
**Style Objective**: Academic Suitable
**Complexity Level**: Rich

## Description

A warm academic theme inspired by Mediterranean terrace gardens and Tuscan villa architecture. Sun-warmed limestone textures, terracotta accents, olive branch botanicals, and classical arch/column motifs create an atmosphere of scholarly warmth. The persistent stone texture and olive branch corners evoke the feeling of afternoon light on ancient stone, making it ideal for presentations in architecture, archaeology, art history, and cultural studies.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show raw: set text(font: ("IBM Plex Mono", "Menlo", "Courier"))
#set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"), size: 20pt)

#show: terrace-garden-theme.with(
  aspect-ratio: "16-9",
  footer: [Terrace Garden],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
  config-common(breakable: false),
)

#title-slide()

= First Section

== First Slide

Content goes here.

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

Fonts are configured in your main file, not in `template.typ`. The tested demo stack is:

```typst
#show raw: set text(font: ("IBM Plex Mono", "Menlo", "Courier"))
#set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"), size: 20pt)
```

Replace these families with another installed serif and monospace stack when needed.

## Available Slide Types

### `#title-slide()`
Grand cover slide with classical arch-and-column SVG decoration (bookending element), olive branches at both top corners, stone texture background. Centered title with terracotta accent line. Uses `self.info` for title, subtitle, author, date, institution.

### `#slide(title: auto)`
Standard content slide with medium-weight title header, terracotta accent underline (55pt), and persistent `_bg-atmosphere` (stone texture + olive branch corners). Footer shows custom content, terracotta diamond marker, and page counter.

### `= Heading` (new-section-slide)
Auto-triggered section divider. Large faint section number (light weight, stone color) with medium-weight title and terracotta accent line. Olive branch accent at bottom-right. Stone texture background.

### `#outline-slide(title: [Contents])`
Table of contents slide. Clean layout with section headings, stone texture, olive branch corner decoration, and terracotta accent line beneath the title.

### `#focus-slide[...]`
Warm contemplative slide with stone-colored background, olive branch framing at corners, centered medium-weight text, and terracotta diamond beneath.

### `#ending-slide[...]`
Bookends with title slide -- same arch-and-column decoration and olive branches at top corners. Centered farewell text with terracotta accent line.

## Reusable Components

### `#stone-card[title][body]`
Primary content card with arch-top accent stripe (header in accent-tinted fill, body in white). Uses `stack(spacing: 0pt)` for adjacent colored blocks and remains content-sized.

```typst
#stone-card([Card Title], [
  Body content with generous spacing.
], accent: palette.primary)
```

### `#terrace-box[title][body]`
Warm content-sized box with terracotta left accent line (3pt), white fill, and a rounded right edge.

```typst
#terrace-box([Box Title], [
  Content with warm terracotta accent.
])
```

### `#olive-quote[body][attribution]`
Quotation block with olive branch SVG ornament above. Italic body text with attribution line below.

```typst
#olive-quote(
  [The quote text goes here.],
  [Author Name, Source],
)
```

### `#garden-tag[label]`
Small inline tag/badge with diamond icon and pill shape. Olive green by default.

```typst
#garden-tag([Archaeology]) #h(4pt) #garden-tag([Roman], color: palette.secondary)
```

### `#mosaic-divider(color: palette.secondary, width: 85%)`
SVG Mediterranean tile pattern divider with alternating diamonds and dots. Centered.

```typst
#mosaic-divider()
#mosaic-divider(color: palette.primary, width: 60%)
```

### `#arch-card[title][body]`
Card with architectural arch-shaped header (centered title, larger top-radius). Uses `stack(spacing: 0pt)`.

```typst
#arch-card([Section Title], [
  Content beneath the arch header.
])
```

### `#timeline-point[year][body]`
Timeline marker with terracotta stone dot, vertical connecting line, and year label. Stack multiple for timeline sequences.

```typst
#timeline-point([1976], [Excavation began at the site])
#v(6pt)
#timeline-point([1980], [Major finds published])
```

### `#stat-card[value][label]`
Metric display with a terracotta planter SVG icon, bold value, and small label in one centered vertical stack.

```typst
#stat-card([42], [Sites Excavated])
```

### `#comparison-table(headers, ..rows)`
Sandstone-styled academic table with stone header row and alternating fill. Headers as array, rows as arrays.

```typst
#comparison-table(
  ([Column A], [Column B], [Column C]),
  ([Row 1A], [Row 1B], [Row 1C]),
  ([Row 2A], [Row 2B], [Row 2C]),
)
```

### `#column-box[title][body]`
Content-sized box with a classical pillar-like rule on the left side.

```typst
#column-box([Topic], [
  Content with pillar side decoration.
])
```

### `#inscription[body]`
Stone inscription style with centered smallcaps text, letter-spacing, sandstone fill, and border. Evokes carved stone tablets.

```typst
#inscription[Senatus Populusque Romanus]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#7B6B4E` | `palette.primary` | Warm olive/stone, headers |
| **Secondary** | `#C17040` | `palette.secondary` | Terracotta accent |
| **Tertiary** | `#6B8E5A` | `palette.tertiary` | Olive green (botanical) |
| **Background** | `#FDF8F3` | `palette.bg` | Warm limestone white |
| **Card** | `#FFFFFF` | `palette.card` | Card white |
| **Text Dark** | `#3D3226` | `palette.text-dark` | Rich earth brown |
| **Text Body** | `#5C4E3E` | `palette.text-body` | Warm dark brown |
| **Text Light** | `#8B7B68` | `palette.text-light` | Faded stone caption |
| **Border** | `#E5D9C8` | `palette.border` | Sandstone border |
| **Stone** | `#F0E8DC` | `palette.stone` | Light sandstone fill |
| **Sand** | `#E8DFD2` | `palette.sand` | Warm sand |
| **Gold** | `#B8964A` | `palette.gold` | Aged gold accent |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.text-dark,
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
- **Dependencies**: None (no external packages beyond touying)

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example
- `theme_design_spec.md` -- Design specification
- `theme.md` -- This API reference

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with academic architecture/archaeology content.
