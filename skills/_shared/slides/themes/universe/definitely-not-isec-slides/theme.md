# Definitely Not ISEC Slides

**Type**: Institutional Theme
**Package**: `@preview/definitely-not-isec-slides:1.1.0`
**Touying version**: 0.7.4 (owned by the Universe package)
**Minimum Typst version**: 0.14.2
**Entry function**: `definitely-not-isec-theme`
**Style**: Institutional, Austrian, Academic, Technical
**Primary color**: TU Graz Red (`#e4154b`)
**Institution**: ISEC, Technische Universität Graz (TU Graz)
**Best For**: ISEC TUGraz presentations
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/definitely-not-isec-slides).

## Description

An opinionated, unofficial presentation theme for the **Institute of Applied Information Processing and Communications (ISEC)** at **TU Graz** (Technische Universität Graz). The theme features TU Graz red branding, the university logo, a progress bar footer, styled code blocks (via codly), quote blocks, coloured content boxes with icons, and a comprehensive institutional colour palette covering all TU Graz faculties. While designed for ISEC, it is easily configurable for other institutes or organisations. The TU Graz logo is considered public domain.

## Quick Start

```typst
#import "@preview/definitely-not-isec-slides:1.1.0": *

#show: definitely-not-isec-theme.with(
  aspect-ratio: "16-9",
  slide-alignment: top,
  font: "Arial",
  progress-bar: true,
  config-common(breakable: false),
  config-info(
    title: [Applied Cryptography Research],
    subtitle: [Secure Computation Protocols],
    authors: ([Dr. Anna Müller], [Prof. Thomas Kern]),
    extra: [ISEC Seminar 2025],
    footer: [Müller & Kern],
  ),
)

#title-slide()

#slide(title: [Motivation])[
  Modern cryptographic protocols require:

  - Post-quantum security assumptions
  - Efficient multi-party computation
  - Verifiable computation guarantees
]

#slide(title: [Main Theorem])[
  $ Pr[cal(A) "wins"] <= epsilon(lambda) + "negl"(lambda) $
]

#standout-slide(title: [Questions?])
```

## Theme Parameters

### `definitely-not-isec-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio |
| `header` | `content` | current heading | Default header content (level-1 heading) |
| `font` | `string` | `"Open Sans"` | Primary body font. Pass an installed font such as `"Arial"` when Open Sans is unavailable. |
| `institute` | `content` | `[isec.tugraz.at]` | Institute label shown in footer |
| `logo` | `content` | TU Graz logo | Logo for title slide and header |
| `slide-alignment` | `alignment` | `top` | Default content alignment on slides |
| `progress-bar` | `bool` | `true` | Show progress bar at bottom of slides. |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle |
| `authors` | `array` | Array of author names (displayed inline) |
| `extra` | `content` | Extra info (e.g., event name, date) |
| `footer` | `content` | Footer text (e.g., short author names) |
| `download-qr` | `string` | URL for auto-generated QR code on title slide |

## Available Slide Types

### `#title-slide()`

The opening slide featuring the TU Graz logo (top-right), title with a coloured accent bar, subtitle in primary colour, authors listed inline, extra information, and an optional QR code (bottom-right, generated from `download-qr`). The footer shows the institute name with a rotated arrow icon.

### `#section-slide(title: [...], subtitle: [...])`

Creates an explicit section transition slide with the section title centred at 36pt and an optional subtitle at 20pt. No header or footer is shown.

### `#slide(title: [...])[...]` (Content Slide)

Creates the package's standard content slide with a branded header (explicit title + institute logo) and a footer showing slide number and author text. Prefer this package-native explicit form, matching the 1.1.0 template. Features include:
- Coloured square bullet markers (primary, then black, then grey)
- Enumeration with primary-coloured number badges
- Emphasised text rendered in primary colour
- Citations in primary colour
- Optional progress bar at the bottom

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `content` | `auto` | Slide title; `auto` uses heading text |
| `alignment` | `alignment` | `none` | Content alignment override |
| `outlined` | `bool` | `true` | Whether slide appears in PDF outline |

