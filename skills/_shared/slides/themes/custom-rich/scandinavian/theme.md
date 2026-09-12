# Scandinavian

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `scandinavian-theme`
**Style**: Nordic minimalism - clean whites, soft grays, muted sage green and warm wood accents
**Primary color**: `#3D5A5B` (muted teal/sage)
**Best For**: Design studios, wellness/mindfulness, sustainable products, Scandinavian companies, architecture, interior design presentations
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A Scandinavian-inspired theme built on the principle of "less is more." Generous whitespace, subtle sage and wood-tone accents, and clean geometric forms create an atmosphere of calm functional beauty. Typography-forward design with clear hierarchy, inspired by Nordic interior design where every element earns its place.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Avenir", "Arial", "PingFang SC"), size: 20pt)

#show: scandinavian-theme.with(
  aspect-ratio: "16-9",
  footer: [Company Name],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
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
| `align` | alignment | `horizon` | Default vertical alignment for slide content |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("Avenir", "Arial", "PingFang SC"), size: 20pt)
```

Recommended font stacks:
- Primary: Avenir, IBM Plex Sans, Arial, or another verified clean sans-serif
- CJK fallback: PingFang SC or another locally installed CJK sans-serif

## Available Slide Types

### `#title-slide()`
Warm white background with centered title block. Generous whitespace, thin sage line separator, subtle geometric circle ornaments in corner. Title in dark charcoal, author in sage primary color.

### `#slide(title: auto, align: auto)`
Clean content slide with no top bar. Bold title in charcoal with thin sage underline (50pt, 1.5pt weight), plus a restrained pair of translucent linen/stone circles below the upper-right header edge. Footer with three-column grid: footer text | sage dot | page counter. Content area stays warm white and typography-forward.

### `= Section Title` (auto-triggers `new-section-slide`)
Left area with subtle linen fill, large sage section number, section title on right side. Thin vertical sage accent line. Clean, structural, and calm.

### `#outline-slide(title: [Contents])`
Clean table of contents slide with title and sage underline. Subtle corner decoration.

### `#focus-slide[...]`
Full sage/teal (#3D5A5B) background with white text. Large centered statement. Subtle white circle decorations.

### `#ending-slide[...]`
Warm white background with centered text in sage primary. Thin decorative line and geometric circle ornament (three circles) below.

## Reusable Components

### `#hygge-card(title, body, accent: palette.primary)`
Soft rounded card (8pt radius) with subtle border and colored top accent line (2pt). Clean title + body layout. Includes `lazy-v(1fr)` for height equalization in columns.

```typst
#hygge-card([Card Title], [
  Card body content here.
])
```

### `#nature-box(title, body, accent: palette.primary)`
Callout box with left sage border (3pt) and light tinted fill. Used for key messages, principles, or callouts.

```typst
#nature-box([Important Note], [
  Key message content here.
])
```

### `#stone-stat(value, label, accent: palette.primary)`
KPI/metric display with large bold value in accent color and small label below. Centered layout with subtle border.

```typst
#stone-stat([94%], [Recyclable Materials])
```

### `#linen-divider(width: 100%)`
Soft decorative separator line (0.75pt in border color). Provides visual breathing space between sections.

```typst
#linen-divider()
```

### `#birch-tag(content, color: palette.primary)`
Minimal rounded pill/tag with very light fill and subtle border. Used for labels, categories, tags.

```typst
#birch-tag[Sustainability] #birch-tag[Design]
```

### `#fjord-quote(quote, author: none)`
Elegant blockquote with thin left sage line (2pt). Italic quote text, optional author attribution below.

```typst
#fjord-quote(
  [Design is not just what it looks like. Design is how it works.],
  author: [Steve Jobs],
)
```

### `#warm-box(title, body)`
Convenience alias for `nature-box` with warm wood/terracotta accent color. Used for secondary callouts.

```typst
#warm-box([Craft Note], [
  Secondary callout content.
])
```

### `#scandi-table(align: center + horizon, headers, rows)`
Clean data table with linen-colored headers, alternating row fills (white/warm white), subtle borders.

```typst
#scandi-table(
  ([Column A], [Column B], [Column C]),
  (
    ([Row 1A], [Row 1B], [Row 1C]),
    ([Row 2A], [Row 2B], [Row 2C]),
  ),
)
```

## Color Scheme

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#3D5A5B` | `palette.primary` | Headers, accent lines, focus backgrounds |
| **Secondary** | `#C4956A` | `palette.secondary` | Warm wood accents, secondary highlights |
| **Secondary Text** | `#9B633B` | `palette.secondary-text` | Text-safe warm wood titles and KPI values |
| **Off-White** | `#E8E2D9` | `palette.off-white` | Subtle fills, section backgrounds |
| **Stone** | `#B8C4C4` | `palette.stone` | Cool decorative fills |
| **Stone Text** | `#5D6E70` | `palette.stone-text` | Text-safe cool-stone titles and labels |
| **Background** | `#FAFAF8` | `palette.bg` | Page background |
| **Card** | `#FFFFFF` | `palette.card` | Content cards |
| **Text Dark** | `#2C3639` | `palette.text-dark` | Headings |
| **Text Body** | `#4A5859` | `palette.text-body` | Body text |
| **Text Light** | `#667577` | `palette.text-light` | Text-safe captions and small labels |
| **Border** | `#E0DDD7` | `palette.border` | Card borders |

Decorative `secondary` and `stone` accents are mapped to their text-safe semantic counterparts inside components; callers can keep using the decorative tokens for borders and fills without sacrificing label contrast.

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,        // #3D5A5B - sage/teal accent
  neutral-lightest: white,         // Light text on dark backgrounds
  neutral-darkest: palette.text-dark, // #2C3639 - dark text
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with content about sustainable product design.
