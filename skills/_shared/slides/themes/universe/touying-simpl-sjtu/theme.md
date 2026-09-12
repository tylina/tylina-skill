# Touying SJTU Simpl

**Type**: University theme
**Package**: `@preview/touying-simpl-sjtu:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `sjtu-theme`
**Style**: institutional, academic, Chinese
**Primary color**: SJTU Red `#C9141E`
**University**: Shanghai Jiao Tong University (上海交通大学), Shanghai, China
**Best For**: Shanghai Jiao Tong University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-simpl-sjtu).

## Description

A Touying slide theme designed for Shanghai Jiao Tong University (SJTU), built on top of the Touying Dewdrop theme. This theme features SJTU's signature red color scheme, university gate imagery, and comprehensive visual identity integration. It supports three navigation modes (mini-slides, sidebar, or none), two title slide variants (standard white and red), and two ending slide variants. The theme includes full Chinese language support and is ideal for academic presentations, lectures, and thesis defenses at SJTU.

Developed by the SJTUG (SJTU Linux User Group) community.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-sjtu:0.1.0": *

#set text(lang: "zh")

#show: sjtu-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides",
  font: ("Libertinus Serif", "Noto Serif SC", "Songti SC"),
  config-common(breakable: false),
  config-info(
    title: [基于 Touying 的上海交通大学学术报告],
    subtitle: [副标题],
    author: [SJTUG],
    date: datetime.today(),
    institution: [上海交通大学],
  ),
)

#title-slide()

#outline-slide(depth: 1)

= 第一部分

== 第一页

正文内容。
```

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `navigation` | `"mini-slides"` | Navigation mode: `"mini-slides"`, `"sidebar"`, or `none` |
| `font` | `("Libertinus Serif", "Noto Serif CJK SC")` | Font family tuple |
| `primary` | `rgb("#C9141E")` | Primary theme color (SJTU Red) |
| `alpha` | `40%` | Transparency for secondary elements |
| `footer` | `none` | Custom footer content (can be a callback `self => ...`) |
| `footer-right` | Slide counter | Right footer showing `N / Total` |
| `subslide-preamble` | `none` | Content prepended to each sub-slide |

### Sidebar Parameters (when `navigation: "sidebar"`)

| Parameter | Default | Description |
|-----------|---------|-------------|
| `sidebar.width` | `10em` | Sidebar width |
| `sidebar.filled` | `false` | Whether sidebar is filled |
| `sidebar.numbered` | `false` | Show section numbers in sidebar |
| `sidebar.indent` | `.5em` | Sidebar text indentation |
| `sidebar.short-heading` | `true` | Use short heading text |

### Mini-Slides Parameters (when `navigation: "mini-slides"`)

| Parameter | Default | Description |
|-----------|---------|-------------|
| `mini-slides.height` | `4em` | Height of the mini-slides navigation bar |
| `mini-slides.x` | `2em` | Horizontal offset |
| `mini-slides.display-section` | `false` | Show section names |
| `mini-slides.display-subsection` | `true` | Show subsection indicators |
| `mini-slides.short-heading` | `true` | Use short heading text |

### Config Info Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `subtitle` | Subtitle text |
| `author` | Author name(s) |
| `date` | Presentation date |
| `institution` | Institution name |

## Available Slide Types

| Slide Type | Syntax | Description |
|------------|--------|-------------|
| Title slide | `#title-slide()` | White-background title page with SJTU branding |
| Title slide (red) | `#title-slide-red()` | Red-themed title page with photo background |
| Outline slide | `#outline-slide()` | Table of contents page |
| Section heading | `= Heading` | Section divider with mini-slides navigation |
| Content slide | `== Heading` | Regular content slide |
| Focus slide | `#focus-slide[...]` | Full-screen emphasis slide with primary color fill |
| End slide | `#end-slide[...]` | White ending slide with SJTU logo |
| End slide (red) | `#end-slide-red[...]` | Red-themed ending slide with background image |
| Custom slide | `#slide(...)` | Explicit slide with layout options |
| Appendix | `#show: appendix` | Freezes slide numbering for appendix |

For longer decks, pass `depth: 1` to `outline-slide` so the section list stays on one page. Before focus or ending slides, set an unoutlined heading such as `== Closing <touying:unoutlined>` so mini-slide navigation does not repeat the previous content heading.

## Color Scheme

| Color Token | Value | Usage |
|-------------|-------|-------|
| `primary` | `#C9141E` (SJTU Red) | Headers, accents, navigation, focus slides |
| `neutral-darkest` | `#000000` | Primary text |
| `neutral-dark` | `#202020` | Secondary text |
| `neutral-light` | `#f3f3f3` | Light backgrounds |
| `neutral-lightest` | `#ffffff` | White backgrounds |

## University Branding Features

- **SJTU Logo**: Multiple variants for different contexts
  - Color logo for white backgrounds (title slide header)
  - White logo for red backgrounds (red title slide)
  - Vertical logo for end slides
- **SJTU Gate**: University gate image used in mini-slides header and section dividers
- **Background Images**: Campus photography for red title/end slide variants
- **Navigation**: Mini-slides bar with SJTU gate branding at the left
- **Footer**: Customizable with callback function for dynamic content

## Advanced Features

### Two-Column Layout

```typst
#slide(composer: (1fr, 1fr))[
  Left column content
][
  Right column content
]
```

### Custom Footer

```typst
#show: sjtu-theme.with(
  footer: self => self.info.institution,
)
```

### Animation

- `#pause` — Incremental content reveal
- `#meanwhile` — Simultaneous content display
- `#uncover("2-")[...]` — Reveal with space reservation
- `#only("2-")[...]` — Reveal without space reservation
- `#alternatives[...][...]` — Alternative content per sub-slide
- `#touying-equation(...)` — Math with pause support

### Speaker Notes

```typst
#speaker-note[
  Presenter notes here.
]
```

## Universe Link

[touying-simpl-sjtu on Typst Universe](https://typst.app/universe/package/touying-simpl-sjtu)
