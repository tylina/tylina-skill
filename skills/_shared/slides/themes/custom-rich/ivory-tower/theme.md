# Ivory Tower Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `ivory-tower-theme`
**Style**: Elegant cream and gold premium aesthetic — executive luxury
**Primary color**: `#1B2A4A` (Deep Navy)
**Accent color**: `#B8964A` (Refined Gold)
**Best For**: Executive presentations, investor decks, premium brand pitches, annual reports
**Style Objective**: Executive luxury
**Complexity Level**: Rich

## Description

An elegant cream and gold premium theme designed for executive presentations, investor decks, and premium brand pitches. Features ivory background with gold accents, refined SVG corner ornaments, filigree dividers, and monogram frames. The design conveys understated confidence and institutional gravitas.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: ivory-tower-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Annual Strategic Review],
    subtitle: [Fiscal Year 2024],
    author: [Managing Partner],
    date: datetime.today(),
    institution: [Firm Name],
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
Premium ivory cover with gold border frame, monogram frame decoration, filigree divider, corner ornaments, and centered content hierarchy.

### `#slide(title: auto, align: auto)`
Standard content slide with navy title, gold accent underline, faint corner ornaments on ivory background, and footer with gold diamond center ornament.

### `#new-section-slide[...]`
Section divider with gold left accent bar, large faint section number in background, "SECTION" label, navy heading, and corner ornaments. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Deep navy background with gold accent lines, corner ornaments, centered white text, and filigree divider below.

### `#ending-slide[...]`
Ivory closing slide with gold border frame, monogram frame, large navy text, and filigree divider.

## Reusable Components

### `#gilt-card(title, body, accent: palette.accent-gold)`
Premium card with gold top border and diamond icon prefix. For content blocks and key information.

```typst
#gilt-card([Revenue Growth])[
  Year-over-year revenue increased by *24.3%* driven by expansion into Asian markets.
]
```

### `#capital-stat(label, value, color: palette.accent-gold)`
Centered monogram → value → label metric stack. For KPIs and metrics.

```typst
#capital-stat([Total Revenue], [\$4.2B])
```

### `#charter-box(title, body, accent: palette.accent-gold)`
Formal content box with left gold bar accent on ivory background. For policy statements and formal content.

```typst
#charter-box([Investment Thesis])[
  Focus on mid-market buyouts in resilient sectors with strong cash flow generation.
]
```

### `#filigree-divider-component(color: palette.accent-gold, width: 60%)`
Inline decorative separator using the filigree SVG ornament.

### `#signet-tag(content, color: palette.accent-gold)`
Small premium tag/badge with gold border. For labels, categories, and status indicators.

```typst
#signet-tag([ESG Compliant]) #signet-tag([AAA Rated])
```

### `#treasury-highlight(title, body)`
Emphasized block with gold background tint and star icon. For key findings and critical metrics.

```typst
#treasury-highlight([Record Quarter])[
  Q4 revenues exceeded guidance by *12%*, marking the firm's strongest quarter.
]
```

Use native `+` lists for ordered priorities; the theme intentionally does not wrap them in a custom list API.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Ivory** | `#FFFEF8` | `palette.ivory` | Warm off-white background |
| **Primary** | `#1B2A4A` | `palette.primary` | Deep navy — titles, authority |
| **Accent Gold** | `#B8964A` | `palette.accent-gold` | Gold — ornaments, accents |
| **Secondary** | `#7A7064` | `palette.secondary` | Warm gray — subtitles |
| **Card White** | `#FFFFFF` | `palette.card-white` | Pure white — card fills |
| **Border** | `#E8E3D8` | `palette.border` | Subtle warm border |
| **Text Body** | `#2C2C2C` | `palette.text-body` | Body copy |
| **Text Muted** | `#9A9488` | `palette.text-muted` | Captions, footnotes |

## Layout Tips

- Use `#grid(columns: N, gutter: ...)` for regular KPI matrices.
- Use ordinary `#cols[...] [...]` for narrative columns; do not opt into `lazy-layout` for multi-component columns.
- Components use natural-height flow, while `capital-stat` keeps its icon → value → label rhythm in one centered stack.

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent-gold,
  neutral-lightest: palette.card-white,
  neutral-darkest: palette.primary,
)
```

## SVG Assets

- **Corner Ornament**: Floral/scroll corner piece for decorative framing
- **Filigree Divider**: Horizontal separator with diamond accent and flanking dots
- **Monogram Frame**: Decorative oval frame for title/ending slides

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Full executive presentation demo (compilable)
- `theme_design_spec.md` — Detailed design specification
- `theme.md` — This documentation

## Demo

See `demo.typ` for a compilable example with executive/business content.
