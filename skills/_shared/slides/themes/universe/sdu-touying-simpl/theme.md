# SDU Touying Simpl

**Type**: University theme
**Package**: `@preview/sdu-touying-simpl:1.1.0`
**Touying version**: 0.7.3 (owned by the Universe package)
**Minimum Typst version**: 0.14.0
**Entry function**: `sdu-theme`
**Style**: institutional, academic, Chinese
**Primary color**: SDU Red `#880000`
**University**: Shandong University (山东大学), Jinan, China
**Best For**: Shandong University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/sdu-touying-simpl).

## Description

A Touying slide theme designed for Shandong University (SDU), one of China's key comprehensive research universities. This theme features SDU's official deep red color scheme (`#880000`, known as "山大标准红色"), the university crest, customizable headers and footers, optimized Chinese font support, and a multi-column matrix slide layout.

The theme was inspired by the PolyU Beamer Slides design and references from touying-pres-ustc and touying-brandred-uobristol templates.

## Quick Start

```typst
#import "@preview/sdu-touying-simpl:1.1.0": *

#show: sdu-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [山东大学学术报告模板],
    short-title: [山大学术报告],
    subtitle: [基于 Touying 框架],
    author: [作者姓名],
    date: datetime.today(),
    institution: [山东大学],
  ),
)

#title-slide()

#outline-slide()

= 第一部分

== 第一页

正文内容。
```

> **Package boundary**: Version 1.1.0 owns Touying 0.7.3. Import only the SDU
> package and use its native header/footer methods; do not add a second Touying import.

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `header` | Current heading | Header content, auto-resolves to current heading fitted to width |
| `footer-a` | `self.info.author` | Left footer content (author) |
| `footer-b` | `self.info.title` | Center footer content (title or short-title) |
| `footer-c` | Slide counter | Right footer showing current/total |

### Config Info Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `subtitle` | Subtitle text |
| `short-title` | Short title for footer display |
| `author` | Author name(s) |
| `date` | Presentation date (e.g., `datetime.today()`) |
| `institution` | Institution name (e.g., `"山东大学"`) |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Cover page with SDU crest, title images, and branding |
| Outline slide | `#outline-slide(title)` | Table of contents; accepts title argument (e.g., `"Outline"`) and optional `column` parameter |
| Section slide | `= Heading` or `#new-section-slide(...)` | Section divider slide |
| Content slide | `== Heading` | Regular content slide with header/footer; use the package `slide(composer: ...)` API or native `grid` for explicit columns |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color |
| Ending slide | `#ending-slide(title: [...])` | Closing/thank-you slide with optional title |
| Matrix slide | `#matrix-slide(columns: N, rows: N)[...][...]` | Grid layout slide for structured content |
| Custom slide | `#slide(...)` | Explicit package slide; do not nest it under `== Heading` merely to create columns |

### Outline Slide Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | `[Outline]` | Outline page title |
| `column` | `2` | Number of columns for the outline |
| `marker` | `auto` | Custom outline bullet marker |

### Matrix Slide Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `columns` | `none` | Number of grid columns |
| `rows` | `none` | Number of grid rows |

## Color Scheme

| Color Token | Value | Usage |
|-------------|-------|-------|
| `primary` / `sdu-red` | `#880000` (SDU Red) | Headers, accents, focus slides, title elements |
| `primary-dark` | `#880000` | Dark emphasis (same as primary) |
| `secondary` | `#ffffff` | Light backgrounds |
| `neutral-lightest` | `#ffffff` | White backgrounds |
| `neutral-darkest` | `#000000` | Primary text |

### Additional Theme Colors

| Color Name | Value | Usage |
|------------|-------|-------|
| `themeblue` | `#4285f4` | Informational highlights |
| `themegreen` | `#34a853` | Success indicators |
| `themeyellow` | `#fbbc05` | Warning elements |
| `themered` | `#ea4335` | Alert elements |

## University Branding Features

- **SDU Crest**: University crest/校徽 via `img/sdu.png` on title and branding elements
- **Title Images**: `img/sdu-title.png` and `img/word.png` on the title slide
- **SDU Red**: Official brand color `#880000` (山大标准红色) used throughout
- **Header**: Displays current section heading fitted to slide width
- **Three-Part Footer**: Author (left), title (center), slide number (right)
- **Chinese Region**: Auto-sets text region to "CN" for Chinese locale

## Advanced Features

### Themed Content Blocks

```typst
#tblock(title: [Theorem])[
  Content here...
]
```

### Matrix Layout

```typst
#matrix-slide(columns: 2, rows: 2)[
  Cell 1
][
  Cell 2
][
  Cell 3
][
  Cell 4
]
```

### Custom Outline

```typst
#outline-slide("Table of Contents")
```

### Ending Slide

```typst
#ending-slide(title: [Thank You!])
```

### Animation (Touying Features)

- `#pause` — Incremental content reveal
- `#uncover("2-")[...]` — Reveal with space reservation
- `#only("2-")[...]` — Reveal without space reservation
- `#alternatives[...][...]` — Choose among alternatives per sub-slide

### Handout Mode

Touying's handout mode is supported for generating printable versions without animations.

## Recommended Font Configuration

The theme supports custom fonts. Place fonts in a `fonts` directory and configure:

```typst
#set text(font: "Your Font Name")
```

## Universe Link

[sdu-touying-simpl on Typst Universe](https://typst.app/universe/package/sdu-touying-simpl)
