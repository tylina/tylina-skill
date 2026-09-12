# Sano Presentation Template

**Type**: Minimal Theme
**Package**: `@preview/sano-presentation-template:1.0.0`
**Touying version**: 0.6.1
**Entry function**: `sano`
**Style**: Minimal, Clean, Academic
**Primary color**: Sano Blue (`#0025AA`)
**Institution**: General-purpose (no specific institution)
**Best For**: Minimal presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/sano-presentation-template).

## Description

A small, minimal, and elegant presentation template built on the Touying slide framework. Sano ("sano" meaning "clear" or "healthy" in multiple languages) provides a distraction-free design with a bold blue accent colour, clean typography using New Computer Modern, and generous whitespace. The theme is intentionally lightweight (under 3 kB) and focuses on content readability over visual complexity, making it ideal for academic talks, research presentations, and seminars where the content should speak for itself.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/sano-presentation-template:1.0.0": *

#show: sano.with(
  config-info(
    title: [Graph Neural Networks for Molecular Property Prediction],
    author: [Dr. Sarah Chen],
    date: datetime.today(),
  ),
)

#title-slide[]

= Introduction

== Motivation

Graph-based representations of molecules enable:

- Permutation-invariant feature learning
- Capturing local and global structural motifs
- End-to-end differentiable property prediction

= Results

== Main Result

$ cal(L) = 1/N sum_(i=1)^N || f_theta (cal(G)_i) - y_i ||^2 $
```

## Theme Parameters

### `sano` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `footer` | `content` | `none` | Footer content (not used in default layout) |
| `lang` | `string` | `"en"` | Document language |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title (displayed at 30pt bold in blue) |
| `author` | `content` | Author name (shown as "By [author]" on title slide) |
| `date` | `datetime` | Presentation date |

## Available Slide Types

### `#title-slide(height: 100%)[...]`

The title/cover slide with large bold title text in Sano Blue, followed by additional content and the author attribution. The layout uses generous margins (85pt left, 180pt right) with bottom-aligned text.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `height` | `length` | `100%` | Slide height |

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides** with the section title centred at 26pt bold in blue on a clean background. The upstream package reserves a top-right section-counter header, but its default white text is not visible against the white page. These slides provide visual breaks between major presentation sections.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides** with the heading displayed at 20pt bold in blue (60% width block). Sub-headings within slides are rendered at 18pt bold in blue. The layout uses comfortable margins (70pt top, 70pt left/right) and the content fills the available vertical space.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `auto/content` | `auto` | Slide title; `auto` uses the heading text |

## Color Scheme

| Role | Name | Hex | Usage |
|------|------|-----|-------|
| Primary | Sano Blue | `#0025AA` | Titles, headings, section numbers |
| Dark | Black | `#000000` | Body text |
| Light | White | `#FFFFFF` | Background, section counter text |

## Typography

The theme uses a carefully selected typographic setup:

| Setting | Value | Description |
|---------|-------|-------------|
| Body font | New Computer Modern | Clean serif for academic text |
| Font size | 16pt | Comfortable reading size |
| Paragraph spacing | 1.8em | Generous vertical rhythm |
| Leading | 0.75em | Line spacing |
| List spacing | 0.8em | Minimum space between list items; set explicitly in a deck because the upstream package defaults to 0.7em |

## Design Philosophy

- **Minimalism**: No logos, no footers, no progress bars by default
- **Content focus**: Large margins and generous spacing direct attention to content
- **Academic typography**: New Computer Modern for familiar scientific document feel
- **Bold accents**: Blue headings provide visual hierarchy without clutter
- **Lightweight**: Entire theme is under 3 kB — fast to compile

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes for presenter mode

## Universe Link

[sano-presentation-template on Typst Universe](https://typst.app/universe/package/sano-presentation-template)
