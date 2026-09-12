# UoBristol Brandred

**Type**: Institutional Theme
**Package**: `@preview/touying-brandred-uobristol:0.2.0`
**Touying version**: 0.5.2
**Entry function**: `uobristol-theme`
**Style**: Institutional, UK, Academic
**Primary color**: Bristol Red (`#ab1f2d`)
**Secondary color**: Bristol Orange (`#ea6719`)
**Institution**: University of Bristol
**Best For**: University of Bristol
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-brandred-uobristol).

## Description

A presentation theme designed for the **University of Bristol**, inspired by the university's official brand guidelines and modified from the Touying Metropolis theme. The theme features Bristol's distinctive brand red colour palette, the university logo and custom bullet icons, a progress bar footer, and a clean modern design suitable for academic lectures, research seminars, and conference presentations. It can also be used for general-purpose academic presentations outside of Bristol.

## Quick Start

```typst
#import "@preview/touying:0.5.2": *
#import "@preview/touying-brandred-uobristol:0.2.0": *

#show: uobristol-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Advances in Quantum Computing],
    subtitle: [A Survey of Recent Results],
    author: [Dr. Jane Smith],
    date: datetime.today(),
    institution: [University of Bristol],
    logo: image("logo.png"),
  ),
)

#title-slide()

#outline-slide()

= Background

== Motivation

Key research questions in quantum computing:

- Fault-tolerant quantum gates
- Error correction thresholds
- Scalable architectures

= Results

== Main Theorem

$ cal(F)(ket(psi)) >= 1 - epsilon $

#focus-slide[
  Thank you for your attention!
]
```

## Theme Parameters

### `uobristol-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default vertical content alignment |
| `header` | `function/content` | auto | Header content; defaults to current heading |
| `header-right` | `function/content` | `self => self.info.logo` | Right-side header content (logo by default) |
| `footer` | `content` | `none` | Footer left-side content |
| `footer-right` | `content` | slide counter | Footer right-side content (page number) |
| `footer-progress` | `bool` | `true` | Whether to show progress bar at footer top |
| `font` | `string` | `"Arial"` | Body text font |
| `math-font` | `string` | `"New Computer Modern Math"` | Math content font |
| `text-size` | `length` | `20pt` | Base text size |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle (optional) |
| `author` | `content` | Author name(s) |
| `date` | `datetime` | Presentation date |
| `institution` | `content` | Institutional affiliation |
| `logo` | `content` | Logo image or emoji for header and title slide |

## Available Slide Types

### `#title-slide(extra: none)`

The title/cover slide with the University of Bristol logo, a primary-coloured geometric overlay, title, subtitle, author, institution, and date. The slide counter is frozen on this slide.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `extra` | `content` | `none` | Extra information below the standard fields |

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides** automatically. These feature a progress bar header, a centred heading card with a shadow effect, and a full-width primary-coloured footer bar. The progress bar shows the current position within the presentation.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides**. Features include:
- A primary-coloured header bar with bold white title text
- Custom bullet markers (filled right triangle `▸` in Bristol Red)
- Enumeration numbers in primary colour and bold weight
- Table borders rendered in primary colour
- Footer with optional progress bar

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `auto/none/content` | `auto` | Slide title; `auto` uses the heading text |
| `align` | `alignment` | `auto` | Content alignment override |

### `#outline-slide(title: [Outline], column: 2)`

A table-of-contents slide showing the presentation outline using the Bristol bullet icon as a marker.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `content` | `[Outline]` | Title text above the outline |
| `column` | `int` | `2` | Number of columns for the outline |
| `marker` | `auto/image/symbol` | `auto` | Bullet marker (defaults to UoB bullet SVG) |

### `#focus-slide[content]`

A full-slide emphasis slide with centred text in primary colour at 1.5em. The slide counter is frozen. Ideal for "Thank you" or key-takeaway slides.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `align` | `alignment` | `horizon + center` | Content alignment |

## Color Scheme

| Role | Color | Hex |
|------|-------|-----|
| Primary (headers, bullets, tables, accents) | Bristol Red | `#ab1f2d` |
| Secondary | Bristol Orange | `#ea6719` |
| Background (neutral lightest) | Off-white | `#fafafa` |

The primary colour is used extensively: header bars, bullet markers, enumeration numbers, table borders, section slide cards, progress bar, highlighted text, and alert text.

## Branding Features

- **University logo**: `uob-logo.svg` displayed on the title slide and optionally in the header-right position of content slides
- **Custom bullet icon**: `uob-bullet.svg` used for outline entries and level-3 headings
- **Geometric overlays**: Semi-transparent primary-coloured polygons on the title slide, echoing Bristol's visual identity
- **Progress bar**: A thin primary-coloured bar at the top of the footer showing presentation progress
- **Highlight override**: `#highlight[text]` renders as bold text in Bristol Red
- **Alert function**: `#alert[text]` uses the primary colour

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes (visible with second-screen configuration)
- `#show: appendix` — Switch to appendix mode (affects slide numbering)
- `---` — Horizontal rule creates a slide break within a section

## Universe Link

[touying-brandred-uobristol on Typst Universe](https://typst.app/universe/package/touying-brandred-uobristol)
