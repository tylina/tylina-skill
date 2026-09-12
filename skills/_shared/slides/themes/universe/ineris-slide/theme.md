# INERIS Slide Theme

**Type**: Institutional / Research Institute
**Package**: `@preview/ineris-slide:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `ineris-slideshow`
**Style**: Institutional, French research institute, industrial safety
**Primary color**: INERIS brand palette (institutional blue/green)
**Institution**: INERIS — Institut National de l'Environnement Industriel et des Risques, France
**Best For**: INERIS institute
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/ineris-slide).

## Description

The INERIS Slide theme is an officially affiliated Touying presentation template
designed to follow the visual identity standards of INERIS — the French National
Institute for Industrial Environment and Risks. INERIS is a public research
institute dedicated to industrial and environmental risk prevention. The theme
provides branded title slides, outline slides, matrix (checkerboard) slides,
focus slides, styled tables, and focus blocks. It uses the Marianne font (the
official French government typeface) with a sans-serif fallback. The theme
author (François Hissel) is verified as affiliated with INERIS.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/ineris-slide:0.1.0": *

#show: ineris-slideshow.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
  ),
)

#title-slide()

= First Section

== First Slide

Your content here.
```

## Theme Parameters

The `ineris-slideshow` function accepts the following parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio |

### config-info() Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | String or content | Document title |
| `subtitle` | String or content | Document subtitle |
| `author` | String or array | Author name(s) |
| `date` | `datetime` or `auto` | Presentation date |

## Available Slide Types

### `#title-slide()`
Opening title slide with INERIS visual identity. Displays the title, subtitle,
author(s), and date using metadata from `config-info()`. Follows INERIS brand
guidelines for layout and color.

### `= Heading` (Section slide)
Level-1 headings create section slides for structuring the presentation.

### `== Heading` (Content slide)
Level-2 headings create standard content slides for regular presentation
content.

### `#outline-slide()`
Table of contents slide showing all section headings. Provides an overview of
the presentation structure.

### `#focus-slide[...]`
Full-screen emphasis slide displaying a single piece of text in large font on
a colored background. Ideal for key takeaways, quotes, or transition messages.

### `#matrix-slide(title: [...], columns: n, rows: n, reversed: false)[...][...]`
Checkerboard-style layout with alternating colors. Each content block fills one
cell in the grid. Parameters:

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | Content | Slide title |
| `columns` | Integer | Number of columns (e.g., `2`) |
| `rows` | Integer | Number of rows (e.g., `4`) |
| `reversed` | Boolean | Reverse the color alternation (default `false`) |

Example:
```typst
#matrix-slide(title: [Comparison], columns: 2, rows: 2)[
  Cell 1 content
][
  Cell 2 content
][
  Cell 3 content
][
  Cell 4 content
]
```

## Color Scheme

The theme uses INERIS institutional colors for:
- Table title row backgrounds and stroke colors
- Checkerboard alternating cells in matrix slides
- Focus slide backgrounds
- Focus block framing and backgrounds

The specific palette follows INERIS brand guidelines as defined in the
institutional visual identity standards.

## Branding Features

- **INERIS visual identity**: Template follows official design standards of
  the French institute for industrial environment and risks
- **Official affiliation**: The package author is verified as connected to INERIS
- **Marianne font**: Uses the Marianne typeface (official French government font)
  when installed; falls back to a sans-serif font otherwise
- **Institutional styling**: Consistent use of INERIS brand colors across all
  slide types and content elements

## Content Helpers

### `#styled-table(..args)`
A styled table following INERIS design guidelines. Accepts the same arguments
as Typst's built-in `table` command. The title row uses the main palette color
as background, and line strokes use the institutional color:

```typst
#styled-table(
  columns: 3,
  table.header([*Parameter*], [*Value*], [*Unit*]),
  [Temperature], [850], [°C],
  [Pressure], [1.2], [bar],
  [Flow rate], [500], [m³/h],
)
```

### `#focus-block(title, ..args)`
A framed block with a title and content area. Uses a distinct background color
to stand out from the surrounding slide content. Suitable for highlighting
important information, warnings, or key findings:

```typst
#focus-block([Safety Recommendation])[
  All storage tanks must be equipped with pressure relief valves
  rated for the maximum anticipated operating pressure.
]
```

## Animation Support

- `#pause` — progressive content reveal
- Standard Touying animation functions (`#uncover`, `#only`, `#alternatives`)
- `#speaker-note[...]` — hidden speaker notes

## Font Requirements

The **Marianne** font is preferred for official INERIS presentations:
- Marianne is the official French government typeface
- If Marianne is not installed, the theme falls back to a system sans-serif font
- Presentations will render correctly without Marianne, but may not match
  official INERIS brand guidelines exactly

The repository demo supplies a local `config-methods(init: ...)` compatibility
override using installed Arial while preserving the package's list, enum, and
heading setup. Remove that override only when Marianne (or the package's Linux
Biolinum fallback) is installed.

For a 2×2 `#matrix-slide`, the demo declares a short empty final grid row. This
keeps the package footer legible instead of placing black footer text over a
dark checkerboard cell.

## Universe Link

[ineris-slide on Typst Universe](https://typst.app/universe/package/ineris-slide)
