# Calmly Touying

**Type**: Universe (Typst package)
**Package**: `@preview/calmly-touying:0.2.0`
**Touying version**: 0.6.1
**Entry function**: `calmly`
**Style**: Minimalist, Moloch-inspired academic design
**Primary color**: `#4271AE` (Tomorrow blue)
**Best For**: Academic talks, feature-rich slides
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A modern, minimalist presentation theme for Touying inspired by the Moloch Beamer theme. Features four color palettes (Tomorrow, Warm Amber, Paper, Dracula), light and dark variants, golden-ratio spacing, a rich component library (30+ components), and 14 slide types including specialized slides for figures, equations, bibliographies, and acknowledgements. Designed for academic and professional presentations with clean typography and thoughtful visual hierarchy.

## Quick Start

```typst
#import "@preview/calmly-touying:0.2.0": *
#import "@preview/touying:0.6.1": config-common

#show: calmly.with(
  config-info(
    title: [Presentation Title],
    subtitle: [A Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution Name],
  ),
  config-common(breakable: false),
  variant: "light",
  colortheme: "tomorrow",
  progressbar: "foot",
  header-style: "moloch",
)

#set text(font: ("IBM Plex Sans", "PingFang SC"))

#title-slide(layout: "moloch")

= First Section

== First Slide

Your content here.

#focus-slide[
  Key Takeaway
]

#ending-slide(
  contact: ("email@example.com",),
)
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide format: `"16-9"` or `"4-3"` |
| `variant` | string | `"light"` | Color mode: `"light"` or `"dark"` |
| `colortheme` | string | `"tomorrow"` | Color palette: `"tomorrow"`, `"warm-amber"`, `"paper"`, `"dracula"` |
| `progressbar` | string | `"foot"` | Progress bar position: `"foot"`, `"head"`, `"frametitle"`, `"none"` |
| `header-style` | string | `"moloch"` | Header style: `"moloch"` (colored bar) or `"minimal"` (underline) |

> **Package compatibility:** In version 0.2.0, choose the title layout on `#title-slide(layout: ...)`. The similarly named theme-level argument is stored upstream but is not applied. In the current renderer, `#pause` can create intermediate pages with incomplete chrome; the repository demo therefore keeps reveal content static. Verify progressive reveals separately before using them in a delivered deck.

### `config-info()` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `none` | Presentation title |
| `subtitle` | content | `none` | Presentation subtitle |
| `author` | content | `none` | Author name |
| `date` | content/datetime | `none` | Presentation date |
| `institution` | content | `none` | Institution or affiliation |

## Available Slide Types

### `#title-slide(layout: "moloch")`
Title page with multiple layout variants. Select the layout on each title-slide call.

- **`"moloch"`** — Left-aligned title with separator line
- **`"centered"`** — Centered title with accent underline
- **`"split"`** — Two-column title with vertical separator

```typst
#title-slide()
#title-slide(layout: "centered")
#title-slide(layout: "split")
```

### `== Heading` (Standard Slide)
Standard content slide, created automatically from level-2 headings. Features Moloch-style colored header and configurable progress bar.

```typst
== Slide Title

Content goes here.
```

### `= Heading` (Section Heading)
Level-1 headings create new sections. Section names appear in headers and navigation.

### `#focus-slide[...]`
Full-bleed accent gradient background for emphasis. Takes a content block.

```typst
#focus-slide[
  Key Takeaway Message
]
```

### `#standout-slide[...]`
High-contrast dark background for maximum emphasis. Similar to focus-slide but uses `standout-bg` color.

```typst
#standout-slide[
  Important Statement
]
```

### `#section-slide(show-progress: false)[...]`
Clean section divider with optional progress indicator.

```typst
#section-slide[Section Title]
#section-slide(show-progress: false)[Section Title]
```

### `#figure-slide(figure, title: none, caption: none)`
Centered figure display slide.

```typst
#figure-slide(
  image("photo.png"),
  title: "Figure Title",
  caption: "A description of the figure.",
)
```

### `#figure-slide-split(left, right, title: none, caption-left: none, caption-right: none)`
Side-by-side figure comparison slide.

```typst
#figure-slide-split(
  image("before.png"),
  image("after.png"),
  title: "Comparison",
  caption-left: "Before",
  caption-right: "After",
)
```

### `#equation-slide(equation, title: none, subtitle: none, definitions: none, citation: none)`
Centered equation with definitions list and optional citation.

