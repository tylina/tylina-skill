# Meridian Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `meridian-theme`
**Style**: Cartographic, geometric, minimalist / light theme
**Primary color**: `#1B4B5A` (Deep Teal)
**Best For**: Research presentations, data analysis, academic seminars, scientific briefings
**Style Objective**: Cartographic precision meets modern minimalism
**Complexity Level**: Rich

## Description

A clean geometric presentation theme inspired by cartographic meridian lines and compass-rose motifs. Features a warm ivory background with deep teal/navy accent lines evoking longitude/latitude grid lines, and subtle SVG compass rose ornaments. The aesthetic combines vintage map warmth with modern scientific precision. Golden amber accents provide hierarchy and visual interest.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Helvetica Neue", "Noto Sans SC"), size: 18pt)
#show raw: set text(font: "DejaVu Sans Mono")

#show: meridian-theme.with(
  aspect-ratio: "16-9",
  footer: [Global Climate Observatory -- Annual Research Briefing],
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
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Warm ivory background with meridian grid overlay, compass rose (top-right), latitude markers (left), double-line borders (top/bottom), centered teal title, golden accent line, subtitle, author, institution, and date.

### `#slide(title: auto, align: auto)`
Content slide with warm ivory background, teal title with double meridian line (teal + gold), golden compass dot in footer, slide counter.

### `#new-section-slide[...]`
Deep teal background with white grid overlay, golden section number, white section title, golden accent line, compass rose (bottom-right).

### `#focus-slide[...]`
Deep teal background with white grid, rectangular frame, compass rose ornament, centered white bold text, golden accent underline.

### `#ending-slide[...]`
Warm ivory background with meridian grid, double-line borders, compass rose above text, teal title, golden accent line, three-dot ornament.

## Reusable Components

### `#coordinate-card(title, body, accent: palette.primary)`
Card with colored top border, white background, golden separator line. For structured content.
```typst
#coordinate-card([Study Overview], [Research examines global patterns...], accent: palette.primary)
```

### `#bearing-stat(label, value, color: palette.accent)`
Centered value-over-label display with an opaque tint and colored bottom border. Its value and label share one precise vertical stack and equalize safely when it is the only component in a bounded lazy column.
```typst
#bearing-stat([Northern Continental], [+1.54 C], color: palette.accent)
```

### `#azimuth-box(title, body, accent: palette.secondary)`
Left-bordered callout box with tinted background. For notes and emphasis.
```typst
#azimuth-box([Data Sources], [- NASA GISS\n- HadCRUT5], accent: palette.primary)
```

### `#meridian-divider(color: palette.primary, width: 80%)`
Horizontal separator with centered compass dot.
```typst
#meridian-divider(color: palette.primary)
```

### `#compass-tag(content, color: palette.primary)`
Capsule-shaped categorization label.
```typst
#compass-tag([Spatial Statistics], color: palette.primary)
```

### `#waypoint-list(body)`
Scoped native Typst enum with golden amber circular markers in a bordered card.
```typst
#waypoint-list[
  + Step one
  + Step two
  + Step three
]
```

### `#cartograph-highlight(body)`
Full-width golden highlight box for key findings.
```typst
#cartograph-highlight[*Key Finding:* The mean anomaly was +1.21 C.]
```

### `#projection-quote(quote, author: none)`
Quote block with teal left accent bar.
```typst
#projection-quote([The signal is geographically structured.], author: [Hansen, 2023])
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Warm Ivory** | `#F8F6F1` | `palette.bg` | Primary background |
| **Deep Ink** | `#1E2A32` | `palette.ink` | Main body text |
| **Deep Teal** | `#1B4B5A` | `palette.primary` | Titles, primary accents, borders |
| **Golden Amber** | `#C4963C` | `palette.accent` | Highlights, section numbers, warm accents |
| **Amber Text** | `#8A5E08` | `palette.accent-text` | Text-safe amber emphasis on light surfaces |
| **Steel Blue** | `#4A7896` | `palette.secondary` | Secondary accents, quotes, callouts |
| **Ink Muted** | `#1E2A32` (30% transparent) | `palette.ink-muted` | Footer and secondary text |
| **Border Light** | `#1B4B5A` (75% transparent) | `palette.border-light` | Card borders |
| **Card BG** | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| **Highlight BG** | `#F5EBD5` | `palette.highlight-bg` | Opaque highlight box fill |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent-text,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example
- `theme_design_spec.md` -- Full visual design specification
- `theme.md` -- API summary (this file)

## Demo

See `demo.typ` for a compilable example featuring climate research content.
