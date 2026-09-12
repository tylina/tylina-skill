# Metropolyst

**Type**: Universe (Typst package)
**Package**: `@preview/metropolyst:0.1.0`
**Touying version**: 0.6.1+
**Minimum Typst version**: 0.12.0
**Entry function**: `metropolyst-theme`
**Style**: Modern, clean, Metropolis-inspired
**Default accent color**: `rgb("#eb811b")` (orange)
**Default header background**: `rgb("#23373b")` (dark teal)
**Author**: Ben Zipperer
**License**: MIT
**Best For**: Academic talks, configurable Metropolis style
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Metropolyst is a highly configurable variant of the Metropolis beamer theme for Touying presentations. It provides extensive font and color customization through a cascading parameter system — set a base `font` or `accent-color` and all related elements inherit automatically, or override individual elements for precise control. The theme includes a brand preset system for organizational styling and stays true to the clean, minimalist aesthetic of the original Metropolis theme by Matthias Vogelgesang.

**Recommended font**: Fira Sans (default). Install via `sudo apt install fonts-fira-sans` (Linux), `brew install --cask font-fira-sans` (macOS), or from Google Fonts (Windows). If it is unavailable, set the theme's `font:` parameter and the demo-level `#set text(...)` to an installed family such as Arial; use an installed math face (for example, STIX Two Math) for equation overrides.

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/metropolyst:0.1.0": *

#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
    logo: emoji.rocket,
  ),
)

// Recommended text settings (match Metropolis style)
// Keep this in sync with the theme's font: parameter.
#set text(font: "Fira Sans", weight: "light", size: 20pt)
#set strong(delta: 100)
#set par(justify: true)

#title-slide()

= First Section

== First Slide

Your content here. Use #alert[alert] for accent-colored text.

#focus-slide[
  Thank you!
]
```

## Theme Parameters

All parameters for the `metropolyst-theme` entry function:

### Layout and Structure

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Vertical content alignment (`horizon`, `top`, `bottom`) |
| `header` | content/function | current heading | Header left content; can be `self => content` |
| `header-right` | content/function | `self.info.logo` | Header right content; can be `self => content` |
| `footer` | content/function | `none` | Footer left content; can be `self => content` |
| `footer-right` | content/function | slide counter (`"N / total"`) | Footer right content; can be `self => content` |
| `footer-progress` | boolean | `false` | Show a 2pt progress bar at the bottom of content slides |

### Font Parameters (Cascading System)

Fonts cascade: setting `font` changes all fonts unless a specific `*-font` parameter overrides it. All `*-font` parameters default to `auto` (inheriting from `font`).

```typst
// All elements use Libertinus Serif, except headers use Fira Sans
#show: metropolyst-theme.with(
  font: ("Libertinus Serif",),
  header-font: ("Fira Sans",),
)
```

#### Base Font

| Parameter | Type | Default | Description |
|---|---|---|---|
| `font` | string/array | `("Fira Sans",)` | Base font family; inherited by all `*-font` parameters when they are `auto` |

#### Header Fonts

| Parameter | Type | Default | Description |
|---|---|---|---|
| `header-font` | auto/string/array | `auto` | Slide header font (inherits `font`) |
| `header-size` | length | `1.2em` | Slide header text size |
| `header-weight` | string | `"regular"` | Slide header text weight |

#### Footer Fonts

| Parameter | Type | Default | Description |
|---|---|---|---|
| `footer-font` | auto/string/array | `auto` | Footer font (inherits `font`) |
| `footer-size` | length | `0.6em` | Footer text size |
| `footer-weight` | string | `"regular"` | Footer text weight |

#### Title Slide Fonts

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title-font` | auto/string/array | `auto` | Title slide title font (inherits `font`) |
| `title-size` | length | `1.4em` | Title text size |
| `title-weight` | string | `"regular"` | Title text weight |
| `subtitle-size` | length | `1.0em` | Subtitle text size |
| `subtitle-weight` | string | `"light"` | Subtitle text weight |
| `author-size` | length | `0.8em` | Author text size |
| `author-weight` | string | `"light"` | Author text weight |
| `date-size` | length | `0.8em` | Date text size |
| `date-weight` | string | `"light"` | Date text weight |
| `institution-size` | length | `0.8em` | Institution text size |
| `institution-weight` | string | `"light"` | Institution text weight |
| `extra-size` | length | `0.8em` | Extra text size (from `title-slide(extra: ...)`) |
| `extra-weight` | string | `"light"` | Extra text weight |
| `logo-size` | length | `2em` | Logo size on title slide |

