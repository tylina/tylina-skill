# Touying Quick

**Type**: Universe (Typst package)
**Package**: `@preview/touying-quick:0.4.2`
**Touying version**: 0.7.1 (owned by the Universe package)
**Minimum Typst version**: 0.14.0
**Entry function**: `touying-quick`
**Style**: Academic, quick-start, TOML-configurable
**Base theme**: Metropolis (via `themes.metropolis`)
**Primary color**: `#001aff` (blue theme) or `#af4343` (red theme)
**Author**: ivaquero
**License**: MIT
**Best For**: Quick academic reports
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Touying Quick is a quick-start presentation template built on top of the Touying Metropolis theme, designed specifically for academic reports. Unlike most Touying themes that use inline `config-*()` calls, Touying Quick uses a unique **TOML-based configuration system** for fonts, colors, sizes, spacing, and localization. It features built-in background images, two color themes (blue and red), automatic title and ending slides, a table of contents, `theorion` theorem blocks, `codly` code highlighting, and full Chinese/English bilingual support.

## Key Differences from Standard Touying Themes

Touying Quick has a **different API** from most Touying themes:

1. **No `config-info()` wrapper** — metadata is passed via `info` (a TOML dictionary) or directly as `title`/`subtitle` parameters
2. **No `config-colors()` wrapper** — colors are selected via the `theme` string parameter (e.g., `"blue"`, `"red"`)
3. **TOML-driven configuration** — fonts, sizes, spacing, colors, and localization are all defined in TOML files and passed as dictionaries
4. **Automatic slide generation** — title slide, outline, and ending slide are generated automatically (no need to call `#title-slide()` manually)
5. **Background images** — supports built-in background images (`bgsky`, `bghexagon`, `bgbook`)
6. **Only `@preview/touying-quick` import needed** — the package re-exports everything from touying and metropolis internally

## Quick Start

```typst
#import "@preview/touying-quick:0.4.2": *

// Avoid repeating the native outline title beneath the Metropolis header.
#let clean-names = {
  let names = default-names
  names.sections.en.outline = none
  names
}

#show: touying-quick.with(
  title: "My Presentation",
  subtitle: "Academic Report",
  theme: "blue",
  info: default-info,
  styles: default-styles,
  names: clean-names,
  lang: "en",
)

= First Section

== First Slide

Your content here.

= Second Section

== Another Slide

More content.
```

`touying-quick:0.4.1` passes the same outline title to native `outline()` that Metropolis displays in the slide header. Setting the active language's `outline` value to `none` avoids a redundant, partially obscured body title while retaining the outline entries.

For a custom-composer slide, call the package's `#slide(title: [...], composer: ...)` directly. Do not put a `==` heading immediately before it: the heading already creates a normal slide, so the subsequent composer call would create an unintended continuation page.

Note: You do **not** need to import `@preview/touying` separately. The `touying-quick` package re-exports everything from `touying:0.6.3`, `themes.metropolis`, `codly:1.3.0`, and `theorion:0.5.0`.

## Theme Parameters

All parameters for the `touying-quick` entry function:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | string | `""` | Presentation title, displayed on the auto-generated title slide |
| `subtitle` | string | `""` | Presentation subtitle; if empty, falls back to `info.series` |
| `heading-idx` | boolean | `true` | Enable automatic heading numbering (`1.1.` format) |
| `bgimg` | string | `bgsky` | Background image; accepts `bgsky`, `bghexagon`, `bgbook`, or a custom image path |
| `theme` | string | `"blue"` | Color theme name; available values: `"blue"`, `"red"` |
| `info` | dictionary | `default-info` | Presentation metadata (author, institution, footer, etc.) loaded from TOML |
| `styles` | dictionary | `default-styles` | Typography configuration (fonts, sizes, spacing, colors) loaded from TOML |
| `names` | dictionary | `default-names` | Localized element names (sections, blocks) loaded from TOML |
| `lang` | string | `"en"` | Language code; overridden by `info.lang` internally. Built-in: `"en"`, `"zh"` |

### Background Images

Three built-in background images are provided as constants:

