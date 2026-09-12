// Touying Unistra Pristine — representative feature demo
// Universe package: @preview/touying-unistra-pristine:1.4.3
// Package-owned Touying version: 0.6.2

#import "@preview/touying:0.6.2": *
#import "@preview/touying-unistra-pristine:1.4.3": *
#import "@preview/mitex:0.2.7": *

// The theme follows the University of Strasbourg visual identity.
// This portable demo selects an installed system font and disables automatic
// link icons. The package's branded fonts and icon fonts remain opt-in.
#show: unistra-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Unistra Pristine: A Comprehensive Demo],
    short-title: [Unistra Pristine Demo],
    subtitle: [_Exploring Every Feature of the Theme_],
    author: [Demo Author],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
    logo: text(font: "Arial", weight: "bold", size: 0.6em)[UNISTRA],
  ),
  config-store(
    show-header: false,
    show-footer: true,
    footer-hide: (),
    font: ("Arial",),
    quotes: (left: "\u{201C}", right: "\u{201D}"),
    link-icons: (),
    link-icons-fa: false,
  ),
)

// A font-independent visual used to exercise hero and gallery layouts without
// requiring bundled photos. The component stays in the demo because this
// Universe theme has no editable local template.typ.
#let demo-panel(label, c1, c2, height: 42mm, ink: white) = rect(
  width: 100%,
  height: height,
  radius: 8pt,
  inset: 1em,
  fill: gradient.linear(c1, c2, angle: 32deg),
  align(center + horizon, text(fill: ink, weight: "bold", label)),
)

#let demo-swatch(c1, c2: none) = rect(
  width: 100%,
  height: 0.72em,
  radius: 2pt,
  fill: if c2 == none { c1 } else { gradient.linear(c1, c2, angle: 18deg) },
)

#title-slide[]

#outline-slide(content-size: 0.9em, height: 68%)

= Theme Overview

== What is Unistra Pristine?

Unistra Pristine is an academic Typst theme built on *Touying* and adapted from the University of Strasbourg visual identity.

- *18 predefined color themes* for focus slides
- *80+ color swatches* organized in 16 color groups
- *Hero and gallery slides* for visual storytelling
- *Citation helpers* and optional icon fonts
- *Configurable header/footer* elements

== Color Highlights

The theme provides 16 groups with variants A--E. Highlights remain readable in
#highlight(fill: blue.C)[blue], #highlight(fill: yellow.C)[yellow],
#highlight(fill: green.C)[green], #highlight(fill: red.C)[red],
#highlight(fill: purple.C)[purple], and #highlight(fill: cyan.C)[cyan].

*Variant pattern:* A is darkest, C is pastel, D is near-white, and E is vivid.
Colors also support methods such as `nblue.A.lighten(30%)`.

== Styled Blocks

Use theme colors for decorative block accents:

#block(stroke: (left: 5pt + nblue.B), outset: (x: 0.5em), inset: (left: 0.8em))[
  *Key Insight* — This block uses `nblue.B` for a left border accent, a common pattern in academic slides.
]
#block(stroke: (left: 5pt + green.B), outset: (x: 0.5em), inset: (left: 0.8em))[
  *Methodology Note* — And this one uses `green.B`. Any of the 80+ palette colors work here.
]

#focus-slide(theme: "berry")[Slide Types]

= Slide Types

== Content Slides

Content slides are created with level-2 headings (`==`). Sub-headings (`===`, `====`) nest within the same slide:

=== Sub-Heading Example

- Bullet points with *bold* and _emphasis_
- Inline `code` formatting
  - Nested sub-items
  - With full Typst formatting support

== Multi-Column Layouts

Touying 0.6.2 exposes `components.side-by-side` for columns:

#components.side-by-side(columns: (1fr, 1fr), gutter: 1.2em)[
  === Left Column

  Concise explanatory text.

  - Point one
  - Point two
][
  === Right Column

  The right column can hold complementary material.
]

#hero(
  demo-panel([RESEARCH], nblue.A, cyan.C, height: 58mm),
  title: "Hero Layout",
  subtitle: "Image-and-text composition",
  columns: (1fr, 1.25fr),
  txt: (
    text: [Combine a strong visual with a short narrative. The `ltr` direction honors custom column proportions.],
    enhanced: false,
    fill: nblue.D,
    align: left + horizon,
  ),
  direction: "ltr",
  hide-footer: false,
)

#gallery(
  demo-panel([DISCOVER], nblue.A, blue.C, height: 36mm),
  demo-panel([MEASURE], green.A, ngreen.C, height: 36mm),
  demo-panel([SHARE], maroon.A, pink.C, height: 36mm),
  title: "Gallery Layout",
  subtitle: "Three visual studies with captions",
  columns: 3,
  captions: ("Discovery", "Evidence", "Impact"),
)

== Incremental Reveal

Use `#pause` for step-by-step content reveal:

First, we establish the problem.

#pause

Then, we propose a solution.

