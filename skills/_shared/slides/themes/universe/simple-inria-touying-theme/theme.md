# Simple INRIA Touying Theme

**Type**: Institutional Theme
**Package**: `@preview/simple-inria-touying-theme:0.1.2`
**Touying version**: 0.6.3
**Entry function**: `inria-theme`
**Style**: Institutional, French, Academic, Research
**Primary color**: INRIA Rouge (`#c9191e`)
**Secondary color**: INRIA Framboise (`#a60f79`)
**Institution**: Inria (Institut national de recherche en sciences et technologies du numérique)
**Best For**: Inria research institute
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/simple-inria-touying-theme).

## Description

An unofficial Touying presentation theme that approximates **Inria's graphic charter** while remaining simple and elegant. Inria is France's national research institute for digital science and technology. The theme features Inria's distinctive rouge (red) colour palette, the Inria logo, a progress bar footer, configurable headers and footers, section slides, and a focus slide. Typography follows Inria's recommendations using Inria Sans (with Fira Sans and Noto Sans fallbacks) and Fira Math for mathematical content. The theme supports both `"16-9"` and `"4-3"` aspect ratios and offers flexible heading modes for section slides.

## Quick Start

```typst
#import "@preview/touying:0.6.3": *
#import "@preview/simple-inria-touying-theme:0.1.2": *

#show: inria-theme.with(
  aspect-ratio: "16-9",
  align: top,
  config-info(
    title: [Formal Verification of Distributed Systems],
    subtitle: [Model Checking with Temporal Logic],
    author: [Dr. Marie Dupont],
    date: datetime.today(),
    institution: [Inria Paris -- Prosecco Team],
  ),
  config-common(breakable: false),
  footer-progress: true,
  section-slides: false,
  black-title: true,
)

// Keep the package entry point reusable; select installed fonts in the deck.
#set text(font: "Arial", size: 20pt)

#title-slide()

= Introduction

== Why Formal Methods

Formal methods provide rigorous guarantees for critical systems.

= Results

== Model Checking Performance

$ cal(M), s models.double phi quad arrow.r.double quad
  forall pi in "Paths"(s): pi models.double phi $

#focus-slide[
  Thank you!
]
```

## Theme Parameters

### `inria-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default content alignment |
| `header` | `content/function` | current heading | Header content; can be a function `self => ...` |
| `header-right` | `content` | logo from `self.info.logo` | Right-side header content |
| `logo` | `image` | Red Inria logo | Logo for title slide |
| `footer` | `content/function` | logo | Footer content; customisable (e.g., `self => self.info.author`) |
| `footer-right` | `content` | slide counter | Right-side footer (page number) |
| `footer-progress` | `bool` | `true` | Show progress bar at bottom |
| `section-slides` | `bool` | `true` | If true, `=` headings define content slides; if false, creates dedicated section slides |
| `black-title` | `bool` | `true` | Use normal text colour for titles instead of accent colour |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle |
| `author` | `content` | Author name(s) |
| `date` | `datetime` | Presentation date |
| `institution` | `content` | Inria centre/team affiliation |
| `logo` | `image` | Logo for header-right position |

## Available Slide Types

### `#title-slide(extra: none, ..args)`

The title/cover slide displaying the Inria logo, title, subtitle, author, date, institution, and optional extra content. Reads metadata from `self.info`.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `extra` | `content` | `none` | Additional information below standard fields |

### `= Section Heading` (Section Slide or Content Slide)

Behaviour depends on the `section-slides` parameter:
- **`section-slides: true`** (default): Level-1 headings create content slides directly with the heading as the title. Content follows immediately.
- **`section-slides: false`**: Level-1 headings create dedicated section transition slides (via `new-section-slide`), and content is placed on subsequent `==` slides.

### `== Slide Title` (Content Slide)

Level-2 headings create standard **content slides** with branded header and footer.

### `#slide(title: auto, footer: auto, align: horizon, ..args)`