#### Section Slide Fonts

| Parameter | Type | Default | Description |
|---|---|---|---|
| `section-font` | auto/string/array | `auto` | Section divider font (inherits `font`) |
| `section-size` | length | `1.4em` | Section heading text size |
| `section-weight` | string | `"regular"` | Section heading text weight |

#### Focus Slide Fonts

| Parameter | Type | Default | Description |
|---|---|---|---|
| `focus-font` | auto/string/array | `auto` | Focus slide font (inherits `font`) |
| `focus-size` | length | `1.4em` | Focus slide text size |
| `focus-weight` | string | `"regular"` | Focus slide text weight |

### Color Parameters (Cascading System)

Colors cascade: `accent-color` influences links, separators, and progress bars when those parameters are set to `auto`. Background and text colors have independent defaults.

```typst
// Change just the accent — links, separator, and progress bar follow
#show: metropolyst-theme.with(
  accent-color: rgb("#e63946"),
)

// Or override specific elements independently
#show: metropolyst-theme.with(
  accent-color: rgb("#e63946"),
  hyperlink-color: rgb("#0077b6"),  // Different from accent
)
```

#### Accent Colors (cascade from `accent-color`)

| Parameter | Type | Default | Inherits | Description |
|---|---|---|---|---|
| `accent-color` | color | `rgb("#eb811b")` | — | Primary accent; used for `#alert[...]` text |
| `hyperlink-color` | auto/color | `auto` | `accent-color` | Hyperlink color |
| `line-separator-color` | auto/color | `auto` | `accent-color` | Title slide separator line color |
| `progress-bar-color` | auto/color | `auto` | `accent-color` | Progress bar foreground color |
| `progress-bar-background` | auto/color | `rgb("#d6c6b7")` | — | Progress bar background color (`auto` resolves to `accent-color.desaturate(70%).lighten(55%)`) |

#### Background Colors

| Parameter | Type | Default | Inherits | Description |
|---|---|---|---|---|
| `main-background-color` | color | `rgb("#fafafa")` | — | Slide body, title slide, and section slide background |
| `header-background-color` | auto/color | `rgb("#23373b")` | — | Slide header bar background (`auto` resolves to `rgb("#23373b")`) |
| `focus-background-color` | auto/color | `auto` | `header-background-color` | Focus slide background |

#### Text Colors

| Parameter | Type | Default | Inherits | Description |
|---|---|---|---|---|
| `main-text-color` | color | `rgb("#23373b")` | — | Body, title slide, and section slide text |
| `header-text-color` | auto/color | `auto` | `main-background-color` | Slide header text (light on dark header) |
| `focus-text-color` | auto/color | `auto` | `main-background-color` | Focus slide text (light on dark background) |
| `footer-text-color` | auto/color | `auto` | `main-text-color` | Footer text color |

## Presentation Info (`config-info`)

Metadata set via `config-info()` and displayed on the title slide:

| Parameter | Type | Description |
|---|---|---|
| `title` | content | Presentation title |
| `subtitle` | content | Optional subtitle (displayed below title, separated by accent-colored line) |
| `author` | content | Author name |
| `date` | content/datetime | Date; use `datetime.today()` for auto-formatting |
| `institution` | content | Organization or institution name |
| `logo` | content | Logo displayed on title slide and optionally in header-right (emoji or `image(...)`) |

## Available Slide Types

### Title Slide — `#title-slide()`

