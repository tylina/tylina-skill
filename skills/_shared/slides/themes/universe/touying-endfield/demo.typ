// ===============================================================
// Touying Endfield Theme — Comprehensive Demo
// Universe package: @preview/touying-endfield:0.1.1
// Touying version: 0.6.3
//
// This demo showcases all slide types, navigation modes, layout
// features, and the unique visual elements of the Endfield theme:
// CMYK-striped footer, dark-panel title card, topographic
// background, triangle mini-slide indicators, progressive sidebar
// outline, and the signature Endfield yellow accent color.
// ===============================================================

#import "@preview/touying:0.6.3": *
#import "@preview/touying-endfield:0.1.1": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
// Endfield defaults to mini-slides navigation with the signature
// yellow accent. Here we configure the full set of options.
#show: endfield-theme.with(
  // Use installed sans-serif families so the demo preserves Endfield's
  // industrial typography without package-default fallback warnings.
  config-fonts(
    latin-font-family: ("Arial",),
    cjk-font-family: ("Noto Sans SC",),
    lang: "en",
    region: "us",
  ),
  config-common(breakable: false),
  aspect-ratio: "16-9",
  // Navigation: "sidebar", "mini-slides", or "none"
  navigation: "mini-slides",
  mini-slides: (
    height: auto,           // auto = 2.5em (inline) or 3em (block)
    x: 2em,                 // Horizontal content margin
    display-section: false,  // Show section-level indicators
    display-subsection: true, // Show subsection-level indicators
    inline: true,            // Section headings inline with dots
    spacing: .2em,           // Gap between triangle symbols
    short-heading: true,
  ),
  // Footer: left side shows institution, right side auto-shows
  // yellow slide counter "N / total"
  footer: self => self.info.institution,
  // Primary accent — the signature Endfield yellow
  primary: rgb("#FFFA01"),
  // Alpha controls transparency for non-active navigation items
  alpha: 40%,
  // The package default sits flush against the navigation strip on some
  // renderers; retain its API while giving automatic heading preambles room.
  subslide-preamble: self => block(
    inset: (top: .2em),
    text(
      1.2em,
      weight: "bold",
      fill: self.colors.primary,
      utils.display-current-heading(depth: self.slide-level, style: auto),
    ),
  ),
  config-info(
    title: [Endfield: Arknights-Inspired Presentations],
    subtitle: [A Comprehensive Theme Demo],
    author: [Demo Author],
    date: datetime.today(),
    institution: [Endfield Industries],
  ),
)

// =========================================
// Title Slide
// =========================================
// Renders a dark card with the primary-colored accent bar on the
// left, title + subtitle in light text, and author/date/institution
// below. The `extra` parameter adds content after institution.
#title-slide(extra: [Version 0.1.1])

// =========================================
// Outline Slide
// =========================================
// Adaptive two-column layout: "Outline" title on the left,
// full table of contents on the right.
#outline-slide()

// =========================================
// SECTION 1: Visual Identity
// =========================================
// Level-1 headings create section divider slides with a
// progressive outline — current section highlighted, others
// faded by the alpha parameter.
= Visual Identity

== The Endfield Aesthetic

The Endfield theme draws inspiration from _Arknights: Endfield_ and features a distinctive visual language:

- *Gradient gray background* with a topographic contour-map watermark
- *Dark panel aesthetic* for headers, footers, sidebar, and title card
- *Signature yellow accent* (`#FFFA01`) for highlights and navigation
- *CMYK-striped footer* with cyan, magenta, and yellow line segments
- *Triangle indicators* in the mini-slides navigation bar

These elements combine to create a modern, industrial presentation style.

== Navigation: Mini-Slides Mode

This demo uses *mini-slides* navigation — the dark bar at the top of each slide. Key features:

+ Current slide: filled downward triangle #math.triangle.small.b.filled
+ Other slides: stroked upward triangle #math.triangle.small.t.stroked
+ Active section is highlighted; inactive sections are faded
+ Configurable via the `mini-slides` dictionary parameter

The symbols, height, spacing, and inline/block layout are all customizable:

```typst
mini-slides: (
  inline: false,            // Block layout (headings on separate line)
  current-slide-sym: $diamond.filled$,  // Custom symbol
  other-slides-sym: $diamond.stroked$,
)
```

== Navigation: Sidebar Mode

To switch to sidebar navigation, change the config:

```typst
#show: endfield-theme.with(
  navigation: "sidebar",
  sidebar: (
    width: 12em,       // Panel width (default: 10em)
    filled: false,      // No fill dots
    indent: .5em,       // Sub-item indentation
    short-heading: true, // Abbreviated headings
  ),
)
```

The sidebar renders a dark panel on the left with a *progressive outline* — the current section is shown in the primary color while other sections are faded.

// =========================================
// SECTION 2: Slide Types
// =========================================
= Slide Types

== Content Slides with Headings

Content slides are created with level-2 headings (`==`). The heading appears as a *bold preamble* in the primary yellow color at 1.2em size.

Standard Typst content works naturally:

- Bullet points with *bold* and _emphasis_
  - Nested items are fully supported
  - With as many levels as needed
- Numbered lists, tables, images, and math

== Multi-Column Layouts

Use a native `#grid(...)` for side-by-side content without creating a
separate continuation slide:

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
  === Left Column

  Each content block becomes one column. This is useful for comparisons, side-by-side content, or visual layouts.
  ],
  [
  === Right Column

  The `columns` parameter controls column proportions:

  ```typst
  #grid(columns: (1fr, 2fr), [
    Narrow (1fr)
  ], [
    Wide (2fr)
  ])
  ```
  ],
)

== Custom Column Proportions

