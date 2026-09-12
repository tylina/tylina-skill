# GREYC Ambrosia

**Type**: Institutional / Laboratory Theme
**Package**: `@preview/touying-greyc-ambrosia:0.1.0`
**Touying version**: 0.6.2
**Entry function**: `greyc-theme`
**Style**: Institutional, French, Research Laboratory
**Institution**: GREYC Laboratory — Université de Caen Normandie / CNRS / ENSICAEN
**Best For**: GREYC laboratory
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-greyc-ambrosia).

## Description

An unofficial Touying presentation theme for the **GREYC** (Groupe de Recherche en Informatique, Image et Instrumentation de Caen) laboratory at Université de Caen Normandie, a joint research unit (UMR 6072) of CNRS and ENSICAEN. The theme mimics the official LaTeX and PowerPoint templates available on the GREYC intranet, and features six visual "flavours" ranging from the legacy GREYC style to variants inspired by well-known Beamer and Touying themes. The name "Ambrosia" references the food of the Greek gods, described as having every flavour imaginable.

Although designed for GREYC researchers, the theme is suitable for any academic or research presentation. It includes built-in footnote citation support, a dedicated bibliography slide, and multiple visual variants.

## Quick Start

```typst
#import "@preview/touying:0.6.2": *
#import "@preview/touying-greyc-ambrosia:0.1.0": *

#show: greyc-theme.with(
  flavor: "legacy",
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Apprentissage Profond pour la Vision par Ordinateur],
    subtitle: [Détection d'Objets en Temps Réel],
    author: [Dr. Jean-Pierre Duval],
    date: datetime.today(),
    institution: [GREYC — UMR 6072 CNRS],
  ),
)

// Choose an installed document font; the package does not force one.
#set text(font: "Arial")

#title-slide()

= Introduction

== Contexte

La détection d'objets est un problème fondamental en vision
par ordinateur.

- Réseaux de neurones convolutifs (CNN)
- Architectures transformer
- Apprentissage par transfert

#bibliography-slide("refs.bib", style: "ieee")
```

## Theme Parameters

### `greyc-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `flavor` | `string` | `"legacy"` | Visual variant (see Flavours section below) |
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footcite-once` | `bool` | `true` | If `true`, footnote citations appear only on the first slide where cited; if `false`, they repeat on every slide |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle (optional) |
| `author` | `content` | Author name(s) |
| `date` | `datetime` | Presentation date |
| `institution` | `content` | Institutional affiliation |

## Available Flavours

The theme offers **six visual flavours**, each with distinct styling for title, outline, and content slides:

| Flavour | Description |
|---------|-------------|
| `"legacy"` | **(Default)** Mimics the official GREYC LaTeX/PPT templates with GREYC branding |
| `"simple"` | Clean, minimal design with reduced visual elements |
| `"cambridge"` | Inspired by the Cambridge Beamer theme |
| `"darmstadt"` | Inspired by the Darmstadt Beamer theme with navigation elements |
| `"dewdrop"` | Inspired by the Touying Dewdrop theme |
| `"stargazer"` | Inspired by the Touying Stargazer theme |

To select a flavour:

```typst
#show: greyc-theme.with(
  flavor: "cambridge",
  // ... other options
)
```

## Available Slide Types

### `#title-slide()`

The title/cover slide displaying the presentation title, subtitle, author, date, and institution. Visual layout varies by flavour — the "legacy" flavour includes GREYC branding elements.

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides**. The appearance depends on the selected flavour: some show a table of contents with the current section highlighted, others use a simple centred heading.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides**. All flavours support:
- Bullet lists and numbered lists
- Mathematical content
- Tables
- Images and figures
- Footnote citations via `#footcite()`

### `#bibliography-slide("file.bib", style: "ieee")`

A dedicated bibliography slide for displaying references. This keeps references on a separate, clearly-labelled slide rather than inline.

| Parameter | Type | Description |
|-----------|------|-------------|
| `"file.bib"` | `string` | Path to the BibTeX bibliography file |
| `style` | `string` | Citation style (e.g., `"ieee"`, `"apa"`) |