Creates the opening slide with title, subtitle, author, date, institution, and logo. An accent-colored separator line divides the title/subtitle from the metadata. The slide counter is frozen.

```typst
#title-slide()

// With extra text (e.g., conference name)
#title-slide(extra: [Conference on Typst 2025])
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `extra` | content | `none` | Additional text below institution (uses `extra-size`/`extra-weight`) |

The title slide layout places the logo (right-aligned via `left-and-right`) opposite the title content. Title and subtitle appear at the top, followed by the separator line, then author, date, institution, and extra text stacked vertically.

### Content Slide — `== Heading` or `#slide[...]`

Standard content slides are created by level-2 headings (`==`), which become the header text. The slide features a colored header bar (dark background, light text), a footer with optional progress bar, and the main content area.

```typst
== My Slide Title

Content goes here with *bold*, _emphasis_, and #alert[accent] text.

- Bullet points
- More points
```

For explicit control, multi-column layouts, or custom titles:

```typst
// Explicit slide with custom title
#slide(title: [Custom Title])[
  Content here.
]

// Two-column layout
#slide[
  Left column content.
][
  Right column content.
]

// Custom column proportions
#slide(composer: (3fr, 2fr))[
  Wider left column.
][
  Narrower right column.
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | auto/content | `auto` | Slide title; `auto` uses current heading |
| `align` | auto/alignment | `auto` | Content alignment override |
| `config` | dictionary | `(:)` | Configuration overrides |
| `repeat` | auto/int | `auto` | Number of subslides for animations |
| `setting` | function | `body => body` | Wrapper function applied to slide body |
| `composer` | auto/array | `auto` | Column layout (e.g. `(1fr, 2fr)`) |

**Note**: Level-1 headings inside a slide body are hidden (`show heading.where(level: 1): none`). Long titles are automatically scaled to fit the header width using `fit-to-width`.

### Section Slide — `= Heading`

Level-1 headings (`=`) create section divider slides. These display the section name centered with a 2pt progress bar below, using `section-font`/`section-size`/`section-weight` styling on `main-background-color`.

```typst
= Introduction

= Methods and Results

= Conclusion
```

The underlying function is `new-section-slide`:

```typst
#new-section-slide(level: 1, numbered: true)[Section Title]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `level` | int | `1` | Heading level to display |
| `numbered` | boolean | `true` | Show heading number |

### Focus Slide — `#focus-slide[...]`

A full-screen emphasis slide using `focus-background-color` (defaults to header background — dark teal) with `focus-text-color` (defaults to main background — light). The slide counter is frozen.

```typst
#focus-slide[
  *Key Takeaway*
]

// Custom alignment
#focus-slide(align: top + left)[
  This is left-aligned at the top.
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `align` | alignment | `horizon + center` | Content alignment |

## Content Features

### Alert Text

The `#alert[...]` function renders text in the `accent-color`. This is the primary way to highlight key terms:

```typst
This is normal text with #alert[important highlighted] words.
```

**Note**: Unlike the built-in Metropolis theme, bold text (`*bold*`) does NOT automatically use alert styling (`show-strong-with-alert: false`). Use `#alert[...]` explicitly for accent-colored text.

### Hyperlinks

Links are automatically colored with `hyperlink-color` (defaults to `accent-color`):

```typst
Visit #link("https://typst.app")[Typst] for more info.
```

### Progress Bar

Enable `footer-progress: true` to show a 2pt progress bar at the bottom of every content slide. The bar uses `progress-bar-color` (foreground) and `progress-bar-background` (background).

```typst
#show: metropolyst-theme.with(
  footer-progress: true,
)
```

Section slides also display a progress bar regardless of the `footer-progress` setting.

## Brands System

Brands are preset configuration dictionaries applied with the spread operator. They allow one-line organizational styling:

```typst
#import "@preview/metropolyst:0.1.0": metropolyst-theme, brands

#show: metropolyst-theme.with(..brands.EPI)
```

### Built-in Brands