#pause

Finally, we evaluate the results.

- Step 1: Data collection
- Step 2: Model training
- Step 3: Evaluation

= Focus Slides

== About Focus Slides

Focus slides are full-screen emphasis pages with 18 preset themes and custom colors.

Each can set a *theme* (or ID), custom colors, an optional icon, and text/counter settings.

#focus-slide(theme: "smoke")[Focus Variants]

#focus-slide(
  theme: "neon",
  icon: [↶],
  outlined: false,
)[
  Theme: *neon* \
  Violet to pink with a portable icon
]

#focus-slide(theme: "ocean", outlined: false)[
  Theme: *ocean* \
  Teal to blue with light text
]

#focus-slide(theme: "forest", outlined: false)[
  Theme: *forest* \
  Deep green to lime gradient
]

#focus-slide(theme: "lavender", outlined: false)[
  Theme: *lavender* \
  Soft pink to violet, black text
]

#focus-slide(
  theme: "wine",
  show-counter: false,
  outlined: false,
  text-size: 1.7em,
)[
  Theme: *wine* \
  Maroon to brown, counter hidden, \
  not in outline, custom text size
]

#focus-slide(
  c1: black,
  c2: white,
  text-color: yellow.E,
  outlined: false,
)[
  *Custom colors* \
  Black-to-white gradient \
  with yellow accent text
]

= Academic Content

== Mathematics

The theme handles mathematical content cleanly in a side-by-side composition:

#components.side-by-side(columns: (1fr, 1fr), gutter: 1.2em)[
  === Theorem (Cauchy-Schwarz)

  For vectors #mi(`\mathbf{u}, \mathbf{v} \in \mathbb{R}^n`):

  #mitex(`|\langle \mathbf{u}, \mathbf{v} \rangle|^2 \leq \langle \mathbf{u}, \mathbf{u} \rangle \cdot \langle \mathbf{v}, \mathbf{v} \rangle`)
][
  === Fourier Transform

  The Fourier transform of #mi(`f`) is:

  #mitex(`\hat{f}(\xi) = \int_{-\infty}^{\infty} f(x) e^{-2\pi i x \xi} \, dx`)
]

== Maxwell's Equations

#mitex(`\begin{aligned} \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\ \nabla \times \mathbf{H} &= \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t} \\ \nabla \cdot \mathbf{D} &= \rho \\ \nabla \cdot \mathbf{B} &= 0 \end{aligned}`)

These are Maxwell's equations in differential form — the foundation of classical electromagnetism.

== Research Results Table

#align(center)[
  #table(
    columns: 4,
    align: (left, center, center, center),
    table.header(
      [*Method*], [*Precision*], [*Recall*], [*F1 Score*],
    ),
    [Baseline], [0.72], [0.68], [0.70],
    [Proposed (ours)], [#highlight(fill: green.C)[*0.89*]], [#highlight(fill: green.C)[*0.85*]], [#highlight(fill: green.C)[*0.87*]],
    [Oracle], [0.95], [0.93], [0.94],
  )
]

Results show significant improvement over the baseline across all metrics, highlighted using the theme's `green.C` color.

== Custom Quotes

The theme provides styled `#quote()` with configurable quote marks (French guillemets by default, English-style configured in this demo):

#quote(
  attribution: [Plato, via Henry Cary's 1897 translation],
)[
  I seem, then, in just this little thing to be wiser than this man at
  any rate, that what I do not know I do not think I know either.
]


#focus-slide(theme: "mint")[Configuration & Customization]

= Configuration

== Footer Customization

The footer displays *author*, *date*, and *slide number* separated by configurable separators.

- `show-footer: true/false` — toggle the entire footer
- `footer-hide: ("author",)` — hide specific elements
- `footer-first-sep` / `footer-second-sep` — set custom separators
- `footer-appendix-label: "A-"` — prefix appendix slide numbers

== Header Navigation Bar

Enable the navigation header bar with `show-header: true`:

```typst
config-store(show-header: true)
```

This renders a mini-slides navigation bar (`unistra-nav-bar`) showing section progress with dot indicators at the top of each slide.

== Font Configuration

Default font stack with automatic fallback:

- *Default:* `("Unistra A", "Segoe UI", "Roboto")`
- *Unistra A:* proprietary and restricted to university members
- *Portable override:* this demo uses `font: ("Arial",)`
- *Icon fonts:* separate files; use `link-icons: ()` when unavailable

Typst reports a warning and substitutes another font when no configured family exists.

== Full Configuration Example

#text(size: 18pt)[
  ```typst
  #show: unistra-theme.with(
    config-info(title: [Research Findings], author: [Jane Doe]),
    config-store(
      font: ("Arial",),
      footer-hide: ("date",),
      link-icons: (),
    ),
  )
  ```
]

= Color Theme Reference

== All 18 Focus Slide Themes

