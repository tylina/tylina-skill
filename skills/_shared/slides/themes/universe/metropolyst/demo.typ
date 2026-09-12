// ===============================================================
// Metropolyst Theme — Comprehensive Demo
// Universe package: @preview/metropolyst:0.1.0
// Touying version: 0.6.1
//
// This demo showcases all slide types, the cascading font and
// color system, multi-column layouts, the brands system,
// alert text, progress bar, focus slides, and the full range
// of configuration options for this Metropolis-inspired theme.
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/metropolyst:0.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
// Metropolyst provides 40+ parameters organized into layout,
// font (cascading), and color (cascading) groups.
#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  // Layout
  align: horizon,
  footer-progress: true,
  footer: [Metropolyst Demo],
  // Font customization (cascading: font -> all *-font when auto).
  // Use an installed portable font rather than the package's Fira Sans default.
  font: ("Arial",),
  // header-font: auto,   // inherits from font
  header-size: 1.2em,
  header-weight: "regular",
  // Color customization (cascading: accent-color -> hyperlink, separator, progress)
  accent-color: rgb("#eb811b"),
  // header-background-color: rgb("#23373b"),  // default dark teal
  // main-background-color: rgb("#fafafa"),    // default off-white
  config-info(
    title: [Metropolyst: A Configurable Metropolis Theme],
    subtitle: [Comprehensive Feature Demonstration],
    author: [Demo Author],
    date: datetime.today(),
    institution: [University of Typst],
    logo: emoji.city,
  ),
)

// Recommended text settings for Metropolis-style presentations
#set text(font: "Arial", weight: "light", size: 20pt)
#show math.equation: set text(font: "STIX Two Math")
#set strong(delta: 100)
#set par(justify: true)

// =========================================
// Title Slide
// =========================================
// Pulls from config-info. Shows title, subtitle, separator
// line (accent-colored), author, date, institution, and logo.
// The extra parameter adds supplementary text below.
#title-slide(extra: [ICFP Workshop 2025])

// =========================================
// SECTION 1: Theme Overview
// =========================================
// Level-1 headings create section divider slides with
// a progress bar below the section name.
= Introduction

== What is Metropolyst?

Metropolyst is a #alert[highly configurable] variant of the Metropolis beamer theme, built for #link("https://touying-typ.github.io/touying/")[Touying] presentations in Typst.

- Inspired by Matthias Vogelgesang's Beamer Metropolis theme
- 22 font parameters with a cascading system
- 12 color parameters with automatic inheritance
- Built-in brand preset system for organizational styling
- Clean, modern, distraction-free design

== Slide Structure

Every content slide has three zones:

+ *Header bar* — dark background with light text showing the slide title; long titles auto-scale to fit
+ *Body area* — light background (`#fafafa`) with the main content
+ *Footer* — customizable left/right text and optional progress bar

The footer of this presentation shows "Metropolyst Demo" on the left and a slide counter on the right, with the orange progress bar enabled via `footer-progress: true`.

// =========================================
// SECTION 2: Typography
// =========================================
= Typography

== Cascading Font System

The `font` parameter sets the base font for all elements. Specific `*-font` parameters override it when set:

#slide(composer: (1fr, 1fr))[
  *Base Font Cascade*

  ```typst
  font: ("Fira Sans",),
  // All elements inherit:
  header-font: auto,  // -> Fira Sans
  footer-font: auto,  // -> Fira Sans
  title-font: auto,   // -> Fira Sans
  section-font: auto, // -> Fira Sans
  focus-font: auto,   // -> Fira Sans
  ```
][
  *Selective Override*

  ```typst
  font: ("Libertinus Serif",),
  header-font: ("Fira Sans",),
  // Result:
  //   Headers  -> Fira Sans
  //   Body     -> Libertinus Serif
  //   Footer   -> Libertinus Serif
  //   Sections -> Libertinus Serif
  ```
]

== Title Slide Typography

Each title slide element has independent size and weight controls:

#align(center)[
  #table(
    columns: 3,
    align: (left, center, center),
    table.header(
      [*Element*], [*Size*], [*Weight*],
    ),
    [Title], [`1.4em`], [`"regular"`],
    [Subtitle], [`1.0em`], [`"light"`],
    [Author], [`0.8em`], [`"light"`],
    [Date], [`0.8em`], [`"light"`],
    [Institution], [`0.8em`], [`"light"`],
    [Extra], [`0.8em`], [`"light"`],
    [Logo], [`2.0em`], [—],
  )
]

