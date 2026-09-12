# Simply YSU — Yanshan University Theme

**Type**: University / Institutional
**Package**: `@preview/simply-ysu-touying:0.1.0`
**Touying version**: 0.6.3
**Entry function**: `ysu-theme`
**Style**: Institutional, Academic, Beamer-inspired, Chinese University
**Primary color**: YSU Blue (`#2B69C1`)
**University**: Yanshan University (燕山大学)
**Best For**: Yanshan University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/simply-ysu-touying).

## Description

A Beamer-inspired presentation theme designed for **Yanshan University (YSU)**, a comprehensive
research university located in Qinhuangdao, Hebei Province, with strong programs in mechanical
engineering, materials science, and information technology. The theme features a rich blue color
palette with an extensive set of color tokens, a navigation bar with section highlighting,
configurable four-cell footer, progress bar, watermark support, and university branding with
YSU wordmark, emblem, and watermark assets.

The theme is designed with Chinese-first typography (default language `"zh"`) using Times New Roman
and KaiTi fonts, and includes Chinese fake bold support via the `cuti` package. It provides five
distinct slide types and the `tblock` utility function for theorem-style content blocks.

## Quick Start

```typst
#import "@preview/touying:0.6.3": *
#import "@preview/simply-ysu-touying:0.1.0": *

#show: ysu-theme.with(
  config-common(breakable: false),
  config-info(
    title: [Heavy Equipment Fatigue Life Prediction with Digital Twins],
    author: [Prof. Wang Jianguo],
    institution: [School of Mechanical Engineering],
    date: datetime.today(),
  ),
)

#title-slide()

#outline-slide()

= Introduction

== Research Background

Digital twin technology for industrial equipment monitoring.

- Real-time structural health assessment
- Predictive maintenance scheduling
- Fatigue crack growth modeling
```

## Theme Parameters

The `ysu-theme` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio |
| `align` | `alignment` | `top` | Default content alignment |
| `progress-bar` | `bool` | `true` | Show progress bar below navigation header |
| `footer-columns` | `array` | `(20%, 18%, 1fr, 5em)` | Column widths for 4-cell footer |
| `footer-a` | `function` | Author name | Left footer cell content |
| `footer-b` | `function` | Date display | Second footer cell |
| `footer-c` | `function` | Short title or title | Third footer cell |
| `footer-d` | `function` | Page counter | Right footer cell (current / total) |
| `watermark` | `bool` | `true` | Show YSU watermark in bottom-right corner |
| `..args` | | | Additional arguments forwarded to touying-slides |

### Config Info Parameters

Passed via `config-info(...)`:

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `short-title` | `content` | Abbreviated title for footer (optional) |
| `author` | `content` | Author name(s) |
| `date` | `datetime` / `content` | Presentation date |
| `institution` | `content` | Department or school affiliation |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | Cover page with YSU wordmark, emblem, gradient line, and info box |
| Outline slide | `#outline-slide()` | Table of contents listing all level-1 sections |
| Regular slide | `== Slide Title` | Content slide with nav bar header and four-cell footer |
| Section divider | `= Section Title` | Section transition with YSU watermark, wordmark, and title |
| Ending slide | `#ending-slide()` | Closing slide with emblem, wordmark, and styled title block |

### Ending Slide Options

The ending slide accepts a custom title parameter:

```typst
#ending-slide(title: [Questions?])
```

Default title is "谢谢！" (Thank you!).

## Utility Functions

### `tblock(title, content)`

Creates a styled theorem/content block with a colored title bar, gradient stripe, and
bordered body. Ideal for definitions, theorems, and key results:

```typst
#tblock("Definition (Fatigue Limit)")[
  The fatigue limit $sigma_f$ is the maximum stress amplitude
  below which a material can endure an infinite number of cycles.
]
```

## Color Scheme

The theme provides an extensive multi-level blue color palette:

