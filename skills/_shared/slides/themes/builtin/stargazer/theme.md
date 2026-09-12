# Stargazer Theme

**Type**: Touying Built-in
**Touying version**: 0.7.4
**Entry function**: `stargazer-theme`
**Style**: Versatile, polished, everyday use
**Primary color**: `#005bac` (blue)
**Best For**: Everyday use, versatile presentations, research talks
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Versatile, polished theme suitable for everyday use. Features a 4-column footer and theorem-style blocks.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import themes.stargazer: *

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [SeaSlides Team],
    date: datetime.today(),
    institution: [Open Presentation Lab],
    logo: emoji.school,
  ),
  config-common(breakable: false),
)

#title-slide()
#outline-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default content alignment |
| `progress-bar` | boolean | `true` | Show progress bar |
| `alpha` | ratio | `20%` | Transparency for covered outline entries |
| `title` | content/function | current heading | Title in header |
| `header-right` | content/function | `self => self.info.logo` | Navigation logo |
| `footer-columns` | tuple | `(25%, 25%, 1fr, 5em)` | Footer column widths |
| `footer-a` | content/function | author | Footer column A |
| `footer-b` | content/function | date | Footer column B |
| `footer-c` | content/function | short title or title | Footer column C |
| `footer-d` | content/function | slide counter | Footer column D |

## Available Slide Types

### `#title-slide()`
Title page with logo and institution.

### `#outline-slide()`
Table of contents slide.

### `#slide(...)`
Standard content slide. Supports `title`, `header`, `footer`, `align`, `config`, `repeat`, `setting`, and `composer`; ordinary `==` headings invoke it automatically.

### `#focus-slide[...]`
Full-screen emphasis slide. Supports `align` and `config` overrides.

### `#new-section-slide[...]`
Section divider (auto-triggered by `= Heading`).

## Special Components

### `#tblock(title: [...])[...]`
Theorem-style block with colored header.

## Color Scheme

### Touying Color Mapping

```typst
config-colors(
  primary: rgb("#005bac"),
  primary-dark: rgb("#004078"),
  secondary: rgb("#ffffff"),
  tertiary: rgb("#005bac"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#000000"),
)
```

> Builtin themes use Touying's `config-colors()` directly. Colors can be customized via the theme entry function or `config-colors()` in `#show: theme.with(...)`.

## Demo

See `demo.typ` for a compilable example.
