# Dewdrop Theme

**Type**: Touying Built-in
**Touying version**: 0.7.4
**Entry function**: `dewdrop-theme`
**Style**: Elegant, structured with navigation
**Primary color**: `#0c4842` (dark teal)
**Best For**: Academic lectures, multi-section talks, course materials
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

Elegant theme with sidebar, mini-slide, and navigation-free modes. Good for academic lectures and multi-section talks.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import themes.dewdrop: *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Title],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
#outline-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `navigation` | string/none | `"sidebar"` | `"sidebar"`, `"mini-slides"`, or `none` |
| `sidebar` | dictionary | `(width: 10em, filled: false, numbered: false, indent: .5em, short-heading: true)` | Sidebar outline configuration |
| `mini-slides` | dictionary | `(height: 4em, x: 2em, display-section: false, display-subsection: true, linebreaks: true, short-heading: true)` | Mini-slide navigation configuration; also accepts `inline` |
| `footer` | content/function | `none` | Footer content |
| `footer-right` | content/function | current / last slide | Right side of footer |
| `primary` | color | `rgb("#0c4842")` | Primary accent color |
| `alpha` | ratio | `60%` | Transparency for navigation |
| `subslide-preamble` | content/function | current heading | Heading shown on continuation subslides |
| `..args` | configuration | none | Touying configuration such as `config-common`, `config-colors`, or `config-info` |

## Available Slide Types

### `#title-slide(extra: none, ..info-overrides)`
Title page with centered content. It supports title, subtitle, author, date, institution, contact, and an additional `extra` line.

### `#outline-slide(title: auto, ..outline-args)`
Table of contents slide with an optional localized title and native Typst outline arguments.

### `== Heading` / `#slide(...)`
Level-two headings create standard content slides automatically. Call `slide` directly only for explicit composers or callback-style content supported by Touying.

### `#focus-slide[...]`
Full-screen emphasis slide.

### `= Heading`
Level-one headings automatically trigger Dewdrop's progressive-outline section slide through `new-section-slide`.

## Color Scheme

### Touying Color Mapping

```typst
config-colors(
  primary: rgb("#0c4842"),
  neutral-dark: rgb("#202020"),
  neutral-light: rgb("#f3f3f3"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#000000"),
)
```

> Builtin themes use Touying's `config-colors()` directly. Colors can be customized via the theme entry function or `config-colors()` in `#show: theme.with(...)`.

## Demo

See `demo.typ` for a compilable example.
