# UPB Corporate Design Slides

**Type**: Institutional / University
**Package**: `@preview/upb-corporate-design-slides:0.1.3`
**Touying version**: 0.6.1
**Entry function**: `upb-theme`
**Style**: Academic, institutional, German university, corporate design
**Primary color**: UPB Ultrablau (`#0025AA`)
**Institution**: Universität Paderborn (University of Paderborn), Germany
**Best For**: Paderborn University
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/upb-corporate-design-slides).

## Description

The UPB Corporate Design Slides theme implements the official corporate design
of the University of Paderborn (Universität Paderborn) for Touying presentations.
It features the distinctive UPB color palette with Ultrablau as primary accent,
branded SVG background images for title, content, and section slides, Karla as
the upstream brand font, and a clean layout with page numbers in the footer. The
local demo uses IBM Plex Sans as an installed sans-serif substitute. The theme
supports standard content slides, title slides, section slides, and focus slides. The
extensive color palette includes 34 named institutional colors organized into
six color families with graduated tints.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/upb-corporate-design-slides:0.1.3": *

#show: upb-theme.with(
  lang: "en",
  footer: [Faculty of Computer Science, Electrical Engineering and Mathematics],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    author: [Author Name],
    date: datetime.today(),
  ),
)

// Prevent visible serif fallback when Karla is unavailable locally.
#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

#title-slide()[]

= Introduction

== First Slide

Your content here.
```

## Theme Parameters

The `upb-theme` function accepts the following parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `footer` | `none` | Footer text displayed on content slides |
| `lang` | `"de"` | Text language (`"de"`, `"en"`, etc.) |

### config-info() Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title (displayed on title slide) |
| `author` | Author name(s) |
| `date` | Date (supports `datetime.today()`, formatted as `DD.MM.YYYY`) |

### Page Configuration

| Setting | Value |
|---------|-------|
| Paper | `presentation-16-9` |
| Base font size | 16pt; Karla upstream, IBM Plex Sans in the local demo |
| Language | German (`"de"`) by default |
| Paragraph spacing | 1.8em |
| Line leading | 0.75em |
| List spacing | 0.7em |
| Margins | top: 95pt, bottom: 5em, left: 30pt, right: 20pt |

## Available Slide Types

### `#title-slide(background-img: ...)[...]`
Title page with branded UPB background image. Displays the title in Ultrablau
(30pt bold), optional body content, and author + date at the bottom. The
background can be customized via `background-img` (defaults to
`backgrounds/title.svg`). Accepts additional body content.

### `= Heading` (Section slide)
Level-1 headings automatically create section divider slides. Uses the UPB
section background image (`backgrounds/section.svg`) and displays the heading
counter (top-right, white) and section title centered in Ultrablau (26pt bold).

### `== Heading` (Content slide)
Level-2 headings create standard content slides. Uses the content background
image (`backgrounds/content.svg`). The slide title is displayed in Ultrablau
(20pt bold), and sub-headings within the slide are also styled in Ultrablau
(18pt bold). Footer shows custom footer text (left) and page number (right).

### `#focus-slide[...]`
Full-color emphasis slide filled with the primary color. Text is displayed
large (2em) and centered in white. Ideal for key messages or transitions.

## Color Scheme

The theme defines an extensive palette of 34 institutional colors via the
`upb-colors` dictionary. All colors are accessible in Typst code.

### Primary Brand Colors

| Color Name | Hex | Description |
|------------|-----|-------------|
| `schwarz` | `#000000` | Black — body text |
| `weiß` | `#FFFFFF` | White — backgrounds |
| `ultrablau` | `#0025AA` | UPB Ultrablau — primary accent |
| `limettengrün` | `#ACEA3D` | Lime green — highlight accent |
| `granatpink` | `#EF3A84` | Garnet pink — secondary accent |

### Graduated Color Families (100/80/60/40/20 tints)

| Family | Base (100%) | Description |
|--------|-------------|-------------|
| `himmelblau` | `#0A75C4` | Sky blue family |
| `saphirblau` | `#181C62` | Sapphire blue family |
| `irisviolett` | `#7E3FA8` | Iris violet family |
| `fuchsiarot` | `#C138A0` | Fuchsia red family |
| `meerblau` | `#23A9C9` | Sea blue family |
| `arktisblau` | `#50D1D1` | Arctic blue family |

Each family provides 5 graduated tints (e.g., `himmelblau-100`, `himmelblau-80`,
`himmelblau-60`, `himmelblau-40`, `himmelblau-20`).

### Using Colors in Code

```typst
// Access any UPB color
#text(fill: upb-colors.ultrablau)[Important text]
#rect(fill: upb-colors.himmelblau-40, width: 100%, height: 2em)
```

## Branding Features

- **Background images**: SVG backgrounds for title (`backgrounds/title.svg`),
  content (`backgrounds/content.svg`), and section (`backgrounds/section.svg`)
  slides, following UPB corporate design
- **Title slide**: Branded background with title in Ultrablau, author and date
  at the bottom
- **Section slide**: Branded background with section counter (white, top-right)
  and section title centered
- **Footer**: Custom text (left) + bold page number (right) on content slides
- **Typography**: Karla upstream; IBM Plex Sans in the local demo
- **Color palette**: 34 institutional colors accessible via `upb-colors`

## Font Requirements

Install **Karla** when exact upstream typography is required:
- Download from [Google Fonts](https://fonts.google.com/specimen/Karla)
- Arch Linux: available via AUR (`ttf-karla`)
- NixOS: available in `24.11` and `unstable` channels
- Typst web app: upload the font files manually

The repository demo deliberately overrides the package's internal Karla setting
with installed IBM Plex Sans after the theme show rule. This keeps the package
cache untouched and prevents visible serif fallback. Until Karla is installed,
Typst still reports the package-owned `unknown font family: karla` warning from
the upstream theme setup; the rendered demo nevertheless uses IBM Plex Sans.

## Animation Support

- `#pause` — progressive content reveal
- `#meanwhile` — simultaneous content display
- Standard Touying animation functions (`#uncover`, `#only`, `#alternatives`)
- `#speaker-note[...]` — hidden speaker notes

## Universe Link

[upb-corporate-design-slides on Typst Universe](https://typst.app/universe/package/upb-corporate-design-slides)
