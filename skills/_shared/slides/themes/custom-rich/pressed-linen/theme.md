# Pressed Linen Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libre Baskerville", "Noto Serif CJK SC"), size: 20pt)

#show: pressed-linen-theme.with(
  aspect-ratio: "16-9",
  footer: [Studio Name],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Entry Point

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Page aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `horizon` | Default vertical alignment for content slides |
| `footer` | `none` | Footer text (left side) |

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `palette.cream` | `#FDFBF7` | Main background |
| `palette.sage` | `#7B9E6B` | Primary accent (sage green) |
| `palette.rose` | `#C4908F` | Secondary accent (dusty rose) |
| `palette.brown` | `#8B6F5C` | Tertiary accent (warm brown) |
| `palette.text-dark` | `#3D3229` | Heading text |
| `palette.text-body` | `#5A4A3F` | Body text |
| `palette.text-muted` | `#9B8B7D` | Captions, muted text |
| `palette.card` | `#FFFFFF` | Card backgrounds |
| `palette.border` | `#E8E0D4` | Borders |
| `palette.linen` | `#F5F0E8` | Linen-toned fills |

## Slide Types

### `#title-slide()`
Full botanical frame with eucalyptus branch, fern frond, and pressed flowers. Reads from `config-info()`.

### `= Section Heading` (auto-triggers `new-section-slide`)
Sage-tinted left panel with fern decoration, section number, and pressed flower accent.

### `#outline-slide(title: [Contents])`
Clean table of contents with botanical corner decoration.

### `== Slide Title` (auto-triggers `slide`)
Standard content slide with linen texture background, sage header accent, and persistent botanical atmosphere.

### `#focus-slide[content]`
Sage green background with pressed flower corners and elegant cream frame border.

### `#ending-slide[content]`
Bookend with title slide — botanical frame, eucalyptus branch, pressed flowers, and botanical divider.

## Reusable Components

### `concept-card(title, body, accent: palette.sage)`
Soft card with colored top border. Use for ideas, principles, categories.

### `insight-box(title, body, accent: palette.sage)`
Left-bordered callout with light fill. Use for key insights, takeaways.

### `stat-card(value, label, accent: palette.sage)`
Centered KPI card with decorative dot cluster. Use for statistics, metrics.

### `quote-card(quote-text, author: none, accent: palette.brown)`
Elegant quotation block with large quote mark and rose left border.

### `feature-card(title, body, accent: palette.rose)`
Feature highlight with colored dot prefix. Use for features, capabilities.

### `timeline-entry(step, title, body, accent: palette.sage)`
Process step with numbered circle and vertical connector.

### `comparison-table(headers, rows)`
Clean data table with alternating linen/cream row fills.

### `callout-box(title, body, accent: palette.brown)`
Important note with diamond icon and bottom border accent.

### `linen-tag(content, color: palette.sage)`
Small rounded tag/pill for categorization.

### `petal-divider(width: 60%)`
Decorative botanical wavy separator line.

## SVG Decorative Elements

| Function | Description |
|----------|-------------|
| `eucalyptus-branch(color, height)` | Pressed eucalyptus branch silhouette |
| `fern-frond(color, height)` | Delicate pressed fern leaf |
| `pressed-flower(color, size)` | Dried flower with petals |
| `botanical-frame(color)` | Full-page vine/leaf corner frame |
| `linen-texture(color)` | Full-page crosshatch grain pattern |
| `botanical-divider(color, width)` | Wavy organic separator line |

## Layout Patterns

```typst
// Two-column with cards
#cols(columns: (1fr, 1fr))[
  #concept-card([Title], [Content])
][
  #concept-card([Title], [Content], accent: palette.rose)
]

// Three-column stats
#cols(columns: (1fr, 1fr, 1fr))[
  #stat-card([42], [Label])
][
  #stat-card([99%], [Label], accent: palette.rose)
][
  #stat-card([3x], [Label], accent: palette.brown)
]

// Timeline sequence
#timeline-entry([01], [Step Title], [Description])
#timeline-entry([02], [Step Title], [Description])

// Tags
#linen-tag[Tag 1] #linen-tag[Tag 2] #linen-tag[Tag 3, color: palette.rose]
```

## Design Notes

- **Aesthetic**: Japanese washi paper + dried flower pressing
- **Mood**: Light, airy, sophisticated, natural
- **Best for**: Botanical, wellness, design studios, creative portfolios, lifestyle brands
- **Persistent atmosphere**: Every content slide has linen texture + small botanical motifs
- **Bookending**: Title and ending slides share botanical frame and eucalyptus branch