== Text Styling

Standard Typst formatting works throughout:

- *Bold text* uses `strong(delta: 100)` for subtle emphasis
- _Italic text_ for definitions and asides
- Use `#alert[text]` for #alert[accent-colored highlights]
- #link("https://typst.app")[Hyperlinks] match the accent color
- Inline `code` renders in monospace

#alert[Important]: Unlike the built-in Metropolis theme, *bold* does _not_ auto-use accent color. Use `#alert[...]` explicitly.

// =========================================
// SECTION 3: Color System
// =========================================
= Colors

== Cascading Color System

Colors cascade from `accent-color` — change one value and related elements follow:

#slide(composer: (1fr, 1fr))[
  *Accent Cascade*

  - #alert[`accent-color`] — primary accent
  - `hyperlink-color: auto` inherits accent
  - `line-separator-color: auto` inherits accent
  - `progress-bar-color: auto` inherits accent
  - `progress-bar-background` — independent default
][
  *Background & Text*

  - `main-background-color` — `#fafafa`
  - `header-background-color` — `#23373b`
  - `focus-background-color: auto` inherits header bg
  - `main-text-color` — `#23373b`
  - `header-text-color: auto` inherits main bg
  - `focus-text-color: auto` inherits main bg
]

== Color Schemes

Different accent and header combinations create distinct moods:

#align(center)[
  #table(
    columns: 3,
    align: (left, left, left),
    table.header(
      [*Style*], [*Accent*], [*Header BG*],
    ),
    [Default (this demo)], [`#eb811b` orange], [`#23373b` dark teal],
    [Purple academic], [`#7c3aed` violet], [`#1e1b4b` indigo],
    [Emerald green], [`#10b981` emerald], [`#0f172a` slate],
    [Red institutional], [`#e63946` red], [`#1d3557` navy],
    [Monochrome], [`#6b7280` gray], [`#111827` near-black],
  )
]

All 12 color parameters are documented in the theme reference.

// =========================================
// SECTION 4: Layout Features
// =========================================
= Layout

== Multi-Column Slides

Pass multiple content blocks to `#slide` for automatic columns:

#slide(composer: (3fr, 2fr))[
  *Wider Left Column (3fr)*

  The `composer` parameter controls column proportions. This column is wider because it uses `3fr` vs `2fr`.

  ```typst
  #slide(composer: (3fr, 2fr))[
    Left content (wider)
  ][
    Right content (narrower)
  ]
  ```
][
  *Narrower Right (2fr)*

  Equal-width columns use the default:

  ```typst
  #slide[
    Left column
  ][
    Right column
  ]
  ```
]

== Mathematical Content

Metropolyst handles academic content cleanly with Fira Math:

#slide(composer: (1fr, 1fr))[
  *Integral Calculus*

  The Gaussian integral:

  #mitex(`\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}`)

  Euler's identity:

  #mitex(`e^{i\pi} + 1 = 0`)
][
  *Linear Algebra*

  Eigenvalue equation:

  #mitex(`\mathbf{A} \mathbf{v} = \lambda \mathbf{v}`)

  Matrix determinant:

  #mitex(`\det(\mathbf{A}) = \sum_{\sigma \in S_n} \text{sgn}(\sigma) \prod_{i=1}^n a_{i, \sigma(i)}`)
]

== Tables and Data

#align(center)[
  #table(
    columns: 5,
    align: (left, center, center, center, center),
    table.header(
      [*Model*], [*Accuracy*], [*Precision*], [*Recall*], [*F1*],
    ),
    [Baseline], [0.78], [0.72], [0.68], [0.70],
    [Proposed], [#alert[0.92]], [#alert[0.89]], [#alert[0.85]], [#alert[0.87]],
    [Ensemble], [0.90], [0.86], [0.83], [0.84],
    [Oracle], [0.97], [0.95], [0.93], [0.94],
  )
]

Use `#alert[...]` to highlight key results in table cells.

== Auto-Scaling Titles

Metropolyst automatically scales long slide titles to fit the header bar using `fit-to-width`, so even verbose headings display correctly without overflow

This feature ensures that descriptive academic slide titles never break the layout. The header gracefully shrinks the text to fit within the available width.

// =========================================
// SECTION 5: Brands
// =========================================
= Brands

== Brand Preset System

Brands are dictionaries of theme parameters applied with the spread operator:

