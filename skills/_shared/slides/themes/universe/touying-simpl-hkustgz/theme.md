# HKUST(GZ) Simpl — Hong Kong University of Science and Technology (Guangzhou) Theme

**Type**: University / Institutional
**Package**: `@preview/touying-simpl-hkustgz:0.1.2`
**Touying version**: 0.6.1
**Entry function**: `hkustgz-theme`
**Style**: Institutional, Academic, Research University
**Primary color**: HKUST Blue (inherited from stargazer defaults)
**University**: Hong Kong University of Science and Technology, Guangzhou (香港科技大学(广州))
**Best For**: HKUST(GZ)
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-hkustgz).

## Description

A presentation theme designed for the **Hong Kong University of Science and Technology (Guangzhou)**,
the mainland campus of HKUST focused on cross-disciplinary research and innovation. The theme is
built on top of the Touying **stargazer** base theme, providing a clean, modern look suitable for
research seminars, thesis defenses, and academic conferences. It features the official HKUST(GZ)
logo and supports both English and Chinese language modes with appropriate typography.

The theme was inspired by the Beihang University (BUAA) touying theme by Coekjan, and adapted
with HKUST(GZ) branding and visual identity assets.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-hkustgz:0.1.2": *

#show: hkustgz-theme.with(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif",),
  config-info(
    title: [Quantum Computing for Optimization Problems],
    subtitle: [Thrust of Microelectronics],
    author: [Dr. Chen Yusheng],
    date: datetime.today(),
    institution: [HKUST(GZ) — Information Hub],
  ),
)

#title-slide()

= Introduction

== Research Motivation

Quantum advantage in combinatorial optimization.

- Variational quantum eigensolver (VQE) approaches
- Quantum approximate optimization algorithm (QAOA)
- Hybrid classical-quantum pipelines
```

## Theme Parameters

The `hkustgz-theme` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `lang` | `string` | `"en"` | Language setting (`"en"` or `"zh"` for Chinese fake bold support) |
| `font` | `tuple` | `("Linux Libertine",)` | Font family stack |
| `..args` | | | Additional arguments forwarded to stargazer base theme |

The package default expects Linux Libertine. The bundled demo and quick start select `Libertinus Serif` explicitly because it is installed in the SeaSlides review environment; choose a font available on the target system.

### Config Info Parameters

Passed via `config-info(...)`:

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle text |
| `author` | `content` | Author name(s) |
| `date` | `datetime` / `content` | Presentation date |
| `institution` | `content` | Department or hub affiliation |
| `logo` | `content` | Logo image (defaults to HKUST(GZ) logo SVG) |

## Available Slide Types

The theme inherits all slide types from the stargazer base theme:

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Full-page title with HKUST(GZ) logo and branding |
| Outline slide | `#outline-slide()` | Table of contents / outline of sections |
| Regular slide | `== Slide Title` | Standard content slide (level-2 heading) |
| Section navigation | `= Section Title` | Automatic outline slide with the active section highlighted |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color background |
| Ending slide | `#ending-slide[...]` | Closing / thank-you slide |

## Color Scheme

The theme inherits the stargazer default color scheme. Colors can be customized
via `config-colors(...)`:

| Color | Usage |
|-------|-------|
| Primary | Headers, navigation bar, accent elements |
| Primary Dark | Footer, emphasis backgrounds |
| Secondary | Highlight and decorative elements |
| Neutral Lightest | Slide backgrounds |
| Neutral Darkest | Body text |

```typst
#show: hkustgz-theme.with(
  config-colors(
    primary: rgb("#003366"),
    primary-dark: rgb("#002244"),
  ),
)
```

## University Branding Features

- **HKUST(GZ) Logo**: Automatically displayed on title slides via `assets/vi/hkustgz-logo.svg`
- **Cross-Disciplinary Focus**: The theme reflects HKUST(GZ)'s four academic hubs
  (Function, Information, Systems, and Society)
- **Chinese Language Support**: Set `lang: "zh"` to enable Chinese fake bold rendering
  via the `cuti` package for proper CJK typography
- **Bilingual Ready**: The theme works well for both English and Chinese presentations

## Language Configuration

When `lang` is set to `"zh"`, the theme automatically:

1. Imports the `cuti` package for Chinese fake bold simulation
2. Applies `show-cn-fakebold` to the document
3. Ensures proper rendering of Chinese characters in bold contexts

```typst
#show: hkustgz-theme.with(
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Noto Sans SC",
  ),
  config-info(
    title: [量子计算在优化问题中的应用],
    author: [陈宇升],
    institution: [香港科技大学(广州) 信息枢纽],
  ),
)
```

## Usage Notes

- The theme is based on Touying's **stargazer** theme; all stargazer configuration options
  are available via pass-through arguments
- In the package-owned 0.6.1 implementation, each level-1 heading creates the active-section
  outline slide; this is expected navigation behavior, not an accidental continuation
- The package pins Touying 0.6.1. Keep that package-owned API version; do not combine it
  with a direct Touying 0.7.x import
- The theme is lightweight (7.30 kB archive) as it primarily wraps the stargazer theme
  with HKUST(GZ) branding
- For local compilation of examples, use the `--root .` flag:
  ```
  typst compile ./examples/main.typ --root .
  ```

## Universe Link

[touying-simpl-hkustgz on Typst Universe](https://typst.app/universe/package/touying-simpl-hkustgz)
