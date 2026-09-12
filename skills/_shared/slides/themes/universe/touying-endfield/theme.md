# Touying Endfield

**Type**: Universe (Typst package)
**Package**: `@preview/touying-endfield:0.1.1`
**Touying version**: 0.6.3
**Entry function**: `endfield-theme`
**Style**: Game-inspired, modern, dark-accented
**Primary color**: `#FFFA01` (Endfield yellow)
**Author**: Leo Li
**License**: MIT
**Best For**: Modern presentations, creative talks
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A Touying presentation theme inspired by the art style of *Arknights: Endfield*, a video game by Hypergryph. The theme features a distinctive visual identity with a gradient gray background, topographic contour-map watermark, a signature yellow accent color, and a CMYK-striped footer bar. It supports three navigation modes (sidebar, mini-slides, and none), configurable fonts with CJK fallback chains, and a dark-panel aesthetic for headers, footers, and the title slide. Based on the Dewdrop theme architecture.

**Note**: This theme is not affiliated with Hypergryph. All trademarks are property of their respective owners.

## Quick Start

```typst
#import "@preview/touying:0.6.3": *
#import "@preview/touying-endfield:0.1.1": *

#show: endfield-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [A Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

#outline-slide()

= First Section

== First Slide

Your content here.

#focus-slide[
  Thank you!
]
```

## Theme Parameters

All parameters for the `endfield-theme` entry function:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (e.g. `"16-9"`, `"4-3"`) |
| `navigation` | string | `"mini-slides"` | Navigation mode: `"sidebar"`, `"mini-slides"`, or `"none"` |
| `sidebar` | dictionary | *(see below)* | Sidebar navigation configuration |
| `mini-slides` | dictionary | *(see below)* | Mini-slides navigation configuration |
| `footer` | content/function | `none` | Left footer content; can be a function `self => ...` |
| `footer-right` | content/function | slide counter | Right footer; defaults to yellow slide number + " / total" |
| `primary` | color | `rgb("#FFFA01")` | Primary accent color (Endfield yellow) |
| `alpha` | ratio | `40%` | Transparency for non-active items in navigation outlines |
| `subslide-preamble` | function | *(heading display)* | Function `self => ...` that renders preamble before each subslide; defaults to showing the current heading in bold primary color at 1.2em |

### Sidebar Configuration

The `sidebar` parameter accepts a dictionary with these keys:

| Key | Type | Default | Description |
|---|---|---|---|
| `width` | length | `10em` | Width of the sidebar panel |
| `filled` | boolean | `false` | Whether to show fill dots in the outline |
| `numbered` | boolean | `false` | Whether to show heading numbers |
| `indent` | length | `0.5em` | Indentation for sub-items |
| `short-heading` | boolean | `true` | Use short heading text |
| `paged` | boolean | `false` | Whether to show page numbers in the outline |
| `fill` | content | `repeat[.]` | Fill content between heading and page number |

Example:
```typst
sidebar: (width: 12em, filled: true, indent: 1em)
```

### Mini-Slides Configuration

The `mini-slides` parameter accepts a dictionary with these keys:

| Key | Type | Default | Description |
|---|---|---|---|
| `height` | length/auto | `auto` | Height of the mini-slides bar (`auto` = `2.5em` when inline, `3em` otherwise) |
| `x` | length | `2em` | Horizontal margin for slide content |
| `display-section` | boolean | `false` | Show indicators for section-level slides |
| `display-subsection` | boolean | `true` | Show indicators for subsection-level slides |
| `inline` | boolean | `true` | Display section headings and dots inline (single row) |
| `spacing` | length | `0.2em` | Spacing between slide indicator symbols |
| `short-heading` | boolean | `true` | Use short heading text |
| `current-slide-sym` | symbol | `▾` (`triangle.small.b.filled`) | Symbol for the current slide indicator |
| `other-slides-sym` | symbol | `△` (`triangle.small.t.stroked`) | Symbol for non-current slide indicators |

Example:
```typst
mini-slides: (height: 3em, display-section: true, inline: false, spacing: .5em)
```

