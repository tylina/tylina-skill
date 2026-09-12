// ===============================================================
// Touying Simpres Theme — Comprehensive Demo
// Universe package: @preview/touying-simpres:0.1.0
// Package Touying dependency: 0.6.1
//
// This demo showcases all slide types, per-slide overrides,
// the progress bar on section dividers, the show-level-one
// toggle, custom footers, the outline slide, focus slides,
// and the title-slide extra parameter — the full feature set
// of the Simpres theme.
// ===============================================================

#import "@preview/touying-simpres:0.1.0": *
#import "@preview/mitex:0.2.7": *

// Recommended show rules from the official template
#show raw: set text(size: 12pt)
#show figure.caption: set text(size: 10pt)

// Theme configuration
// Simpres has six parameters: aspect-ratio, lang, font,
// text-size, show-level-one, and footer.
// Here we enable the section heading on content slides
// and set a date-based footer.
#show: touying-simpres.with(
  aspect-ratio: "16-9",
  lang: "en",
  // The package defaults to Source Sans 3, which must be installed.
  // Use a known local sans-serif face so this demo compiles without fallback.
  font: "Arial",
  text-size: 18pt,
  show-level-one: true,
  footer: [#datetime.today().display("[year]-[month]-[day]")],
  config-common(breakable: false),
  config-info(
    title: [Touying Simpres: A Straightforward Theme],
    subtitle: [Clean Presentations for Education and Business],
    author: [Demo Author],
    date: datetime.today(),
    institution: [Typst University],
  ),
)

// =========================================
// Title Slide
// =========================================
// Pulls metadata from config-info. Displays title (bold,
// primary color), subtitle, horizontal rule, author,
// institution, and date. Slide counter is frozen.
#title-slide(extra: [Package demo · version 0.1.0])

// =========================================
// Outline Slide
// =========================================
// Table of contents with adaptive columns.
// Level-1 entries appear bold. depth and title are configurable.
#outline-slide(depth: 2)

// =========================================
// SECTION 1: Theme Overview
// =========================================
// Level-1 headings automatically create section divider slides
// with the section title and a progress bar showing how far
// through the presentation you are.
= Theme Overview

== What is Simpres?

Simpres ("Simple Presentation") is a clean, minimal theme for *touying* presentations.

- *Six configuration parameters* — easy to set up
- Colored header bar with slide title and optional section heading
- Section dividers with a *progress bar*
- High-contrast focus slides
- Per-slide overrides for footer, title, and section heading visibility

Inspired by the touying University theme, the Metropolis theme, and clean-math-presentation.

== The Header Bar

#block(width: 100%)[
  Each content slide has a *primary-colored header bar* showing:

  + The *slide title* — large, bold, white text
  + The *section heading* — smaller text above the title (when `show-level-one: true`)

  The section heading on this slide reads "Theme Overview" because we set `show-level-one: true` globally.

  Below the content, the footer shows the date on the left and a *slide counter* ("N / total") on the right.
]

// =========================================
// SECTION 2: All Slide Types
// =========================================
= Slide Types

== Content Slides

#block(width: 100%)[
  Content slides are the workhorse of Simpres. Create them with level-2 headings:

  ```typst
  == My Slide Title

  Content with *bold*, _emphasis_, and math: $E = m c^2$
  ```

  They support all standard Typst features:

  - Bullet lists with *bold* and _italic_ text
    - Nested sub-items
    - With full formatting
  - Numbered lists, tables, figures, and equations
  - Code blocks and inline `code`
]

== Mathematics

Simpres works well for academic content with mathematical typesetting:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

Aligned equations for derivations:

#mitex(`\begin{aligned} \nabla \cdot \mathbf{E} &= \frac{\rho}{\epsilon_0} \\ \nabla \cdot \mathbf{B} &= 0 \\ \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\ \nabla \times \mathbf{B} &= \mu_0 \mathbf{J} + \mu_0 \epsilon_0 \frac{\partial \mathbf{E}}{\partial t} \end{aligned}`)

These are *Maxwell's equations* — fundamental to electromagnetism.

== Tables and Data

#align(center)[
  #table(
    columns: 4,
    align: (left, center, center, center),
    table.header(
      [*Model*], [*Accuracy*], [*Precision*], [*F1 Score*],
    ),
    [Baseline], [0.74], [0.71], [0.72],
    [Proposed], [*0.91*], [*0.88*], [*0.89*],
    [Ensemble], [0.93], [0.90], [0.91],
  )
]