#grid(
  columns: (1fr, 2fr, 1fr),
  gutter: 1em,
  [
  #align(center)[
    _Narrow_ \
    `1fr`
  ]
  ],
  [
  #align(center)[
    The center column is twice as wide. Use `composer: (1fr, 2fr, 1fr)` for asymmetric layouts. This is great for highlighting a central figure or table.
  ]
  ],
  [
  #align(center)[
    _Narrow_ \
    `1fr`
  ]
  ],
)

== Page Breaks

Use `#pagebreak()` to continue content under the same heading title without creating a new subsection:

This is the first page of a two-page topic. The heading preamble stays the same across the break.

#pagebreak()

This is the continuation — same heading, new slide. The mini-slides navigation correctly tracks this as the same subsection. Useful for long explanations or step-by-step walkthroughs.

// =========================================
// SECTION 3: Academic Content
// =========================================
= Academic Content

== Mathematics

The Endfield theme supports full mathematical typesetting with clean rendering against the gradient background:

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
  === Integral Identity

  #mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

  === Series Expansion

  #mitex(`e^x = \sum_{n=0}^\infty \frac{x^n}{n!}`)
  ],
  [
  === Linear Algebra

  #mitex(`\det(\mathbf{A}) = \sum_{\sigma \in S_n} \text{sgn}(\sigma) \prod_{i=1}^n a_{i, \sigma(i)}`)

  === Differential Equation

  #mitex(`\frac{\partial^2 u}{\partial t^2} = c^2 \nabla^2 u`)
  ],
)

== Structured Data

#align(center)[
  #table(
    columns: 4,
    align: (left, center, center, center),
    table.header(
      [*Operation*], [*Time (ms)*], [*Memory (MB)*], [*Accuracy*],
    ),
    [Baseline], [142], [512], [0.72],
    [Optimized], [*38*], [*256*], [*0.89*],
    [Theoretical], [12], [128], [0.95],
  )
]

The Endfield aesthetic renders tables cleanly against the gradient gray background, with the contour-map watermark adding subtle visual depth.

== Aligned Equations

Mathematical derivations with alignment:

#mitex(`\begin{aligned} \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\ \nabla \times \mathbf{H} &= \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t} \\ \nabla \cdot \mathbf{D} &= \rho \\ \nabla \cdot \mathbf{B} &= 0 \end{aligned}`)

These are _Maxwell's equations_ in differential form.

// =========================================
// SECTION 4: Configuration Deep Dive
// =========================================
= Configuration

== Color Customization

The primary color drives the entire theme. Override it for different moods:

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
  === Color Options

  - Default yellow: `rgb("#FFFA01")`
  - Cyan accent: `rgb("#00C8FF")`
  - Green accent: `rgb("#00FF88")`
  - Orange accent: `rgb("#FF8800")`

  The full color palette uses six tokens: `primary`, `neutral-darkest`, `neutral-dark`, `neutral`, `neutral-light`, `neutral-lightest`.
  ],
  [
  === How To Override

  ```typst
  #show: endfield-theme.with(
    primary: rgb("#00C8FF"),
    // All accent elements update:
    // - Title bar, heading preamble
    // - Navigation highlights
    // - Focus slide background
    // - Footer line segment
  )
  ```
  ],
)

== Footer Design

The Endfield footer has a *unique CMYK-striped line* above a dark panel:

- *Three colored segments*: dark neutral (2em) + cyan (2em) + magenta (2em)
- *Primary color line* fills the remaining width
- Left side: custom footer content (e.g., institution name)
- Right side: yellow slide counter in `N / total` format

In sidebar mode, the footer switches to a single primary-colored line.

```typst
footer: self => self.info.institution,
footer-right: context {
  text(utils.slide-counter.display(), fill: rgb("#FFFA01"), weight: "black")
  + text(" / " + utils.last-slide-number, size: 0.618em)
},
```

== Font Configuration

Configure fonts with the `config-fonts` function:

```typst
#show: endfield-theme.with(
  config-fonts(
    latin-font-family: ("Arial",),
    cjk-font-family: ("Noto Sans SC",),
    lang: "en",
    region: "us",
  ),
  config-info(...),
)
```

Default fallback chain: HarmonyOS Sans / Source Sans 3 / Noto Sans (Latin) and HarmonyOS Sans SC / Source Han Sans / Noto Sans CJK (CJK).

== Title Slide Adjustment

If your title wraps to multiple lines, increase `title-height`:

```typst
#show: endfield-theme.with(
  config-store(title-height: 6em),  // Default: 4em
  config-info(
    title: [A Very Long Title That Needs More Space],
    ...
  ),
)
```

The `extra` parameter on `#title-slide()` adds content below the institution:

```typst
#title-slide(extra: [
  Presented at Conference 2025 --- Session 4B
])
```

// =========================================
// Focus Slide
// =========================================
// Full-screen emphasis: primary yellow background with large
// centered bold text. Slide counter is frozen.
#focus-slide[
  Design with purpose.

  Present with impact.
]

// =========================================
// SECTION 5: Summary
// =========================================
= Summary

== Recap

The Touying Endfield theme provides:

+ *Three navigation modes* — mini-slides with triangle indicators, sidebar with progressive outline, or clean no-navigation
+ *Five slide types* — title, content, section, outline, and focus slides
+ *Distinctive visual identity* — gradient background, contour-map watermark, CMYK footer, dark panels
+ *Flexible layouts* — `#slide`, multi-column composer, `#pagebreak` for continuations
+ *Configurable accent color* — single `primary` parameter drives the entire palette
+ *CJK-ready fonts* — built-in fallback chains for Latin and CJK with `config-fonts`
+ *Academic content support* — clean math, tables, and structured data rendering

#focus-slide[
  Thank you!
]
