# NUDT Simpl — National University of Defense Technology Theme

**Type**: University / Institutional
**Package**: `@preview/touying-simpl-nudt:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `nudt-theme`
**Style**: Institutional, Academic, Military/Defense University, Dewdrop-based
**Primary color**: NUDT Green (`#005844`)
**University**: National University of Defense Technology (国防科技大学)
**Best For**: National University of Defense Technology
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-nudt).

## Description

A professional presentation theme designed for the **National University of Defense Technology (NUDT)**,
China's premier military-affiliated research university located in Changsha, Hunan. NUDT is renowned
for its contributions to supercomputing (Tianhe series), aerospace engineering, and national defense
technology. The theme is built on Touying's **dewdrop** base architecture and adapted from the SJTU
touying theme, providing multiple navigation modes, nine distinct slide types including green and
standard variants for title and ending slides, and comprehensive university branding.

The theme features NUDT's official dark green color palette and includes extensive visual identity
assets — university logos (SVG), campus gate photography, background images, and dedicated
ending-slide artwork.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-nudt:0.1.0": *

#show: nudt-theme.with(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif", "Songti SC"),
  config-common(breakable: false),
  config-info(
    title: [High-Performance Computing for Computational Fluid Dynamics],
    subtitle: [College of Computer Science and Technology],
    author: [Dr. Chen Haifeng],
    date: datetime.today(),
    institution: [National University of Defense Technology],
  ),
)

#title-slide()

= Introduction

== Research Objectives

Accelerating CFD simulations on the Tianhe supercomputer.

- Scalable parallel solvers for Navier-Stokes equations
- GPU-accelerated mesh generation and refinement
- Multi-physics coupling for hypersonic flow analysis
```

## Theme Parameters

The `nudt-theme` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `navigation` | `string` | `"mini-slides"` | Navigation mode: `"mini-slides"`, `"sidebar"`, or `none` |
| `font` | `array` | `("Libertinus Serif", "Noto Serif CJK SC")` | Font fallback stack |
| `sidebar` | `dict` | `(width: 10em, filled: false, ...)` | Sidebar navigation configuration |
| `mini-slides` | `dict` | `(height: 4em, x: 2em, ...)` | Mini-slides navigation configuration |
| `footer` | `content` | `none` | Custom left footer content |
| `footer-right` | `content` | Page counter display | Right footer content |
| `primary` | `color` | `rgb("#005844")` | Primary theme color |
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
| `institution` | `content` | College or department |
| `logo` | `content` | Logo image (defaults to NUDT logo SVG) |

## Available Slide Types

The NUDT theme provides an extensive set of nine slide types:

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Standard title with NUDT logo and campus background |
| Title slide (green) | `#title-slide-green()` | Green variant with campus photo and primary-colored block |
| Outline slide | `#outline-slide()` | Table of contents / outline of sections |
| Regular slide | `== Slide Title` | Standard content slide with navigation header |
| Section divider | `= Section Title` | New section transition with progressive outline |
| Section (compact) | Configure `new-section-slide-fn: new-section-slide-compact` | Automatic compact divider with a bulleted sub-outline |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis with primary color background |
| End slide | `#end-slide[...]` | Closing slide with NUDT logo and background |
| End slide (green) | `#end-slide-green[...]` | Green ending variant with custom background |

### Compact Section Slide

The `new-section-slide-compact` provides a space-efficient section divider that lists
level-2 headings under the current section as bullet points. If there are more than 5
subsections, the content automatically splits into two columns.

Select it through the theme configuration; level-1 headings still create section slides
automatically, so do not call the function manually:

```typst
#show: nudt-theme.with(
  config-common(
    breakable: false,
    new-section-slide-fn: new-section-slide-compact,
  ),
  config-info(title: [Presentation Title]),
)

= Section Title
```

## Color Scheme

The theme uses NUDT's official institutional colors:

| Color | Hex | RGB | Usage |
|-------|-----|-----|-------|
| NUDT Green | `#005844` | `rgb(0, 88, 68)` | Primary — headers, navigation, accents |
| Black | `#000000` | `rgb(0, 0, 0)` | Darkest neutral — emphasis text |
| Dark Gray | `#202020` | `rgb(32, 32, 32)` | Dark neutral — body text |
| Light Gray | `#f3f3f3` | `rgb(243, 243, 243)` | Light neutral — subtle backgrounds |
| White | `#ffffff` | `rgb(255, 255, 255)` | Lightest neutral — slide backgrounds |

Custom primary color:

```typst
#show: nudt-theme.with(
  primary: rgb("#006B54"),
)
```

## University Branding Features

- **NUDT Logo**: Multiple SVG variants — standard (`nudt-vi-logo.svg`), white
  (`nudt-vi-logo-white.svg`), and combined marks (`nudt-vi-logo-ud.svg`,
  `nudt-vi-logo-ud-white.svg`)
- **Campus Gate**: Photography of the iconic NUDT gate (`nudt-vi-nudtgate.png`)
  used on green title slide variants
- **Campus Photo**: Full campus photography (`nudt-vi-nudtphoto.png`) for
  decorative title/ending variants
- **Background Image**: Custom background (`nudt-vi-nudtbg.png`) for title and
  ending slides
- **End Slide Artwork**: Dedicated ending image (`nudt-vi-end.png`) from official
  NUDT PPT templates

### Asset Licensing

Visual identity assets in the `vi/` directory are sourced from the NUDT official website
and official PPT templates. These assets are intended for academic and internal use.
Users should follow NUDT's branding guidelines when using the theme.

## Navigation Modes

The theme supports three navigation modes:

### Mini-Slides (Default)
Compact dot-based navigation showing section/subsection progress at the top of each slide.
When `short-heading: true`, attach a label such as `<sec:mathematics>` or `<slide:hybrid>`
to a long heading. The package turns the label into concise navigation text while retaining
the full heading on the slide and in the outline.

### Sidebar
A side panel showing the full outline with current position highlighted.

```typst
#show: nudt-theme.with(
  navigation: "sidebar",
  sidebar: (width: 12em, filled: true),
)
```

### No Navigation
Clean slides without any navigation elements.

```typst
#show: nudt-theme.with(
  navigation: none,
)
```

## Typography

- Base text size: 16pt with justified paragraphs
- Default fonts: Libertinus Serif (Latin) + Noto Serif CJK SC (Chinese)
- Paragraph leading: 1.25em
- Citation style: Chicago Notes
- Footnote entries rendered at 0.8em

## Usage Notes

- The theme is based on the SJTU touying theme architecture (dewdrop-style)
- The Universe package is pinned internally to Touying 0.6.1; keep the matching direct import shown above
- Override the default CJK fallback when `Noto Serif CJK SC` is unavailable; the example uses
  `Songti SC`, which should be replaced with an installed serif CJK font on other systems
- The large archive size (1.43 MB) includes embedded university visual identity assets
- Appendix mode automatically hides footers for supplementary slides
- For local compilation of examples, use the `--root .` flag:
  ```
  typst compile ./examples/main.typ --root .
  ```

## Universe Link

[touying-simpl-nudt on Typst Universe](https://typst.app/universe/package/touying-simpl-nudt)
