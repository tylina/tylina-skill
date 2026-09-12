# Touying BUAA

**Type**: University theme
**Package**: `@preview/touying-buaa:0.2.0`
**Touying version**: 0.5.2
**Entry function**: `buaa-theme`
**Style**: institutional, academic, Chinese
**Primary color**: BUAA Blue (inherited from Stargazer theme)
**University**: Beihang University (北京航空航天大学), Beijing, China
**Best For**: Beihang University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-buaa).

## Description

A Touying slide theme designed for Beihang University (BUAA, formerly Beijing University of Aeronautics and Astronautics). This theme wraps the built-in Touying Stargazer theme with BUAA-specific branding, including the university logo and visual identity assets. It features automatic Chinese fake-bold rendering support when the language is set to Chinese, making it ideal for academic presentations, thesis defenses, and research seminars at BUAA.

The theme was inspired by the Southeast University Touying Slide Theme by QuadnucYard.

## Quick Start

```typst
#import "@preview/touying:0.5.2": *
#import "@preview/touying-buaa:0.2.0": *

#show: buaa-theme.with(
  aspect-ratio: "16-9",
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Songti SC",
  ),
  config-info(
    title: [基于 Touying 的北航学术报告],
    subtitle: [副标题],
    author: [作者姓名],
    date: datetime.today(),
    institution: [北京航空航天大学],
  ),
)

#title-slide()

#outline-slide()

= 第一部分

== 第一页

这是正文内容。
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
| `logo` | Logo image (defaults to BUAA logo SVG) |

### Config Common Parameters

| Parameter | Description |
|-----------|-------------|
| `preamble` | Preamble content, e.g., `pdfpc.config(...)` for presenter mode |
| `show-notes-on-second-screen` | Enable speaker notes display (e.g., `right`) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Cover page with BUAA branding, title, author, and date |
| Outline slide | `#outline-slide()` | Auto-generated table of contents |
| Section heading | `= Heading` | Section divider slide (level-1 heading) |
| Content slide | `== Heading` | Regular content slide (level-2 heading) |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color |
| Ending slide | `#ending-slide[...]` | Closing/thank-you slide |
| Custom slide | `#slide(...)` | Explicit slide with custom layout options |
| Appendix | `#show: appendix` | Freezes slide numbering for supplementary material |

## Color Scheme

The theme inherits the Stargazer color palette with BUAA institutional styling:

| Role | Description |
|------|-------------|
| Primary | Theme accent color used in headers, progress bars, and highlights |
| Neutral Dark | Dark text and heading colors |
| Neutral Light | Light backgrounds |
| Neutral Lightest | White backgrounds |

## University Branding Features

- **BUAA Logo**: Automatically included via `assets/vi/buaa-logo.svg`
- **Header**: Displays section navigation with university branding
- **Footer**: Shows slide number, author, and title information
- **Chinese Support**: When `lang: "zh"`, imports `@preview/cuti:0.2.1` for proper Chinese fake-bold rendering
- **Stargazer Base**: Inherits all Stargazer theme features including progress bars, mini-slides navigation, and themed content blocks

## Advanced Features

### Themed Content Blocks

```typst
#tblock(title: [定理])[
  内容...
]
```

### Two-Column Layout

```typst
#slide(composer: (1fr, 1fr))[
  左栏内容
][
  右栏内容
]
```

### Speaker Notes

```typst
#speaker-note[
  演讲提示内容
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
#show: buaa-theme.with(
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Songti SC",
  ),
)
```

Replace `"Songti SC"` with an installed CJK family on non-macOS systems. Listing a font that is not installed produces a Typst font-fallback warning.

## Universe Link

[touying-buaa on Typst Universe](https://typst.app/universe/package/touying-buaa)