```typst
#import "@preview/metropolyst:0.1.0": metropolyst-theme, brands

// Apply built-in EPI brand
#show: metropolyst-theme.with(..brands.EPI)

// Override specific brand settings
#show: metropolyst-theme.with(
  ..brands.EPI,
  footer-progress: true,  // Add progress bar
)
```

=== Built-in: EPI (Economic Policy Institute)

#align(center)[
  #table(
    columns: 2,
    align: (left, left),
    table.header([*Parameter*], [*Value*]),
    [`font`], [`("Roboto",)`],
    [`accent-color`], [`rgb("#C01F41")` (red)],
    [`header-background-color`], [`rgb("#063957")` (dark blue)],
    [`progress-bar-background`], [`auto`],
    [`footer-right`], [`none` (no page counter)],
  )
]

== Custom Brands

Define your own brand as a dictionary — inline or in a separate file:

#slide(composer: (1fr, 1fr))[
  *Inline Brand*

  ```typst
  #let my-brand = (
    accent-color: rgb("#0066cc"),
    header-background-color:
      rgb("#1a1a2e"),
    font: ("Roboto",),
    footer-right: none,
  )
  #show: metropolyst-theme.with(
    ..my-brand,
  )
  ```
][
  *Reusable Brand File*

  ```typst
  // my-brands.typ
  #let brands = (
    "acme": (
      accent-color: rgb("#ff6b35"),
      header-background-color:
        rgb("#004e89"),
      font: ("Inter",),
      footer: [ACME Corp],
    ),
  )

  // main.typ
  #import "my-brands.typ": brands
  #show: metropolyst-theme.with(
    ..brands.acme,
  )
  ```
]

// =========================================
// Focus Slide — Key Message
// =========================================
// Full-screen emphasis: focus-background-color (dark teal)
// with focus-text-color (light). Counter is frozen.
#focus-slide[
  Clean design. \
  Total configurability. \
  One theme.
]

// =========================================
// SECTION 6: Advanced Usage
// =========================================
= Advanced

== Footer Configuration

The footer has three customizable zones:

#slide(composer: (1fr, 1fr, 1fr))[
  *Left Footer*

  ```typst
  footer: [My Talk],
  // or dynamic:
  footer: self =>
    self.info.institution,
  ```
][
  *Right Footer*

  ```typst
  footer-right: context
    utils.slide-counter
      .display()
    + " / "
    + utils.last-slide-number,
  ```
][
  *Progress Bar*

  ```typst
  footer-progress: true,
  // Colors:
  progress-bar-color: auto,
  progress-bar-background:
    rgb("#d6c6b7"),
  ```
]

== Header Customization

Both header zones accept content or `self => content` functions:

```typst
// Static header content
header: [Fixed Title],
header-right: [Company Logo],

// Dynamic header (default behavior)
header: self => utils.display-current-heading(
  setting: utils.fit-to-width.with(grow: false, 100%),
  depth: self.slide-level,
),
header-right: self => self.info.logo,
```

The default header shows the current `==` heading on the left and the logo on the right.

== Page Configuration

The theme uses these page settings (for reference):

#slide(composer: (1fr, 1fr))[
  *Margins*

  ```typst
  margin: (
    top: 3.8em,
    bottom: 1.5em,
    x: 2em,
  )
  ```
][
  *Global Text Rules*

  ```typst
  set text(
    size: 20pt,
    font: font,
    weight: "light",
    stretch: 100%,
  )
  set strong(delta: 100)
  ```
]

These establish the characteristic Metropolis look: light-weight body text with subtle bold differentiation. Override them after the `#show: metropolyst-theme.with(...)` call if needed.

// =========================================
// SECTION 7: Summary
// =========================================
= Summary

== Feature Recap

Metropolyst delivers the Metropolis aesthetic with full configurability:

+ *4 slide types* — title, content, section (with progress bar), and focus
+ *Cascading fonts* — set `font` once; override `header-font`, `section-font`, etc. individually
+ *Cascading colors* — set `accent-color` once; links, separator, and progress bar follow
+ *Brand presets* — one-line organizational styling with `..brands.EPI`
+ *Custom brands* — define reusable dictionaries of theme parameters
+ *Alert text* — `#alert[...]` for accent-colored emphasis
+ *Multi-column layouts* — `#slide[...][...]` with `composer` weights
+ *Auto-scaling titles* — long headings fit the header bar automatically
+ *Progress bar* — optional footer progress indicator
+ *Title slide extras* — `extra:` parameter for conference names or notes

// =========================================
// Closing Focus Slide
// =========================================
#focus-slide[
  Thank you!
]
