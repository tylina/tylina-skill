# Metropolis Theme

**Type**: Touying Built-in
**Touying version**: 0.7.4
**Entry function**: `metropolis-theme`
**Style**: Modern, elegant (Beamer Metropolis-inspired)
**Primary color**: `#eb811b` (orange)
**Best For**: Academic talks, conferences, technical presentations
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

Inspired by the popular Beamer Metropolis theme by Matthias Vogelgesang. Features a clean, modern design with a colored header bar and optional progress bar.

**Recommended fonts**: Fira Sans + Fira Math when installed; otherwise use a verified sans-serif and math fallback.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import themes.metropolis: *

#set text(font: ("Fira Sans", "IBM Plex Sans", "Arial"), weight: "light", size: 20pt)
#show math.equation: set text(font: "New Computer Modern Math")
#set strong(delta: 100)
#set par(justify: true)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
    logo: emoji.city,
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default content alignment |
| `header` | content/function | fitted current heading at slide depth | Header content |
| `header-right` | content/function | `self.info.logo` | Right side of header |
| `footer` | content/function | `none` | Footer content |
| `footer-right` | content/function | current / last slide | Right side of footer |
| `footer-progress` | boolean | `true` | Show progress bar in footer |
| `..args` | configuration | none | Touying configuration such as `config-common`, `config-colors`, or `config-info` |

## Available Slide Types

### `#title-slide(config: (:), extra: none, ..info-overrides)`
Title page with logo, title, subtitle, author, date, institution, contact, and optional extra content. Named metadata overrides are merged with `config-info`.

### `#outline-slide(config: (:), level: auto, title: [Outline], spacing: 2em, ..outline-args)`
Progressive outline slide with Metropolis numbering and spacing defaults. Use `level: 1, numbered: (false,)` for an unnumbered section-only overview when heading numbering is not configured; outline styling arguments are per-level arrays.

### `== Heading` / `#slide(title: auto, align: auto, config: (:), repeat: auto, setting: ..., composer: auto, ..bodies)`
Level-two headings create standard content slides automatically. Call `slide` directly for explicit composers, settings, or callback-style reveal content.

### `= Heading` / `#new-section-slide(config: (:), level: 1, numbered: true)[...]`
Level-one headings automatically create section dividers with a progress bar; manual calls are normally unnecessary.

### `#focus-slide(config: (:), align: horizon + center)[...]`
Full-screen emphasis slide with dark background.

## Color Scheme

### Touying Color Mapping

```typst
config-colors(
  primary: rgb("#eb811b"),
  primary-light: rgb("#d6c6b7"),
  secondary: rgb("#23373b"),
  neutral-lightest: rgb("#fafafa"),
  neutral-dark: rgb("#23373b"),
  neutral-darkest: rgb("#23373b"),
)
```

> Builtin themes use Touying's `config-colors()` directly. Colors can be customized via the theme entry function or `config-colors()` in `#show: theme.with(...)`.

## Key API Patterns (from source)

```typst
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 3em, bottom: 1.5em, x: 2em),
)
```

- `components.left-and-right(left, right)` — Header/footer left-right layout
- `components.progress-bar(height: 2pt, color1, color2)` — Progress bar
- `components.custom-progressive-outline(...)` — Numbered progressive outline used by `outline-slide`
- `utils.fit-to-width(grow: false, 100%, content)` — Fit content to width
- `utils.display-current-heading(depth:, setting:)` — Display current heading

## Demo

See `demo.typ` for a compilable example.
