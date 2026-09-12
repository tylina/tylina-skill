# Nordic Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `nordic-theme`
**Style**: Scandinavian-inspired — muted cool tones, clean lines, airy spacing
**Primary color**: `#37474F` (blue-gray dark)
**Best For**: Academic talks, clean design, functional presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A custom Touying theme inspired by Scandinavian design principles. Think IKEA catalog meets academic presentation: functional, beautiful, understated. Features muted blue-gray tones with a teal-green accent, generous whitespace, clean typography, and soft card components. Perfect for technical talks, design presentations, and academic lectures that value clarity and elegance.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: nordic-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
    contact: [email@example.com],
  ),
)
#set text(font: ("Avenir Next", "Avenir", "Arial"), size: 20pt)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides; may be overridden per slide |
| `footer` | content/function | `none` | Footer content or function |

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#37474F` | `palette.primary` | Headers, focus slide background, title text |
| **Secondary** | `#546E7A` | `palette.secondary` | Subtitle text, ending slide background |
| **Accent** | `#80CBC4` | `palette.accent` | Teal accent lines and card top bars |
| **Accent Text** | `#2F7772` | `palette.accent-text` | Text-safe teal for contacts, list markers, and code rules |
| **Background** | `#ECEFF1` | `palette.bg` | Slide background fill |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Card body fill |
| **Warm** | `#BCAAA4` | `palette.warm` | Separator lines, warm contrast |
| **Text Dark** | `#263238` | `palette.text-dark` | Primary body text color |
| **Text Light** | `#546E7A` | `palette.text-light` | Accessible metadata, footer text, page counter |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  secondary: palette.secondary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Available Slide Types

### `#title-slide()`
Left-aligned cover slide with generous whitespace. Semibold dark blue-gray title, thin teal accent line, and accessible muted metadata. Airy and modern.

### `#slide(title: auto, align: auto)`
Standard content slide with a clean header (title + thin accent underline) and minimalist footer with page counter. Uses `auto` to pick up `== Heading` titles.

### `#new-section-slide[...]`
Minimal section divider. Shows a tracked "SECTION" label, medium-weight section heading, and short accent line in a measured stack. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with dark blue-gray (`#37474F`) background and white text. No header or footer for maximum impact.

### `#ending-slide[...]`
Closing slide with blue-gray (`#546E7A`) background, medium-weight white text, and a small accent underline.

## Reusable Components

### `#hygge-card(title, body)`
A card component with soft rounded corners, subtle border, white background, and a teal accent bar at the top.

```typst
#hygge-card([Card Title])[
  Card body content goes here. Supports rich formatting.
]
```

### Native Lists

The theme styles ordinary Typst lists with a text-safe teal dash. Use standard `-` syntax; no custom list wrapper is required.

```typst
- *First item* -- with description
- *Second item* -- with description
- *Third item* -- with description
```

### Columns and Equal-Height Cards

Use standard `#cols` for ordinary columns. When each column contains exactly one `hygge-card`, opt into `lazy-layout: true` to equalize their heights.

```typst
#cols[Left content][Right content]

#cols(lazy-layout: true)[
  #hygge-card[First][Short body.]
][
  #hygge-card[Second][Longer body that wraps across lines.]
]
```

### `#separator()`
A thin horizontal line in warm gray for visual breaks between content sections.

```typst
#separator()
```

## Key API Patterns

This theme follows the correct Touying 0.7.4 patterns:

```typst
// Slide wrapper pattern
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  // ... header/footer setup ...
  touying-slide(self: self, ..args)
})

// Page config
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  fill: palette.bg,
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 3.5em, bottom: 2em, x: 2em),
)

// Store for mutable state
config-store(
  title: none,
  align: align,
  footer: footer,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example
- `theme.md` — This documentation

## Demo

See `demo.typ` for a full compilable example showcasing all slide types and components.
