# Clear TUB Theme

**Type**: Institutional / University
**Package**: `@preview/clear-tub:0.2.0`
**Touying version**: 0.6.1
**Entry function**: `tub-theme`
**Style**: Academic, institutional, German university, corporate design
**Primary color**: TU Berlin Red (`#c50e1f`)
**Institution**: Technische Universität Berlin (TU Berlin), Germany
**Best For**: TU Berlin presentations
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/clear-tub).

## Description

The Clear TUB theme is an unofficial Touying presentation template following
the TU Berlin corporate design guidelines. It features the distinctive TU Berlin
red accent color, a light-gray header bar with slide titles and logo, a
three-segment footer (author, title, date/page), and an optional progress bar.
The theme includes content helper functions for academic presentations —
theorem/definition/example blocks, alert boxes, highlight boxes, quote blocks,
and footnote-style citations. Logo files for TU Berlin are included but are
copyrighted by TU Berlin and restricted to authorized users.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/clear-tub:0.2.0": *

#show: tub-theme.with(
  aspect-ratio: "16-9",
  progress-bar: false,
  logo: image("tub_logo.png"),
  department: [Department of Computer Science],
  config-info(
    title: [Research Presentation Title],
    subtitle: [A Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Technische Universität Berlin],
  ),
)

#title-slide()

#outline-slide()

= Introduction

== First Slide

Your content here.
```

> **`clear-tub` 0.2.0 compatibility note:** In the current renderer, enabling
> the package progress bar can intermittently suppress the three-segment
> footer on otherwise valid content slides. Keep `progress-bar: false` for
> stable footer rendering until the upstream package fixes the interaction.
> The local demo uses this safe setting.

## Theme Parameters

The `tub-theme` function accepts the following parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `department` | `none` | Department name shown on title slide |
| `logo` | `none` | Logo image for header and title slide |
| `progress-bar` | `true` | Show thin progress bar below footer; use `false` for stable rendering with package version 0.2.0 (see note above) |
| `footer-a` | Author | Left footer segment (callback: `self => ...`) |
| `footer-b` | Title or short-title | Center footer segment (callback) |
| `footer-c` | Date + slide counter | Right footer segment (callback) |

### config-info() Parameters

| Parameter | Description |
|-----------|-------------|
| `title` | Presentation title |
| `short-title` | Short title for footer (defaults to full title) |
| `subtitle` | Presentation subtitle |
| `author` | Author name(s) |
| `date` | Date (supports `datetime.today()`) |
| `institution` | Institution name |

### config-colors() Overrides

| Parameter | Default | Description |
|-----------|---------|-------------|
| `primary` | `#c50e1f` | Override accent color |
| `neutral-darkest` | `#000000` | Override body text color |

### config-common() Options

| Parameter | Description |
|-----------|-------------|
| `show-notes-on-second-screen` | Show speaker notes (e.g., `right`) |

## Available Slide Types

### `#title-slide()`
Centered title page with logo, title (in TU Berlin red), subtitle, author,
department, and date. No header or footer is shown.

### `= Heading` (Section slide)
Level-1 headings automatically create section divider slides. Displays the
section name centered in large TU Berlin red text. No header or footer.

### `== Heading` (Content slide)
Level-2 headings create standard content slides with a light-gray header bar
(slide title + logo) and a three-segment footer.

### `#slide(title: ..., composer: ...)[...]`
Explicit content slide. Supports multi-column layouts via the `composer`
parameter:
```typst
#slide(composer: (1fr, 1fr))[Left column][Right column]
#slide(composer: (2fr, 1fr))[Wider left][Narrower right]
```

### `#outline-slide()`
Progressive table of contents. Current section is highlighted, others are
dimmed. No header or footer.

### `#ending-slide(title: [...])[...]`
Closing slide with a red rounded-corner block for the title and body text
below. Ideal for "Thank you" or "Questions?" slides. No header or footer.

## Color Scheme

| Color | Hex | Role |
|-------|-----|------|
| TU Berlin Red | `#c50e1f` | Primary accent, headings, header title |
| Primary Dark | `#9a0b18` | Block title bars |
| Gray | `#717171` | Secondary text, subtitles, footnotes |
| Light Gray | `#f5f5f5` | Header background, highlight boxes |
| Black | `#000000` | Body text, footer segments |
| White | `#ffffff` | Backgrounds, ending slide text |

## Branding Features

- **Logo**: TU Berlin logo in header bar (right side) and title slide (centered).
  Set via the `logo` parameter. Logo files included but © TU Berlin.
- **Header bar**: Light-gray background with slide title (left, TU Berlin red)
  and logo (right) on content slides
- **Three-segment footer**: Author (dark background) | Title (red background) |
  Date + Page (dark background)
- **Progress bar**: Thin red bar below footer showing presentation progress
  (toggleable via `progress-bar` parameter)
- **Typography**: Arial / Helvetica Neue / Helvetica font stack at 20pt base size

## Content Helpers

### Blocks and Boxes

| Function | Description |
|----------|-------------|
| `#tub-block(title: [...])[...]` | Styled block with colored header bar and light body |
| `#tub-theorem[...]` | Theorem block (pre-titled "Theorem") |
| `#tub-definition[...]` | Definition block (pre-titled "Definition") |
| `#tub-example[...]` | Example block (pre-titled "Example") |
| `#alert-box[...]` | Red left-border box on light-red background |
| `#highlight-box[...]` | Bold red text on light-gray background with red left border |

### Text and Citation Helpers

| Function | Description |
|----------|-------------|
| `#emphasis[...]` | Bold red inline text |
| `#quote-block(attribution: [...])[...]` | Styled blockquote with left gray border |
| `#slide-cite[...]` | Footnote-style citation |
| `#slide-ref[...]` | Bottom-aligned reference text in small gray font |

### Usage Examples

```typst
#tub-theorem[
  For all $n >= 1$: $sum_(k=1)^n k = n(n+1)/2$.
]

#alert-box[
  Important: Deadline for submission is March 15.
]

#quote-block(attribution: [Albert Einstein])[
  Imagination is more important than knowledge.
]
```

## Animation Support

- `#pause` — progressive content reveal across sub-slides
- `#meanwhile` — show content simultaneously in another area
- `#speaker-note[...]` — hidden speaker notes (pdfpc compatible)
- Standard Touying animation functions (`#uncover`, `#only`, `#alternatives`)

## Universe Link

[clear-tub on Typst Universe](https://typst.app/universe/package/clear-tub)
