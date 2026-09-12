# Silk Road Theme -- API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Avenir Next", "Arial", "Noto Sans SC"), size: 18pt)
#let pal = build-palette("lapis")

#show: silk-road-theme.with(
  aspect-ratio: "16-9",
  preset: "lapis",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()

= Section Title
== Slide Title
- Content here

#focus-slide[Key Statement]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Page aspect ratio |
| `align` | `horizon` | Default content alignment |
| `footer` | `none` | Footer content (string or function) |
| `preset` | `"lapis"` | Color preset: `lapis`, `emerald`, `desert` |

## Available Slide Types

| Function | Description | Key Parameters |
|----------|-------------|----------------|
| `title-slide()` | Cover slide with star header | Reads from `config-info` |
| `slide()` | Standard content slide | `title:`, `align:` |
| `dark-slide()` | Dark lapis background slide | `title:`, `ghost:`, `ghost-size:`, `header-left:`, `header-right:` |
| `new-section-slide()` | Auto-triggered on `= Heading` | Section number display |
| `focus-slide()` | Turquoise statement slide | Body content |
| `ending-slide()` | Closing slide with star cluster | Body content |

## Reusable Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `mosaic-card(title, body, accent:)` | Card with colored top border | Default accent: turquoise |
| `minaret-stat(label, value, description:)` | Tall stat with gold number | Left gold border |
| `arabesque-quote(body, cite:)` | Quote with gold bar | Optional attribution |
| `tile-tag(body, color:)` | Inline jewel-tone tag | Default: turquoise |
| `caravan-divider(color:)` | Geometric border strip | Centered, 80% width |
| `star-frame(path, height:, caption:)` | Image with star corners | Corner ornaments |
| `geometric-star(color:, size:)` | SVG 8-pointed star | Decorative placement |
| `border-strip(color:, width:, height:)` | Diamond pattern bar | Full-width default |
| `ornament-star(color:, size:)` | Small filled star | Inline separator |

## Color Presets

### Lapis (default)
- Ink: `#1B2B3A` | Paper: `#FDF8F0` | Accent: `#1E3A5F` / `#1B8A7A` / `#C8963E`

### Emerald
- Ink: `#1A2E1F` | Paper: `#FDFBF5` | Accent: `#1B5E3A` / `#2A8B6E` / `#B8862B`

### Desert
- Ink: `#2A1E13` | Paper: `#FEF5E7` | Accent: `#8B4513` / `#B87333` / `#DAA520`

## Palette Access

```typst
#let pal = build-palette("lapis")
// Access: pal.ink, pal.paper, pal.lapis, pal.turquoise, pal.gold, pal.terra
// Derived: pal.ink-light, pal.ink-faint, pal.ink-ghost, pal.ink-muted
// Also: pal.meta-color, pal.gold-text, pal.gold-light, pal.gold-faint
```
