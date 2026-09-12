# Touying Pres UGE

**Type**: Institutional Theme
**Package**: `@preview/touying-pres-uge:0.1.1`
**Touying version**: 0.7.3 (owned by the Universe package)
**Entry function**: `uge-theme`
**Style**: Institutional, French, Academic
**Primary color**: UGE Blue (Université Gustave Eiffel brand blue)
**Institution**: Université Gustave Eiffel
**Best For**: Universite Gustave Eiffel
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-pres-uge).

## Description

A presentation theme designed for **Université Gustave Eiffel** (UGE), a French public university formed in 2020 from the merger of several research and higher education institutions in the Paris region. The theme reproduces the university's official visual identity, including its logo, colour palette, and layout conventions. It is built on the Touying slide framework and is suitable for academic lectures, research presentations, thesis defences, and conference talks associated with UGE or its affiliated laboratories and research institutes.

The UGE logo included in the package is a registered trademark; the package author notes that its use is authorised within the limits of applicable intellectual property law.

## Quick Start

```typst
#import "@preview/touying-pres-uge:0.1.1": *

#set text(font: ("Arial",))

#show: uge-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Modélisation des Infrastructures de Transport],
    subtitle: [Approches Multi-échelles],
    authors: (
      (
        name: "Dr. Sophie Martin",
        affiliations: (1,),
        email: "sophie.martin@univ-eiffel.fr",
      ),
    ),
    institutions: (
      "Université Gustave Eiffel",
    ),
    date: datetime.today(),
  ),
)

#title-slide()

= Introduction

== Contexte

Les infrastructures de transport sont au cœur des enjeux
de développement durable.

- Vieillissement des ouvrages d'art
- Transition vers la mobilité décarbonée
- Adaptation aux changements climatiques

= Résultats

== Modèle proposé

$ sigma(x) = E dot epsilon(x) + eta dot dot(epsilon)(x) $

#focus-slide[
  Merci de votre attention !
]
```

## Theme Parameters

### `uge-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle (optional) |
| `authors` | `array` | Structured author records with `name`, `affiliations`, and `email` fields |
| `institutions` | `array` | Affiliation names referenced by each author's `affiliations` indexes |
| `date` | `datetime/content` | Presentation date |
| `logo` | `content` | Logo shown in the content-slide header |
| `variant` | `bool` | Switches section-slide pattern treatment |

## Available Slide Types

### `#title-slide()`

The title/cover slide featuring the UGE logo, presentation title, subtitle, author, date, and institution. Follows the official UGE visual identity with the university's brand colours and layout.

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides**. These provide visual separation between major parts of the presentation, typically rendered with the UGE brand styling.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides**. Features include:
- UGE-branded header and/or footer elements
- Clean typography following the university's design guidelines
- Support for bullet lists, numbered lists, tables, and mathematical content
- Consistent colour scheme throughout

### `#focus-slide[content]`

A full-slide emphasis slide for key messages, transitions, or closing remarks. Content is centred and displayed prominently.

## Color Scheme

| Role | Description |
|------|-------------|
| Primary | UGE institutional blue — used for headers, accents, and branding elements |
| Background | White/light — clean academic background |
| Text | Dark — high-contrast body text |

The colour palette follows Université Gustave Eiffel's official graphic charter, ensuring visual consistency with other UGE communications.

## Branding Features

- **University logo**: The official Université Gustave Eiffel logo is embedded in the package and displayed on title slides and slide headers/footers
- **Official visual identity**: Layout, typography, and colour choices follow UGE's graphic charter
- **Trademark notice**: The UGE logo is a registered trademark; usage is subject to applicable intellectual property law in France, Canada, and the United States
- **Clean academic layout**: Designed for the formal academic context of a French university

## Research Context

Université Gustave Eiffel is known for research in:
- Transport and mobility engineering
- Civil engineering and urban planning
- Materials science and geotechnics
- Environmental science and sustainability
- Digital technologies and smart cities

The theme is well-suited for presentations in any of these domains.

## Dependencies

- **Touying** (0.7.3, owned by the Universe package) — Core slide framework

## Source Repository

The source is hosted on GitLab Inria:
- Repository: [gitlab.inria.fr/ttoullie/touying-pres-uge](https://gitlab.inria.fr/ttoullie/touying-pres-uge)
- License: GPL-3.0-or-later

## Tips

- The package includes the UGE logo as an embedded asset — no need to provide your own
- For thesis defence presentations, include committee members in the subtitle or author fields
- The `config-info` function follows standard Touying conventions, making it easy to switch from other Touying themes

## Universe Link

[touying-pres-uge on Typst Universe](https://typst.app/universe/package/touying-pres-uge)