### Additional Package Slide Helpers

The package also exports the following helpers. They use the selected flavour's
own chrome and should be preferred over recreating these layouts locally:

```typst
#outline-slide()

#focus-slide[
  Le graphe améliore la cohérence spatiale.
]

#ending-slide(title: [Merci])[
  Questions ?
]

#backup-slide(title: [Résultats complémentaires])[
  Contenu d'annexe.
]
```

## Reusable Components

`#tblock` and `#framed-tblock` are package-owned thematic blocks. Both accept
`title`, `fill`, `background`, and `shadowed` options; omitting the colour
options uses the active flavour palette.

```typst
#tblock(title: [Hypothèse])[
  Les relations locales améliorent la régularité des prédictions.
]

#framed-tblock(title: [Résultat], shadowed: false)[
  Le modèle atteint 84,1 % de mIoU.
]
```

## Special Functions

### `#footcite(<key>)`

Inline footnote citation that adds the full reference to the slide's footnote area. The cited reference appears as a superscript number in the text, with the full citation at the bottom of the slide.

```typst
Recent advances in object detection #footcite(<yolo2023>)
have shown remarkable progress.
```

The `footcite-once` parameter controls whether a citation's footnote appears only on its first occurrence (`true`, default) or on every slide where it is cited (`false`).

### `#hidden-bibliography("file.bib", style: "ieee")`

Includes the bibliography data without rendering a visible bibliography slide. Useful when using `#footcite()` throughout and wanting the reference metadata loaded but not displayed as a separate slide.

### `#alert[content]`

Overridden alert function for emphasising text. The `touying-greyc-ambrosia` import must come *after* the `touying` import for this override to work correctly:

```typst
#import "@preview/touying:0.6.2": *        // First
#import "@preview/touying-greyc-ambrosia:0.1.0": *  // Second
```

### `#show: appendix`

Switches to appendix mode, which may affect slide numbering and navigation. Also overridden from Touying — import order matters.

## Color Scheme

The colour scheme varies by flavour. The "legacy" flavour uses the GREYC laboratory's institutional colours:

| Role | Description |
|------|-------------|
| Primary | GREYC institutional colour — headers, accents, navigation |
| Secondary | Complementary colour for emphasis elements |
| Background | White/light for readability |
| Text | Dark for high contrast |

Other flavours (Cambridge, Darmstadt, etc.) use colour palettes appropriate to their respective visual inspirations while maintaining GREYC branding compatibility.

## Branding Features

- **GREYC branding**: The "legacy" flavour reproduces the visual identity of the GREYC laboratory
- **Multi-affiliation**: GREYC is a joint unit of Université de Caen Normandie, CNRS, and ENSICAEN — the theme accommodates multi-institutional branding
- **Flavour system**: Six visual variants provide flexibility while maintaining a consistent API
- **Citation system**: Built-in `#footcite()` function supports the academic citation workflow common in research presentations

## Import Order

The import order is important for this theme. Always import `touying` first, then `touying-greyc-ambrosia`:

```typst
#import "@preview/touying:0.6.2": *
#import "@preview/touying-greyc-ambrosia:0.1.0": *
```

This ensures that overridden functions (`#alert`, `#show: appendix`) work correctly.

The package itself imports Touying `0.6.2`. Keep the direct import on that same
version; mixing the package with Touying `0.7.4` crosses an incompatible Universe
package boundary. Pass generic Touying configuration, such as
`config-common(breakable: false)`, through `greyc-theme.with(...)`.

## Tips

- The `"legacy"` flavour is the closest to the official GREYC templates — use it for internal lab presentations
- For conferences, `"cambridge"` or `"stargazer"` provide a more polished, internationally-recognisable look
- Use `footcite-once: false` if the same reference is needed on multiple slides (e.g., for a tutorial presentation)
- Extended examples are available in `examples/demo.typ` in the package repository

## Universe Link

[touying-greyc-ambrosia on Typst Universe](https://typst.app/universe/package/touying-greyc-ambrosia)
