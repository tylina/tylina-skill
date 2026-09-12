# Clean Math Presentation

**Type**: Universe (Typst package)
**Package**: `@preview/clean-math-presentation:0.1.1`
**Touying version**: 0.5.5
**Entry function**: `clean-math-presentation-theme`
**Style**: Clean academic theme designed for mathematical presentations
**Primary color**: `#005bac`
**Best For**: Mathematical talks, theorem-heavy presentations
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A clean, minimal presentation theme built specifically for mathematical talks, lectures, and academic conferences. Created by Joshua Lampert, it provides built-in support for theorem-like environments (theorem, lemma, corollary, definition, example, proof), a structured multi-author/affiliation system with automatic superscript numbering on the title slide, a configurable progress bar, and a polished header/footer layout. Parts of the theme are based on the stargazer theme from touying.

Key features:
- **Theorem environments**: `theorem`, `lemma`, `corollary`, `definition`, `example`, and `proof` blocks with automatic styling
- **Multi-author system**: Authors with affiliated institutions, presenting author underlining
- **Progress bar**: Optional colored progress indicator at the top of slides
- **Title slide**: Supports background images and up to two logos
- **Focus & ending slides**: Special-purpose slide types for emphasis and closing
- **`mgrid` utility**: Multi-line equation alignment helper
- Depends on the `great-theorems` package for proof blocks

## Quick Start

```typst
#import "@preview/touying:0.5.5": *
#import "@preview/clean-math-presentation:0.1.1": *

#show: clean-math-presentation-theme.with(
  config-info(
    title: [My Mathematical Talk],
    short-title: [Short Title],
    subtitle: [A Subtitle],
    authors: (
      (name: "Alice Smith", affiliation-id: 1),
      (name: "Bob Jones", affiliation-id: 2),
    ),
    affiliations: (
      (id: 1, name: "Department of Mathematics, University of Somewhere"),
      (id: 2, name: "Institute of Applied Sciences, Nice University"),
    ),
    author: "Alice Smith",
    date: datetime.today(),
  ),
  config-colors(
    primary: rgb("#6068d6"),
    secondary: rgb("#2f1971"),
  ),
  // Required when = headings should generate outline dividers.
  config-common(new-section-slide-fn: new-section-slide),
  progress-bar: false,
)

#title-slide()

= Section Title

== Slide Title

Content goes here.

#theorem(title: "Pythagorean Theorem")[
  For a right triangle with legs $a$, $b$ and hypotenuse $c$:
  $ a^2 + b^2 = c^2 $
]

#focus-slide[
  Thank you!
]
```

## Theme Parameters

These are passed directly to `clean-math-presentation-theme.with(...)`:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio. Options: `"16-9"`, `"4-3"` |
| `align` | alignment | `top + left` | Default content alignment on slides |
| `alpha` | percentage | `20%` | Alpha/opacity value used for color mixing in decorative elements |
| `progress-bar` | boolean | `false` | Show a colored progress bar at the top of each slide |
| `header-right` | content/auto | `auto` | Content for the right side of the header (defaults to `short-title`) |
| `footer-columns` | array | `(25%, 50%, 15%, 10%)` | Column width ratios for the 4-part footer |
| `footer-a` | function/auto | `auto` | Footer column A content (defaults to presenting author name) |
| `footer-b` | function/auto | `auto` | Footer column B content (defaults to title) |
| `footer-c` | function/auto | `auto` | Footer column C content (defaults to date) |
| `footer-d` | function/auto | `auto` | Footer column D content (defaults to slide number) |

## Config-Info Parameters

These are passed inside `config-info(...)`:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | content | — | Presentation title (displayed on title slide and in footer) |
| `short-title` | content | `auto` | Shortened title for footer display; falls back to `title` if omitted |
| `subtitle` | content | `none` | Subtitle shown on the title slide |
| `authors` | array of dicts | `()` | List of author dictionaries with `name` and `affiliation-id` keys |
| `affiliations` | array of dicts | `()` | List of affiliation dictionaries with `id` and `name` keys |
| `author` | string | — | Presenting author name (shown in footer; underlined on title slide if it matches an entry in `authors`) |
| `date` | datetime/content | — | Date of the presentation |

