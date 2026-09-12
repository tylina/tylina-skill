# Lavender Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `lavender-theme`
**Style**: Soft, elegant, calming purple/lilac tones
**Primary color**: `#7E57C2` (medium purple)
**Best For**: Wellness, education, psychology, design topics
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A refined, elegant theme built around a purple and lilac color palette. Designed for wellness, education, psychology, and design presentations, Lavender creates a calming visual atmosphere with soft decorative elements, layered tonal fields, and thoughtful typography. Its restrained component set includes decorative circles on title and ending slides, accent-bordered cards, numbered step lists, and rounded soft boxes.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lavender-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
    contact: [email@example.com],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content or function receiving `self` |

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#7E57C2` | `palette.primary` | Headers, badges, default card accents |
| **Secondary** | `#AB47BC` | `palette.secondary` | Orchid purple, alternate accent |
| **Accent** | `#CE93D8` | `palette.accent` | Light purple decorative elements, divider lines |
| **Background** | `#F3E5F5` | `palette.bg` | Very light lavender page fill |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White card backgrounds |
| **Deep** | `#4527A0` | `palette.deep` | Deep purple for titles, focus/ending slides |
| **Text Dark** | `#311B92` | `palette.text-dark` | Dark indigo body text |
| **Text Light** | `#7E57C2` | `palette.text-light` | Purple secondary text, footer |
| **Soft** | `#E1BEE7` | `palette.soft` | Soft lilac decorative fills, soft-box backgrounds |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  secondary: palette.secondary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Available Slide Types

### `#title-slide()`
Elegant cover page with decorative circles in corners, deep purple title, divider line, and author/institution/date info on a light lavender background.

### `#slide(title: auto)`
Standard content slide with an open white header showing a muted section label, deep-purple title, and short lilac underline. Includes a minimal three-part footer with optional custom content and a page counter.

Block code is rendered in a framed white panel at 0.72em to keep practical snippets within the slide area.

### `#new-section-slide[...]`
Section divider with centered heading in deep purple, flanked by decorative accent lines on a lavender background. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with deep purple background and large white text. Use for key messages or dramatic pauses.

### `#ending-slide[...]`
Closing slide with deep purple background, decorative translucent circles, and bold white text.

## Reusable Components

### `#petal-card(title, body, accent: none)`
Information card with a soft lavender background and colored left border. Accent defaults to primary purple.

```typst
#petal-card([Key Insight])[
  Important information goes here.
]

#petal-card([Custom Accent], accent: palette.secondary)[
  Card with orchid purple accent.
]
```

### Numbered Steps (via `set enum`)

Styled with purple circle number badges. Use standard `+` syntax:

```typst
+ First step description
+ Second step description
+ Third step description
+ Fourth step description
```

### Multi-column layouts

Use Touying's standard `cols` primitive. The theme does not add a second generic column system.

```typst
#cols(columns: (2fr, 1fr))[Left content][Right content]
```

### `#soft-box(body)`
Simple rounded box with soft lavender fill and no border. Ideal for quotes, highlights, or gentle visual grouping.

```typst
#soft-box[
  A calming highlight or note.
]
```

## Palette Access

The exported `palette` dictionary contains all theme colors. Use semantic keys such as `palette.primary`, `palette.secondary`, and `palette.soft` instead of undocumented prefixed constants or inline `rgb(...)` values.

## Key API Patterns

This theme follows the correct Touying 0.7.4 API patterns:

```typst
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 4em, bottom: 2em, x: 2em),
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example
- `theme.md` — This documentation

## Demo

See `demo.typ` for a full compilable example showcasing all slide types and components.
