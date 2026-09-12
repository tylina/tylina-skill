# ENS Rennes Presentation

**Type**: Institutional Theme
**Package**: `@preview/ens-rennes-presentation:0.1.0`
**Touying version**: 0.6.1 (package-owned)
**Entry function**: `ens-rennes-theme`
**Style**: Institutional, French, Grande École
**Primary color**: ENS Blue (`#324c98`)
**Institution**: École Normale Supérieure de Rennes (ENS Rennes)
**Best For**: ENS Rennes presentations
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/ens-rennes-presentation).

## Description

A presentation theme for **ENS Rennes** (École Normale Supérieure de Rennes), one of France's prestigious Grandes Écoles. The theme follows the ENS Rennes graphic charter and supports department-specific branding for all six departments. It features three header layout styles, pre-built mathematical block environments (definitions, theorems, propositions, etc.), and a clean academic design with the ENS Rennes visual identity. The recommended font is Univers, with New Computer Modern Sans and CMU Sans Serif as fallbacks.

## Quick Start

```typst
#import "@preview/ens-rennes-presentation:0.1.0": *

#show: ens-rennes-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Théorie des Catégories et Informatique],
    subtitle: [Applications en Sémantique des Programmes],
    mini-title: [Catégories et Informatique],
    authors: [Dr. Morgane Le Gall],
    mini-authors: [Le Gall],
    date: datetime.today(),
  ),
  department: "info",
  display-dpt: false,
  section-style: "named subsection",
)

#title-slide()

= Introduction

== Contexte

#slide(title: [Motivation])[
  Les catégories fournissent un cadre unifié pour la
  sémantique des langages de programmation.

  - Foncteurs et transformations naturelles
  - Monades et effets de calcul
  - Catégories cartésiennes closes
]
```

## Theme Parameters

### `ens-rennes-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `department` | `string` | — | Department code (see Departments table) |
| `display-dpt` | `bool` | `false` | If `true`, uses department-specific graphic charter; if `false`, uses the school-wide ENS Rennes identity |
| `section-style` | `string` | — | Header display mode (see Section Styles below) |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle (optional) |
| `mini-title` | `content` | Shortened title for footer; falls back to `title` if not set |
| `authors` | `content` | Full author name(s) |
| `mini-authors` | `content` | Shortened author names for footer; falls back to `authors` if not set |
| `date` | `datetime/content` | Presentation date |

## Departments

ENS Rennes has six departments, each with its own graphic identity when `display-dpt: true`:

| Code | Department |
|------|-----------|
| `"info"` | Informatique (Computer Science) |
| `"maths"` | Mathématiques (Mathematics) |
| `"mktro"` | Mécatronique (Mechatronics) |
| `"dem"` | Droit, Économie, Management (Law, Economics, Management) |
| `"2sep"` | Sport, Santé, Société (Sport, Health, Society) |
| `"spen"` | Sciences pour l'Environnement (Environmental Sciences) |

## Section Styles

The `section-style` parameter controls how the header bar displays sections and subsections:

| Style | Header Behaviour | Content Pattern |
|-------|-----------------|-----------------|
| `"named subsection"` | Shows section and subsection titles in header | Use `#slide(title: [...])` for content |
| `"subsection"` | Shows section titles; subsections as bullets | Use `#slide(title: [...])` for content |
| `"compact section only"` | Compact header with sections + current subsection | Use `== Slide Title` heading syntax |

### Pattern for `"named subsection"` and `"subsection"`:

```typst
= Section Title
== Subsection Title

#slide(title: [Slide Title])[
  Content goes here.
]
```

### Pattern for `"compact section only"`:

```typst
= Section Title
== Slide Title

Content goes here directly after the heading.
```

## Available Slide Types

### `#title-slide(additional-content: none)`

The title/cover slide with the ENS Rennes logo, title, subtitle, author(s), and date.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `additional-content` | `content` | `none` | Extra content displayed below the standard fields |