### Author/Affiliation System

The `authors` parameter takes a list of dictionaries. Each author dictionary has:
- `name` (string): The author's display name
- `affiliation-id` (integer): Links to the corresponding `id` in the `affiliations` list

The `affiliations` parameter takes a list of dictionaries. Each affiliation dictionary has:
- `id` (integer): Unique identifier referenced by authors
- `name` (string): Institution or department name

On the title slide, superscript numbers are automatically added to each author linking them to their affiliation. If the `author` parameter matches one of the names in `authors`, that name is underlined on the title slide to indicate the presenting author.

```typst
config-info(
  authors: (
    (name: "First Author", affiliation-id: 1),
    (name: "Second Author", affiliation-id: 2),
    (name: "Third Author", affiliation-id: 1),
  ),
  affiliations: (
    (id: 1, name: "Fancy Department, University of Somewhere"),
    (id: 2, name: "Important Institute, Nice University"),
  ),
  author: "First Author",  // This name will be underlined on the title slide
)
```

## Config-Colors Parameters

Passed inside `config-colors(...)`:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `primary` | color | `rgb("#005bac")` | Main accent color used for headers, theorem block titles, links, and the progress bar |
| `secondary` | color | `rgb("#004078")` | Secondary color used for the footer background and other accents |
| `tertiary` | color | `rgb("#972828")` | Tertiary accent color available for additional styling |

```typst
config-colors(
  primary: rgb("#6068d6"),
  secondary: rgb("#2f1971"),
)
```

## Available Slide Types

### `#title-slide()`

The opening title page. Displays the title, subtitle, all authors with affiliation superscripts, affiliations, and date.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `logo1` | content/none | `none` | First logo image (displayed on the title slide) |
| `logo2` | content/none | `none` | Second logo image |
| `background` | content/none | `none` | Background image for the title slide |
| `margin` | dictionary | `(top: 1.0em, bottom: 0.0em)` | Margin overrides for the title slide |

```typst
#title-slide(
  logo1: image("logo.svg", height: 4.5em),
  logo2: image("logo2.png", height: 4em),
  background: image("background.jpg"),
)
```

### `#slide()` — Regular Content Slide

Standard slide for presentation content. Can also be created implicitly using `== Heading` syntax.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | content/auto | `auto` | Slide title (auto-derived from heading if using `==` syntax) |
| `header` | content/auto | `auto` | Custom header content |
| `footer` | content/auto | `auto` | Custom footer content |
| `align` | alignment/auto | `auto` | Content alignment override |

```typst
#slide(title: "My Slide Title")[
  Content goes here.
]
```

Or use heading syntax:

```typst
== My Slide Title

Content goes here.
```

### `#outline-slide()` — Table of Contents

Displays an outline/table of contents of the presentation.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | content | (localized "Outline") | Title for the outline slide |
| `numbered` | boolean | `true` | Whether to number the outline entries |
| `level` | integer/none | `none` | Maximum heading level to include |

```typst
#outline-slide()
```

### `#new-section-slide()` — Section Divider

Automatically generated when using `= Section Heading` syntax. Shows an outline with the current section highlighted.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | content | (localized "Outline") | Title text |
| `level` | integer | `1` | Heading level |
| `numbered` | boolean | `true` | Whether entries are numbered |

### `#focus-slide()` — Focus/Emphasis Slide

A full-screen emphasis slide with centered content, using the primary color as background.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `align` | alignment | `horizon + center` | Content alignment |

```typst
#focus-slide[
  *Key Takeaway*

  Mathematics is beautiful.
]
```