| Constant | Description |
|---|---|
| `bgsky` | Sky-themed gradient background (default) |
| `bghexagon` | Hexagonal pattern background |
| `bgbook` | Book-themed background |

You can also pass any custom image path string to `bgimg`.

### Color Themes

Two built-in color themes are available, each defining 20 color slots across four families:

| Theme | Primary | Secondary | Tertiary | Neutral |
|---|---|---|---|---|
| `"blue"` | `#001aff` (deep blue) | `#3297df` (sky blue) | `#448C95` (teal) | `#3297df` |
| `"red"` | `#af4343` (crimson) | `#a14848` (dark red) | `#448C95` (teal) | `#3297df` |

Each color family has 5 variants: base, `-light`, `-lightest`, `-dark`, `-darkest`. These map to the Metropolis theme's `config-colors()` system internally.

#### Blue Theme Colors (full)

| Slot | Value | Usage |
|---|---|---|
| `primary` | `#001aff` | Level-1 heading color, title slide accent |
| `primary-light` | `#ff0000` | Alert/highlight accent |
| `primary-lightest` | `#fcbd00` | Light accent (gold) |
| `primary-dark` | `#ffde79` | Dark accent (amber) |
| `primary-darkest` | `#ffc004` | Darkest accent (gold) |
| `secondary` | `#3297df` | Level-2 heading color |
| `tertiary` | `#448C95` | Level-3 heading color |
| `neutral-lightest` | `#fafafa` | Slide background |
| `neutral-dark` | `#202020` | Body text |
| `neutral-darkest` | `#000000` | Pure black |

#### Red Theme Colors (full)

| Slot | Value | Usage |
|---|---|---|
| `primary` | `#af4343` | Level-1 heading color, title slide accent |
| `primary-light` | `#3c51f3` | Alert/highlight accent |
| `primary-lightest` | `#fcbd00` | Light accent (gold) |
| `primary-dark` | `#ecdfba` | Dark accent (cream) |
| `primary-darkest` | `#fcbd00` | Darkest accent (gold) |
| `secondary` | `#a14848` | Level-2 heading color |
| `tertiary` | `#448C95` | Level-3 heading color |
| `neutral-lightest` | `#fafafa` | Slide background |
| `neutral-dark` | `#202020` | Body text |
| `neutral-darkest` | `#000000` | Pure black |

## Info Configuration

The `info` parameter is a TOML dictionary with presentation metadata. The default (`default-info`) has all empty strings except `lang: "en"`.

| Key | Type | Default | Description |
|---|---|---|---|
| `author` | string | `""` | Author name, displayed on the title slide |
| `institution` | string | `""` | Institutional affiliation, displayed on the title slide |
| `series` | string | `""` | Series/course name; used as subtitle fallback when `subtitle` is empty |
| `footer` | string | `""` | Footer text displayed at the bottom of every slide |
| `header` | string | `""` | Present in the TOML schema but not consumed by package version 0.4.1 |
| `ending` | string | `""` | Text for the auto-generated ending slide (e.g., "Thanks for Your Attention") |
| `lang` | string | `"en"` | Language code; this overrides the top-level `lang` parameter |

### Example Custom Info

```typst
// Option 1: Inline dictionary
#let my-info = (
  author: "Jane Doe",
  institution: "MIT",
  series: "Advanced Topics in AI",
  footer: "MIT CSAIL",
  header: "",
  ending: "Thank You!",
  lang: "en",
)

#show: touying-quick.with(
  title: "Neural Architecture Search",
  info: my-info,
  ...
)

// Option 2: Load from TOML file
#let my-info = toml("my-info.toml").default
```

## Styles Configuration

The `styles` parameter is a TOML dictionary controlling typography. It has four sections: `fonts`, `sizes`, `spaces`, and `colors`.

### Fonts (`styles.fonts.<lang>`)

Font families are organized by language. Built-in configurations exist for `en` (English) and `zh` (Chinese).

#### English Fonts (`styles.fonts.en`)