| Brand | Font | Accent | Header BG | Notes |
|---|---|---|---|---|
| `EPI` | Roboto | `rgb("#C01F41")` (red) | `rgb("#063957")` (dark blue) | No page counter; auto progress-bar-background |

### Combining Brands with Overrides

Brand values can be selectively overridden — the spread applies the brand defaults, then your explicit parameters take priority:

```typst
#show: metropolyst-theme.with(
  ..brands.EPI,
  footer-progress: true,   // Add progress bar to EPI style
  footer-right: context utils.slide-counter.display() + " / " + utils.last-slide-number,
)
```

### Defining Custom Brands

Brands are simply dictionaries of valid theme parameters:

```typst
// Inline custom brand
#let my-brand = (
  accent-color: rgb("#0066cc"),
  header-background-color: rgb("#1a1a2e"),
  font: ("Roboto",),
  footer-right: none,
)
#show: metropolyst-theme.with(..my-brand)
```

Or in a separate file for reuse:

```typst
// my-brands.typ
#let brands = (
  "acme-corp": (
    accent-color: rgb("#ff6b35"),
    header-background-color: rgb("#004e89"),
    font: ("Inter",),
    footer: [ACME Corp],
    footer-progress: true,
  ),
)

// main.typ
#import "my-brands.typ": brands
#show: metropolyst-theme.with(..brands.acme-corp)
```

## Color Scheme

The theme maps its parameters to Touying's `config-colors`:

| Color Name | Mapped From | Default Value | Usage |
|---|---|---|---|
| `primary` | `accent-color` | `rgb("#eb811b")` | `#alert[...]` text |
| `primary-light` | `progress-bar-background` | `rgb("#d6c6b7")` | Progress bar track |
| `secondary` | (fixed) | `rgb("#23373b")` | Dark accents |
| `neutral-lightest` | `main-background-color` | `rgb("#fafafa")` | Slide background |
| `neutral-dark` | `main-text-color` | `rgb("#23373b")` | Body text |
| `neutral-darkest` | `main-text-color` | `rgb("#23373b")` | Darkest text |

### Example Color Schemes

```typst
// Default: Metropolis orange on dark teal
accent-color: rgb("#eb811b"),
header-background-color: rgb("#23373b"),

// Purple academic
accent-color: rgb("#7c3aed"),
header-background-color: rgb("#1e1b4b"),

// Emerald green
accent-color: rgb("#10b981"),
header-background-color: rgb("#0f172a"),

// Red institutional
accent-color: rgb("#e63946"),
header-background-color: rgb("#1d3557"),

// Monochrome
accent-color: rgb("#6b7280"),
header-background-color: rgb("#111827"),
```

## Global Text Settings

The theme applies these base text rules:

```typst
set text(size: 20pt, font: font, weight: "light", stretch: 100%)
set strong(delta: 100)
show link: it => text(fill: hyperlink-color, it)
```

These establish the Metropolis look: light-weight body text with subtle bold differentiation. You can override them after the `#show: metropolyst-theme.with(...)` call.

## Page Configuration

```typst
config-page(
  paper: "presentation-" + aspect-ratio,
  header-ascent: 30%,
  footer-descent: 30%,
  margin: (top: 3.8em, bottom: 1.5em, x: 2em),
)
```

## Internal Components Used

- `components.cell` — Styled cell for header bar
- `components.left-and-right` — Two-column layout for header, footer, and title slide
- `components.progress-bar` — Progress indicator bar (footer and section slides)
- `utils.fit-to-width` — Auto-scale long titles to fit the header
- `utils.call-or-display` — Render content or call function with `self`
- `utils.display-current-heading` — Show current heading text
- `utils.display-info-date` — Formatted date display
- `utils.slide-counter` — Slide numbering counter
- `utils.last-slide-number` — Total slide count

## Universe Link

[metropolyst on Typst Universe](https://typst.app/universe/package/metropolyst)
[Source on GitHub](https://github.com/benzipperer/metropolyst)
