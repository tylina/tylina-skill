# GQE Le Moulon Presentation

**Type**: Institutional / Laboratory Theme
**Package**: `@preview/gqe-lemoulon-presentation:0.0.7`
**Touying version**: 0.6.1 (owned by the external package)
**Entry function**: `gqe-lemoulon-presentation-theme`
**Style**: Institutional, French, Research Laboratory, Biology
**Institution**: GQE-Le Moulon (Génétique Quantitative et Évolution) — Université Paris-Saclay / INRAE / CNRS / AgroParisTech
**Best For**: GQE-Le Moulon quantitative genetics
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/gqe-lemoulon-presentation).

## Description

A presentation theme for **GQE-Le Moulon** (Quantitative Genetics and Evolution – Le Moulon), a French research laboratory (UMR 8120) specialising in quantitative genetics, evolutionary biology, and crop improvement. The laboratory is a joint unit of Université Paris-Saclay, INRAE, CNRS, and AgroParisTech. The theme features predefined logos for all partner institutions, a "brochette" (logo strip) system for multi-affiliation branding, styled boxes and tables with theme colours, an image-with-legend function, and support for research team identification. It is well-suited for scientific presentations in biology, genetics, agriculture, and related fields.

## Quick Start

```typst
#import "@preview/gqe-lemoulon-presentation:0.0.7": *
#import themes.gqe: *

#show: gqe-lemoulon-presentation-theme.with(
  aspect-ratio: "4-3",
  config-info(
    title: [Génétique d'Association chez le Maïs],
    subtitle: [Identification de QTL par GWAS],
    author: [Dr. Claire Durand],
    equipe: [Génétique et Amélioration des Plantes],
  ),
)

#title-slide()

= Introduction

== Contexte

#slide()[
  La sélection génomique est un outil puissant pour
  l'amélioration des plantes cultivées.

  - Identification de QTL par GWAS
  - Prédiction génomique
  - Sélection assistée par marqueurs
]
```

## Theme Parameters

### `gqe-lemoulon-presentation-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"4-3"` | Slide aspect ratio (`"4-3"` or `"16-9"`) |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle (optional) |
| `author` | `content` | Author name(s) |
| `date` | `content` | Presentation date (optional) |
| `equipe` | `content` | Research team name within GQE-Le Moulon |
| `logo` | `content/image` | Primary logo (replaces default) |
| `logo2` | `content/image` | Secondary logo |
| `brochette` | `content` | Grid of partner institution logos (logo strip) |

### `config-colors` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `primary` | `color` | Dominant theme colour (e.g., `blue`) — affects `pave`, `tableau`, and other elements |
| `alert` | `color` | Alert/emphasis colour for the `#alert` function (e.g., `red`) |

## Available Slide Types

### `#title-slide()`

The title/cover slide displaying the presentation title, subtitle, author, team, and institutional logos. Uses the `brochette` logo strip if configured.

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides** that visually separate major parts of the presentation.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create slide title markers. Content is typically placed inside a `#slide()` call:

```typst
== Slide Title

#slide()[
  Your content here.
]
```

### `#slide()[content]`

Standard content slide. Used after a `==` heading to provide the slide body.

## Built-in Content Functions

### `#pave(title)[content]`

A styled box (powered by showybox) with a coloured header and themed appearance. Ideal for highlighting key points, methods, or findings.

```typst
#pave("Research Approach")[
  - High-throughput genotyping
  - Multi-environment field trials
  - Mixed model association analysis
]
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `string` | Box title displayed in the coloured header |
| `body` | `content` | Box content |

### `#tableau(columns: n, ..cells)`

A customised Typst table with theme colours applied to headers and borders. Drop-in replacement for `#table()` with pre-applied styling.

```typst
#tableau(columns: 3,
  [Trait], [Heritability], [QTL Detected],
  [Grain yield], [0.72], [14],
  [Plant height], [0.85], [8],
  [Flowering time], [0.91], [22],
)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `columns` | `int` | Number of table columns |
| `..cells` | `content` | Table cell content |

### `#tableaum(columns: n)[markdown]`

