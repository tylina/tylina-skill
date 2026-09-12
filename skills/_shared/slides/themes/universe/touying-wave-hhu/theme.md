# Touying Wave HHU

**Type**: University theme
**Package**: `@preview/touying-wave-hhu:0.2.0`
**Touying version**: 0.6.3 (package-internal dependency)
**Entry function**: `hhu-theme`
**Style**: institutional, academic, Chinese, wave-decorated
**Primary color**: HHU Blue `#006fb8`
**University**: Hohai University (河海大学), Nanjing, China
**Best For**: Hohai University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-wave-hhu).

## Description

A Touying slide theme designed for Hohai University (HHU), China's premier university for water resources and hydraulic engineering. Inspired by the Hohai University brand guidelines and modified from the Metropolis theme, this theme features a distinctive wave decoration motif reflecting the university's water-themed identity. It includes comprehensive branding with multiple logo variants, wave SVG decorations, Font Awesome icons for metadata, and a rich 10-color palette.

The theme supports multiple slide types including multi-column and page-aligned layouts, section and subsection dividers, and a footer progress bar.

## Quick Start

```typst
#import "@preview/touying-wave-hhu:0.2.0": *

#show: hhu-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [河海大学学术报告模板],
    subtitle: [
      #stack(
        spacing: 0.8em,
        [基于 Touying 框架的 Wave 主题],
        text(size: 0.62em, weight: "regular")[
          作者姓名 · 河海大学 · #datetime.today().display("[year] 年 [month] 月 [day] 日")
        ],
      )
    ],
  ),
  config-common(breakable: false),
)

#title-slide()

#outline-slide()

= 第一部分

== 第一页

正文内容。
```

The Universe package imports and re-exports its compatible Touying 0.6.3 API. Import the package alone rather than mixing it with a separate Touying version.

The package's native `title-slide` renders the `author`, `institution`, and `date` fields with Font Awesome font glyphs. If the Font Awesome 6 Free and Brands families are installed, those fields may be supplied directly. Otherwise, use the font-independent subtitle metadata pattern above; missing Font Awesome fonts render replacement boxes.

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `horizon` | Default content alignment |
| `header` | `auto` | Header content; auto-resolves to current heading display |
| `header-right` | `self => self.info.logo` | Right header content (default: logo) |
| `footer` | `none` | Footer content |
| `footer-right` | Slide counter | Right footer showing `N / Total` |
| `footer-progress` | `true` | Whether to show a progress bar at the bottom |
| `subtitle-show-slide-heading` | `false` | Show slide heading in subtitle area |

### Config Info Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `subtitle` | Subtitle text |
| `author` | Author name(s); native title metadata requires Font Awesome fonts |
| `date` | Presentation date (e.g., `datetime.today()`); native title metadata requires Font Awesome fonts |
| `institution` | Institution name; native title metadata requires Font Awesome fonts |

### Config Page Parameters

| Parameter | Description |
|-----------|-------------|
| `footer` | Custom page footer (can be a callback `(self) => { ... }`) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Cover page with wave decoration, logos, and FA icons |
| Outline slide | `#outline-slide()` | Table of contents with wave bullet markers |
| Section slide | `= Heading` or `#new-section-slide(...)` | Section divider with HHU logo |
| Subsection slide | `#new-subsection-slide(...)` | Subsection divider with HHU logo |
| Content slide | `== Heading` or `#slide(...)` | Regular content slide with header and footer |
| Multi-column slide | `#slide-mc(title: [Title])[Left][Right]` | Slide using the package's equal-width multi-column grid |
| Page-aligned slide | `#slide-aligned(title: [Title])[Left][Right]` | Slide using the package's page-aligned block layout |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide |
| Custom slide | `#slide(...)` | Explicit slide with custom layout options |

## Color Scheme

The theme defines a rich 10-color palette inspired by Hohai University's visual identity:

| Color Name | Hex Value | Usage |
|------------|-----------|-------|
| `blue` (primary) | `#006fb8` | Headers, accents, navigation, progress bar |
| `navy` (secondary) | `#214046` | Dark backgrounds, emphasis |
| `red` | `#ce2637` | Alert and highlight elements |
| `orange` | `#f46b21` | Warning and secondary accents |
| `purple` | `#713579` | Decorative elements |
| `pink` | `#e9269a` | Decorative elements |
| `lime` | `#058805` | Success indicators |
| `aqua` | `#009b94` | Water-themed accents |
| `white` | `#ffffff` | Backgrounds |
| `black` | `#000000` | Primary text |

### Mapped Color Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `primary` | HHU Blue | Main accent color |
| `primary-light` | Blue lightened 30% | Hover/focus states |
| `primary-dark` | Blue darkened 30% | Active/pressed states |
| `secondary` | HHU Navy | Secondary elements |
| `neutral-lightest` | White | Slide backgrounds |
| `neutral-dark` | Black | Text color |
| `neutral-darkest` | Black | Heading color |

## University Branding Features

- **Wave Decoration**: SVG wave motifs (`assets/wave.svg`, `assets/wave-dark.svg`) used on title slides, outline markers, and section headings
- **HHU Logos**: Multiple variants for different contexts:
  - `logo.svg` (blue) — header right area, section/subsection slides
  - `logo-white.svg` — for dark backgrounds
  - `logo-title.svg` — title slide top-left
- **Font Awesome Icons**: Title slide uses FA icons for author (#fa-circle-user), institution (#fa-institution), and date (#fa-calendar) via `iconic-salmon-fa`
- **Progress Bar**: Configurable footer progress bar showing presentation completion
- **Header**: Displays current heading with university logo

## Advanced Features

### Multi-Column Layout

```typst
#slide-mc(title: [Comparison])[
  Left column content
][
  Right column content
]
```

In package version 0.2.0, `slide-mc` and `slide-aligned` use their built-in equal-width columns and default gutter. Do not pass `columns`, `gutter`, or `alignment`: those names are forwarded to Touying as unexpected slide arguments and fail compilation.

### Page-Aligned Layout

```typst
#slide-aligned(title: [Governing Equations])[
  Explanatory content
][
  $ equation $
]
```

### Custom Footer

```typst
#show: hhu-theme.with(
  config-page(
    footer: (self) => {
      self.info.title
    }
  ),
)
```

### Callout Boxes

The package exports `callout`, `tip`, `note`, `example`, `important`, `warning`, `caution`, `refer`, and `question`, plus `-i` icon variants.

```typst
#note(title: [Operational note])[
  Use the latest gauge and radar observations before issuing an alert.
]
```

### Animation

- `#pause` — Incremental content reveal
- `#uncover("2-")[...]` — Reveal with space reservation
- `#only("2-")[...]` — Reveal without space reservation
- `#alternatives[...][...]` — Choose among alternatives per sub-slide

### Font Configuration

Custom math and text fonts via `fontset.typ`:
- Default math font: `"New Computer Modern Math"`
- Default text size: `20pt`

## Universe Link

[touying-wave-hhu on Typst Universe](https://typst.app/universe/package/touying-wave-hhu)