```typst
#equation-slide(
  $ E = m c^2 $,
  title: "Mass-Energy Equivalence",
  subtitle: "Special Relativity",
  definitions: [
    $E$ — Energy \
    $m$ — Mass \
    $c$ — Speed of light
  ],
  citation: (bib-key: "einstein1905", label: "Einstein, 1905"),
)
```

### `#bibliography-slide(bib-content)`
Styled references/bibliography slide.

```typst
#bibliography-slide(
  bib-content: bibliography("refs.bib"),
)
```

### `#acknowledgement-slide(subtitle, people, institutions, extra)`
People and institution acknowledgement cards.

```typst
#acknowledgement-slide(
  subtitle: "This work was supported by...",
  people: (
    (name: "Jane Doe", role: "Advisor"),
    (name: "John Smith", role: "Collaborator"),
  ),
  institutions: ("University A", "Lab B"),
  extra: [Additional thanks...],
)
```

### `#ending-slide(title, subtitle, contact)`
Closing/thank-you slide with contact information.

```typst
#ending-slide(
  title: "Thank You",
  subtitle: "Questions?",
  contact: ("email@example.com", "github.com/user"),
)
```

## Reusable Components

### Box Components

#### `#highlight-box(title: "...")[...]`
Left-accent gradient box for important information. Uses primary accent color.

```typst
#highlight-box(title: "Key Point")[
  Important information here.
]
```

#### `#alert-box(title: "...")[...]`
Red-accented warning/alert box.

```typst
#alert-box(title: "Warning")[
  Critical warning message.
]
```

#### `#example-box(title: "...")[...]`
Green-accented example box.

```typst
#example-box(title: "Example")[
  Demonstration content.
]
```

#### `#themed-block(title: "...", fill-mode: "...")[...]`
Generic themed container. Set `fill-mode: "fill"` for filled background.

```typst
#themed-block(title: "Note")[Content]
#themed-block(title: "Filled Block", fill-mode: "fill")[Content]
```

#### `#algorithm-box(title: "...")[...]`
Code/algorithm container with styled header.

```typst
#algorithm-box(title: "Algorithm 1: Binary Search")[
  1. Set low = 0, high = n - 1
  2. While low <= high...
]
```

#### `#quote-block()[...]`
Styled blockquote with attribution support.

```typst
#quote-block(attribution: [Steve Jobs])[
  "The only way to do great work is to love what you do."
]
```

#### `#code-block()[...]`
Styled code display block.

````typst
#code-block(lang: "python", ```python
print("Hello")
```.text)
````

#### `#soft-shadow-box()[...]`
Elevated box with subtle stroke for visual emphasis.

### Text Helpers

| Function | Description | Example |
|----------|-------------|---------|
| `#alert[...]` | Accent-colored inline text | `#alert[important]` |
| `#muted[...]` | Grey muted text | `#muted[secondary info]` |
| `#subtle[...]` | Light subtle text | `#subtle[minor detail]` |
| `#fig-caption[...]` | Italic figure caption | `#fig-caption[Figure 1]` |

### Citation Components

#### `#cite-box(key, display-label, position)`
Corner-positioned citation gadget.

```typst
#cite-box("einstein2005", display-label: "Einstein, 2005", position: "top-right")
#cite-box("smith2023", position: "bottom-right")
```

Positions: `"top-right"`, `"bottom-left"`, `"bottom-right"`

Inline citations with `@key` render with a subtle grey background pill.

### Native Layouts

The package pins Touying 0.6.1, which predates Touying's `cols`/`lazy-layout` API. Use Typst's native `grid()` directly for package-compatible column layouts. Keep complete caller-side components in direct natural flow; use `stack(spacing:)` only for one deliberately composed vertical group.

```typst
#grid(
  columns: (golden-split-left, golden-split-right),
  column-gutter: 1.5em,
  [Left column content],
  [Right column content],
)
```

### Visual Elements

| Function | Description |
|----------|-------------|
| `#accent-line()` | Gradient accent line |
| `#soft-divider()` | Subtle horizontal divider |
| `#pill[...]` | Rounded tag/label badge |
| `#bullet-circle()` | Level 1 bullet marker |
| `#bullet-square()` | Level 2 bullet marker |
| `#bullet-dash()` | Level 3 bullet marker |

### Card Components

| Function | Description |
|----------|-------------|
| `#person-card(name, role)` | Person display card (used in acknowledgement-slide) |
| `#institution-card(name)` | Institution display card |