### `= Section Title` (Section Heading)

Level-1 headings (`=`) create **sections** that appear in the header navigation. Sections provide visual structure and are tracked in the header bar according to the selected `section-style`.

### `== Subsection Title` (Subsection / Slide)

Level-2 headings (`==`) create **subsections** or direct slides, depending on the `section-style`:
- In `"named subsection"` and `"subsection"` modes: creates a subsection label
- In `"compact section only"` mode: creates a content slide directly

### `#slide(title: auto)[content]`

Standard content slide used with the `"named subsection"` and `"subsection"` styles.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `auto/none/content` | `auto` | `auto` uses the subsection heading; `none` hides it; or provide custom content |

## Mathematical Block Environments

The theme provides pre-built mathematical blocks using the `new-block` constructor. Each block type has a coloured accent bar and a formatted title.

### Pre-built Blocks

| Block Function | Label | Accent Color |
|---------------|-------|-------------|
| `definition` | Definition | Blue (`#324c98`) |
| `theorem` | Theorem | Red (`#bf0000`) |
| `corollary` | Theorem | Red (`#bf0000`) |
| `proposition` | Proposition | Green (`#006000`) |
| `lemma` | Lemma | Blue (`#324c98`) |
| `example` | Example | Green (`#006000`) |
| `remark` | Remark | Grey (`#555555`) |

Usage:

```typst
#definition(title: [Monad])[
  A monad on a category $cal(C)$ is an endofunctor
  $T : cal(C) -> cal(C)$ equipped with...
]

#theorem(title: [Lambek's Theorem])[
  The initial algebra of an endofunctor is an isomorphism.
]
```

### Custom Blocks

Create new block types using `new-block`:

```typst
#let conjecture = new-block(kind: [Conjecture], color: rgb("#8B4513"))

#conjecture(title: [Open Problem])[
  This conjecture remains unresolved.
]
```

### `tblock` Function

A more flexible block with direct title and colour:

```typst
#tblock(color: rgb("#324c98"), title: [Key Insight])[
  Content with custom styling.
]
```

## Color Scheme

| Role | Color | Hex |
|------|-------|-----|
| Definition / Lemma | ENS Blue | `#324c98` |
| Theorem / Corollary | Red | `#bf0000` |
| Proposition / Example | Green | `#006000` |
| Remark | Grey | `#555555` |

Department-specific colours are activated when `display-dpt: true`.

## Font Stack

The theme uses a cascading font stack aligned with the ENS Rennes graphic charter:

1. **Univers** — Official charter font (must be installed separately)
2. **New Computer Modern Sans** — First fallback
3. **CMU Sans Serif** — Second fallback
4. System default sans-serif font

## Branding Features

- **ENS Rennes logo**: Embedded in the package; displayed on title and content slides
- **Department branding**: Six department-specific visual identities via `display-dpt: true`
- **Graphic charter compliance**: Follows the official ENS Rennes graphic charter for colours, fonts, and layout
- **Mini-title / Mini-authors**: Shortened versions for the footer, keeping slides clean
- **Header navigation**: Section-aware header bar with three layout styles

## Import Note

This package re-exports its package-owned Touying 0.6.1 API, so you only need to import the theme package:

```typst
#import "@preview/ens-rennes-presentation:0.1.0": *
```

No separate `#import "@preview/touying:..."` is needed.

Do not add a direct Touying import or use Touying 0.7.x-only configuration
patterns with this theme; keep to the package's documented API.

## Tips

- Use `"named subsection"` for structured academic talks with clear sub-topics
- Use `"compact section only"` for shorter, simpler presentations
- The `mini-title` and `mini-authors` fields keep footers clean on content-heavy slides
- Set `display-dpt: true` with the appropriate `department` code for department-specific events
- Download the Univers font for full graphic charter compliance

## Universe Link

[ens-rennes-presentation on Typst Universe](https://typst.app/universe/package/ens-rennes-presentation)
