# Art Deco Theme - API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Georgia", "Noto Serif SC"))

#show: art-deco-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [My Presentation],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime.today(),
  ),
)

#title-slide()
#outline-slide()

= Section Title
== Slide Title
Content here...

#focus-slide[Key Message]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Page aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `horizon` | Default vertical alignment for content slides |
| `footer` | `none` | Footer text displayed on content slides |

## Color Palette

| Key | Hex | Usage |
|-----|-----|-------|
| `palette.gold` | #C9A84C | Bright decoration and large titles on dark surfaces |
| `palette.navy` | #0A1628 | Dark backgrounds, header text |
| `palette.emerald` | #2D4A3E | Secondary accent, variety |
| `palette.cream` | #FFFDF7 | Content slide background |
| `palette.white` | #FFFFFF | Card backgrounds |
| `palette.text-dark` | #1A1A2E | Primary text on light |
| `palette.text-body` | #3D3D56 | Body text |
| `palette.text-light` | #756A42 | Captions and metadata on cream/white surfaces |
| `palette.gold-text` | #755A12 | Text-safe gold on cream and white surfaces |
| `palette.border` | #D4CFC2 | Card borders |

## Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual call | Navy bg, gold frame, centered title |
| `new-section-slide` | `= Heading` | Navy bg, gold sunburst, section title |
| `slide` | `== Heading` | Cream bg, navy title, gold underline |
| `outline-slide()` | Manual call | TOC with gold diamond markers |
| `focus-slide[...]` | Manual call | Navy bg, gold border frame, centered text |
| `ending-slide[...]` | Manual call | Navy bg, chevron patterns, gold text |

## Reusable Components

### `gilded-card(title, body, accent: palette.gold)`
Card with gold top border and corner triangle detail. White fill with warm border.

```typst
#gilded-card([Card Title], [Card content here...])
#gilded-card([Green Card], [...], accent: palette.emerald)
```

### `deco-box(title, body, accent: palette.gold)`
Callout box with geometric left border and diamond marker before title.

```typst
#deco-box([Key Insight], [Important information...])
#deco-box([Note], [...], accent: palette.emerald)
```

### `trophy-stat(label, value, trend: none)`
Centered KPI card with a diamond icon, large value, label, and optional trend. Internals use one centered `stack`, so short/long values and Latin/CJK labels remain aligned.

```typst
#trophy-stat([Revenue], [$4.2B], trend: [+18% YoY])
```

### `chevron-divider()`
Decorative gold separator with three geometric chevrons.

```typst
#chevron-divider()
```

### `gatsby-tag(content, color: palette.gold)`
Elegant capsule/pill tag with gold border.

```typst
#gatsby-tag([Luxury], color: palette.gold)
#gatsby-tag([Premium], color: palette.emerald)
```

### `marquee-quote(quote, author: none)`
Quote block with large art deco quotation mark and gold left accent.

```typst
#marquee-quote(
  [The future of luxury is sustainable opulence.],
  author: [Victoria Ashworth],
)
```

## Layout Patterns

### Two-column with cards
```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  gilded-card([Left Title], [Left content...]),
  gilded-card([Right Title], [Right content...], accent: palette.emerald),
)
```

Use `lazy-layout: true` only for this single-flexible-card-per-column pattern. `gilded-card` ends in `lazy-v(1fr)` so sibling cards can equalize.

### KPI row
```typst
#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
  trophy-stat([Metric 1], [$1.2M], trend: [+15%]),
  trophy-stat([Metric 2], [94%], trend: [+7pts]),
  trophy-stat([Metric 3], [1,200], trend: [+22%]),
  trophy-stat([Metric 4], [$28B]),
)
```

### Multi-component two-column
```typst
== Slide Title
#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  Left column content
][
  Right column content
]
```

## Design Notes

- **Signature look**: Bright gold on deep navy for dramatic slides; deep gold provides text-safe emphasis on cream content slides
- **Decorative elements**: Gold diamonds, chevrons, corner brackets, sunburst rays
- **Best for**: Luxury brands, fashion, awards, galas, finance, premium launches
- **Typography**: The verified demo stack uses Georgia for Latin and Noto Serif SC for CJK; projects may choose another installed serif stack
