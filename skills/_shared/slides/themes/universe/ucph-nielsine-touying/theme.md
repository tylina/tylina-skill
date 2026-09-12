# UCPH Nielsine Touying

**Type**: Institutional Theme
**Package**: `@preview/ucph-nielsine-touying:0.1.3`
**Touying version**: 0.6.3
**Entry function**: `ucph-metropolis-theme` (via `uc.ucph-metropolis-theme`)
**Style**: Institutional, Danish, Academic, Metropolis-based
**Primary color**: UCPH Red (via `uc.colors.ucph-dark.red`)
**Secondary color**: UCPH Blue (via `uc.colors.ucph-dark.blue`)
**Institution**: Københavns Universitet (University of Copenhagen, UCPH)
**Best For**: University of Copenhagen
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/ucph-nielsine-touying).

## Description

An unofficial Touying-based presentation theme for the **University of Copenhagen** (Københavns Universitet, UCPH), built on the Metropolis slide design. Named after **Nielsine Nielsen**, Denmark's first female academic (1885), the theme features UCPH's institutional red and blue colours, the university seal, customisable gradients for focus slides, support for the theorion theorem block system (definitions, theorems, propositions), pinit annotations, and bilingual support (Danish and English). The upstream theme recommends Fira Sans; this local demo uses IBM Plex Sans with a light weight for the same clean, modern academic character without an unavailable-font warning. It is **not** affiliated with or endorsed by the University of Copenhagen.

## Quick Start

```typst
#import "@preview/ucph-nielsine-touying:0.1.3" as uc
#import "@preview/touying:0.6.3" as ty

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), weight: "light")

#show: uc.ucph-metropolis-theme.with(
  language: "en",
  ty.config-common(breakable: false),
  ty.config-info(
    title: [Advances in Computational Genomics],
    subtitle: [Bayesian Methods for Variant Calling],
    author: [Dr. Sofie Andersen],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: uc.logos.seal,
  ),
)

#uc.title-slide()

= Introduction

== Research Motivation

Modern genomic analysis requires scalable Bayesian inference methods.

#uc.focus-slide([Thank you!])
```

## Import Pattern

This theme uses a **namespace import** pattern rather than glob imports:

```typst
#import "@preview/ucph-nielsine-touying:0.1.3" as uc
#import "@preview/touying:0.6.3" as ty
```

All theme functions are prefixed with `uc.` and touying config functions with `ty.`.

## Theme Parameters

### `uc.ucph-metropolis-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `language` | `string` | `"en"` | Document language (`"en"` or `"dk"`) |

The theme function takes `ty.config-info(...)` as a positional argument.

### `ty.config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle |
| `author` | `content` | Author name(s) |
| `date` | `datetime` | Presentation date |
| `institution` | `content` | University/department affiliation |
| `logo` | `logo` | Logo object (e.g., `uc.logos.seal`) |

## Available Slide Types

### `#uc.title-slide()`

The title/cover slide displaying the UCPH university seal, title, subtitle, author, date, and institution. Follows Metropolis-style layout conventions.

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section divider slides** with the section title prominently displayed. These provide visual breaks between presentation parts.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides** with the Metropolis-style header bar and clean body area.

### `#uc.focus-slide(content, fill: none)`

An emphasis/attention slide with centred content. The optional `fill` parameter accepts custom backgrounds, including gradients:

```typst
#let my-gradient = gradient.linear(
  uc.colors.ucph-dark.red,
  uc.colors.ucph-dark.blue,
  angle: 45deg
)
#uc.focus-slide(fill: my-gradient)[Please pay attention!]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | `content` | required | Slide body (positional argument) |
| `fill` | `color/gradient` | `none` | Background fill colour or gradient |

## Color Scheme

The theme provides UCPH institutional colours via `uc.colors`:

| Access Path | Description | Usage |
|-------------|-------------|-------|
| `uc.colors.ucph-dark.red` | UCPH Dark Red | Focus slides, emphasis, theorem blocks |
| `uc.colors.ucph-dark.blue` | UCPH Dark Blue | Gradients, accents |

Custom gradients can be constructed from these colours for focus slide backgrounds.

## Logos

Available via the `uc.logos` namespace:

| Logo | Access | Description |
|------|--------|-------------|
| University Seal | `uc.logos.seal` | Official UCPH seal for title slides and headers |

## Typography

| Setting | Value | Description |
|---------|-------|-------------|
| Body font | IBM Plex Sans, with Noto Sans SC fallback | Installed Fira Sans alternative for warning-free compilation |
| Weight | `"light"` | Elegant light appearance |
| Math font | (configurable) | Use Fira Math or New Computer Modern Math |

## Optional Integrations

### Theorion — Theorem Blocks

The theme supports the `theorion` package for mathematical content blocks:

```typst
#import "@preview/theorion:0.5.0" as th

#show: th.show-theorion
#th.set-inherited-levels(0)
```

Available block types:
| Function | Purpose |
|----------|---------|
| `#th.definition()[...]` | Mathematical definitions |
| `#th.theorem()[...]` | Theorems |
| `#th.proposition()[...]` | Propositions |
| `#th.important-block(fill: ...)[...]` | Important/highlighted blocks |

### Pinit — Annotations

The theme supports `pinit` for inline annotations and highlights:

```typst
#import "@preview/pinit:0.2.2" as pi

#pi.pin(1)text#pi.pin(2)
#pi.pinit-highlight(1, 2)
#pi.pinit-point-from(2)[annotation]
```

## Language Support

The theme supports bilingual presentations:

| Language Code | Language |
|---------------|----------|
| `"en"` | English |
| `"dk"` | Danish (Dansk) |

Set via the `language` parameter in `uc.ucph-metropolis-theme`.

## Branding Features

- **University seal**: `uc.logos.seal` displayed on title slides
- **UCPH colours**: Institutional red and blue palette
- **Metropolis design**: Clean, modern Metropolis-based slide layout
- **Gradient focus slides**: Custom red-to-blue gradients for emphasis
- **Fira Sans typography**: Light-weight sans-serif for elegant appearance
- **Bilingual**: Danish and English language support

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes for presenter mode

## Universe Link

[ucph-nielsine-touying on Typst Universe](https://typst.app/universe/package/ucph-nielsine-touying)
