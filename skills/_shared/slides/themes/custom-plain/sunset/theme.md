# Sunset Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `sunset-theme`
**Style**: Warm, gradient-rich, sunset-inspired
**Primary color**: `#FF6F00` (deep amber/orange)
**Best For**: Motivational talks, creative showcases, storytelling
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A warm custom theme inspired by sunset colors: deep amber, orange, golden yellow, and deep purple. Perfect for motivational talks, creative showcases, and storytelling presentations. It pairs an open, typographic content header with a short sunset-gradient rule, decorative sun circles on the title slide, timeline components, callout boxes, and warm accent cards.

## Quick Start

```typst
// Copy template.typ to your project, then:
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: sunset-theme.with(
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
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Title page with centered gradient block design, dark high-contrast title text, and decorative sun circles. Shows title, subtitle, author, date, and institution.

### `#slide(title: auto)`
Standard content slide with an open section/title stack, a short orange-to-amber gradient rule, and a balanced three-part footer with page counter. Usually created with `== Slide Title` rather than called directly.

### `#new-section-slide[...]`
Section divider with orange accent lines and large italic text (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Full-screen emphasis slide with an orange-to-purple diagonal gradient background.

### `#ending-slide[...]`
Closing slide with amber background and bold dark text.

## Reusable Components

### `#warm-card(title, body, accent: none)`
Highlighted information card with left accent border. Defaults to the accessible deep burnt-orange accent.

```typst
#warm-card[Key Insight][
  Important information here.
]

// With a custom accent color:
#warm-card(accent: palette.tertiary)[Purple Note][
  Uses the deep purple accent.
]
```

### `#timeline-item(year, title, description)`
Timeline entry with a colored year badge and description block. Ideal for milestones and roadmaps.

```typst
#timeline-item[2024][Launch][Product launched to the public.]
```

### Multi-column layout

Use Touying's universal `cols` helper; the theme does not add a custom column wrapper.

```typst
#cols(columns: (2fr, 1fr))[Left content][Right content]
```

### `#callout(body, icon: "!")`
Callout box with golden yellow background and a customizable icon badge.

```typst
#callout(icon: "!")[
  This is an important note.
]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#FF6F00` | `palette.primary` | Bright decorative orange, gradient starts, short rules, sun accents |
| **Primary Deep** | `#B54708` | `palette.primary-deep` | Accessible orange text and badges, focus gradient endpoint |
| **Secondary** | `#FF8F00` | `palette.secondary` | Amber, header gradient endpoint, ending slide background |
| **Tertiary** | `#6A1B9A` | `palette.tertiary` | Deep purple, focus slide gradient, decorative circles |
| **Background** | `#FFF8E1` | `palette.bg` | Warm cream slide background |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White card fill |
| **Accent Warm** | `#FFD54F` | `palette.accent-warm` | Golden yellow, callout boxes, sun decorations |
| **Text Dark** | `#3E2723` | `palette.text-dark` | Dark brown primary text |
| **Text Light** | `#795548` | `palette.text-light` | Brown secondary text, footer, metadata |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary-deep,
  secondary: palette.secondary,
  tertiary: palette.tertiary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Key API Patterns

This theme uses the correct Touying API patterns:

```typst
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 4em, bottom: 2em, x: 2em),
  fill: palette.bg,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)

## Demo

See `demo.typ` for a compilable example.
