# SWUFE Simpl — Southwestern University of Finance and Economics Theme

**Type**: University / Institutional
**Package**: `@preview/touying-simpl-swufe:0.2.1`
**Touying version**: 0.7.4 (owned by the Universe package)
**Entry function**: `swufe-theme`
**Style**: Institutional, Academic, Finance/Economics University
**Primary color**: SWUFE Blue (`#01538B`)
**University**: Southwestern University of Finance and Economics (西南财经大学)
**Best For**: Southwestern University of Finance and Economics
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-swufe).

## Description

A polished presentation theme designed for the **Southwestern University of Finance and Economics
(SWUFE)**, one of China's top universities specializing in economics, finance, and management, located
in Chengdu, Sichuan. The theme is a Typst adaptation of the classic SWUFE Beamer template, built on
the Touying framework with inspiration from the Beihang University touying theme by Coekjan.

The theme features a professional blue color palette matching SWUFE's institutional identity, a
four-cell customizable footer, mini-slides navigation bar, and utility functions for theorem-style
content blocks (`tblock`) and shadowed figures (`shadow-figure`). It supports both English and
Chinese presentations with KaiTi font fallback for CJK typography.

## Quick Start

```typst
#import "@preview/touying-simpl-swufe:0.2.1": *

#show: swufe-theme.with(
  aspect-ratio: "16-9",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Kaiti SC",
    "STKaiti",
    "Noto Serif SC",
  ),
  config-info(
    title: [Financial Risk Modeling with Machine Learning],
    subtitle: [School of Finance],
    author: [Prof. Lei Chao],
    date: datetime.today(),
    institution: [Southwestern University of Finance and Economics],
  ),
)

#title-slide()

= Introduction

== Research Motivation

Machine learning transforms financial risk assessment.

- Credit scoring with gradient boosting models
- Market volatility prediction via LSTM networks
- Systemic risk detection using graph neural networks
```

## Theme Parameters

The `swufe-theme` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `lang` | `string` | `"en"` | Language setting (`"en"` or `"zh"` for Chinese fake bold) |
| `font` | `array` | `(("Libertinus Serif", covers: "latin-in-cjk"), "KaiTi", ...)` | Font stack |
| `align` | `alignment` | `horizon` | Default content alignment |
| `alpha` | `ratio` | `20%` | Alpha for inactive items in progressive outline |
| `title` | `function` | Current heading | Header title content function |
| `footer-columns` | `array` | `(1fr, 2fr, 0.7fr, 0.3fr)` | Column widths for 4-cell footer |
| `footer-a` | `function` | Author info | Left footer cell content |
| `footer-b` | `function` | Short title or title | Second footer cell |
| `footer-c` | `function` | Date | Third footer cell |
| `footer-d` | `function` | Page counter | Right footer cell (page / total) |
| `..args` | | | Additional arguments forwarded to touying-slides |

### Config Info Parameters

Passed via `config-info(...)`:

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle text |
| `short-title` | `content` / `auto` | Abbreviated title for footer (defaults to `title`) |
| `authors` | `content` | Full author listing (supports markup/superscripts) |
| `author` | `content` | Author shown in footer |
| `date` | `datetime` / `content` | Presentation date |
| `institution` | `content` / `array` | Institutional affiliations (supports multiple) |
| `banner` | `content` | Banner image for title slide (defaults to SWUFE banner SVG) |
| `logo` | `content` | Logo image |

### Config Colors Parameters

Passed via `config-colors(...)`:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `primary` | `rgb(1, 83, 139)` | Main theme color |
| `primary-dark` | `rgb(0, 42, 70)` | Dark variant for footer/emphasis |
| `secondary` | `rgb(255, 255, 255)` | Secondary color (white) |
| `neutral-lightest` | `rgb(255, 255, 255)` | Lightest neutral |
| `neutral-darkest` | `rgb(0, 0, 0)` | Darkest neutral (black) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Full title page with SWUFE banner, authors, institution, date |
| Outline slide | `#outline-slide()` | Table of contents with knob markers |
| Regular slide | `== Slide Title` | Content slide with nav bar, title bar, and footer |
| Section divider | `= Section Title` | New section with progressive outline and alpha highlighting |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis with primary color, bold white text |
| Ending slide | `#ending-slide[...]` | Closing slide with centered large italic content, no title bar |

## Utility Functions

