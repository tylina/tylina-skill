# Laurel Crown — Theme API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: laurel-crown-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [University],
  ),
)

#title-slide()

= Section Title

== Slide Title

Content here.

#focus-slide[Key Message]

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio |
| `footer` | `none` | Footer content |

## Slide Types

| Function | Trigger | Purpose |
|----------|---------|---------|
| `title-slide()` | Manual | Opening slide with laurel wreath frame |
| `new-section-slide` | `= Heading` | Section divider |
| `slide` | `== Heading` | Content slide |
| `focus-slide[...]` | Manual | Key message emphasis |
| `ending-slide[...]` | Manual | Closing slide with wreath frame |

## Components

| Component | Usage | Description |
|-----------|-------|-------------|
| `chapter-block(title, body)` | Section opener | Full-width header bar |
| `laurel-card(title, body)` | Key content | Gold-bordered card with leaf corners |
| `contribution-item(body)` | Lists | Gold bullet item |
| `vine-divider()` | Separator | SVG vine horizontal divider |
| `honors-tag(content)` | Labels | Inline pill badge |
| `finding-quote(quote, author:)` | Citations | Vine-bordered blockquote |
| `milestone-stat(label, value)` | Metrics | Large number with gold underline |

## Color Palette

Access via `palette.xxx`:
- `bg` — Warm ivory (#FEFDF5)
- `ink` — Deep burgundy (#5B1A2A)
- `accent` — Scholarly green (#2E5944)
- `gold` — Gold (#B8860B)
- `muted` — Warm gray (#8B7D6B)
