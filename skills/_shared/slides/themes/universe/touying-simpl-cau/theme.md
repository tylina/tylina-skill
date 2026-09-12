# CAU Simpl — China Agricultural University Theme

**Type**: University / Institutional
**Package**: `@preview/touying-simpl-cau:0.2.1`
**Touying version**: 0.6.1
**Entry function**: `cau-theme`
**Style**: Institutional, Academic, Chinese University
**Primary color**: CAU Green (`#4d7c2b`)
**University**: China Agricultural University (中国农业大学)
**Best For**: China Agricultural University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-cau).

## Description

A presentation theme designed specifically for **China Agricultural University (CAU)**, one of China's
leading universities in agricultural sciences and life sciences. The theme features CAU's official
green-and-gold color palette and supports optional campus gate background imagery. It is built on
top of the Touying **stargazer** base theme, providing a clean and professional look suitable for
academic lectures, thesis defenses, research seminars, and conference presentations.

The theme was originally adapted from the Beihang University (BUAA) touying theme by Coekjan, and
customized with CAU-specific branding, logos, and color schemes.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-cau:0.2.1": *

#show: cau-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Sustainable Agriculture and Food Security],
    subtitle: [A Research Perspective from CAU],
    author: [Dr. Zhang Wei],
    date: datetime.today(),
    institution: [College of Agronomy and Biotechnology],
  ),
)

#title-slide()

= Introduction

== Research Background

Agricultural innovation drives national food security.

- Crop genome editing for drought resistance
- Precision agriculture and IoT monitoring
- Sustainable soil management practices
```

## Theme Parameters

The `cau-theme` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `lang` | `string` | `"en"` | Language setting (`"en"` or `"zh"`) |
| `font` | `array` | `("Libertinus Serif", "Source Han Sans SC", ...)` | Font fallback stack |
| `use-background` | `bool` | `true` | Show/hide the campus gate background image |
| `..args` | | | Additional arguments forwarded to stargazer base theme |

### Config Info Parameters

Passed via `config-info(...)`:

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle text |
| `author` | `content` | Author name(s) |
| `date` | `datetime` / `content` | Presentation date |
| `institution` | `content` | Department or institutional affiliation |
| `logo` | `content` | Logo image (defaults to CAU logo SVG) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Full-page title with CAU branding, logo, and optional gate background |
| Outline slide | `#outline-slide()` | Table of contents / outline of sections |
| Regular slide | `== Slide Title` | Standard content slide (level-2 heading) |
| Section divider | `= Section Title` | New section heading slide (level-1 heading) |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color background |
| Ending slide | `#ending-slide[...]` | Closing / thank-you slide with university branding |

## Color Scheme

The theme uses China Agricultural University's official brand colors:

| Color | Hex | RGB | Usage |
|-------|-----|-----|-------|
| CAU Green | `#4d7c2b` | `rgb(77, 124, 43)` | Primary — headers, navigation, accents |
| CAU Dark Green | `#3d5c27` | `rgb(61, 92, 39)` | Primary dark — footer, emphasis |
| CAU Gold | `#fdd100` | `rgb(253, 209, 0)` | Secondary — highlights, decorative |
| Deep Green | `#006600` | `rgb(0, 102, 0)` | Tertiary — additional accent |
| White | `#ffffff` | `rgb(255, 255, 255)` | Lightest neutral — backgrounds |
| Black | `#000000` | `rgb(0, 0, 0)` | Darkest neutral — body text |

Custom colors can be set via `config-colors(...)`:

```typst
#show: cau-theme.with(
  config-colors(
    primary: rgb("#4d7c2b"),
    primary-dark: rgb("#3d5c27"),
    secondary: rgb("#fdd100"),
  ),
)
```

## University Branding Features

- **CAU Logo**: Automatically displayed on title slides via `assets/CAU_logo.svg`
- **Campus Gate Background**: An SVG rendering of the iconic CAU gate, positioned at 75% width
  on the right side of title slides. Toggle with `use-background: false`
- **Green-Gold Palette**: Reflects CAU's agricultural identity
- **Chinese Language Support**: Set `lang: "zh"` for Chinese-optimized typography with
  Source Han Sans SC font fallback

## Usage Notes

- The theme is based on Touying's **stargazer** theme; all stargazer configuration options
  are available via pass-through arguments
- Heading numbering is configured automatically via the `numbly` package
- For local compilation of examples, use the `--root .` flag:
  ```
  typst compile ./examples/main.typ --root .
  ```

## Universe Link

[touying-simpl-cau on Typst Universe](https://typst.app/universe/package/touying-simpl-cau)
