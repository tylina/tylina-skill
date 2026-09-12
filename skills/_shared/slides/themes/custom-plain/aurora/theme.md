# Aurora Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `aurora-theme`
**Style**: Northern Lights inspired, dark background with vibrant gradient accents
**Primary color**: `#00E676` (aurora green)
**Best For**: Tech talks, creative showcases, conference presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A stunning dark theme inspired by the Aurora Borealis (Northern Lights). Features vibrant green-to-purple gradient accents on a deep dark background. The gradient effects create a dramatic, modern visual style perfect for tech presentations, creative showcases, and conference talks.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: aurora-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
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
| `align` | alignment | `horizon` | Default vertical alignment for ordinary content slides |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Dramatic cover with gradient-colored title text (green → purple → cyan), decorative gradient line, subtitle, author, and date.

### `#slide(title: auto)`
Dark content slide with section + title header and gradient accent line beneath. Green page counter in footer.

### `#new-section-slide[...]`
Section divider with green accent lines above and below (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Ultra-dark background with glowing green text for emphasis.

### `#ending-slide[...]`
Dark slide with gradient line decorations above and below the closing message.

## Reusable Components

### `#aurora-card(title, body, accent: none)`
Card with an accent-to-purple gradient left border on a dark background. The optional `accent` also colors the title.

```typst
#aurora-card[Key Insight][Important information here.]
```

### `#feature-grid(items)`
2-column grid of feature cards with gradient top borders. Each item is a dict with `title` and `desc` keys.

```typst
#feature-grid((
  (title: "Feature 1", desc: "Description"),
  (title: "Feature 2", desc: "Description"),
))
```

### `#gradient-line(width: 100%)`
Decorative gradient line (green → purple → cyan).

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Green** | `#00E676` | `palette.green` | Primary aurora accent, headings, focus text |
| **Purple** | `#7C4DFF` | `palette.purple` | Gradient midpoint, secondary accent |
| **Cyan** | `#00BCD4` | `palette.cyan` | Gradient endpoint, tertiary accent |
| **Background** | `#0a0e17` | `palette.bg` | Deep dark page background |
| **Card BG** | `#141b2d` | `palette.card-bg` | Card and component fill |
| **Border** | `#1e2a3a` | `palette.border` | Card border strokes |
| **Text Primary** | `#E8EAF6` | `palette.text-primary` | Main text color on dark bg |
| **Text Secondary** | `#78909C` | `palette.text-secondary` | Subtle / secondary text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.green,
  secondary: palette.purple,
  tertiary: palette.cyan,
  neutral-lightest: palette.text-primary,
  neutral-darkest: palette.bg,
)
```

## Usage Guidance

Aurora is a Plain-tier theme whose identity comes from typography, dark color, and restrained gradient rules. Use ordinary headings and `#cols[...] [...]` for layout. Apply `aurora-card` and `feature-grid` selectively when a compact grouping communicates the content more clearly; keep custom styling in `template.typ`.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)

## Demo

See `demo.typ` for a compilable example.
