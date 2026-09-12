# NEU Simpl — Northeastern University (China) Theme

**Type**: University / Institutional
**Package**: `@preview/touying-simpl-neu:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `neu-theme`
**Style**: Institutional, Academic, Chinese University, Dewdrop-based
**Primary color**: NEU Blue (`#284093`)
**University**: Northeastern University, China (东北大学)
**Best For**: Northeastern University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-neu).

## Description

A feature-rich presentation theme designed for **Northeastern University (NEU)**, one of China's
leading universities in engineering, computer science, and metallurgy, located in Shenyang, Liaoning.
The theme is built on Touying's **dewdrop** base theme and adapted from the SJTU (Shanghai Jiao Tong
University) touying theme. It provides multiple navigation modes (mini-slides or sidebar), extensive
slide type variety including two title slide variants and two ending slide variants, and full
university branding with the NEU logo, motto image, and campus photography.

The theme features a rich blue color palette based on NEU's official institutional colors and
supports both English and Chinese typography with Libertinus Serif and Noto Serif CJK SC fonts.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-neu:0.1.0": *

#show: neu-theme.with(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif", "Songti SC"),
  config-common(breakable: false),
  config-info(
    title: [Intelligent Control Systems for Smart Manufacturing],
    subtitle: [School of Information Science and Engineering],
    author: [Prof. Liu Mingyang],
    date: datetime.today(),
    institution: [Northeastern University],
  ),
)

#title-slide()

= Introduction

== Research Overview

Intelligent manufacturing drives Industry 4.0 transformation.

- Cyber-physical systems integration
- Adaptive control with reinforcement learning
- Digital twin-based process optimization
```

## Theme Parameters

The `neu-theme` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `navigation` | `string` | `"mini-slides"` | Navigation mode: `"mini-slides"`, `"sidebar"`, or `none` |
| `font` | `array` | `("Libertinus Serif", "Noto Serif CJK SC")` | Font fallback stack |
| `sidebar` | `dict` | `(width: 10em, filled: false, ...)` | Sidebar navigation configuration |
| `mini-slides` | `dict` | `(height: 4em, x: 2em, ...)` | Mini-slides navigation configuration |
| `footer` | `content` | `none` | Custom left footer content |
| `footer-right` | `content` | Page counter display | Right footer content |
| `primary` | `color` | `rgb("#284093")` | Primary theme color |
| `alpha` | `ratio` | `40%` | Transparency for inactive navigation items |
| `subslide-preamble` | `content` | `none` | Content shown before each subslide |
| `..args` | | | Additional arguments forwarded to touying-slides |

### Sidebar Configuration

| Key | Default | Description |
|-----|---------|-------------|
| `width` | `10em` | Sidebar width |
| `filled` | `false` | Fill sidebar background |
| `numbered` | `false` | Show slide numbers in sidebar |
| `indent` | `.5em` | Indentation for subsections |
| `short-heading` | `true` | Use short heading text |

### Mini-Slides Configuration

| Key | Default | Description |
|-----|---------|-------------|
| `height` | `4em` | Navigation bar height |
| `x` | `2em` | Horizontal margin |
| `display-section` | `false` | Show section titles in nav bar |
| `display-subsection` | `true` | Show subsection titles |
| `linebreaks` | `false` | Allow line breaks in nav bar |
| `short-heading` | `true` | Use short heading text |

### Config Info Parameters

Passed via `config-info(...)`:

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle text |
| `author` | `content` | Author name(s) |
| `date` | `datetime` / `content` | Presentation date |
| `institution` | `content` | Department or institution |
| `logo` | `content` | Logo image (defaults to NEU logo) |

## Available Slide Types

The NEU theme provides an extensive set of slide types:

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | White-background title with NEU logo and campus background |
| Title slide (blue) | `#title-slide-blue()` | Blue/photo-background variant with campus photography |
| Outline slide | `#outline-slide()` | Table of contents / outline of sections |
| Regular slide | `== Slide Title` | Standard content slide with navigation header |
| Section divider | `= Section Title` | New section transition with progressive outline |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis with primary color background |
| End slide | `#end-slide[...]` | Closing slide with NEU logo and background |
| End slide (blue) | `#end-slide-blue[...]` | Blue ending variant with campus photography |

## Color Scheme

The theme uses Northeastern University's official brand colors:

| Color | Hex | RGB | Usage |
|-------|-----|-----|-------|
| NEU Blue | `#284093` | `rgb(40, 64, 147)` | Primary — headers, navigation, accents |
| Black | `#000000` | `rgb(0, 0, 0)` | Darkest neutral — emphasis text |
| Dark Gray | `#202020` | `rgb(32, 32, 32)` | Dark neutral — body text |
| Light Gray | `#f3f3f3` | `rgb(243, 243, 243)` | Light neutral — subtle backgrounds |
| White | `#ffffff` | `rgb(255, 255, 255)` | Lightest neutral — slide backgrounds |

> Note: NEU's official color specification is C100 M70 (approximately `#004c9c`), but the
> theme uses `#284093` based on official presentation template examples.

Custom primary color:

```typst
#show: neu-theme.with(
  primary: rgb("#004c9c"),
)
```

## University Branding Features

- **NEU Logo**: Multiple variants included — standard (`neu-vi-logo.png`), white
  (`neu-vi-logo-white.png`), and combined mark (`neu-vi-logo-ud.png`)
- **University Motto**: The NEU motto image (`neu-vi-neumotto.png`) is displayed in
  the navigation header
- **Campus Background**: Background imagery (`neu-vi-neubg.png`) used on title and
  ending slides
- **Campus Photography**: Blue-themed slides use `neu-vi-neuphoto.jpg` for a
  photographic title/ending variant
- **End Slide Background**: Dedicated ending image (`neu-vi-end.png`) for the blue
  ending slide variant

## Navigation Modes

The theme supports three navigation modes:

### Mini-Slides (Default)
Compact dot-based navigation showing section/subsection progress at the top of each slide.
When `short-heading: true`, attach a label such as `<sec:results>` or `<slide:architecture>`
to a long heading; the package converts the label to the concise navigation text while retaining
the full heading on the slide and in the outline.

### Sidebar
A side panel showing the full outline with current position highlighted.

```typst
#show: neu-theme.with(
  navigation: "sidebar",
  sidebar: (width: 12em, filled: true),
)
```

### No Navigation
Clean slides without any navigation elements.

```typst
#show: neu-theme.with(
  navigation: none,
)
```

## Typography

- Base text size: 18pt with justified paragraphs
- Default fonts: Libertinus Serif (Latin) + Noto Serif CJK SC (Chinese)
- Citation style: Chicago Notes
- Footnote entries rendered at 0.8em

## Usage Notes

- The theme is based on Touying's **dewdrop** theme, adapted from the SJTU touying theme
- The Universe package is pinned internally to Touying 0.6.1; keep the matching direct import shown above
- Override the default CJK fallback when `Noto Serif CJK SC` is unavailable; the example uses
  `Songti SC`, which should be replaced with an installed serif CJK font on other systems
- The large archive size (2.32 MB) includes embedded university visual identity assets
- For local compilation of examples, use the `--root .` flag:
  ```
  typst compile ./examples/main.typ --root .
  ```

## Universe Link

[touying-simpl-neu on Typst Universe](https://typst.app/universe/package/touying-simpl-neu)
