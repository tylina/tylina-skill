# DIDS Lab Theme

**Type**: Institutional / Lab
**Package**: `@preview/touying-dids:0.1.0`
**Touying version**: 0.5.3
**Entry function**: `dids-theme`
**Style**: Academic, institutional, lab branding
**Primary color**: Blue (`#1d78c3`)
**Institution**: DIDS Lab, National University of Defense Technology (NUDT), China
**Best For**: DIDS Lab at NUDT
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-dids).

## Description

The DIDS theme is a professional Touying presentation template designed for the
DIDS (Data Intelligence and Decision Science) Lab at the National University of
Defense Technology (NUDT). Inspired by the touying-buaa theme for Beihang University,
it provides a clean academic look with blue-toned branding, a progress bar, structured
headers and three-column footers, and built-in theorem blocks. The theme includes
DIDS Lab logo assets for visual identity and supports both Chinese and English content.

## Quick Start

```typst
#import "@preview/touying:0.5.3": *
#import "@preview/touying-dids:0.1.0": *

#show: dids-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Research Presentation Title],
    subtitle: [DIDS Lab Seminar],
    author: [Author Name],
    date: datetime.today(),
    institution: [DIDS Lab, NUDT],
  ),
)

#title-slide()

#outline-slide()

= Introduction

== Motivation

Your content here.
```

## Theme Parameters

The `dids-theme` function accepts the following parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `progress-bar` | `true` | Show progress bar in header |
| `header` | Current heading (level 2) | Header content callback |
| `header-right` | Level-1 heading + logo | Accepted and stored by package 0.1.0, but not consumed by its content-slide header |
| `footer-columns` | `(25%, 1fr, 25%)` | Footer column proportions |
| `footer-a` | Author info | Left footer content |
| `footer-b` | Short title or full title | Center footer content |
| `footer-c` | Date + slide counter | Right footer content |

### config-info() Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `subtitle` | Presentation subtitle |
| `author` | Author name(s) |
| `date` | Date (supports `datetime.today()`) |
| `institution` | Institution or lab name |

## Available Slide Types

### `#title-slide(extra: none)`
Title page with DIDS Lab full logo, title block, subtitle, author, institution,
and date. Package 0.1.0 accepts `extra`, but does not render it.

### `= Heading` (Section slide)
Level-1 headings automatically create section divider slides (`new-section-slide`).
Shows the section heading with DIDS full logo and progress bar.

### `== Heading` (Content slide)
Level-2 headings create standard content slides with a header bar (progress bar,
current heading, and logo) and a three-column footer (author, title, date/page).

### `#slide(composer: ..)[...]`
Explicit content slide. Supports the `composer` parameter for multi-column layouts:
```typst
#slide(composer: (1fr, 1fr))[Left column][Right column]
```

### `#outline-slide(leading: ...)`
Table of contents slide with "CONTENTS / 目录" heading. Uses progressive outline
to highlight the current section. The `leading` parameter adjusts spacing.

### `#focus-slide(background-color: ..., background-img: ...)[...]`
Full-screen emphasis slide. Customizable background color or background image.

### `#matrix-slide(columns: n, rows: n)[...][...]`
Checkerboard grid layout for presenting multiple content blocks side by side.

### `#ending-slide[...]`
Closing slide with centered body content. Prefer body content for "Thank you" or
"Questions?" text. Package 0.1.0 also accepts `title: [...]`, but its built-in
pale-blue title block has insufficient text contrast.

## Color Scheme

| Color | Hex | Role |
|-------|-----|------|
| Primary Blue | `#1d78c3` | Headings, accents, links |
| Secondary Navy | `#002777` | Secondary emphasis |
| Tertiary Light Blue | `#e1ecfe` | Backgrounds, highlights |
| Neutral Lightest | `#f7fbfe` | Light backgrounds |
| Neutral Darkest | `#000000` | Body text |

## Branding Features

- **Logo placement**: DIDS Lab logo (`assets/vi/dids.png`) appears in the header
  bar of content slides (top-right) and in the title/section/outline slides
  (`assets/vi/dids-full.png` — full logo variant)
- **Header bar**: Shows progress bar (when enabled), current heading text (left),
  and section heading with logo (right)
- **Three-column footer**: Author | Title | Date + Page Number
- **Progress bar**: Thin colored bar in the header area tracking presentation progress

## Content Helpers

### `#tblock(title: [...])[...]`
Themed block with a colored title bar and gradient accent. Useful for theorems,
definitions, and highlighted content blocks:

```typst
#tblock(title: [Theorem])[
  For all $n >= 1$, we have $sum_(k=1)^n k = n(n+1)/2$.
]
```

## Animation Support

- `#pause` — progressive content reveal
- `#meanwhile` — show content simultaneously in another area
- `#uncover("2-")[...]` — reveal with space reservation
- `#only("2-")[...]` — reveal without space reservation
- `#alternatives[...][...]` — switch between content alternatives
- `#speaker-note[...]` — hidden speaker notes (pdfpc compatible)

## Appendix Support

Use `#show: appendix` to freeze the last slide number for appendix slides:

```typst
#show: appendix

== Appendix Slide

Additional material here.
```

## Package Boundary Notes

- `touying-dids:0.1.0` owns and imports Touying 0.5.3. Use that documented API
  boundary; do not mix in Touying 0.7.4 configuration calls.
- The package hardcodes `Microsoft YaHei` as a title-slide fallback. Typst emits
  a font warning when that family is not installed, even for an English title.
  Install that font to silence the warning; do not edit the Typst package cache.
- Touying 0.5.3 does not expose the current `config-common(breakable:)` setting.
  Keep title metadata compact and inspect rendered pages for accidental spillover.

## Universe Link

[touying-dids on Typst Universe](https://typst.app/universe/package/touying-dids)