### Font Configuration — `config-fonts()`

A dedicated function for font setup. Pass it as a positional argument to `endfield-theme.with(...)`:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `cjk-font-family` | tuple of strings | `("HarmonyOS Sans",)` | CJK font family |
| `latin-font-family` | tuple of strings | `("HarmonyOS Sans",)` | Latin font family |
| `lang` | string | `"en"` | Text language |
| `region` | string | `"us"` | Text region |

Example:
```typst
#show: endfield-theme.with(
  config-fonts(
    cjk-font-family: ("Source Han Sans",),
    latin-font-family: ("Source Sans 3",),
    lang: "zh",
    region: "cn",
  ),
  config-info(...),
)
```

**Default font fallback chain** (when no `config-fonts` is provided):
- **Latin**: `("HarmonyOS Sans", "Source Sans 3", "Noto Sans")`
- **CJK**: `("HarmonyOS Sans SC", "Source Han Sans", "Noto Sans CJK")`
- **Combined**: Latin chain + CJK chain concatenated

### Store Configuration — `config-store()`

Additional internal parameters accessible via `config-store(...)`:

| Key | Type | Default | Description |
|---|---|---|---|
| `title-height` | length | `4em` | Height of the decoration bar on the title slide; increase when titles wrap to multiple lines |

Example (fix multi-line title overflow):
```typst
#show: endfield-theme.with(
  config-store(title-height: 6em),
  config-info(
    title: [A Very Long Presentation Title That Wraps To Multiple Lines],
    ...
  ),
)
```

## Available Slide Types

### Title Slide — `#title-slide()`

Creates the presentation cover page with a dark panel containing the title (with a primary-colored decoration bar), subtitle, author, date, and institution. The slide counter is frozen.

```typst
#title-slide()
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Additional configuration overrides |
| `extra` | content | `none` | Extra content displayed below the institution |

The title slide pulls its content from `config-info(...)`. It features a dark `neutral-dark.darken(50%)` card with a thin primary-colored accent bar on the left side. The title-height of the decoration bar can be adjusted via `config-store(title-height: ...)` if the title wraps to multiple lines.

### Content Slide — `== Heading` or `#slide[...]`

Standard content slides are created automatically when you use level-2 headings (`==`). The heading becomes the slide's preamble title (bold, primary color, 1.2em).

```typst
== My Slide Title

Content goes here.
```

For explicit control or multi-column layouts, use `#slide[...]`:

```typst
// Two-column slide
#slide[
  Left column content
][
  Right column content
]

// Custom column proportions
#slide(composer: (1fr, 3fr))[
  Narrow sidebar
][
  Wide main content
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `repeat` | auto/int | `auto` | Number of subslides for animations |
| `setting` | function | `body => body` | Wrapper function applied to the slide body |
| `composer` | auto/array | `auto` | Column layout specification (e.g. `(1fr, 2fr)`) |

### Section Slide — `= Heading`

Level-1 headings (`=`) automatically create section divider slides showing the section title on the left (bold, 1.2em) and a progressive outline on the right, with non-current sections faded by the `alpha` parameter.

```typst
= My Section Title
```

The section divider includes the header and footer appropriate to the current navigation mode.

### Outline Slide — `#outline-slide()`

Displays a full table of contents with all sections using an adaptive two-column layout: the title on the left and the outline on the right.

```typst
#outline-slide()
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `title` | content/function | *(i18n "Outline")* | Title displayed beside the outline; defaults to localized "Outline" text |

### Focus Slide — `#focus-slide[...]`

A full-screen emphasis slide with the primary color as background and large centered bold text. The slide counter is frozen. No header or footer is shown.

```typst
#focus-slide[
  Key Takeaway
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |

### Page Break — `#pagebreak()`

Creates a new slide within the same subsection (no new heading preamble).

```typst
== Long Topic

First page of content.

#pagebreak()

Continued content (same heading).
```

## Color Scheme

The theme uses a six-color palette configured via `config-colors`:

