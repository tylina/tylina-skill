# Cherry Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `cherry-theme`
**Style**: Japanese cherry blossom (sakura) inspired — soft pinks, warm reds, elegant and poetic
**Primary color**: `#C62828` (deep cherry red)
**Best For**: Cultural presentations, art, literature, aesthetic topics
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A beautiful custom theme inspired by Japanese cherry blossoms (sakura). Features soft pinks, warm reds, and white tones that create an elegant and poetic atmosphere. Perfect for cultural presentations, art, literature, or any aesthetic topic. Includes decorative sakura-inspired elements like petal dividers, scattered blossom circles, and a haiku display box.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: cherry-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("New Computer Modern", "Hiragino Mincho ProN", "Libertinus Serif"))

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
Beautiful cover slide with the title in deep cherry red, decorative cherry blossom circles scattered around using `place`, subtitle in warm brown italic, author, date, and institution. A decorative pink line separates the title from metadata.

### `#slide(title: auto)`
Standard content slide with an open header: a cherry-red title and short blush underline. Footer displays custom content on the left and the current slide number on the right.

### `#new-section-slide[...]`
Section divider with red accent lines above and below the section name, plus scattered sakura petal decorations. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with deep cherry red background and white text.

### `#ending-slide[...]`
Closing slide with soft petal-pink background and cherry red bold text.

## Reusable Components

### `#sakura-card(title, body, accent: none)`
Definite-width card with a pink left border and petal-pink background. Defaults to the cherry-secondary pink accent. Its terminal `lazy-v(1fr)` is inert in ordinary flow; use `cols(lazy-layout: true)` only for a row where every column contains exactly one direct `sakura-card`.

```typst
#sakura-card[Key Insight][
  Important information displayed in a sakura-themed card.
]

// With custom accent color:
#sakura-card(accent: palette.gold)[Golden Note][
  A card with a gold accent border.
]
```

### `#haiku-box(line1, line2, line3)`
A definite-width three-line text display box with elegant formatting. Lines are centered in one `stack` with decorative dividers between them. Perfect for haiku poetry or any three-part statement.

```typst
#haiku-box(
  [An old silent pond],
  [A frog jumps into the pond],
  [Splash! Silence again.],
)
```

### `#accent-tag(label)`
Inline rounded tag/badge in cherry red with white text. Great for highlighting categories or keywords.

```typst
#accent-tag[Art] #accent-tag[Culture] #accent-tag[Poetry]
```

### `#petal-divider()`
Decorative horizontal divider with small circle "petals" in varying pink shades. Adds a sakura-inspired separator between content sections.

```typst
#petal-divider()
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#C62828` | `palette.primary` | Deep cherry red, headers, focus slides |
| **Secondary** | `#E91E63` | `palette.secondary` | Pink, card borders, decorative elements |
| **Accent** | `#F8BBD0` | `palette.accent` | Light pink / sakura, decorative circles |
| **Background** | `#FFF0F0` | `palette.bg` | Very light blush page background |
| **Card BG** | `#FFFFFF` | `palette.card-bg` | White card backgrounds |
| **Petal** | `#FCE4EC` | `palette.petal` | Petal pink, ending slide bg, card fill |
| **Text Dark** | `#3E2723` | `palette.text-dark` | Dark brown primary text |
| **Text Light** | `#806158` | `palette.text-light` | Contrast-safe warm brown secondary text |
| **Gold** | `#9C5600` | `palette.gold` | Text-safe optional gold accent |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Key API Patterns

This theme uses the correct Touying 0.7.4 API patterns:

```typst
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 4em, bottom: 2em, x: 2em),
  fill: palette.bg,
)
```

All slide functions use `touying-slide-wrapper(self => { ... })` and `touying-slide(self: self, ...)`. Use Touying's native `cols` for semantic columns; the theme does not export a generic column wrapper. The demo also shows the theme's framed raw-code treatment.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)
- `theme.md` — This documentation

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
