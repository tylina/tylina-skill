# TU Darmstadt Theme (Not TUDaBeamer 2023)

**Type**: Institutional / University
**Package**: `@preview/not-tudabeamer-2023:0.2.1`
**Touying version**: 0.6.1 (embedded by the package)
**Entry function**: `not-tudabeamer-2023-theme`
**Style**: Academic, institutional, German university, corporate design
**Primary color**: Black on white, with gray footer text
**Institution**: Technische Universität Darmstadt (TU Darmstadt), Germany
**Best For**: TU Darmstadt presentations
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/not-tudabeamer-2023).

## Description

The Not TUDaBeamer 2023 theme is an unofficial Typst presentation template
imitating the TU Darmstadt LaTeX beamer 2023 corporate design. It is part of
the tuda-typst-templates project, which also includes thesis and exercise
templates. The theme uses a widescreen layout (13.33 × 7.5 inches), the Roboto
font family, and features uppercase slide titles in a distinctive large bold
style, a header with short title/author and logo, and a three-column footer
with date, department/institute/author, and page number. The theme also provides
a figure-with-copyright helper and a two-column outline slide.

**Important**: This is an unofficial template. Please confirm with your
supervisor whether you may use Typst and this template for your presentation.

## Quick Start

```typst
#import "@preview/not-tudabeamer-2023:0.2.1": *

#show: not-tudabeamer-2023-theme.with(
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    short-title: [Short Title],
    subtitle: [Subtitle],
    author: "Author Name",
    short-author: "Author",
    date: datetime.today(),
    department: [Department of Computer Science],
    institute: [Institute for Applied Research],
    // Use the approved TU Darmstadt asset when available.
    // logo: image("tuda_logo.svg", height: 100%),
    logo: none,
  ),
)

// Package-boundary compatibility for systems without Roboto.
// Remove this rule after installing Roboto for exact corporate typography.
#show text: set text(
  font: "Arial",
  fallback: true,
)

#title-slide()

#outline-slide()

= First Section

== First Slide

Your content here.
```

The font compatibility rule intentionally follows the theme show rule. Version
0.2.1 hard-codes `Roboto` with `fallback: false` inside the external package;
an earlier outer rule cannot reliably reach every generated header/footer node.
Install Roboto and remove the compatibility rule for exact corporate
typography. The Arial substitute keeps the deck readable in the canonical
review environment without modifying the package cache.

## Theme Parameters

The `not-tudabeamer-2023-theme` function accepts variadic `..args` that are
passed to `touying-slides`. Use `config-common(breakable: false)` to prevent
accidental continuation pages; presentation metadata is set with `config-info()`:

### config-info() Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title (displayed centered on title slide) |
| `short-title` | Short title for header display |
| `subtitle` | Subtitle (displayed below title) |
| `author` | Author name (string) |
| `short-author` | Short author name for header and footer |
| `date` | Date (supports `datetime.today()`, formatted as `DD.MM.YYYY`) |
| `department` | Department name (displayed in footer) |
| `institute` | Institute name (displayed in footer) |
| `logo` | Logo image (displayed top-right in header, recommended height: 0.75in) |

### Page Configuration

| Setting | Value |
|---------|-------|
| Page width | 13.33 inches |
| Page height | 7.5 inches |
| Margins | top: 1.2in, bottom: 0.33in, left: 0.39in, right: 0.34in |
| Date format | `[day].[month].[year]` (German style) |
| Base font size | 20pt, Roboto (black weight for headers) |

## Available Slide Types

### `#title-slide()`
Full-width centered title page with the presentation title in large uppercase
Roboto Black (42pt) and subtitle below. The header logo is displayed but the
text header is hidden. No special background.

### `= Heading` (Section slide)
Level-1 headings automatically create section divider slides. Displays the
section name in large uppercase bold text positioned at the bottom third of
the slide. Standard header/footer layout.

### `== Heading` (Content slide)
Level-2 headings create standard content slides. The slide title is rendered
in uppercase Roboto Black (42pt) at the top. Header shows short title + short
author (uppercase) and logo. Footer shows date, department/institute/author,
and page number.

### `#slide(title: [...])[...]`
Explicit content slide with optional title override. If `title` is `auto`,
the current heading is used.

### `#outline-slide()`
Two-column outline (table of contents) with enumerated level-1 headings. The
slide title is set to "Outline" and sections are numbered in large bold font.

## Color Scheme

| Color | Hex | Role |
|-------|-----|------|
| Footer text gray | `#898989` | Footer text, secondary elements |
| Black | `#000000` | Body text, header text |
| White | `#FFFFFF` | Background |

Version 0.2.1 exposes no public accent-color parameter for this presentation
theme. Its local palette is intentionally minimal: black text on white with a
gray footer.

## Branding Features

- **Logo**: TU Darmstadt logo displayed top-right in the header area (0.99in
  height). Use an approved `tuda_logo.svg` asset when available; otherwise pass
  `logo: none` rather than shipping a test placeholder.
- **Header**: Uppercase short title + short author in Roboto (10pt, tracked)
  with logo on the right side. Can be disabled per slide.
- **Footer**: Three-column layout — Date (left) | Department + Institute +
  Author (center) | Page number (right), all in gray Roboto (9pt)
- **Title typography**: Large uppercase Roboto Black (42pt) with tight leading
  for slide titles, matching the original LaTeX TUDa beamer style
- **Required font for exact branding**: Roboto

## Content Helpers

### `#figure-with-copyright(copyright: [...], caption: [...])`
Figure wrapper that supports a copyright notice. When the `show-copyright`
state is active, the copyright text replaces the caption:

```typst
#figure-with-copyright(
  copyright: [Photo: © TU Darmstadt],
  caption: [Campus view],
  image("campus.jpg"),
)
```

### Font Helper Functions

| Function | Description |
|----------|-------------|
| `header-font(...)` | Roboto, black weight, tracked, 10pt |
| `footer-font(...)` | Roboto, gray fill, 9pt |
| `title-font(...)` | Roboto, black weight, 42pt |
| `subtitle-font(...)` | Roboto, 22pt |
| `slide-title-font(...)` | Roboto, black weight, 42pt, descender-aligned |

## Animation Support

- `#pause` — progressive content reveal
- `#meanwhile` — simultaneous content in another area
- Standard Touying animation functions (`#uncover`, `#only`, `#alternatives`)
- `#speaker-note[...]` — hidden speaker notes

## Font Requirements

The package uses **Roboto** for all presentation text and disables Typst's
fallback internally. Install Roboto and compile with an appropriate
`--font-path` for exact branding. When that is not possible, use the Quick Start
compatibility rule; it selects Arial while preserving all package-defined
sizes, weights, tracking, and colors. XCharter is not referenced by this
package's presentation template.

## Universe Link

[not-tudabeamer-2023 on Typst Universe](https://typst.app/universe/package/not-tudabeamer-2023)
