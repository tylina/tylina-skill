# Touying Simpres

**Type**: Universe (Typst package)
**Package**: `@preview/touying-simpres:0.1.0`
**Touying package dependency**: 0.6.1 (internal to the universe package)
**Demo Touying import**: package only (re-exported 0.6.1 API)
**Minimum Typst version**: 0.13.1
**Entry function**: `touying-simpres`
**Style**: Clean, straightforward academic and business presentations
**Primary color**: `#003366` (dark navy blue)
**Author**: thy0s
**License**: MIT
**Default font**: Source Sans 3
**Best For**: Education and business presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Touying Simpres ("Simple Presentation") is a clean, no-frills presentation theme designed for education, business, and computer science contexts. It features a colored header bar displaying the slide title (and optionally the current section heading), a footer with a page counter, section divider slides with a progress bar, and a high-contrast focus slide. The theme draws inspiration from the touying University theme, the Metropolis theme, and the clean-math-presentation package by JoshuaLampert. It deliberately keeps configuration minimal — six parameters in total — making it easy to pick up and use immediately.

## Quick Start

```typst
#import "@preview/touying-simpres:0.1.0": *

#show: touying-simpres.with(
  aspect-ratio: "16-9",
  font: "Arial", // replace with a sans-serif font installed on your system
  text-size: 18pt,
  footer: [#datetime.today().display("[year]-[month]-[day]")],
  config-common(breakable: false),
  config-info(
    title: [My Presentation Title],
    subtitle: [A Clear Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [University of Somewhere],
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

The package imports and re-exports its compatible Touying 0.6.1 API. Import the package alone rather than mixing it with a separate Touying version. The package defaults to Source Sans 3; install that family or set `font` to a locally available sans-serif face to avoid fallback warnings. The local demo uses Arial and a slightly smaller body size so every realistic example fits without automatic continuation slides.

## Theme Parameters

All parameters for the `touying-simpres` entry function:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio; supports `"16-9"` or `"4-3"` |
| `lang` | string | `"en"` | Language code (ISO 639) for the presentation |
| `font` | string | `"Source Sans 3"` | Font family used throughout the presentation |
| `text-size` | length | `22pt` | Body text size on content slides |
| `show-level-one` | boolean | `true` | Whether the current section (level-1) heading is displayed on content slide headers |
| `footer` | content/none | `none` | Footer content displayed on the left side of content slides (page counter always appears on the right) |

### Metadata via `config-info`

Presentation metadata is supplied through the `config-info` function inside the `touying-simpres.with()` call:

| Parameter | Type | Description |
|---|---|---|
| `title` | content | Presentation title (displayed on title slide in primary color, bold, 1.5em) |
| `subtitle` | content/none | Subtitle (displayed below title in medium weight) |
| `author` | content/none | Author name |
| `date` | datetime/none | Presentation date (formatted as `[year]-[month]-[day]`) |
| `institution` | content/none | Institutional affiliation |

### Internal Configuration

The theme sets these internal configurations automatically:

| Config | Key | Value |
|---|---|---|
| `config-page` | `paper` | `"presentation-" + aspect-ratio` |
| `config-page` | `margin` | `(top: 3.5em, bottom: 1.5em, x: 2em)` |
| `config-common` | `slide-fn` | `slide` |
| `config-common` | `new-section-slide-fn` | `new-section-slide` |
| `config-methods` | `alert` | Text styled with `self.colors.primary` fill |
| `config-store` | `title` | `none` |
| `config-store` | `footer` | Value from `footer` parameter |
| `config-store` | `show-level-one` | Value from `show-level-one` parameter |

## Available Slide Types

### Title Slide — `#title-slide()`

Creates the presentation cover page using metadata from `config-info`. Displays a centered layout with the title (bold, primary color, 1.5em), subtitle (medium weight), a horizontal rule in the primary color, author, institution, and date. The slide counter is frozen on this slide.

```typst
#title-slide()

// With extra content below the standard metadata:
#title-slide(extra: [Additional information or logos])
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Additional configuration overrides |
| `extra` | content/none | `none` | Extra content block displayed below the date/institution |

**Layout details:**
- Background: `neutral-lightest` (white)
- Title: `size: 1.5em`, `weight: "bold"`, `fill: primary`
- Separator line: `stroke: 2pt + primary`
- Info text: `size: 0.9em`
- Block inset: `2em`

### Content Slide — `== Heading` or `#slide[...]`

Standard content slides are created automatically from level-2 headings (`==`). The heading becomes the slide title displayed in a colored header bar (primary background, white text). When `show-level-one` is `true`, the current section heading also appears above the title in smaller text.

```typst
// Automatic content slide via heading
== My Slide Title

Content goes here with *bold*, _emphasis_, and math: $E = m c^2$

// Explicit slide with per-slide overrides
#slide(
  title: "Custom Title",
  footer: [Local override],
  show-level-one: true,
)[
  Slide content with overridden settings.
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | auto/content | `auto` | Slide title; `auto` uses the current level-2 heading |
| `footer` | auto/content | `auto` | Override the default footer for this slide only |
| `show-level-one` | boolean/none | `none` | Override section heading visibility for this slide (`true`/`false`); `none` uses the theme default |

**Header layout:**
- Background fill: `primary` color
- Section heading (if shown): `size: 0.7em`, white text
- Slide title: `size: 1.8em × 0.7em`, bold, white text

**Footer layout:**
- Custom footer content on the left at `size: 0.7em`
- Slide counter on the right: `"N / total"`

### Section Slide — `= Heading` (automatic)

Level-1 headings (`=`) automatically trigger a section divider slide via the `new-section-slide` function. The slide displays the section title in large primary-colored bold text with a progress bar beneath it showing how far through the presentation you are.

```typst
= Introduction

