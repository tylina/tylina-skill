# Watercolor Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `watercolor-theme`
**Style**: Creative, organic, painterly, warm / light theme
**Primary color**: `#1E6091` (Ocean Blue)
**Best For**: Creative presentations, art direction, design portfolios, storytelling, branding talks
**Style Objective**: Creative
**Complexity Level**: Rich

## Description

A soft, organic painting aesthetic featuring SVG blob shapes created with cubic bezier curves, paint splatter accents, wavy bleed-line dividers, warm cream paper background, and translucent watercolor wash fills. Three color variants (blue, rose, gold) provide emotional range while layered translucent shapes create depth and visual richness. Perfect for creative industries, visual storytelling, and design presentations that need an artistic, hand-crafted feeling.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: watercolor-theme.with(
  aspect-ratio: "16-9",
  footer: [The Art of Visual Storytelling],
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Layered decorative blob shapes (blue, rose, gold) as background, centered title, wavy divider, author in accent blue, institution and date in muted ink, paint splatter accents.

### `#slide(title: auto)`
Cream paper background with bold title, wavy bleed-line underline, corner blob decoration top-right, footer with paint splatter and slide counter.

### `#new-section-slide[...]`
Deep blue wash background with organic blob texture overlay, gold and rose splatter accents, large white section title, white decorative elements.

### `#focus-slide[...]`
Dark blue watercolor background with layered blob overlays, paint splatters, and centered white bold text.

### `#ending-slide[...]`
Cream paper with multiple overlapping blobs and scattered splatters, centered text between wavy bleed-line decorations.

## Reusable Components

### `#wash-card(title, body, variant: "blue")`
Card with organic blob shape visible behind content. Variants: "blue", "rose", "gold".
```typst
#wash-card([Warm Palettes], [Warm colors evoke energy and passion.], variant: "gold")
```

### `#palette-stat(label, value, variant: "blue")`
Large colored number with paint-splatter corner accent.
```typst
#palette-stat([Emotional Recall], [+67%], variant: "blue")
```

### `#brush-quote(quote-text, author: none)`
Quote with brushstroke SVG accent mark and blue wash background.
```typst
#brush-quote([Design is how it works.], author: [Steve Jobs])
```

### `#bleed-divider()`
Wavy irregular SVG line divider mimicking watercolor bleeding.
```typst
#bleed-divider()
```

### `#swatch-grid(items)`
Grid of colored squares like a painter's palette.
```typst
#swatch-grid(([Scale], [Color], [Contrast], [Proximity]))
```

### `#pigment-tag(label, variant: "blue")`
Small rounded organic tag. Variants: "blue", "rose", "gold".
```typst
#pigment-tag([Proportion], variant: "blue")
```

### `#wash-box(body, variant: "blue")`
Content area with soft translucent watercolor fill. Variants: "blue", "rose", "gold".
```typst
#wash-box([Color is not decoration -- it is communication.])
```

### `#paint-splatter(variant: "blue", width: 50pt)`
Decorative SVG paint splatter cluster. Variants: "blue", "rose", "gold".
```typst
#paint-splatter(variant: "gold", width: 50pt)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Warm Cream** | `#FDF8F0` | `palette.bg` | Warm paper background |
| **Deep Sienna** | `#2C1810` | `palette.ink` | Primary text, rich dark ink |
| **Ocean Blue** | `#1E6091` | `palette.accent` | Primary accent, cards, quotes |
| **Crimson Rose** | `#9B2226` | `palette.secondary` | Secondary accent, emphasis |
| **Warm Gold** | `#CA8A04` | `palette.gold` | Tertiary accent, warmth |
| **Accessible Gold** | `#A16207` | `palette.gold-text` | Gold foreground text and borders |
| **Wash Blue** | `#1E6091` (80% transparent) | `palette.wash-blue` | Translucent blue fill |
| **Wash Rose** | `#9B2226` (85% transparent) | `palette.wash-rose` | Translucent rose fill |
| **Wash Gold** | `#CA8A04` (80% transparent) | `palette.wash-gold` | Translucent gold fill |
| **Ink Light** | `#2C1810` (38% transparent) | `palette.ink-light` | Footer, muted text |
| **Ink Muted** | `#2C1810` (30% transparent) | `palette.ink-muted` | Secondary text |
| **White** | `#FFFFFF` | `palette.white` | White text on dark slides |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