Markdown-syntax table (powered by tablem) with theme colours. Convenient for quick table entry.

```typst
#tableaum(columns: 3)[
  | *Species* | *Ploidy* | *Genome Size* |
  | --------- | -------- | ------------- |
  | Maize     | 2n       | 2.3 Gb        |
  | Wheat     | 6n       | 17 Gb         |
  | Rice      | 2n       | 430 Mb        |
]
```

### `#image-legende(image: ..., width: ..., [legend])`

Displays an image with a styled caption/legend block beneath it.

```typst
#image-legende(
  image: image("manhattan_plot.png"),
  width: 85%,
  [Manhattan plot for grain yield — chromosome 10]
)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `image` | `image` | The image to display |
| `width` | `length` | Display width (e.g., `85%`) |
| `legend` | `content` | Caption text below the image |

## Predefined Logo Variables

The package includes logos for all GQE-Le Moulon partner institutions:

| Variable | Institution |
|----------|-------------|
| `logo-gqe` | GQE-Le Moulon |
| `logo-upsay` | Université Paris-Saclay |
| `logo-upsay-fac-sciences` | Université Paris-Saclay — Faculté des Sciences |
| `logo-inrae` | INRAE |
| `logo-cnrs` | CNRS |
| `logo-cnrs-biologie` | CNRS — Biologie |
| `logo-agroparistech` | AgroParisTech |
| `logo-ideev` | IDEEV (Institut Diversité Écologie et Évolution du Vivant) |
| `logo-pappso` | PAPPSO (Plateforme d'Analyse Protéomique de Paris Sud-Ouest) |

## Brochette (Logo Strip)

The `brochette` parameter creates a horizontal strip of partner institution logos, typically displayed on the title slide:

```typst
brochette: grid(columns: (30%, 25%, 20%, 20%), {
  set align(horizon + center)
  set image(height: 25pt)
  logo-upsay
}, {
  set align(horizon + center)
  set image(height: 20pt)
  logo-inrae
}, {
  set align(horizon + center)
  set image(height: 30pt)
  logo-cnrs-biologie
}, {
  set align(horizon + center)
  set image(height: 20pt)
  logo-agroparistech
})
```

## Color Scheme

| Role | Description |
|------|-------------|
| Primary | Theme accent colour — used for `pave` headers, `tableau` borders, and slide elements |
| Alert | Emphasis colour for `#alert[...]` function |

Colours cascade to all themed components (`pave`, `tableau`, `tableaum`).

## Recommended Font

```typst
#set text(font: "PT Sans", weight: "light", size: 24pt)
```

The recommended font is **PT Sans** at light weight, though any font can be used.

## Dependencies

- **Touying** — Core slide framework
- **Showybox** — Powers the `#pave()` styled box
- **Tablem** — Powers the `#tableaum()` markdown table

## Branding Features

- **Multi-institutional logos**: Nine predefined logo variables for GQE-Le Moulon and its partner institutions
- **Brochette system**: Flexible logo strip for displaying multiple affiliations
- **Team identification**: The `equipe` parameter identifies the specific research team within the laboratory
- **Themed content components**: `pave`, `tableau`, `tableaum`, and `image-legende` all inherit the theme colour scheme
- **Biology/agriculture focus**: Categories include Presentation, Biology, Education, and Agriculture

## Import Note

This package requires importing both the main package and the GQE theme module:

```typst
#import "@preview/gqe-lemoulon-presentation:0.0.7": *
#import themes.gqe: *
```

## Tips

- Use the `equipe` parameter to identify your specific team (e.g., "Base", "DyGAP", "STAMP")
- The predefined logos save time — no need to hunt for institutional SVGs
- Use `#pave()` for highlighting research methods, key findings, or project summaries
- Combine `#tableau()` for data tables with `#image-legende()` for figure panels
- The `brochette` grid layout is flexible — adjust column widths and image heights to match your logo proportions
- The repository demo uses a centered footer counter and scoped text sizing for
  dense 4:3 slides; preserve those safeguards when extending the demo.

## Universe Link

[gqe-lemoulon-presentation on Typst Universe](https://typst.app/universe/package/gqe-lemoulon-presentation)
