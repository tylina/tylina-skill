# Tensor Field Theme

A mathematical field visualization theme for Touying 0.7.4 presentations. Features flowing vector field lines, gradient indicators, tensor notation, and coordinate axis decorations on a warm cream/ivory background.

## Usage

```typst
#import "template.typ": *

#show raw: set text(font: ("IBM Plex Mono", "Menlo", "Courier"))

#show: tensor-field-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Your Title],
    subtitle: [Your Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)

#set text(font: ("IBM Plex Sans", "Arial", "Helvetica"))
```

Typography is configured by the presentation rather than the theme entry point. The stack above is the tested demo default and may be replaced by another installed sans-serif family.

## Slide Functions

| Function | Description |
|----------|-------------|
| `title-slide()` | Opening slide with field frame border and bookend corners |
| `slide(title: auto)` | Standard content slide with flow field atmosphere |
| `new-section-slide` | Section divider with indigo left accent bar |
| `focus-slide[content]` | Deep indigo background with centered bold text |
| `ending-slide[content]` | Closing slide with bookend corners |

## Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `field-card` | `(title, body, accent: palette.primary)` | Card with flowing vector lines along left edge |
| `manifold-box` | `(title, body, accent: palette.accent)` | Insight box with curved contour border |
| `magnitude-stat` | `(label, value, color: palette.primary)` | Metric with gradient-colored magnitude indicator |
| `theorem-box` | `(kind, title, body, accent: palette.primary)` | Formal theorem/definition box with double-line border |
| `vector-tag` | `(content, color: palette.primary)` | Small tag with arrow decoration |
| `flow-divider` | `(color: palette.border, width: 80%)` | Flowing curve separator |
| `basis-card` | `(title, body, accent: palette.primary)` | Card with coordinate axis overlay |
| `eigenvalue-box` | `(title, body, accent: palette.secondary)` | Highlighted result box with lambda bracket |
| `topology-quote` | `(body, attribution: none)` | Quote with manifold-surface decoration |

## SVG Helpers

| Helper | Description |
|--------|-------------|
| `flow-field-bg()` | Full-page vector field with coherent streamlines |
| `field-frame()` | Border with coordinate axes in corners |
| `gradient-divider(width)` | Horizontal line with arrow and hash marks |
| `manifold-accent(width)` | Small curved surface mesh for decoration |
| `bookend-mark(size)` | Tensor notation styled corner mark |

## Color Palette

Access colors via the `palette` dictionary:

- `palette.bg` - Warm cream background (#FFFEF7)
- `palette.primary` - Deep indigo (#312E81)
- `palette.secondary` - Amber (#B45309)
- `palette.accent` - Blue (#3B82F6)
- `palette.text` - Dark stone (#1C1917)
- `palette.text-muted` - Muted stone (#57534E)
- `palette.card-bg` - White (#FFFFFF)
- `palette.border` - Light stone (#D6D3D1)

## Entry Point

The theme entry function is `tensor-field-theme`.