| Key | Default | Used For |
|---|---|---|
| `title` | `"Palatino"` | Title slide title text |
| `subtitle` | `"Palatino"` | Title slide subtitle text |
| `author` | `"Times New Roman"` | Author name on title slide |
| `footer` | `"Georgia"` | Footer text on all slides |
| `contents` | `"Georgia"` | Table of contents text |
| `context` | `"Georgia"` | Body content text |
| `math` | `"Times New Roman"` | Mathematical expressions |
| `ending` | `"Palatino"` | Ending slide text |

#### Chinese Fonts (`styles.fonts.zh`)

| Key | Default | Used For |
|---|---|---|
| `title` | `"STKaiti"` | Title slide title |
| `subtitle` | `"STKaiti"` | Title slide subtitle |
| `author` | `"Kaiti SC"` | Author name |
| `footer` | `"Songti SC"` | Footer text |
| `contents` | `"Songti SC"` | Table of contents |
| `context` | `"Songti SC"` | Body content |
| `math` | `"Kaiti SC"` | Mathematical expressions |
| `ending` | `"STKaiti"` | Ending slide |

### Sizes (`styles.sizes`)

All sizes are in `pt` (applied as `value * 1pt`).

| Key | Default | Used For |
|---|---|---|
| `title` | `40` | Title slide title |
| `subtitle` | `18` | Title slide subtitle |
| `author` | `14` | Author name |
| `heading-1` | `16` | Level-1 heading text |
| `heading-2` | `14` | Level-2 heading text |
| `heading-3` | `12` | Level-3 heading text |
| `heading-4` | `10.5` | Level-4 heading text |
| `context` | `10.5` | Body text |
| `footer` | `10` | Footer text |
| `ending` | `50` | Ending slide text |

### Spaces (`styles.spaces`)

All spacing values are in `em` (applied as `value * 1em`).

| Key | Default | Used For |
|---|---|---|
| `par-indent` | `2` | First-line paragraph indentation |
| `par-leading` | `1` | Line spacing within paragraphs |
| `par-spacing` | `1` | Spacing between paragraphs |
| `list-indent` | `1.2` | Indentation for list and enum items |
| `block-above` | `1` | Space above block elements |
| `block-below` | `1` | Space below block elements |
| `contents-indent` | `2` | Table of contents indentation (in pt) |

Note: `par-indent` uses `all: true` for Chinese (`zh`) language, meaning all lines are indented, not just the first.

### Colors (`styles.colors.<theme>`)

