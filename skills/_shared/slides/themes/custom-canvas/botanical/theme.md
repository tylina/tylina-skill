# Botanical Theme - API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 18pt)

#let pal = build-palette("forest")

#show: botanical-theme.with(
  aspect-ratio: "16-9",
  preset: "forest",
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

#title-slide()

= Section Title
== Slide Title
Content here.

#focus-slide[Key Statement]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio |
| `align` | alignment | `horizon` | Default content vertical alignment |
| `footer` | content/function | `none` | Footer content or `self =>` function |
| `preset` | string | `"forest"` | Color preset name |

## Color Presets

| Preset | Ink | Paper | Accent | Character |
|--------|-----|-------|--------|-----------|
| `forest` | Deep forest green #1B3A2D | Warm cream #FDF8F0 | Antique gold #8B6914 | Classic botanical |
| `autumn` | Burgundy #4A1C2B | Warm ivory #FDF5E6 | Dark goldenrod #B8860B | Autumn herbarium |
| `tropical` | Deep teal #1A4F4F | Honeydew #F0FFF0 | Peru copper #CD853F | Tropical conservatory |

## Slide Types

| Function | Description | Background |
|----------|-------------|------------|
| `slide(title:, align:)` | Light content slide with a subtle pressed-sprig atmosphere and corner marks | Paper |
| `dark-slide(title:, ghost:, ghost-size:, ghost-dx:, ghost-dy:, header-left:, header-right:)` | Dark forest green slide with ghost numeral/pressed-sprig decoration | Ink |
| `title-slide()` | Elegant cover with a responsive double border and botanical silhouettes | Paper |
| `new-section-slide` | Auto-triggered on `= Heading`. Ghost number + golden accent | Paper |
| `focus-slide[content]` | Statement slide with a golden corner frame and botanical silhouette | Ink |
| `ending-slide[content]` | Closing slide that bookends the cover frame and pressed sprigs | Paper |
| `hero-slide(background-image:, scrim:)[content]` | Full-bleed image with gradient scrim | Image |

## Reusable Components

| Component | Parameters | Description |
|-----------|-----------|-------------|
| `leaf-card(title, body)` | positional | Card with green top border, serif title |
| `specimen-box(label, title, body)` | positional | Herbarium-style specimen label card |
| `root-stat(label, value, description:)` | positional + named | KPI display with decorative accent |
| `vine-divider(total-width:)` | named | Decorative line separator with center diamond |
| `seed-tag(body)` | positional | Organic rounded pill tag |
| `herbarium-quote(body, cite:)` | positional + named | Italic quote with leaf ornament and border |
| `plate-frame(path, caption:, height:)` | positional + named | Double-border image frame for specimens |
| `gold-rule(width:, height:)` | named | Simple decorative gold horizontal rule |

## Palette Access

```typst
#let pal = build-palette("forest")
// Available keys: ink, paper, accent, accent-text, ink-light, ink-faint,
//   ink-ghost, ink-muted, accent-light, accent-faint, rule-color, meta-color
```

## Typography Constants

```typst
#let typo = (
  display: 40pt, h1: 28pt, h2: 22pt,
  body: 16pt, small: 12pt, tiny: 9pt, meta: 8pt,
)
```

## Font Constants

```typst
#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC")
```

## Design Notes

- Canvas-level theme: heavy use of `place()` for decorative elements
- Victorian botanical illustration aesthetic
- A multi-element pressed-sprig SVG carries the botanical identity across every slide type
- Text-bearing derived colors maintain readable contrast while gold remains the decorative accent
- Corner ornaments and responsive double frames support the botanical silhouettes
- Dark slides combine ghost numerals with restrained pressed-sprig watermarks
- Ornamental dividers use diamond symbols with extending lines
- Double-border framing for specimen/plate elements
