# MUW Touying Community

**Type**: Institutional Theme
**Package**: `@preview/muw-touying-community:0.1.0`
**Touying version**: 0.6.1
**Entry function**: `muw-slides`
**Style**: Institutional, Austrian, Medical, Corporate Design
**Primary color**: MedUni Wien Dark Blue (dunkelblau)
**Institution**: Medizinische Universität Wien (Medical University of Vienna)
**Best For**: Medical University of Vienna
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/muw-touying-community).

## Description

An unofficial Touying-based presentation theme following the **Medical University of Vienna** (Medizinische Universität Wien, MUW) Corporate Design guidelines. The theme replicates the look and feel of MUW's official PowerPoint templates with dark blue ("dunkelblau") and white colour schemes, the MedUni Wien logo, and structured slide layouts suitable for medical research presentations, clinical seminars, and academic lectures. This is a community-contributed theme and is **not** affiliated with or endorsed by the Medical University of Vienna. The MedUni Wien logo is included but is the intellectual property of the university and subject to copyright.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/muw-touying-community:0.1.0": *

#set text(lang: "en")

#show: muw-slides.with(
  config-common(slide-level: 2, breakable: false),
  config-info(
    title: [Advances in Translational Oncology],
    author: [Univ. Prof. Dr. Maria Hofer],
    institution: [Universitätsklinik für Innere Medizin I],
    organization: [Medizinische Universität Wien],
  ),
  footer-title: [Advances in Translational Oncology],
  footer-orga: [Universitätsklinik für Innere Medizin I],
  page-numbering-start: 2,
)

#title-slide-dunkelblau()

= Background

== Clinical Motivation

Current challenges in translational oncology:

- Tumour heterogeneity and treatment resistance
- Biomarker-driven patient stratification
- Bridging preclinical models to clinical outcomes

= Results

== Statistical Analysis

$ "HR" = 0.62 quad (95% "CI": 0.48 - 0.81, quad p < 0.001) $
```

## Theme Parameters

### `muw-slides` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `str` | `"16-9"` | Slide aspect ratio, such as `"16-9"` or `"4-3"` |
| `footer-title` | `content` | Package placeholder | Topic or presenter text in the footer; set this explicitly to avoid placeholder output |
| `footer-orga` | `content` | Package placeholder | Organisational-unit text in the footer; set this explicitly to avoid placeholder output |
| `show-date` | `bool` | `false` | Whether the current date is shown in the footer |
| `page-numbering-start` | `int` | `2` | First page to show slide numbers |
| `..args` | arguments | — | Additional configuration forwarded to Touying |

### `config-common` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `slide-level` | `int` | `2` | Heading level that creates content slides |
| `breakable` | `bool` | package default | Forwarded to the package-owned Touying common configuration; `false` prevents accidental continuation pages and must be paired with page-by-page review |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `author` | `content` | Author name with academic title |
| `institution` | `content` | Department or clinic name |
| `organization` | `content` | Organisation name (e.g., Medizinische Universität Wien) |

## Available Slide Types

### `#title-slide-dunkelblau()`

The title/cover slide with a dark blue ("dunkelblau") and white background following MUW Corporate Design. Displays the MedUni Wien logo, title, author, institution, and organisation. This is the primary title slide variant.

### `= Section Header` (Section Slide)

Level-1 headings (`=`) create **section divider slides** with a white background. These serve as visual transitions between major parts of the presentation. Body text can follow the heading for brief section descriptions.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides** following MUW's corporate layout with consistent typography and spacing.

### `=== Subtitle` (Subtitle Element)

Level-3 headings (`===`) create **subtitles** within content slides, providing hierarchical structure within a single slide.

## Color Scheme

The theme follows MedUni Wien's Corporate Design colour palette:

| Role | Description |
|------|-------------|
| Dunkelblau (Dark Blue) | Primary brand colour, title slide background |
| White | Title slide text, content slide background |
| MUW accent colours | Used for structural elements per corporate guidelines |

## Branding Features

- **MedUni Wien logo**: Official university logo included in the theme (copyright of MedUni Wien)
- **Corporate Design compliance**: Layout follows MUW's official PowerPoint template guidelines
- **Dunkelblau title slide**: Dark blue background matching MUW visual identity
- **White content slides**: Clean white background for readability in lecture halls
- **Page numbering**: Configurable start page for slide numbers (default starts at page 2)
- **Footer metadata**: Pass `footer-title` and `footer-orga` explicitly; the package defaults are visible instructional placeholders

## Compatibility Notes

The package owns its Touying 0.6.1 dependency and should be used with that supported API. It also hard-codes Georgia and Lucida Sans in its internal slide and footer functions. On systems without Lucida Sans, Typst may emit a font-fallback warning even though the rendered fallback is readable; removing that diagnostic requires an upstream package change.

## Content Guidelines

The theme is designed for medical and scientific presentations. Consider using:

- Clinical data tables with confidence intervals
- Statistical notation ($p$-values, hazard ratios, odds ratios)
- Patient cohort descriptions
- Kaplan-Meier survival references
- Imaging figure descriptions

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes for presenter mode

## Universe Link

[muw-touying-community on Typst Universe](https://typst.app/universe/package/muw-touying-community)
