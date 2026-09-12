# Midnight Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `midnight-theme`
**Style**: Dark, restrained, midnight-sky inspired
**Primary color**: `#4FC3F7` (light blue)
**Best For**: Tech conferences, developer talks, and dark-room presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Midnight is a dark, content-led theme built around deep navy, light-blue accents, and restrained violet highlights. Its Plain-tier vocabulary relies on typography, whitespace, thin gradient rules, native lists, and two reusable card components. Small star dots are reserved for the title and ending bookends, while code and mathematics receive high-contrast dark-mode styling.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: midnight-theme.with(
  aspect-ratio: "16-9",
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
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content or function receiving `self` |

## Color Scheme

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#4FC3F7` | `palette.primary` | Touying primary and light-blue accent |
| **Background** | `#0D1B2A` | `palette.bg` | Midnight navy page background |
| **Card Background** | `#1B2838` | `palette.card-bg` | Opaque card fill |
| **Accent** | `#4FC3F7` | `palette.accent` | Rules, headings, and key values |
| **Accent 2** | `#7C4DFF` | `palette.accent2` | Violet gradient endpoint and alternate card accent |
| **Text** | `#E0E0E0` | `palette.text` | Primary text |
| **Text Secondary** | `#90A4AE` | `palette.text-sec` | Labels, metadata, and footer |
| **Code Background** | `#0A1628` | `palette.code-bg` | Block and inline code fill |
| **Code Text** | `#C5E1F5` | `palette.code-text` | Block-code foreground |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.text,
  neutral-darkest: palette.bg,
)
```

## Available Slide Types

### `#title-slide()`

Centered cover with a bold title, short blue-to-violet rule, optional subtitle and metadata, and eight small star dots. Metadata comes from `config-info()`.

### `#slide(title: auto, align: auto)`

Standard content slide with a muted section label, medium-weight title, short gradient underline, and a three-part footer. `align` overrides the theme default for one slide.

### `#new-section-slide[...]`

Centered semibold section heading between two restrained accent rules. It is generated automatically by a level-1 `= Heading`.

### `#focus-slide[...]`

Width-constrained semibold statement on the midnight background, framed by one cyan and one violet rule.

### `#ending-slide[...]`

Closing bookend with four star dots, semibold text, and a short gradient rule.

## Reusable Components

### `#glow-card(title, body, accent: none)`

Opaque dark card with a prominent left rule and a subtle accent stroke. The default accent is `palette.accent`.

```typst
#glow-card([Key Insight])[
  Important information with a restrained luminous border.
]

#glow-card([Alternate Accent], accent: palette.accent2)[
  Violet emphasis without an inline color literal.
]
```

### `#stat-card(label, value, trend: none)`

Metric card whose value, label, and optional trend form one centered `stack(spacing:)`. Use it in lazy columns only when each column contains exactly one card.

```typst
#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
  [#stat-card([Users], [12K], trend: [Up 23%])],
  [#stat-card([Revenue], [USD 1.2M], trend: [Up 15%])],
  [#stat-card([Growth], [23%], trend: [Year over year])],
)
```

## Native Layout and List Styling

The theme does not define generic two- or three-column wrappers. Use Touying's standard `cols` primitive:

```typst
#cols(columns: (2fr, 1fr))[Left content][Right content]
```

Unordered lists use standard `- item` syntax and receive the theme's filled cyan marker automatically. No custom icon-list API is required.

## Dark-Mode Styling

The theme's initialization method applies:

- `palette.text` to body text and strong text
- `palette.accent` to headings
- `palette.code-bg` and `palette.code-text` to block code
- `palette.code-bg` and `palette.accent` to inline code
- inherited light text for mathematics

## Key API Pattern

```typst
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  fill: palette.bg,
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 4em, bottom: 2em, x: 2em),
)
```

All slide functions use `touying-slide-wrapper(self => { ... })` and `touying-slide(self: self, ...)`.

## Usage Notes

- Keep slides content-led: headings, native lists, ordinary `#cols`, and the two documented cards are the primary vocabulary.
- Use `palette.accent2` sparingly so the blue-to-violet gradient remains a meaningful highlight.
- For data charts, keep axis labels smaller than body text and verify every compiled chart for label collisions.

## Files

- `template.typ` -- theme definition
- `demo.typ` -- compilable usage example
- `theme_design_spec.md` -- implemented visual specification
- `theme.md` -- this API reference
