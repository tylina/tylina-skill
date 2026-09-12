# Rosewood Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `rosewood-theme`
**Style**: Warm, earthy, sophisticated — inspired by rosewood furniture
**Primary color**: `#5D4037` (rich brown)
**Best For**: Architecture, interior design, history, premium brands
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A warm, elegant presentation theme inspired by the rich tones of rosewood furniture. Features deep browns, warm reds, and cream tones for a classic, sophisticated look. Ideal for architecture, interior design, history, premium brands, and any presentation that benefits from a timeless, refined aesthetic.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: rosewood-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for ordinary content slides |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Elegant cover slide with dark brown background, cream-colored title text, thin decorative red line, and subtle wood-grain pattern created with semi-transparent horizontal lines. Shows title, subtitle, author, date, and institution.

### `#slide(title: auto)`
Standard content slide with brown header bar showing section and slide title, cream background, and footer with institution name and page counter.

### `#new-section-slide[...]`
Section divider with warm-red left accent bar and brown section title on cream background. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with deep brown background and cream text.

### `#ending-slide[...]`
Closing slide with dark brown background, decorative red lines, and centered bold cream text framed by ornamental lines.

## Reusable Components

### `#wood-card(title, body, accent: none)`
Card with warm brown left border and cream background. Accepts optional `accent` color parameter.

```typst
#wood-card[Key Insight][
  Important information here.
]

#wood-card(accent: palette.warm-red)[Warning][
  Highlighted with red accent.
]
```

### `#chapter-heading(number, title)`
Large chapter/section number in warm red with title beside it, separated by a thin accent line.

```typst
#chapter-heading(1, [Foundations])
```

### Standard `#cols` layout
Use Touying's standard `cols` helper for multi-column composition; Rosewood does not add a redundant wrapper.

```typst
#cols(columns: (2fr, 1fr), gutter: 1.5em)[
  Left content
][
  Right content
]
```

### `#ornament-divider()`
Decorative divider with centered diamond ornament (small rotated square in warm red) flanked by thin accent lines.

```typst
#ornament-divider()
```

### `#quote-block(body, author: none)`
Styled quote block with thick warm-red left border, italic text on cream background, and optional author attribution.

```typst
#quote-block(author: [Frank Lloyd Wright])[
  Every great architect is — necessarily — a great poet.
]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#5D4037` | `palette.primary` | Brown headers, titles, section headings |
| **Secondary** | `#795548` | `palette.secondary` | Medium brown alternate accent |
| **Accent** | `#A1887F` | `palette.accent` | Light brown/taupe for ornament lines and subtle borders |
| **Light Accent** | `#D7CCC8` | `palette.accent-light` | Muted text on dark title/ending backgrounds |
| **Warm Red** | `#BF360C` | `palette.warm-red` | Deep red-orange emphasis, decorative lines, section bar |
| **Background** | `#EFEBE9` | `palette.bg` | Very light brown/cream slide background |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White card background |
| **Deep** | `#3E2723` | `palette.deep` | Dark brown for title/ending slide backgrounds |
| **Text Dark** | `#3E2723` | `palette.text-dark` | Dark brown body text |
| **Text Light** | `#795548` | `palette.text-light` | Accessible warm brown secondary text on light backgrounds |
| **Cream** | `#FFF8E1` | `palette.cream` | Warm cream text on dark backgrounds |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  secondary: palette.secondary,
  neutral-lightest: palette.cream,
  neutral-darkest: palette.text-dark,
)
```

## Key API Patterns

This theme uses the correct Touying 0.7.4 API patterns:

```typst
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 4em, bottom: 2em, x: 2em),
  fill: palette.bg,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)
- `theme.md` — This documentation

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