## Progressive Reveals

```typst
== Animated Slide

First point is always visible.

#pause

Second point appears on click.

#pause

Third point appears on next click.
```

```typst
== Selective Display

#only(1)[Shown only on sub-slide 1]
#only(2)[Shown only on sub-slide 2]
#only("3-")[Shown from sub-slide 3 onward]
```

## Color Themes

Four built-in color themes, each with light and dark variants (8 combinations total):

| Theme | Description | Accent Primary |
|-------|-------------|---------------|
| **Tomorrow** (default) | Programmer-friendly palette with balanced blue tones | `#4271AE` |
| **Warm Amber** | Soft, warm tones with amber accents; premium feel | Amber hues |
| **Paper** | High contrast black/white with blue accents; academic | Blue accents |
| **Dracula** | Dark purple and pink accents; popular developer palette | Purple/pink |

### Tomorrow Light Colors (Default)

| Token | Hex | Usage |
|-------|-----|-------|
| `accent-primary` | `#4271AE` | Headers, links, focus slides |
| `accent-secondary` | `#718C00` | Example boxes, secondary highlights |
| `accent-glow` | `#3E999F` | Teal accent for special elements |
| `accent-deep` | `#8959A8` | Purple accent for variety |
| `bg-base` | `#FFFFFF` | Slide background |
| `bg-muted` | `#F2F2F2` | Muted background areas |
| `text-primary` | `#1D1F21` | Main body text |
| `text-secondary` | `#4D4D4C` | Secondary text |
| `alert-border` | `#C82829` | Alert box accents |
| `example-border` | `#718C00` | Example box accents |
| `focus-bg` | `#4271AE` | Focus slide background |
| `standout-bg` | `#1D1F21` | Standout slide background |

### Color System Functions

| Function | Description |
|----------|-------------|
| `get-theme-colors()` | Retrieve color palette by theme name and variant |
| `make-gradients()` | Generate gradient definitions from theme colors |

## Theme Aliases

Pre-configured shortcuts for common setups:

| Alias | Description |
|-------|-------------|
| `warm-amber-theme` | Backward-compatible alias for `calmly`; pass `colortheme: "warm-amber"` explicitly |
| `thesis-theme` | Alias for calmly (academic defaults) |
| `moloch-style-theme` | Preconfigured Moloch header and foot progress bar |
| `minimal-style-theme` | Preconfigured minimal header and foot progress bar |
| `dark-theme` | Preconfigured dark variant |

## Spacing & Typography Constants

### Spacing

| Constant | Size |
|----------|------|
| `spacing-xs` | 6pt |
| `spacing-sm` | 10pt |
| `spacing-md` | 16pt |
| `spacing-lg` | 24pt |
| `spacing-xl` | 36pt |
| `spacing-2xl` | 48pt |

### Typography Sizes

| Constant | Size |
|----------|------|
| `size-display` | 42pt |
| `size-title` | 34pt |
| `size-slide-title` | 26pt |
| `size-body` | 17pt |
| `size-small` | 15pt |
| `size-caption` | 13pt |

### Default Fonts

- **Headings**: Source Sans 3, Inter, Noto Sans, sans-serif fallback list
- **Body**: Source Sans 3, Inter, Noto Sans, sans-serif fallback list
- **Monospace**: JetBrains Mono, Fira Code, Noto Sans Mono, monospace fallback list

These families are hard-coded by the external package. If none are installed, Typst falls back visually and reports package-source font warnings. The verified repository demo applies installed IBM Plex Sans after the theme show rule to preserve the intended sans-serif character; choose an installed local substitute if IBM Plex Sans is unavailable on another system. The package-source warnings remain until one of the hard-coded upstream families is installed.

### Golden Ratio Utilities

| Constant/Function | Description |
|--------------------|-------------|
| `phi` | Golden ratio (1.618...) |
| `golden-major` | ~0.618 proportion |
| `golden-minor` | ~0.382 proportion |
| `golden-split-left` | ~38.2% width for layouts |
| `golden-split-right` | ~61.8% width for layouts |
| `golden-center(body)` | Golden-ratio vertical centering |

## Files

- `demo.typ` — Comprehensive feature showcase (compilable)
- `theme.md` — This documentation file

## Links

- [calmly-touying on Typst Universe](https://typst.app/universe/package/calmly-touying)
- [Source on GitHub](https://github.com/YHan228/calmly-touying)