| Color Name | Default Value | Usage |
|---|---|---|
| `primary` | `rgb("#FFFA01")` | Accent bar, heading preamble, navigation highlights, focus slide background, sidebar active item, footer line |
| `neutral-darkest` | `rgb("#191919")` | Body text, headings |
| `neutral-dark` | `rgb("#7C7C7C")` | Dark panels (header/footer/sidebar), darkened further by `.darken(50%)` |
| `neutral` | `rgb("#828282")` | Mid-tone neutral |
| `neutral-light` | `rgb("#D9D9D9")` | Footer text |
| `neutral-lightest` | `rgb("#E6E6E6")` | Title text on dark panels, sidebar text |

### Page Background

The slide background is a linear gradient from light gray to slightly darker gray with a topographic contour-map SVG watermark at the bottom:
```
fill: gradient.linear(angle: 90deg, rgb("#e6e6e6").lighten(20%), rgb("#e6e6e6").darken(20%))
background: place(bottom, image("contour_map.svg", width: 100%))
```

### Footer Design

The footer has a distinctive multi-colored line above a dark panel:
- **Non-sidebar mode**: A sequence of colored line segments — dark neutral (2em), cyan CMYK (2em), magenta CMYK (2em), then primary color for the remainder
- **Sidebar mode**: A single primary-colored line spanning the full width
- The footer panel shows the left footer content and a right-aligned slide counter (yellow number + " / total" at smaller size)

### Example Color Overrides

```typst
// Default: Endfield yellow
primary: rgb("#FFFA01")

// Cyan accent
primary: rgb("#00C8FF")

// Green accent
primary: rgb("#00FF88")

// Orange accent
primary: rgb("#FF8800")
```

## Navigation Modes

### Mini-Slides (`navigation: "mini-slides"`) — Default

Displays a dark navigation bar at the top of each slide with section headings and triangle indicators for each slide. The current slide gets a filled downward triangle (`▾`); other slides show a stroked upward triangle (`△`). The current section is highlighted; others are faded by the `alpha` parameter. Content margin is set by `mini-slides.x` (default: `2em`).

### Sidebar (`navigation: "sidebar"`)

Displays a dark progressive-outline panel on the left side of each slide. The current section and subsection are highlighted in the primary color; others are displayed in light neutral color with reduced opacity. The sidebar width (default: `10em`) reduces the available content area via left margin.

### No Navigation (`navigation: "none"`)

Disables all navigation elements. Content uses the default `mini-slides.x` (`2em`) horizontal margin with `2em` top/bottom margins. The CMYK-striped footer still appears.

## Recommended Fonts

| Font | Notes |
|---|---|
| **HarmonyOS Sans** | Default; good CJK support. Has known stretch metadata issues (see below) |
| **Source Sans 3** | Recommended Latin alternative to avoid HarmonyOS issues |
| **Source Han Sans** | Recommended CJK alternative |
| **Noto Sans / Noto Sans CJK** | Fallback fonts in the default chain |
| **Gilroy** | Commercial font; can be used for focus slides for emphasis |

## Known Issues

1. **HarmonyOS Sans font stretch bug**: The font has non-standardized stretch metadata causing Typst to use condensed variants for "light" weight. `#text(stretch: 100%)` does not fix it since the condensed variant reports `stretch: 1000`. Workarounds: use Source Sans / Source Han Sans, uninstall condensed series, or await Typst fix (typst/typst#2917, typst/typst#2098).

2. **Sidebar/mini-slides overflow**: Navigation components do not adapt responsively to large numbers of slides/sections. The sidebar does not change outline depth or text size — it overflows. Mini-slides have similar limitations. This stems from Touying's built-in `custom-progressive-outline` and `mini-slides` components. Partial fix for mini-slides: set a larger `height` value.

3. **Title slide decoration bar**: The accent bar does not adapt to multi-line titles. Fix by setting a larger `title-height` in `config-store(title-height: 6em)`.

## Universe Link

[touying-endfield on Typst Universe](https://typst.app/universe/package/touying-endfield)
[Source on GitHub](https://github.com/leostudiooo/typst-touying-theme-endfield)
