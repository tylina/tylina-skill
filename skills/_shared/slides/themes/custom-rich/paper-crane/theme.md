# Paper Crane

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `paper-crane-theme`
**Style**: Origami-inspired, geometric folds, angular shapes, warm minimalism
**Primary color**: `#E8736A` (coral)
**Best For**: Strategy presentations, design thinking, creative workshops, product innovation, structured frameworks
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

An origami-inspired theme built around the visual metaphor of paper folding. Crisp geometric fold lines trace invisible creases across every slide, angular diamond patterns frame key moments, and paper crane silhouettes appear as persistent motifs. The warm coral and cream palette with indigo accents creates a space that feels both structured and inviting -- like a well-lit studio where ideas take flight through careful, intentional construction.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#show: paper-crane-theme.with(
  aspect-ratio: "16-9",
  footer: [Paper Crane],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
  config-common(breakable: false),
)

#title-slide()

= First Section

== First Slide

Content goes here.

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)
```

## Available Slide Types

### `#title-slide()`
Spacious cover slide with centered title, angular fold-line accent, and decorative diamond frame. Origami crane silhouettes at top-right and bottom-left as bookending elements. Uses `self.info` for title, subtitle, author, date, institution.

### `#slide(title: auto)`
Standard content slide with medium-weight indigo title, angular coral fold-line accent below, and persistent paper crane atmosphere (geometric fold-line crease pattern background, tiny crane in top-right corner, small diamond in bottom-left). Footer shows custom content, diamond marker, and page counter.

### `= Heading` (new-section-slide)
Auto-triggered section divider. Large faint coral section number with medium-weight title and angular fold accent. Fold-line background with small crane at bottom-right.

### `#focus-slide[...]`
Dramatic indigo background with white fold-line pattern overlay. Large translucent crane silhouette centered behind text. Content is centered with diamond dot beneath.

### `#ending-slide[...]`
Bookends with title slide -- same diamond frame decoration and crane silhouettes. Centered farewell text with angular accent line.

## Reusable Components

### `#concept-card(title, body, accent: palette.primary)`
Angular card with subtle shadow and fold-corner decoration in top-right. Includes `lazy-v(1fr)` for height equalization in `cols(lazy-layout: true)`; use exactly one card per lazy column.

**Parameters**: `title` (content), `body` (content), `accent` (color, optional)

### `#insight-box(title, body)`
Left-border accent block with coral emphasis -- like a folded paper edge. No `lazy-v` (adapts to content height).

**Parameters**: `title` (content), `body` (content)

### `#stat-card(label, value, accent: palette.dark)`
Diamond-shaped container for statistics. Geometric rotated square around the value number with label below.

**Parameters**: `label` (content), `value` (content), `accent` (color, optional)

### `#quote-card(quote, author: none)`
Quotation block with small crane icon decoration in top-right corner. Italic text with optional author attribution.

**Parameters**: `quote` (content), `author` (content, optional)

### `#fold-card(title, body)`
Borderless card with subtle background fill and fold-corner decoration in top-left. Includes `lazy-v(1fr)` for equalization in `cols(lazy-layout: true)`; use exactly one card per lazy column.

**Parameters**: `title` (content), `body` (content)

### `#origami-box(title, body, accent: palette.sage)`
Two-part card with colored header bar (stacked pattern). Angular colored top section with white content area below. Includes `lazy-v(1fr)` for `cols(lazy-layout: true)`; use exactly one card per lazy column.

**Parameters**: `title` (content), `body` (content), `accent` (color, optional)

### `#timeline-entry(step, title, description)`
Step indicator with diamond-shaped number and content. Used for sequential processes, roadmaps, or ordered lists.

**Parameters**: `step` (content), `title` (content), `description` (content)

### `#comparison-card(left-title, left-body, right-title, right-body, left-accent: palette.primary, right-accent: palette.sage)`
Two-panel side-by-side layout with vertical divider. Each panel has its own accent-colored title.

**Parameters**: `left-title`, `left-body`, `right-title`, `right-body` (all content), `left-accent`, `right-accent` (colors, optional)

### `#crane-divider(width: 80%)`
SVG-based decorative separator with geometric diamond/arrow motif at center. NOT a plain line.

**Parameters**: `width` (relative, optional)

### `#fold-tag(content, color: palette.primary)`
Small inline tag/badge with angular appearance. For categorization or labeling.

**Parameters**: `content` (content), `color` (color, optional)

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `palette.primary` | `#E8736A` | Coral -- warm accent, fold-lines, emphasis |
| `palette.dark` | `#3D5A80` | Indigo -- headings, contrast, focus-slide bg |
| `palette.accent` | `#D4A574` | Cream gold -- warm highlights, secondary crane |
| `palette.sage` | `#7BA08C` | Muted sage -- natural complement, variety |
| `palette.bg` | `#FFF9F5` | Warm white -- page background |
| `palette.card` | `#FFFCF9` | Slightly warmer -- card surfaces |
| `palette.text-dark` | `#2C3040` | Near-black -- primary text |
| `palette.text-body` | `#3D4055` | Softer -- body text |
| `palette.text-light` | `#7A7E8F` | Muted -- captions, metadata |
| `palette.border` | `#EDE6DE` | Subtle -- card borders |
| `palette.fold-line` | `#D4CCC4` | Neutral -- background crease pattern |

## Component Structural Diversity

| Pattern | Components |
|---------|-----------|
| SVG decoration inside | `concept-card` (fold-corner), `quote-card` (crane icon) |
| `place()` overlay | `concept-card`, `fold-card`, `stat-card` (rotated diamond) |
| No visible border | `fold-card` (typography + background only) |
| SVG divider | `crane-divider` (geometric diamond motif) |
| Tag/badge | `fold-tag` (inline pill element) |
| Stacked (header + body) | `origami-box` (colored header bar) |
| Two-panel | `comparison-card` (side-by-side with divider) |
| Step indicator | `timeline-entry` (diamond number + content) |