The proposed model shows a significant improvement over the baseline across all metrics.

// =========================================
// SECTION 3: Per-Slide Overrides
// =========================================
= Per-Slide Overrides

== Default Settings

This slide uses the *global defaults*:

- `show-level-one: true` — the section heading "Per-Slide Overrides" appears in the header
- `footer` shows today's date
- The title comes from the `==` heading

These can all be overridden on individual slides using `#slide(...)`.

// Demonstrate per-slide override: hide section heading, custom footer, custom title
#slide(
  show-level-one: false,
  footer: [Local override],
  title: "Customized Slide",
)[
  #block(width: 100%)[
    This slide demonstrates *per-slide overrides*:

    - `show-level-one: false` — the section heading is hidden from the header
    - `footer: [Local override]` — replaces the date footer with custom content
    - `title: "Customized Slide"` — replaces the heading-derived title

    ```typst
    #slide(
      show-level-one: false,
      footer: [Local override],
      title: "Customized Slide",
    )[
      Your content here.
    ]
    ```
  ]
]

// Another override: no footer at all
#slide(
  show-level-one: true,
  footer: none,
  title: "Minimal Footer Slide",
)[
  #block(width: 100%)[
    This slide has *no footer content* on the left — only the page counter remains on the right.

    This is useful for slides where you want maximum vertical space or a cleaner look.

    Setting `footer: none` clears the left footer while preserving the slide counter.
  ]
]

// =========================================
// SECTION 4: Outline and Focus
// =========================================
= Special Slides

== The Outline Slide

#block(width: 100%)[
  The `#outline-slide()` function creates a table-of-contents slide:

  ```typst
  #outline-slide()
  #outline-slide(depth: 1)
  #outline-slide(title: "Gliederung")
  #outline-slide(title: "Sommaire")
  ```

  The default depth is 2 and the default title is "Outline." Set depth to 1 for sections only, or provide a localized title. Level-1 entries are rendered in *bold*.
]

== Focus Slides

#block(width: 100%)[
  Focus slides provide *high-contrast emphasis* — the primary color fills the background with large, centered white text:

  ```typst
  #focus-slide[
    Key takeaway message
  ]
  ```

  No configuration options — just pass content. Perfect for transitions, key points, or dramatic pauses.
]

// Demonstrate focus slide
#focus-slide[
  Simplicity is the ultimate sophistication.
]

// =========================================
// SECTION 5: Customization
// =========================================
= Customization

== Custom Colors

Override the default navy blue with `config-colors`:

```typst
#show: touying-simpres.with(
  config-colors(primary: rgb("006D5B"), secondary: rgb("B2DFDB")),
  ...
)
```

Available color schemes: *Navy* (default) `#003366` / `#CCE5FF`; *Teal* `#006D5B` / `#B2DFDB`; *Burgundy* `#800020` / `#F5E6EB`; *Charcoal* `#2C3E50` / `#D5DBDB`; *Forest* `#1B5E20` / `#C8E6C9`.

The `primary` color drives the header bar, title text, section headings, focus slide background, progress bar, and alert/bold text. The `secondary` color is used for the progress bar track.

== Typography and Language

Simpres uses *Source Sans 3* at *22pt* by default. Both are configurable:

```typst
#show: touying-simpres.with(
  font: "Libertinus Serif",  // academic serif font
  text-size: 20pt,           // slightly smaller
  lang: "de",                // German language rules
  ...
)
```

Recommended show rules for code and captions:

```typst
#show raw: set text(size: 12pt)
#show figure.caption: set text(size: 10pt)
```

== Title Slide with Extra Content

#block(width: 100%)[
  The `#title-slide` accepts an `extra` parameter for additional content:

  ```typst
  #title-slide(extra: [
    Funded by the National Science Foundation \
    Grant No. ABC-1234567
  ])
  ```

  This is useful for acknowledgements, logos, or grant information that should appear on the cover page.
]

// =========================================
// SECTION 6: Summary
// =========================================
= Summary

== Feature Recap

#set text(size: 18pt)
#set list(spacing: 0.25em)

Touying Simpres provides a *complete, minimal presentation system*:

- *Five slide types:* title, content, section, outline, and focus
- *Per-slide overrides:* `title`, `footer`, and `show-level-one`
- *Four-color palette:* `primary`, `secondary`, `neutral-lightest`, and `neutral-darkest`
- *Minimal configuration:* six parameters with sensible defaults

// =========================================
// Closing Focus Slide
// =========================================
#focus-slide[
  Thank you!
]
