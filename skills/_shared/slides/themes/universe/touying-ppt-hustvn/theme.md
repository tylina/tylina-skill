# HUST Vietnam Theme

**Type**: Institutional / University
**Package**: `@preview/touying-ppt-hustvn:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `hust-theme`
**Style**: Academic, institutional, Vietnamese university
**Primary color**: HUST Red (`#AD1D2F`)
**Institution**: Hanoi University of Science and Technology (HUST), Vietnam
**Best For**: Hanoi University of Science and Technology
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-ppt-hustvn).

## Description

The HUST Vietnam theme replicates the official 2022 Microsoft PowerPoint template
of the Hanoi University of Science and Technology (HUST) — one of Vietnam's top
engineering universities. Built on the Touying framework and inspired by the
stargazer theme, it provides two color themes (red and blue), branded background
images for title and ending slides, and a professional header/footer layout with
HUST visual identity elements. The theme requires the Lato font.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/touying-ppt-hustvn:0.1.0": *

#show: hust-theme.with(
  aspect-ratio: "16-9",
  theme: "red",
  config-info(
    title: [Research Presentation Title],
    subtitle: [Department of Computer Science],
    author: [Nguyen Van A],
    date: datetime.today(),
    institution: [Hanoi University of Science and Technology],
  ),
)

#title-slide()

= Introduction

== First Slide

Your content here.
```

## Theme Parameters

The `hust-theme` function accepts the following parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `theme` | `"red"` | Color theme (`"red"` or `"blue"`) |
| `align` | `horizon` | Default content alignment |
| `outline-align` | `top` | Outline slide content alignment |
| `alpha` | `20%` | Progressive outline transparency for non-current sections |
| `lang` | `"en"` | Text language |
| `font` | `("Lato",)` | Font family (Lato required) |
| `title` | Current heading display | Slide title derivation callback |
| `footer-pagenum` | Slide counter display | Page number format in footer |
| `progress-bar` | `true` | Enable progress bar (stored in config) |

### config-info() Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `subtitle` | Presentation subtitle |
| `author` | Author name(s) |
| `authors` | Array of author names (alternative to `author`) |
| `date` | Date (supports `datetime.today()`) |
| `institution` | University or department name |

## Available Slide Types

### `#title-slide()`
Opening slide with branded HUST background image (varies by theme and aspect
ratio), university logo, title, subtitle, author, institution, and date. All
text rendered in HUST Red. No header/footer shown.

### `= Heading` (Section / Outline slide)
Level-1 headings automatically create outline slides (`new-section-slide`
delegates to `outline-slide`). Shows a progressive table of contents with the
current section highlighted and others dimmed.

### `== Heading` (Content slide)
Level-2 headings create standard content slides. Features a colored header bar
(primary color with white bold title text) underlined by a secondary-color
accent stripe, plus a footer with HUST logo, red rule, and page number.

### `#slide(title: ..., align: ...)[...]`
Explicit content slide with optional title override and alignment control.

### `#outline-slide(title: ..., level: 1, numbered: true)`
Table of contents slide with progressive outline. Non-current sections are
shown at reduced opacity. Parameters:
- `title` — heading text (defaults to localized "Outline")
- `level` — heading depth to display
- `numbered` — whether to number outline entries

### `#ending-slide(title: [...])`
Closing slide with branded HUST background image. Displays a large bold title
centered on the right portion of the slide. Ideal for "Thank you" slides.

## Color Scheme

### Red Theme (`theme: "red"` — default)

| Color | Hex | Role |
|-------|-----|------|
| Primary (HUST Red) | `#AD1D2F` | Headers, titles, accents |
| Secondary (HUST Yellow) | `#CE8C09` | Accent stripes, secondary elements |
| Neutral Lightest | `#FFFFFF` | Backgrounds, header text |

### Blue Theme (`theme: "blue"`)

| Color | Hex | Role |
|-------|-----|------|
| Primary (HUST Blue) | `#002E5C` | Headers, titles, accents |
| Secondary (HUST Red) | `#AD1D2F` | Accent stripes, secondary elements |
| Neutral Lightest | `#FFFFFF` | Backgrounds, header text |

## Branding Features

- **Background images**: Title and ending slides use official HUST PowerPoint
  template backgrounds, varying by theme color and aspect ratio
  (e.g., `assets/title-bg-red-16-9.png`, `assets/ending-bg-blue-4-3.png`)
- **Header bar**: Primary-colored block with white bold title text, underlined
  by a secondary-colored accent stripe
- **Footer**: HUST logo image (left), red horizontal rule, and page counter
  (right) in a grid layout
- **Title slide logo**: Official HUST top-left corner mark
- **Typography**: Requires the Lato font (Google Fonts, open-source)

## Content Styling

- Headings are automatically colored with the primary theme color
- Links to external URLs are colored with the primary color
- List markers use the `knob-marker` style in the primary color
- Figure captions and footnotes are rendered at reduced size (0.6em)
- Table captions are positioned at the top for `table` figures

## Animation Support

- `#pause` — progressive content reveal
- `#meanwhile` — simultaneous content in another area
- `#uncover("2-")[...]` — reveal with space reservation
- `#only("2-")[...]` — reveal without space reservation
- `#alternatives[...][...]` — switch between alternatives
- `#speaker-note[...]` — hidden speaker notes

## Font Requirements

The **Lato** font must be installed for proper rendering:
- Download from [Google Fonts](https://fonts.google.com/specimen/Lato)
- Arch Linux: `yay -S ttf-lato`
- Typst web app: upload the font files manually

## Universe Link

[touying-ppt-hustvn on Typst Universe](https://typst.app/universe/package/touying-ppt-hustvn)
