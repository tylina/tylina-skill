# Touying ECNU Simpl

**Type**: University theme
**Package**: `@preview/touying-simpl-ecnu:0.0.1`
**Touying version**: 0.6.1
**Entry function**: `ecnu-theme`
**Style**: institutional, academic, Chinese
**Primary color**: ECNU Red `#b60b2d`
**University**: East China Normal University (华东师范大学), Shanghai, China
**Best For**: East China Normal University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-ecnu).

## Description

A Touying slide theme designed for East China Normal University (ECNU). This theme wraps the Touying Stargazer theme with ECNU-specific branding, featuring the university's distinctive red and gold color palette, ECNU logo, title wordmark, and optional campus background image. It was adapted from the `touying-simpl-cau` (China Agricultural University) template, which in turn derives from `touying-buaa` (Beihang University).

The theme includes configurable Chinese font support and is ideal for academic presentations, thesis defenses, and research seminars at ECNU. Its package default expects Source Han Sans; choose an installed CJK font explicitly when that family is unavailable.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-ecnu:0.0.1": *

#show: ecnu-theme.with(
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Noto Sans SC",
  ),
  config-info(
    title: [华东师范大学学术报告模板],
    subtitle: [副标题],
    author: [作者姓名],
    date: datetime.today(),
    institution: [East China Normal University],
  ),
)

#title-slide()

#outline-slide()

= 第一部分

== 第一页

正文内容。
```

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `lang` | `"en"` | Text language passed to Typst's `set text(lang: ...)` |
| `font` | `((name: "Libertinus Serif", covers: "latin-in-cjk"), "Source Han Sans SC", "Source Han Sans")` | Font fallback list passed to Typst's `set text(font: ...)` |
| `use-background` | `true` | Whether to display the ECNU campus background image |
| `..args` | — | Additional arguments forwarded to the Stargazer theme |

### Config Info Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `subtitle` | Subtitle text |
| `short-title` | Short title for headers/footers |
| `author` | Author name(s) |
| `date` | Presentation date (e.g., `datetime.today()`) |
| `institution` | Institution name |
| `logo` | Logo image (defaults to ECNU logo) |

### Config Common Parameters

| Parameter | Description |
|-----------|-------------|
| `preamble` | Preamble content, e.g., `pdfpc.config(...)` for presenter mode |
| `show-notes-on-second-screen` | Enable speaker notes display (e.g., `right`) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Cover page with ECNU branding, logo, and background |
| Outline slide | `#outline-slide()` | Auto-generated table of contents |
| Section heading | `= Heading` | Section divider slide (level-1 heading) |
| Content slide | `== Heading` | Regular content slide (level-2 heading) |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color |
| Ending slide | `#ending-slide[...]` | Closing/thank-you slide |
| Custom slide | `#slide(...)` | Explicit slide with custom layout options |
| Appendix | `#show: appendix` | Freezes slide numbering for supplementary material |

## Color Scheme

| Color Token | Value | Usage |
|-------------|-------|-------|
| `primary` | `#b60b2d` (ECNU Red) | Headers, accents, progress bars, focus slides |
| `primary-dark` | `#5a0718` (Dark Red) | Title text, emphasis elements |
| `secondary` | `#fdd100` (ECNU Gold) | Secondary accents and highlights |
| `tertiary` | `#004f71` (Deep Blue) | Tertiary color for variety |
| `neutral-lightest` | `#ffffff` | White backgrounds |
| `neutral-darkest` | `#5a0718` | Dark text |

## University Branding Features

- **ECNU Logo**: Displayed in header-right area via `assets/ecnu_logo.png`
- **ECNU Title Wordmark**: University name wordmark via `assets/ecnu_title.png`
- **Campus Background**: Optional background image (`assets/ecnu_background.png`) centered on slides, controlled by `use-background` parameter
- **Header**: Dual-column header with logo and wordmark
- **Footer**: Shows slide number, author, and title information
- **Chinese Support**: Configurable CJK font fallback list; the package defaults to Source Han Sans SC / Source Han Sans

## Advanced Features

### Disabling Background Image

```typst
#show: ecnu-theme.with(
  use-background: false,
  // ...
)
```

### Themed Content Blocks

```typst
#tblock(title: [Definition])[
  Content here...
]
```

### Two-Column Layout

```typst
#slide(composer: (1fr, 1fr))[
  Left column content
][
  Right column content
]
```

### Speaker Notes

```typst
#speaker-note[
  Presenter notes here.
]
```

### Animation

- `#pause` — Incremental content reveal
- `#meanwhile` — Simultaneous content on alternate sub-slides
- `#uncover("2-")[...]` — Reveal with space reservation
- `#only("2-")[...]` — Reveal without space reservation
- `#alternatives[...][...]` — Choose among alternatives per sub-slide
- `#touying-equation(...)` — Math equation with pause support

## Recommended Font Configuration for Chinese

```typst
#show: ecnu-theme.with(
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Noto Sans SC",
  ),
)
```

The package pins Touying 0.6.1. Keep that package-owned API version; do not combine it with a direct Touying 0.7.x import.

## Universe Link

[touying-simpl-ecnu on Typst Universe](https://typst.app/universe/package/touying-simpl-ecnu)