= Methodology

= Results
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `numbered` | boolean | `true` | Whether to display the heading number |

**Layout details:**
- Padding: `20%` on all sides
- Section title: `size: 1.8em`, `weight: "bold"`, `fill: primary`
- Stack direction: top-to-bottom, spacing: `0.65em`
- Progress bar: `height: 2pt`, fills from `primary` to `secondary` color based on progress

### Outline Slide — `#outline-slide()`

Displays a table of contents for the presentation. Level-1 entries are bold. Uses adaptive columns for layout.

```typst
// Default outline
#outline-slide()

// Custom depth and title (useful for localization)
#outline-slide(depth: 1, title: "Gliederung")
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `depth` | integer | `2` | Maximum heading level to display in the outline |
| `title` | string | `"Outline"` | Title text for the outline slide (override for localization) |

### Focus Slide — `#focus-slide[...]`

A high-contrast emphasis slide with the primary color as background and large centered white text. Ideal for key takeaways, transitions, or dramatic pauses.

```typst
#focus-slide[
  Key Takeaway
]

#focus-slide[
  Any questions?
]
```

| Parameter | Type | Description |
|---|---|---|
| `body` | content | The content to display centered on the slide |

**Layout details:**
- Background fill: `primary` color
- Text: `fill: neutral-lightest` (white), `size: 2em`
- Margin: `2em`
- Alignment: `horizon + center`

## Reusable Components

### `alert` (via `config-methods`)

The theme configures the `alert` method to render text in the primary color. This is automatically applied to bold text (`*text*`) via touying's show rules.

```typst
// Automatic — bold text uses primary color
This is *important* text.

// Manual usage in custom contexts
#(self => text(fill: self.colors.primary)[Highlighted])
```

### Progress Bar (in section slides)

The new-section-slide includes a `components.progress-bar` that visually indicates presentation progress using the `primary` and `secondary` colors. This is built into the section slide and not independently callable.

### Slide Counter (in footer)

Every content slide displays an automatic slide counter in the bottom-right: `"N / total"` format. The counter is frozen on title slides.

### Adaptive Columns (in outline slide)

The outline slide uses `components.adaptive-columns` to automatically distribute the table of contents across columns based on content length.

## Color Scheme

The theme uses a four-color palette configured via `config-colors`:

| Color Name | Default Hex | Visual | Usage |
|---|---|---|---|
| `primary` | `#003366` | Dark navy blue | Header background, title text, section headings, focus slide background, progress bar fill, alert/bold text, separator line |
| `secondary` | `#CCE5FF` | Light blue | Progress bar track color (unfilled portion) |
| `neutral-lightest` | `#FFFFFF` | White | Slide background, header text, focus slide text |
| `neutral-darkest` | `#000000` | Black | Body text, footer text |

### Overriding Colors

You can customize the color scheme by passing `config-colors` to the theme:

```typst
#show: touying-simpres.with(
  config-colors(
    primary: rgb("8B0000"),       // Dark red
    secondary: rgb("FFE4E1"),     // Misty rose
    neutral-lightest: rgb("FFFFFF"),
    neutral-darkest: rgb("1A1A1A"),
  ),
  config-info(
    title: [Red-Themed Presentation],
    ...
  ),
)
```

### Example Color Schemes

```typst
// Default: Navy blue (education/corporate)
primary: rgb("003366"), secondary: rgb("CCE5FF")

// Teal / academic
primary: rgb("006D5B"), secondary: rgb("B2DFDB")

// Burgundy / formal
primary: rgb("800020"), secondary: rgb("F5E6EB")

// Charcoal / minimalist
primary: rgb("2C3E50"), secondary: rgb("D5DBDB")

// Forest green / environmental
primary: rgb("1B5E20"), secondary: rgb("C8E6C9")
```

## Per-Slide Overrides

A distinctive feature of touying-simpres is the ability to override `show-level-one`, `footer`, and `title` on individual slides:

```typst
// Global: hide section headings
#show: touying-simpres.with(
  show-level-one: false,
  footer: none,
  ...
)

// But show section heading on this specific slide
#slide(show-level-one: true, footer: [Special footer], title: "Custom Title")[
  This slide shows the section heading and has a custom left footer.
]
```

## Show Rules

The theme applies minimal show rules. Users can add their own:

```typst
// Recommended show rules (from the template)
#show raw: set text(size: 12pt)
#show figure.caption: set text(size: 10pt)
```

## Tips and Patterns

### Localization

Override the outline title for non-English presentations:

```typst
#outline-slide(title: "Sommaire")    // French
#outline-slide(title: "Gliederung")  // German
#outline-slide(title: "Índice")      // Spanish
```

### Bibliography Slide

Create a references slide with hidden section heading and no footer:

```typst
#heading(outlined: true, depth: 1)[References]
#slide(show-level-one: false, title: "Literature", footer: none)[
  #bibliography("refs.bib", title: none)
]
```

### CeTZ Integration

The template example demonstrates CeTZ figure integration with touying-reducer for animated drawings:

```typst
#import "@preview/cetz:0.5.2"
#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas,
  cover: cetz.draw.hide.with(bounds: true),
)
```

## Design Inspirations

The theme combines ideas from three sources:
- **University theme** from touying — structured academic layout
- **Metropolis theme** from touying — clean header bar design
- **clean-math-presentation** by JoshuaLampert — minimal aesthetics

## Universe Link

[touying-simpres on Typst Universe](https://typst.app/universe/package/touying-simpres)
[Source on GitHub](https://github.com/thy0s/touying-simpres)