Explicit slide function with full parameter control:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `config` | `dict` | `(:)` | Slide configuration |
| `repeat` | `auto/int` | `auto` | Number of sub-slides |
| `setting` | `function` | `body => body` | Additional set/show rules |
| `composer` | `function` | `components.side-by-side` | Layout composer |
| `title` | `auto/content` | `auto` | Slide title |
| `footer` | `auto/content` | `auto` | Footer override |
| `align` | `alignment` | `horizon` | Content alignment |

### `#focus-slide[content]`

A full-slide emphasis slide with background colour set to `primary-dark` (INRIA bleu nuit). Text is displayed in white. Ideal for conclusions, key messages, or "Thank you" slides.

### `#new-section-slide(short-title: auto, title)`

Creates an explicit section transition slide with the given title. Used automatically when `section-slides: false`.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `short-title` | `auto/content` | `auto` | Short title for navigation |
| `title` | `content` | required | Section title |

## Color Scheme

The theme defines Inria's official institutional colour palette:

| Variable | Name | Hex | Usage |
|----------|------|-----|-------|
| `inria-rouge` | Rouge | `#c9191e` | Primary brand, bullets, accents |
| `inria-framboise` | Framboise | `#a60f79` | Secondary colour |
| `inria-violet` | Violet | `#5d4b9a` | Accent |
| `inria-bleu-nuit` | Bleu Nuit | `#27348b` | Focus slide background, primary-light |
| `inria-bleu-canard` | Bleu Canard | `#1067a3` | Accent |
| `inria-bleu-azur` | Bleu Azur | `#00a5cc` | Accent |
| `inria-bleu-vert` | Bleu Vert | `#88ccca` | Accent |
| `inria-gris-bleu` | Gris Bleu | `#384257` | Neutral darkest, body text |
| `inria-cactus` | Cactus | `#608b37` | Accent |
| `inria-vert-tendre` | Vert Tendre | `#95c11f` | Accent |
| `inria-jaune` | Jaune | `#ffcd1c` | Accent |
| `inria-orange` | Orange | `#ff8300` | Accent |
| `inria-sable` | Sable | `#d6bc86` | Accent |

### Default Colour Configuration

```typst
config-colors(
  primary: inria-rouge,
  primary-light: inria-bleu-nuit,
  secondary: inria-framboise,
  neutral-lightest: white,
  neutral-darkest: inria-gris-bleu,
)
```

## Typography

| Setting | Value | Description |
|---------|-------|-------------|
| Body font | Inria Sans (→ Fira Sans → Noto Sans → DejaVu Sans Mono) | Package font chain; choose a verified proportional font in the deck when the first three are unavailable |
| Math font | Fira Math | Matching sans-serif math |
| `strong(delta: 100)` | Bold text | Enhanced weight delta |
| `par(justify: true)` | Justified text | Professional paragraph layout |

## Utility Functions

- `#bold(body)` — Shorthand for bold text
- `#fullcite(label)` — Full citation at 0.5em size

## Branding Features

- **Inria logo**: Red Inria logo on title slide and in header-right
- **Progress bar**: Primary-coloured progress bar at page bottom
- **Rouge accents**: Inria red used for bullets, headings (when `black-title: false`), and highlights
- **Focus slide**: Bleu Nuit background with white text for emphasis
- **Header/footer**: Customisable with functions accessing `self.info`

## Recommended Settings

```typst
#set text(lang: "en")
#set text(font: "Arial", size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 100)
#set par(justify: true)
```

For heading-based decks, prefer `section-slides: false` so `=` creates a dedicated section divider and every `==` heading owns one content slide. For dense academic material, `align: top` keeps body flow below the header. Pass `config-common(breakable: false)` through `inria-theme.with(...)` and keep each slide within its visible frame; this prevents dense content from flowing into the following titled slide.

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes for presenter mode
- `#show: appendix` — Switch to appendix mode

## Universe Link

[simple-inria-touying-theme on Typst Universe](https://typst.app/universe/package/simple-inria-touying-theme)
