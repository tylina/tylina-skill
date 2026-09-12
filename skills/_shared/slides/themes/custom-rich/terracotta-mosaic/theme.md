# Terracotta Mosaic

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `terracotta-mosaic-theme`
**Style**: Warm terracotta, geometric mosaic patterns, Mediterranean sun
**Primary color**: `#C75B12` (Burnt Terracotta Orange)
**Secondary color**: `#1B4B6B` (Deep Mediterranean Blue)
**Best For**: Architecture, travel, cultural studies, history presentations
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A warm, inviting theme inspired by Mediterranean terracotta tiles, Moorish geometric mosaics, and the Alhambra palace. Features persistent zellige star-pattern atmosphere on every content slide, a signature horseshoe arch frame on title/ending slides, and geometric tile-border SVG decorations. The earthy palette of burnt orange and warm cream is punctuated by deep Mediterranean blue accents.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"), size: 18pt)

#show: terracotta-mosaic-theme.with(
  aspect-ratio: "16-9",
  footer: [My Presentation],
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

#focus-slide[Key Takeaway]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for ordinary slide content |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

Font families are configured by the deck in `main.typ`, not by the reusable theme. The demo uses an installed serif stack that suits the architectural tone:

```typst
#set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"), size: 18pt)
```

The theme owns hierarchy, size, and color only; raw/code content inherits the deck's font policy.

## Available Slide Types

### `#title-slide()`
Full-page cover with Moorish arch frame (horseshoe arch SVG), enhanced zellige mosaic pattern, and centered title content. Reads from `config-info()`.

### `#slide(title: auto, align: auto, ..args)`
Standard content slide with warm parchment background, persistent zellige star-pattern atmosphere, geometric tile-border header accent, and diamond-marker footer.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Features left terracotta accent bar, large faded section number, section title, and tile border divider.

### `#focus-slide[...]`
Deep Mediterranean blue background with subtle white zellige pattern. Centered white bold text with gold tile border accent below.

### `#ending-slide[...]`
Bookends with title slide: warm cream background with enhanced zellige pattern and arch frame. Centered farewell text with tile border and mosaic divider decorations.

## Reusable Components

### `#tile-card(title, body, accent: palette.primary)`
Primary content card with geometric tile border on top edge and subtle shadow elevation. It is intrinsically content-sized and works in either a regular `grid` or a one-card-per-column `cols` row.

```typst
#tile-card([Card Title], [
  Card body content here with bullet points or text.
])
```

### `#courtyard-stat(label, value, color: palette.primary)`
Centered statistic display with a strict arch icon → value → label stack. Best in regular 2-3 column grids for key metrics.

```typst
#courtyard-stat([Annual Visitors], [2.7M], color: palette.primary)
```

### `#arabesque-quote(quote, author: none)`
Quote block with left terracotta border and decorative diamond ornament. For memorable quotes and key statements.

```typst
#arabesque-quote(
  [Architecture should speak of its time and place.],
  author: [Frank Gehry],
)
```

### `#zellige-box(title, body, accent: palette.secondary)`
Information card with 8-pointed star SVG ornament next to title and colored top border. It is intrinsically content-sized.

```typst
#zellige-box([Topic Name], [
  Descriptive content here.
], accent: palette.secondary)
```

### `#mosaic-tag(content, color: palette.primary)`
Small inline pill/badge for categorization labels.

```typst
#mosaic-tag([Sustainable]) #h(0.3em) #mosaic-tag([Heritage], color: palette.secondary)
```

### `#timeline-entry(year, title, description, color: palette.primary)`
Timeline-style entry with diamond bullet marker and year. Stack multiple entries vertically for historical timelines.

```typst
#timeline-entry([1370], [Alhambra Completed], [
  The Nasrid palace reaches its final form under Muhammad V.
])
```

### `#arch-highlight(title, body)`
Featured content with small arch icon next to title, indented body text. No box border -- typography and spacing only.

```typst
#arch-highlight([Key Feature], [
  Description of the highlighted feature or concept.
])
```

### `#sunbaked-card(title, body)`
Warm gradient card (sand-to-white) evoking sun-dried clay. It is intrinsically content-sized.

```typst
#sunbaked-card([Warm Topic], [
  Content that benefits from a warm visual frame.
])
```

### `#mosaic-divider(color: palette.primary, width: 60%)`
Centered geometric tile border pattern used as a section divider.

```typst
#mosaic-divider(color: palette.primary, width: 50%)
```

### `#tile-border(color: palette.primary, width: 200pt)`
Inline geometric diamond-chain border strip. Used internally in headers but available for custom layouts.

### `#arch-frame(color: palette.primary, width: 280pt)`
Moorish horseshoe arch frame SVG. Used on title/ending slides but available for custom compositions.

## Color Scheme

### Palette Dictionary (Rich)

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#C75B12` | `palette.primary` | Headers, accent bars, main branding |
| **Secondary** | `#1B4B6B` | `palette.secondary` | Contrast accent, alternate cards |
| **Dark** | `#2A1810` | `palette.dark` | Deepest text, dark backgrounds |
| **Accent** | `#D4A03C` | `palette.accent` | Highlights, gold decorations |
| **Background** | `#FDF8F3` | `palette.bg` | Page background |
| **Card** | `#FFFFFF` | `palette.card` | Content cards |
| **Text Dark** | `#2A1810` | `palette.text-dark` | Headings, primary text |
| **Text Body** | `#4A3728` | `palette.text-body` | Body text |
| **Text Light** | `#8B7355` | `palette.text-light` | Captions, secondary text |
| **Border** | `#E8D5C4` | `palette.border` | Card borders, dividers |
| **Tile Warm** | `#E8A065` | `palette.tile-warm` | Lighter terracotta accent |
| **Tile Blue** | `#2D6A8F` | `palette.tile-blue` | Blue ceramic variant |
| **Sand** | `#F5EDE4` | `palette.sand` | Subtle warm background |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,         // #C75B12 -- terracotta orange
  neutral-lightest: palette.bg,     // #FDF8F3 -- warm cream
  neutral-darkest: palette.text-dark, // #2A1810 -- dark umber
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
- **Dependencies**: `@preview/shadowed:0.3.0` (card shadows)

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with Mediterranean architecture content.