See the [Color Themes](#color-themes) section above. Colors are defined per-theme with 20 slots across 4 families.

## Names Configuration

The `names` parameter provides localized names for structural elements. Built-in support for English (`en`) and Chinese (`zh`).

### Section Names (`names.sections.<lang>`)

| Key | English | Chinese | Description |
|---|---|---|---|
| `outline` | `"Contents"` | `"主要内容"` | Title for the table of contents slide |

### Block Names (`names.blocks.<lang>`)

| Key | English | Chinese | Description |
|---|---|---|---|
| `algorithm` | `"Algorithm"` | `"算法"` | Algorithm block supplement |
| `table` | `"Table"` | `"表"` | Table figure supplement |
| `figure` | `"Figure"` | `"图"` | Figure supplement |
| `equation` | `" Eq. "` | `"式 "` | Equation reference prefix |
| `rule` | `"Rule"` | `"法则"` | Rule block supplement |
| `law` | `"Law"` | `"定律"` | Law block supplement |

### Adding a New Language

To add French support, create a custom names TOML:

```toml
[sections.fr]
outline = "Sommaire"

[blocks.fr]
algorithm = "Algorithme"
table = "Tableau"
figure = "Figure"
equation = " Éq. "
rule = "Règle"
law = "Loi"
```

Load it and merge with defaults:

```typst
#let my-names = toml("my-names.toml")
#show: touying-quick.with(lang: "fr", names: my-names, ...)
```

## Available Slide Types

### Title Slide (automatic)

The title slide is **automatically generated** — you do not need to call `#title-slide()`. It is created at the beginning of the presentation using `title`, `subtitle`, `info.author`, and `info.institution`. Package version 0.4.1 supplies `datetime.today()` and `emoji.school` directly; date and logo are not exposed as `touying-quick` parameters.

If `subtitle` is empty, it falls back to `info.series`.

### Outline Slide (automatic)

A table of contents slide is **automatically generated** after the title slide. It uses `names.sections.<lang>.outline` as the native outline title and respects `styles.spaces.contents-indent` for indentation. The outline shows only `depth: 1` (top-level sections). With package version 0.4.1, the recommended local setup is `outline: none` for the active language because Metropolis already owns the header region; this prevents a duplicated body title from sitting beneath the header.

### Section Slide — `= Heading`

Level-1 headings (`=`) create section divider slides using the Metropolis theme's built-in section slide styling. These reset the equation counter for chapter-relative numbering.

```typst
= Introduction

= Methodology

= Results
```

### Content Slide — `== Heading`

Level-2 headings (`==`) create regular content slides. The heading becomes the slide title. Content supports all Typst features.

```typst
== My Slide Title

Content with *bold*, _emphasis_, and `code`.

- Bullet points
- With $math$ support
```

### Ending Slide (automatic)

An ending slide is **automatically generated** at the end of the presentation. It displays the `info.ending` text centered on the slide using the ending font and size from styles. This slide uses a hidden heading (`<touying:hidden>`) to avoid appearing in the outline.

### Focus Slide — `#focus-slide[...]`

Inherited from the Metropolis theme. Displays a full-screen emphasis slide with the primary color background and large centered text.

```typst
#focus-slide(config: config-page(background: none))[
  Key Insight
]
```

The explicit `background: none` override is important when `bgimg` is enabled: the package's document-wide page background otherwise covers Metropolis's dark focus-slide fill and leaves its light text with insufficient contrast.

### Explicit Slide — `#slide[...]`

For full control over slide content and layout. Inherited from Metropolis/Touying.

```typst
#slide[
  Custom slide content without a heading.
]

// Multi-column
#slide(composer: (1fr, 1fr))[
  Left column
][
  Right column
]
```

The package entry function does not forward arbitrary `config-common(...)` arguments to Metropolis. Keep dense content bounded by splitting it across intentional `==` slides; do not rely on automatic continuation pages for admonition stacks, long code samples, or recap lists.

## Heading Mapping

| Heading Level | Behavior |
|---|---|
| `= Heading` | Creates a section divider slide; resets equation counter |
| `== Heading` | Creates a content slide with the heading as title |
| `=== Heading` | Sub-heading within a content slide (level-3, 12pt) |
| `==== Heading` | Sub-sub-heading within a content slide (level-4, 10.5pt) |

When `heading-idx: true` (default), all headings are automatically numbered in `1.1.` format.

## Reusable Components

### Admonition Blocks (from `theorion`)

The package re-exports `theorion` blocks as convenient aliases:

| Function | Description |
|---|---|
| `#tip[...]` | Tip/suggestion admonition block |
| `#note[...]` | Informational note block |
| `#quote[...]` | Quotation block |
| `#warning[...]` | Warning admonition block |
| `#caution[...]` | Caution/danger admonition block |

```typst
#tip[
  Use `heading-idx: true` to enable automatic numbering.
]

#warning[
  The `info.lang` value overrides the top-level `lang` parameter.
]
```

### Three-Line Table — `#tableq`

Academic-style three-line table (top rule, header separator, bottom rule; no vertical strokes).

```typst
#tableq(
  (
    ([*Method*], [*Precision*], [*Recall*]),
    ([Baseline], [0.72], [0.68]),
    ([Proposed], [*0.89*], [*0.85*]),
  ),
  3,  // number of columns
  inset: 0.3em,
  stroke-color: rgb("000"),
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `data` | array | *(required)* | Array of row arrays, each containing cell content |
| `k` | integer | *(required)* | Number of columns |
| `inset` | length | `0.3em` | Cell padding |
| `stroke-color` | color | `rgb("000")` | Rule/stroke color |

### Table Stroke Helpers

| Function | Description |
|---|---|
| `table-three-line(stroke-color)` | Returns a stroke function for three-line tables |
| `table-no-left-right(stroke-color)` | Returns a stroke function with no left/right borders |

### Code Block — `#code`

Styled code block wrapper with background and border.

```typst
#code("print('hello')", lang: "python")
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `text` | string | *(required)* | Code content as a string |
| `lang` | string | `"python"` | Language for syntax highlighting |
| `breakable` | boolean | `true` | Allow page breaks within the block |
| `width` | length | `100%` | Block width |

### Chinese Math Text — `#ctext`

Wrapper for rendering text using the Chinese math font.

```typst
$#ctext[中文数学]$
```

### Bibliography Helper — `#bibx`

Manages multiple bibliographies to prevent duplication.

```typst
#bibx(bibliography("refs.bib"), main: true)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `bib` | content | *(required)* | Bibliography content |
| `main` | boolean | `false` | Whether this is the main bibliography |

## Equation Numbering

Labeled equations receive automatic chapter-relative numbering in `(chapter.n)` format:

```typst
$ E = m c^2 $ <eq:einstein>

See @eq:einstein for details.
```

The equation counter resets at each level-1 heading (section). Cross-references use the localized equation name from `names.blocks.<lang>.equation`.

## Code Highlighting

Raw code blocks (```` ```lang ... ``` ````) are automatically styled using `codly` with:

- Fill color: `#F2F3F4`
- No zebra striping
- Inset: `0.3em`
- Border radius: `0.5em`
- No display name

## Figure and Table Captions

- Table captions are positioned at the **top** (above the table)
- Figure captions show only the body text (default supplement is stripped)
- Links are automatically underlined

## Bundled Packages

The theme automatically imports and makes available:

| Package | Version | Purpose |
|---|---|---|
| `touying` | 0.6.3 | Presentation framework (Metropolis theme) |
| `codly` | 1.3.0 | Code block syntax highlighting and decoration |
| `theorion` | 0.5.0 | Theorem environments and admonition blocks |

## Custom TOML Configuration Example

Create your own TOML files for full customization:

### `my-info.toml`
```toml
[default]
author = "Jane Doe"
institution = "Stanford University"
series = "Deep Learning Seminar"
footer = "Stanford CS Department"
header = ""
ending = "Questions?"
lang = "en"
```

### `my-styles.toml`
```toml
[fonts.en]
title = "Inter"
subtitle = "Inter"
author = "Inter"
footer = "Inter"
contents = "Inter"
context = "Inter"
math = "STIX Two Math"
ending = "Inter"

[sizes]
author = 16
title = 44
subtitle = 20
heading-1 = 18
heading-2 = 16
heading-3 = 14
heading-4 = 12
context = 12
footer = 10
ending = 48

[spaces]
par-indent = 0
par-leading = 1.2
par-spacing = 1.2
list-indent = 1.5
block-above = 1.2
block-below = 1.2
contents-indent = 2

[colors.blue]
primary = "#001affff"
primary-light = "#ff0000ff"
primary-lightest = "#fcbd00"
primary-dark = "#ffde79ff"
primary-darkest = "#ffc004ff"
secondary = "#3297df"
secondary-light = "#ff0000"
secondary-lightest = "#3297df"
secondary-dark = "#3297df"
secondary-darkest = "#3297df"
tertiary = "#448C95"
tertiary-light = "#3297df"
tertiary-lightest = "#3297df"
tertiary-dark = "#3297df"
tertiary-darkest = "#3297df"
neutral = "#3297df"
neutral-light = "#3297df"
neutral-lightest = "#fafafa"
neutral-dark = "#202020"
neutral-darkest = "#000000"
```

### Usage

```typst
#import "@preview/touying-quick:0.4.2": *

#let my-info = toml("my-info.toml").default
#let my-styles = toml("my-styles.toml")

#show: touying-quick.with(
  title: "Custom Presentation",
  theme: "blue",
  info: my-info,
  styles: my-styles,
  names: default-names,
  lang: "en",
)
```

## Universe Link

[touying-quick on Typst Universe](https://typst.app/universe/package/touying-quick)
[Source on GitHub](https://github.com/ivaquero/touying-quick)