### `tblock(title: ..., content)`

Creates a theorem-style content block with a colored title bar, gradient accent stripe,
and bordered body. Useful for definitions, theorems, and key results:

```typst
#import "@preview/mitex:0.2.7": mi

#tblock(title: "Theorem (Black-Scholes)")[
  The price of a European call option is given by:
  #mi(`C = S_0 \Phi(d_1) - K e^{-rT} \Phi(d_2)`)
]
```

### `shadow-figure(figure)`

Wraps a figure or image in a centered shadow effect for visual emphasis:

```typst
#shadow-figure(figure(image("chart.png", width: 80%)))
```

## Color Scheme

The theme uses SWUFE's official institutional blue palette:

| Color | Hex | RGB | Usage |
|-------|-----|-----|-------|
| SWUFE Blue | `#01538B` | `rgb(1, 83, 139)` | Primary — headers, nav bar, accents |
| SWUFE Dark Blue | `#002A46` | `rgb(0, 42, 70)` | Primary dark — footer, emphasis |
| White | `#FFFFFF` | `rgb(255, 255, 255)` | Secondary — slide backgrounds |
| Black | `#000000` | `rgb(0, 0, 0)` | Darkest neutral — body text |

Custom colors:

```typst
#show: swufe-theme.with(
  config-colors(
    primary: rgb("#005bac"),
    primary-dark: rgb("#004078"),
  ),
)
```

## University Branding Features

- **SWUFE Banner**: SVG banner image (`assets/swufebanner.svg`) displayed prominently
  on the title slide
- **Logo Assets**: Sourced from the `swufe-logo` project by ChenZhongPu
- **Blue Palette**: Matches SWUFE's official institutional identity
- **Academic Focus**: Design adapted from the established SWUFE Beamer LaTeX template
  on Overleaf

### Asset Licensing

Logo assets are property of Southwestern University of Finance and Economics and are
included solely for academic typesetting purposes without official endorsement.

## Footer Configuration

The theme features a distinctive four-cell footer with alternating primary/primary-dark
backgrounds. Each cell is independently configurable:

```typst
#show: swufe-theme.with(
  footer-columns: (1fr, 2fr, 0.7fr, 0.3fr),
  footer-a: self => self.info.author,
  footer-b: self => self.info.short-title,
  footer-c: self => utils.display-info-date(self),
  footer-d: self => context utils.slide-counter.display() + " / " + utils.last-slide-number,
)
```

## Navigation Bar

The theme includes a mini-slides navigation bar at the top of each content slide,
showing sections and subsections with dot indicators. The current section is highlighted
in the primary color while inactive sections use 55% alpha transparency.

A gradient bar connects the navigation to the slide title, creating a smooth visual
transition.

## Language Configuration

When `lang` is set to `"zh"`, the theme automatically imports the `cuti` package and
applies `show-cn-fakebold` for proper Chinese bold rendering.

```typst
#show: swufe-theme.with(
  lang: "zh",
  config-info(
    title: [基于机器学习的金融风险建模],
    author: [雷超],
    institution: [西南财经大学 金融学院],
  ),
)
```

## Typography

- Base text size: 20pt
- Default fonts: Libertinus Serif (Latin with CJK coverage), KaiTi / Kaiti SC / Noto Serif CJK SC
- List markers: Knob markers with primary color gradient
- Figure captions and footnotes: 0.6em
- Headings colored with primary color
- Table figure captions positioned at top

## Usage Notes

- The theme supports multiple institutional affiliations via array syntax in `institution`
- The `short-title` parameter controls what appears in the footer (defaults to full title)
- The package owns Touying 0.7.4. Import only `touying-simpl-swufe`; do not add a
  second direct Touying import.
- Its slide wrapper already disables automatic breaking. Split dense content explicitly and
  verify the rendered page count.
- The package default font stack contains family names that may be absent locally. Override the
  `font` parameter with installed fallbacks, as shown in the quick start.
- For a dense two-column page, use the package-supported
  `#slide(align: top, composer: (1fr, 1fr))[left][right]` form.
- Scale list items at 0.85 for compact content
- For local compilation with assets, use the `--root .` flag:
  ```
  typst compile ./examples/main.typ --root .
  ```

## Universe Link

[touying-simpl-swufe on Typst Universe](https://typst.app/universe/package/touying-simpl-swufe)