### `#ending-slide()` — Closing Slide

A closing slide for the presentation, typically used for "Thank you" or "Questions?" messages.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | content/none | `none` | Optional title for the ending slide |

```typst
#ending-slide[
  Questions?
]
```

**Package 0.1.1 note:** `ending-slide` retains the preceding header/footer
state. For a chrome-free closing page, use the documented `#slide(...)` API
with `header: none`, `footer: none`, and `config-page(header: none, footer:
none)` instead.

## Math Environments / Theorem Blocks

The theme provides six built-in theorem-like environments. All except `proof` accept an optional `title` parameter for a custom label. These are styled with the primary color and render as bordered blocks with bold headers.

### `#theorem()`

A theorem block with "Theorem" header.

```typst
#theorem(title: "Pythagorean Theorem")[
  For a right triangle: $a^2 + b^2 = c^2$.
]

#theorem[
  Every bounded sequence in $RR^n$ has a convergent subsequence.
]
```

### `#definition()`

A definition block with "Definition" header.

```typst
#definition(title: "Continuity")[
  A function $f: RR -> RR$ is _continuous_ at $x_0$ if
  $forall epsilon > 0, exists delta > 0: |x - x_0| < delta => |f(x) - f(x_0)| < epsilon$.
]
```

### `#lemma()`

A lemma block with "Lemma" header.

```typst
#lemma(title: "Euclid's Lemma")[
  If $p$ is a prime and $p | a b$, then $p | a$ or $p | b$.
]
```

### `#corollary()`

A corollary block with "Corollary" header.

```typst
#corollary[
  Every integer greater than 1 has a unique prime factorization.
]
```

### `#example()`

An example block with "Example" header.

```typst
#example[
  The function $f(x) = x^2$ is continuous on $RR$.
]
```

### `#proof()`

A proof block (powered by the `great-theorems` package). Renders with a "Proof." prefix in italics and ends with a QED square symbol. Does **not** accept a `title` parameter.

```typst
#proof[
  By contradiction, assume $sqrt(2)$ is rational...
]
```

### General `#tblock()`

A generic theorem-like block where you can specify a custom block title. All named environments above are built from this.

```typst
#tblock(blocktitle: "Conjecture", title: "Goldbach")[
  Every even integer greater than 2 is the sum of two primes.
]
```

## Utility Functions

### `#mgrid()`

A helper for aligning multi-line block equations in a grid layout.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `align` | alignment | `center` | Alignment of the equations |
| `gutter` | length | `1em` | Space between rows |

```typst
#mgrid(
  $x + y &= 5$,
  $2x - y &= 1$,
)
```

## Section Headings

- `= Heading` creates a new section and triggers a `new-section-slide` (outline slide with current section highlighted)
- `== Heading` creates a regular content slide with that heading as the title

## Progress Bar

When `progress-bar: true` is set, a thin colored bar appears at the top of each slide showing the presentation progress. The bar uses the `primary` color.

```typst
#show: clean-math-presentation-theme.with(
  progress-bar: true,
)
```

## Appendix Mode

Use `#show: appendix` to switch to appendix mode. Slides after this point are excluded from the progress bar and outline numbering.

```typst
#show: appendix

= References

#slide(title: "References")[
  #bibliography("bibliography.bib", title: none)
]
```

## Notes

- This package imports `@preview/touying:0.5.5` and `@preview/great-theorems:0.1.1` internally
- The theme supports speaker notes via `config-common(show-notes-on-second-screen: right)`
- Handout mode can be enabled via `config-common(handout: true)`
- Labeled equations (`$...$<eq:label>`) are automatically numbered; unlabeled equations are not
- The `slide-level` defaults to `2` (headings at level 2 create slides)

## Universe Link

[clean-math-presentation on Typst Universe](https://typst.app/universe/package/clean-math-presentation)
[Source code on GitHub](https://github.com/JoshuaLampert/clean-math-presentation)
