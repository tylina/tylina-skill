# Modern SYSU Touying

**Type**: University theme
**Package**: `@preview/modern-sysu-touying:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `sysu-theme`
**Style**: institutional, academic, Chinese
**Primary color**: SYSU Green (CMYK 100,0,100,60 / approx. `#006600`)
**University**: Sun Yat-sen University (中山大学), Guangzhou, China
**Best For**: Sun Yat-sen University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/modern-sysu-touying).

## Description

A Touying slide theme designed for Sun Yat-sen University (SYSU), one of China's top research universities. This theme wraps the Touying Stargazer theme with SYSU-specific branding, featuring the university's official green and red color scheme defined in CMYK per SYSU's visual identity standards. The theme includes the SYSU logo in SVG format and automatic Chinese fake-bold rendering when the language is set to Chinese.

The template was adapted from the `touying-buaa` (Beihang University) theme and is maintained by the SYSU community. A QQ discussion group (797942860) is available for template support.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/modern-sysu-touying:0.1.0": *

#show: sysu-theme.with(
  aspect-ratio: "16-9",
  lang: "zh",
  config-info(
    title: [中山大学学术报告模板],
    subtitle: [基于 Touying 框架],
    author: [作者姓名],
    date: datetime.today(),
    institution: [中山大学],
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
| `lang` | `"en"` | Language setting; when `"zh"`, enables Chinese fake-bold via `cuti` |
| `font` | `("Linux Libertine",)` | Font family tuple; use CJK fonts for Chinese |
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
| `logo` | Logo image (defaults to SYSU logo SVG) |

### Config Common Parameters

| Parameter | Description |
|-----------|-------------|
| `preamble` | Preamble content, e.g., `pdfpc.config(...)` for presenter mode |
| `show-notes-on-second-screen` | Enable speaker notes display (e.g., `right`) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Cover page with SYSU branding, green color scheme |
| Outline slide | `#outline-slide()` | Auto-generated table of contents |
| Section heading | `= Heading` | Section divider slide (level-1 heading) |
| Content slide | `== Heading` | Regular content slide (level-2 heading) |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color |
| Ending slide | `#ending-slide[...]` | Closing/thank-you slide |
| Custom slide | `#slide(...)` | Explicit slide with custom layout options |
| Appendix | `#show: appendix` | Freezes slide numbering for supplementary material |

## Color Scheme

SYSU's official colors are defined in CMYK per the university's visual identity standard:

| Color Token | CMYK / Value | Usage |
|-------------|-------------|-------|
| `primary` (SYSU Green) | CMYK(100,0,100,60) ≈ `#006600` | Headers, accents, progress bars |
| `primary-dark` (SYSU Red) | CMYK(30,100,100,50) ≈ `#590000` | Title text, emphasis elements |
| `secondary` | `#ffffff` | Light backgrounds |
| `tertiary` | SYSU Green | Navigation and decorative elements |
| `neutral-lightest` | `#ffffff` | White backgrounds |
| `neutral-darkest` | SYSU Red | Dark text |

## University Branding Features

- **SYSU Logo**: Automatically included via `assets/vi/sysu_logo.svg` in the header
- **Official Colors**: Uses CMYK-defined colors per SYSU visual identity standard
- **Header**: Displays section navigation with university logo
- **Footer**: Shows slide number, author, and title information
- **Chinese Support**: When `lang: "zh"`, imports `@preview/cuti:0.3.0` for proper Chinese fake-bold rendering
- **Stargazer Base**: Inherits all Stargazer theme features including progress bars, navigation, and themed content blocks

## Advanced Features

### Themed Content Blocks

```typst
#tblock(title: [Theorem])[
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
#show: sysu-theme.with(
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Source Han Sans SC",
    "Source Han Sans",
  ),
)
```

## Universe Link

[modern-sysu-touying on Typst Universe](https://typst.app/universe/package/modern-sysu-touying)