| Color Token | Hex | Usage |
|-------------|-----|-------|
| `primary` | `#2B69C1` | Main accent — nav bar, headings, accents |
| `primary-light` | `#78A4E7` | Light accent elements |
| `primary-lighter` | `#DCE8FA` | Subtle backgrounds |
| `primary-lightest` | `#F6F9FF` | Very light backgrounds |
| `primary-dark` | `#1F4F94` | Dark accent, emphasis |
| `primary-darker` | `#163A70` | Deep emphasis |
| `primary-darkest` | `#102744` | Very dark backgrounds |
| `secondary` | `#173A72` | Secondary accent |
| `secondary-light` | `#4F78B9` | Secondary light variant |
| `secondary-lighter` | `#DFE9FA` | Secondary subtle background |
| `tertiary` | `#4D88D6` | Tertiary accent |
| `neutral-light` | `#A3AEC2` | Muted UI elements |
| `neutral-lighter` | `#E8EDF6` | Subtle borders |
| `neutral-lightest` | `#FFFFFF` | Slide backgrounds |
| `neutral-dark` | `#344760` | Body text |
| `neutral-darker` | `#22344B` | Dark text emphasis |
| `neutral-darkest` | `#162234` | Headings, strong text |

## University Branding Features

- **YSU Wordmark**: University wordmark image with colored and white variants, displayed
  on title and section slides
- **YSU Emblem**: University seal displayed on title and ending slides
- **Watermark**: Semi-transparent YSU watermark in the bottom-right corner of section
  slides and optionally on content slides (controlled via `watermark` parameter)
- **Gradient Accents**: Gradient line on title slide and gradient stripes in tblock
  components using the blue palette
- **Chinese-First Design**: Default language set to `"zh"` with appropriate fonts

### Asset Structure

Visual assets are stored in `themes/assets/` with the naming pattern `ysu-*`. An
`ASSETS.md` file documents the file inventory, source links, and licensing details.
University-branded assets have separate licensing not covered by the package's MIT license.

## Navigation and Footer

### Navigation Bar

The theme features a navigation bar showing all level-1 sections with the current section
highlighted in the primary color. Inactive sections are displayed with reduced emphasis.

### Progress Bar

When `progress-bar: true` (default), a colored progress bar appears below the navigation
header, indicating the current position within the presentation.

### Four-Cell Footer

The footer is divided into four configurable cells:

```typst
#show: ysu-theme.with(
  footer-columns: (20%, 18%, 1fr, 5em),
  footer-a: self => self.info.author,
  footer-b: self => utils.display-info-date(self),
  footer-c: self => if self.info.short-title != none { self.info.short-title } else { self.info.title },
  footer-d: self => context utils.slide-counter.display() + " / " + utils.last-slide-number,
)
```

## Typography

- Base text size: 22pt
- Default fonts: Times New Roman, KaiTi, STKaiti, LXGW WenKai, Microsoft YaHei, Arial
- Default language: Chinese (`"zh"`)
- Paragraphs: justified (`par(justify: true)`)
- List markers: Radial gradient circles using primary color palette
- Level-3 headings: Colored with `primary`; level-4 with `primary-dark`
- Figure captions: 0.62em; footnote entries: 0.6em
- Table figure captions positioned at top
- Chinese fake bold enabled via `cuti` package

## Usage Notes

- The theme uses Beamer-style naming (`ysu-beamer.typ`) reflecting its LaTeX Beamer heritage
- Set `config-common(breakable: false)` in production decks so an oversized logical slide cannot
  turn into a titleless continuation page. Split dense material or scope it to a readable 17--18pt
  size when necessary.
- `show-strong-with-alert` is disabled; alerts use primary-color highlighting
- Section slides use `new-section-slide` with `numbered: false` by default
- Page margins: top 4.2em, bottom 0.8em, x 2.2em
- For local compilation from a cloned repository:
  ```
  typst compile --root . examples/beamer-ysu.typ
  ```

## Universe Link

[simply-ysu-touying on Typst Universe](https://typst.app/universe/package/simply-ysu-touying)