#text(size: 17pt)[
  #components.side-by-side(columns: (1fr, 1fr), gutter: 1em)[
    #table(
      columns: (auto, 1fr, 1.15fr),
      inset: 0.24em,
      align: (center, left, center),
      table.header([*ID*], [*Theme*], [*Preview*]),
      [1], [lblue], [#demo-swatch(blue.E, c2: cyan.E)],
      [2], [blue], [#demo-swatch(nblue.E, c2: cyan.E)],
      [3], [dblue], [#demo-swatch(nblue.E, c2: blue.E)],
      [4], [yellow], [#demo-swatch(yellow.B, c2: yellow.C)],
      [5], [pink], [#demo-swatch(pink.E, c2: pink.B)],
      [6], [neon], [#demo-swatch(violet.E, c2: pink.E)],
      [7], [mandarine], [#demo-swatch(orange.E, c2: brown.E)],
      [8], [hazy], [#demo-swatch(maroon.E, c2: grey.E)],
      [9], [smoke], [#demo-swatch(grey.E, c2: black)],
    )
  ][
    #table(
      columns: (auto, 1fr, 1.15fr),
      inset: 0.24em,
      align: (center, left, center),
      table.header([*ID*], [*Theme*], [*Preview*]),
      [10], [forest], [#demo-swatch(green.A, c2: camo.E)],
      [11], [berry], [#demo-swatch(pink.A, c2: purple.A)],
      [12], [ocean], [#demo-swatch(cyan.A, c2: blue.B)],
      [13], [lavender], [#demo-swatch(purple.C, c2: violet.C)],
      [14], [moss], [#demo-swatch(ngreen.C, c2: grey.B)],
      [15], [clay], [#demo-swatch(brown.B, c2: maroon.C)],
      [16], [mint], [#demo-swatch(ngreen.E, c2: cyan.C)],
      [17], [lemon], [#demo-swatch(yellow.A, c2: camo.E)],
      [18], [wine], [#demo-swatch(maroon.A, c2: brown.A)],
    )
  ]
]

== Base Color Palette

The full 16-group reference is in `theme.md`; these eight groups show A--E:

#text(size: 18pt)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 0.28em,
    align: (left, center, center, center, center, center),
    table.header([*Group*], [*A*], [*B*], [*C*], [*D*], [*E*]),
    [grey], [#demo-swatch(grey.A)], [#demo-swatch(grey.B)], [#demo-swatch(grey.C)], [#demo-swatch(grey.D)], [#demo-swatch(grey.E)],
    [red], [#demo-swatch(red.A)], [#demo-swatch(red.B)], [#demo-swatch(red.C)], [#demo-swatch(red.D)], [#demo-swatch(red.E)],
    [blue], [#demo-swatch(blue.A)], [#demo-swatch(blue.B)], [#demo-swatch(blue.C)], [#demo-swatch(blue.D)], [#demo-swatch(blue.E)],
    [green], [#demo-swatch(green.A)], [#demo-swatch(green.B)], [#demo-swatch(green.C)], [#demo-swatch(green.D)], [#demo-swatch(green.E)],
    [purple], [#demo-swatch(purple.A)], [#demo-swatch(purple.B)], [#demo-swatch(purple.C)], [#demo-swatch(purple.D)], [#demo-swatch(purple.E)],
    [yellow], [#demo-swatch(yellow.A)], [#demo-swatch(yellow.B)], [#demo-swatch(yellow.C)], [#demo-swatch(yellow.D)], [#demo-swatch(yellow.E)],
    [cyan], [#demo-swatch(cyan.A)], [#demo-swatch(cyan.B)], [#demo-swatch(cyan.C)], [#demo-swatch(cyan.D)], [#demo-swatch(cyan.E)],
    [violet], [#demo-swatch(violet.A)], [#demo-swatch(violet.B)], [#demo-swatch(violet.C)], [#demo-swatch(violet.D)], [#demo-swatch(violet.E)],
  )
]

= Summary

== Feature Recap

Touying Unistra Pristine provides:

#text(size: 18pt)[
  #components.side-by-side(columns: (1fr, 1fr), gutter: 1.2em)[
    - *6 slide types* — title, content, focus, hero, gallery, outline
    - *18 focus themes* with gradient backgrounds
    - *80+ swatches* in 16 color groups
    - *Optional icon helpers* with installed fonts
    - *Smart link icons* with URL matching
  ][
    - *Citation helpers* — `pcite` and `mcite`
    - *Flexible layouts* — side-by-side, hero, gallery
    - *Custom quotes* — French or English-style
    - *Appendix mode* with an `"A-"` prefix
    - *Header/footer controls* and separators
  ]
]

#show: appendix

= Appendix

== Appendix Slide

This slide uses appendix numbering. After `#show: appendix`, slide numbers are prefixed with `"A-"` (configurable via `footer-appendix-label`).

This is useful for backup slides, additional data, or supplementary material that should not count toward the main presentation length.

#focus-slide(
  theme: "berry",
  outlined: false,
)[
  Thank you!
]
