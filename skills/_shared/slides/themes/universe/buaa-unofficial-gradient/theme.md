# BUAA Unofficial Gradient

**Type**: Institutional Theme
**Package**: `@preview/buaa-unofficial-gradient:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `buaa-theme`
**Style**: Institutional, Chinese, Academic, Gradient
**Primary color**: BUAA Blue (`#005bac`)
**Institution**: Beihang University (BUAA / Beijing University of Aeronautics and Astronautics)
**Best For**: Beihang University gradient style
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/buaa-unofficial-gradient).

## Description

An unofficial presentation theme for **Beihang University (BUAA)** featuring a gradient visual design inspired by the university's official colour specifications. The theme provides a clean, modern look with gradient accents on cover, section, and closing slides while keeping content slides minimal and readable. It includes BUAA's institutional colour palette (blues, red, gold, silver, grey), themed content blocks for highlighting information, an article-title utility for journal paper presentations, and side-by-side layout helpers. The BUAA logo is embedded for academic and non-commercial use.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/buaa-unofficial-gradient:0.1.0": *

#show: buaa-theme.with(
  config-info(
    title: [Advances in Aerospace Engineering],
    subtitle: [Beihang University Research Seminar],
    author: [Dr. Wei Zhang],
    date: datetime.today(),
    institution: [School of Aeronautic Science and Engineering],
  ),
)

#title-slide()

#outline-slide()

= Introduction

== Research Background

Key challenges in modern aerospace design:

- Lightweight composite structures
- Computational fluid dynamics at scale
- Multi-objective optimisation

= Results

== Main Findings

$ nabla dot bold(u) = 0, quad rho (partial bold(u)) / (partial t) + rho (bold(u) dot nabla) bold(u) = -nabla p + mu nabla^2 bold(u) $

#end-slide()
```

## Theme Parameters

### `buaa-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle |
| `author` | `content` | Author name(s) |
| `date` | `datetime` | Presentation date |
| `institution` | `content` | Institutional affiliation |

## Available Slide Types

### `#title-slide()`

The cover/title page with gradient design elements, BUAA branding, title, subtitle, author, date, and institution.

### `#outline-slide()`

A table-of-contents slide listing the presentation structure for audience orientation.

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides** with gradient accents and the section title prominently displayed. These slides use BUAA visual identity elements.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides** with a clean, minimal layout. Content slides are kept deliberately simple for maximum readability.

### `#end-slide()`

A closing/end slide with gradient design elements matching the title slide. Use this for "Thank you" or Q&A endings.

## Color Scheme

The theme defines colours drawn from BUAA's official colour specifications:

| Variable | Name | Hex | Usage |
|----------|------|-----|-------|
| `buaa-blue` | BUAA Blue | `rgb(0, 91, 172)` | Primary brand colour, headings |
| `star-blue` | Star Blue | `rgb(0, 61, 166)` | Accent, gradients |
| `sky-blue` | Sky Blue | `rgb(0, 155, 222)` | Lighter accent, gradients |
| `chinese-red` | Chinese Red | `rgb(195, 13, 35)` | Emphasis, red blocks |
| `quality-grey` | Quality Grey | `rgb(135, 135, 135)` | Subtle accents |
| `pro-gold` | Pro Gold | `rgb(210, 160, 95)` | Gold-themed blocks |
| `pro-silver` | Pro Silver | `rgb(209, 211, 211)` | Silver-themed blocks |

## Utility Functions

### Themed Content Blocks

Coloured blocks for structuring information with BUAA palette colours:

| Function | Description | Colour |
|----------|-------------|--------|
| `#tblock(title: [...])[...]` | Themed block | Blue (primary) |
| `#rblock(title: [...])[...]` | Red block | Chinese Red |
| `#gblock(title: [...])[...]` | Gold block | Pro Gold |
| `#sblock(title: [...])[...]` | Silver block | Pro Silver |

### `#article-title()` — Journal Article Presentation

A specialised slide for presenting journal publications with structured metadata:

| Parameter | Type | Description |
|-----------|------|-------------|
| `article-fig` | `content` | Figure/image of the article |
| `journal` | `content` | Journal name |
| `impf` | `content` | Impact factor |
| `pub-date` | `content` | Publication date |
| `quartile` | `content` | Quartile/ranking (e.g., CAS Q1) |
| `core-research` | `content` | Core research summary |
| `authors` | `content` | Author list |
| `institution` | `content` | Institutional affiliation |

### `#horz-block()` — Side-by-Side Layout

Displays 2–4 content blocks side by side with wireframe borders. Pass each column as a separate content block argument:

```typst
#horz-block()[
  Column 1 content
][
  Column 2 content
]
```

## Branding Features

- **BUAA Logo**: Embedded university logo displayed on cover, outline, and section transition slides
- **Gradient accents**: Visual gradient elements on non-content slides using BUAA blue tones
- **Minimal content slides**: Content pages are kept clean with extra branding only on structural slides
- **Logo usage**: BUAA visual identity assets are for demonstration and non-commercial academic use only

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes for presenter mode

## Universe Link

[buaa-unofficial-gradient on Typst Universe](https://typst.app/universe/package/buaa-unofficial-gradient)