## Version Boundary

Version 1.1.0 owns Touying 0.7.4. Import only the theme package, use its native
`#slide(title: ...)[...]` wrapper, and verify the optional progress bar and
chosen font in the rendered output.

### `#standout-slide(title: [...])`

An emphasis slide with centred text at 28pt semibold on a clean background. No header or footer. Ideal for key messages or Q&A prompts.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `content` | `none` | Centred emphasis text |

### `#blank-slide[...]`

A completely blank slide with zero margins, no header, and no footer. Content is centred. Useful for full-bleed images or custom layouts.

## Color Scheme

The theme defines a comprehensive colour palette covering TU Graz faculties:

| Variable | Name | Hex | Usage |
|----------|------|-----|-------|
| `tug` / `primary` | TU Graz Red | `#e4154b` | Primary brand, headers, bullets |
| `isec` | ISEC Navy | `#272733` | Dark accent |
| `head` / `standout` | Standout Teal | `#245b78` | Standout slide background |
| `dark` | Dark Blue-Grey | `#3b5a70` | Dark accent |
| `colB` / `tugmid` | Mid Blue | `#5191c1` | Secondary blue |
| `colD` / `tugblue` | Deep Blue | `#285f82` | Emphasis colour |
| `web` | Web Teal | `#0c5a77` | Links |
| `csbme` / `tugcyan` | Cyan | `#19b4e3` | Faculty: CS/BME |
| `arch` / `tugturquoise` | Turquoise | `#0a98a2` | Faculty: Architecture |
| `bauw` | Gold | `#d68e23` | Faculty: Civil Engineering |
| `mach` | Blue | `#3066ba` | Faculty: Mechanical Engineering |
| `chem` / `tugviolet` | Violet | `#5e60a8` | Faculty: Chemistry |
| `math` | Green | `#1e6934` | Faculty: Mathematics |
| `crypto` | Lime | `#a6c947` | Cryptography |
| `applied` / `tugpurple` | Purple | `#7d219e` | Applied Sciences |
| `footer` | Grey | `#808080` | Footer text |

## Utility Functions

### `#quote-block[...]` — Blockquote

A styled block with a coloured vertical bar on the left side (similar to a Markdown blockquote):

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `top-pad` | `length` | `0.55cm` | Extra padding height |
| `color` | `color` | primary | Bar colour |
| `spacing` | `length` | `0.3cm` | Vertical spacing after block |

### `#color-block(title: [...], icon: "...", color: ...)[...]` — Titled Box

A titled content box with coloured header and body, built on showybox:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `content` | `[]` | Block title |
| `icon` | `string` | `none` | Tabler icon name |
| `spacing` | `length` | `0.78em` | Above/below spacing |
| `color` | `color` | primary | Title bar and border colour |
| `color-body` | `color` | lite beige | Body background colour |

### `#note(text)` — Speaker Notes

Wraps `pdfpc.speaker-note()` for presenter mode notes.

### Reducer Bindings

- `#cetz-canvas[...]` — CetZ canvas with touying animation support
- `#fletcher-diagram[...]` — Fletcher diagram with touying animation support

## Branding Features

- **TU Graz logo**: SVG logo in header and title slide (public domain)
- **Progress bar**: 3pt primary-coloured progress indicator at bottom of content slides
- **Coloured bullets**: Hierarchical square bullet markers in primary → black → grey
- **Numbered enumerations**: Primary-coloured square badges with white numbers
- **Code blocks**: Styled via codly with line numbers, zebra striping, and subtle borders
- **Bibliography**: IEEE style with primary-coloured citations
- **Configurable institute**: Easily swap `institute` and `logo` for other TU Graz institutes

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes via pdfpc
- `#note("...")` — Shorthand for speaker notes
- `#show: appendix` — Switch to appendix mode

## Universe Link

[definitely-not-isec-slides on Typst Universe](https://typst.app/universe/package/definitely-not-isec-slides)
