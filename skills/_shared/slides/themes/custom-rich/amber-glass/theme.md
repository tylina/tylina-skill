# Amber Glass Theme - API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: amber-glass-theme.with(
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

#set text(font: ("Arial", "Noto Sans SC", "Libertinus Serif"))

#title-slide()

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
| `palette.primary` | #D4900A | Warm amber -- accent borders, KPI borders, decorative elements |
| `palette.secondary` | #F5E6C8 | Pale honey -- card borders, soft fills |
| `palette.honey-bg` | #FFF5E0 | Honey-tinted background for title and ending slides |
| `palette.bg` | #FFFDF8 | Warm white -- content slide background |
| `palette.text` | #3D2E1A | Dark warm brown -- primary text |
| `palette.text-muted` | #746247 | Accessible muted brown/gold -- captions, metadata |
| `palette.accent` | #9A5A00 | Deep amber -- accessible emphasis text and focus background |
| `palette.success` | #3F6F2E | Botanical green -- positive trends and sustainability accents |
| `palette.surface` | #FFF8EC | Slightly tinted -- card background fill |

## Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual call | Honey-tinted bg, glass frame, centered title |
| `new-section-slide` | `= Heading` | Warm bg, left amber band, section title |
| `slide` | `== Heading` | Warm white bg, amber title underline |
| `focus-slide[...]` | Manual call | Deep amber bg, frosted glass frame, white text |
| `ending-slide[...]` | Manual call | Honey bg, glass frame, amber text |

## Reusable Components

### `honey-card(title, body, accent: palette.primary)`
Frosted glass card with amber top border and warm surface fill. Use for content blocks.

```typst
#honey-card([Card Title], [Card content here...])
#honey-card([Accent Card], [...], accent: palette.accent)
```

### `glass-panel(title, body, accent: palette.primary)`
Translucent panel with frosted border and left accent line. For highlighted content and callouts.

```typst
#glass-panel([Key Insight], [Important information...])
#glass-panel([Note], [...], accent: palette.accent)
```

### `warm-stat(label, value, trend: none)`
KPI display card with large amber number and optional trend indicator.

```typst
#warm-stat([Revenue], [$2.8B], trend: [+24% YoY])
```

### `amber-divider()`
Decorative amber line separator with circular accents.

```typst
#amber-divider()
```

### `amber-tag(content, color: palette.primary)`
Warm pill tag with honey border. For labels and categories.

```typst
#amber-tag([Premium])
#amber-tag([Limited Edition], color: palette.accent)
```

### `amber-quote(quote, author: none)`
Quote block with amber left accent and italic text.

```typst
#amber-quote(
  [The essence of luxury is patience.],
  author: [Master Distiller],
)
```

## Layout Patterns

### Two-column with cards
```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  honey-card([Left Title], [Left content...]),
  honey-card([Right Title], [Right content...], accent: palette.accent),
)
```

### KPI row
```typst
#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  warm-stat([Metric 1], [$1.2M], trend: [+15%]),
  warm-stat([Metric 2], [94%], trend: [+7pts]),
  warm-stat([Metric 3], [1,200], trend: [+22%]),
  warm-stat([Metric 4], [$28B]),
)
```

### Full-slide two-column
```typst
== Slide Title
#cols[Left column content][Right column content]
```

### Glass panels side by side
```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  glass-panel([Left Panel], [Content...], accent: palette.primary),
  glass-panel([Right Panel], [Content...], accent: palette.accent),
)
```

## Design Notes

- **Signature look**: Warm amber on pale honey/white -- luminous and refractive
- **Decorative elements**: Amber dots, frosted glass borders, circular accents, diamond separators
- **Best for**: Luxury brands, lifestyle products, premium services, wine/spirits, hospitality
- **Typography**: Noto Serif SC with Libertinus Serif fallback for display elements; the consumer owns the base body font, and the demo uses Arial with Noto Sans SC/Libertinus fallbacks
- **Glass-morphism**: Cards use semi-transparent fills and subtle strokes to evoke frosted glass
