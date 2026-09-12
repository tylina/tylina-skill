// ===============================================================
// Shuimu Touying — Comprehensive Demo
// Universe package: @preview/shuimu-touying:0.4.1
// Touying version: 0.7.4 (owned by the Universe package)
//
// This demo showcases ALL unique features of the Shuimu theme:
// a Tsinghua University Beamer-style theme with mini-frames
// navigation bar, themed blocks (titled-block), Chinese-first metadata
// fields (reporter, supervisor), numbered outline slides, focus
// slides, section dividers, multi-column layouts, equation
// numbering, incremental reveal, and the full THU purple palette.
// ===============================================================

#import "@preview/shuimu-touying:0.4.1": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
// The theme uses Tsinghua University's official purple (#660874)
// derived from the university's Visual Identity System.
// Fonts: Linux Libertine + Noto Serif CJK SC (install locally).
#show: shuimu-touying-theme.with(
  aspect-ratio: "16-9",
  theme-fonts: shuimu-fonts(outline-size: .9em),
  config-common(breakable: false),
  // align: horizon,                // Default vertical alignment
  // display-section-slides: false, // Set true for auto section dividers
  config-info(
    title: [Shuimu Touying: Comprehensive Feature Demo],
    subtitle: [A Tsinghua University Beamer-Style Theme for Typst],
    // Unique fields: reporter (报告人) and supervisor (导师)
    reporter: [*Demo Presenter*],
    author: [*Mason Chen*],
    supervisor: [*Prof. Advisor*],
    date: datetime.today(),
    institution: [Tsinghua University, Department of Computer Science],
  ),
  // Customize footer cells (all optional):
  // footer-reporter: self => self.info.reporter,
  // footer-author: self => self.info.author,
  // footer-deck-title: self => self.info.title,
  // footer-slide-counter: context utils.slide-counter.display() + " / " + utils.last-slide-number,
)

// =========================================
// Title Slide
// =========================================
// Renders: purple title block, person list with Chinese
// prefixes (报告人/作者/导师), institution, and date.
// Supports arrays of up to 3 names per role.
#title-slide()

// =========================================
// Outline Slide
// =========================================
// Numbered circles with section titles, clickable links.
// Title defaults to localized "Outline" / "目录".
#outline-slide()

// =========================================
// SECTION 1: Theme Overview
// =========================================
= Theme Overview

== What is Shuimu Touying?

Shuimu Touying (水木) is a *Beamer-style presentation theme* for Tsinghua University, built on the Touying framework's Stargazer theme.

- *Mini-frames navigation bar* with section dots at the top of every slide
- *Themed content blocks* (`titled-block`) with gradient dividers
- *Chinese-first metadata* — `reporter`, `supervisor`, `author` fields
- *Numbered outline slides* with circled section indices
- *Focus slides* with frozen slide counter
- *Four-segment footer* — reporter, author, title, page counter
- *Tsinghua purple palette* derived from the official Visual Identity System

The name references "水木清华" (Shuimu Tsinghua), a classical phrase associated with the university.

== Navigation Bar

The *mini-frames navigation bar* at the top of each slide shows:

+ All level-1 section titles as clickable links
+ Dot indicators for each page within a section
+ The current page dot is *filled*; others are outline-only
+ The active section is shown in *full white*; inactive sections at 40% opacity
+ Focus slides are automatically *excluded* from the dot count

The bar background uses `primary-dark` (`#320439`), a darker shade of the Tsinghua purple.

== Footer Structure

The footer is a four-column grid on every content slide:

#table(
  columns: 4,
  align: (center, center, center, center),
  table.header(
    [*Cell*], [*Width*], [*Default*], [*Description*],
  ),
  [footer-reporter], [15%], [Reporter], [Left-most],
  [footer-author], [15%], [Author], [Second],
  [footer-deck-title], [1fr], [Title], [Fill remaining],
  [footer-slide-counter], [5em], [N / M], [Slide counter],
)

Each cell is customizable via the four `footer-*` parameters shown above. Cells set to `none` collapse to zero width.

// =========================================
// SECTION 2: Themed Blocks (titled-block)
// =========================================
= Themed Blocks

== The titled-block Component

The `titled-block` combines a purple title bar, gradient divider, and tinted content panel.

#titled-block(
  title: [Euler's Identity],
  [#mitex(`e^{\pi i} + 1 = 0`)]
)

#titled-block(
  title: [Key Insight],
  [The `titled-block` is ideal for theorems, definitions, formulas, and important callouts. It uses the theme's primary color automatically.]
)

== Equation Numbering with titled-block

#set math.equation(numbering: "(1)")

#titled-block(
  title: [Numbered Equation],
  [#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)]
)

#titled-block(
  title: [Unnumbered Equation],
  [#math.equation(block: true, numbering: none)[
    #mitex(`\sum_{k=0}^n \binom{n}{k} = 2^n`)
  ]]
)

== Continued Equation Numbering

#titled-block(
  title: [Continues Numbering],
  [#mitex(`\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}`)]
)

// =========================================
// SECTION 3: Slide Types
// =========================================

= Slide Types

== Content Slides

Content slides are created with *level-2 headings* (`==`). They feature:

- The mini-frames navigation bar at the top
- A *purple title bar* with white bold text
- Themed *knob-style bullet markers* in the primary color
- Support for all Typst formatting: *bold*, _emphasis_, `code`

Standard lists work naturally:

- First point with details
  - Sub-point A
  - Sub-point B
- Second point
- Third point

#slide(title: [Multi-Column Layout])[
  Use `#slide[...][...]` for two-column layouts.

  === Left Column

  The left column can contain explanatory text, bullet points, and analysis.

  - Observation one
  - Observation two
  - Observation three
][
  === Right Column

  The right column can complement with formulas, data, or visuals.

  #mitex(`\hat{f}(\xi) = \int_{-\infty}^{\infty} f(x) e^{-2\pi i x \xi} \, dx`)

  #mitex(`\mathcal{L} = -\sum_{i=1}^N y_i \log p_i`)
]

== Incremental Reveal

Use `#pause` for step-by-step content reveal:

First, we establish the research question.

#pause

Then, we present the methodology.

#pause

Finally, we discuss the results and conclusions.

== Mathematics

The theme renders mathematical content with clean serif typography:

#mitex(`\begin{aligned} \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\ \nabla \times \mathbf{H} &= \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t} \\ \nabla \cdot \mathbf{D} &= \rho \\ \nabla \cdot \mathbf{B} &= 0 \end{aligned}`)

These are Maxwell's equations in differential form.

== Tables and Data

#align(center)[
  #table(
    columns: 4,
    align: (left, center, center, center),
    table.header(
      [*Method*], [*Precision*], [*Recall*], [*F1*],
    ),
    [Baseline], [0.72], [0.68], [0.70],
    [Proposed (ours)], [*0.89*], [*0.85*], [*0.87*],
    [Oracle], [0.95], [0.93], [0.94],
  )
]

Table captions for `table`-kind figures are automatically positioned at the top.

// =========================================
// SECTION 4: Special Slides
// =========================================
= Special Slides

== Focus Slide

Focus slides are *full-screen emphasis slides* with:

- Solid `primary` color (`#660874`) background
- White bold text at `1.5em`
- No header, no footer
- Frozen slide counter (does not increment)
- Excluded from navigation bar dots

```typst
#focus-slide[Your message here!]

#focus-slide(align: top + left)[
  Custom alignment
]
```

The next slide demonstrates a focus slide.

#focus-slide[
  Key Takeaway: \
  Shuimu Touying brings Tsinghua's identity \
  to modern Typst presentations.
]

== Outline Slide

The outline slide renders a *numbered table of contents*:

- Each section gets a *primary-colored circle* with the section number
- Section titles are *clickable links* to the section location
- Sections are stacked vertically with `1.5em` spacing
- Title defaults to the localized "Outline" string

```typst
#outline-slide()
#outline-slide(title: [Table of Contents])
```

== New Section Slide

When `display-section-slides: true` is set, the theme auto-generates a section divider for each `= Heading`:

- Section title in *primary color*, `2.5em`, bold
- Centered horizontally and vertically
- Can also be invoked manually:

```typst
#new-section-slide(title: [Custom Section Title])
```

// =========================================
// SECTION 5: Configuration
// =========================================

= Configuration

== Config-Info Fields

The theme supports Chinese-first metadata with three person roles:

#table(
  columns: 3,
  align: (left, left, left),
  table.header(
    [*Field*], [*Title Slide Prefix*], [*Footer*],
  ),
  [`reporter`], [报告人：], [footer-reporter (15%)],
  [`author`], [作者：], [footer-author (15%)],
  [`supervisor`], [导师：], [Title slide only],
  [`institution`], [Below person list], [--],
  [`date`], [Below institution], [--],
  [`short-title`], [--], [footer-deck-title (if set)],
)

Each person field accepts a *single value* or an *array of up to 3 names*, rendered in a horizontal grid on the title slide.

== Theme Parameters

Key parameters for `shuimu-touying-theme`:

#table(
  columns: 3,
  align: (left, left, left),
  table.header(
    [*Parameter*], [*Default*], [*Description*],
  ),
  [`aspect-ratio`], [`"16-9"`], [Slide aspect ratio],
  [`align`], [`horizon`], [Default content alignment],
  [`display-section-slides`], [`false`], [Auto section dividers],
  [`header-title`], [*(current heading)*], [Content-slide header title],
  [`footer-*`], [*(see docs)*], [Customizable footer cells],
)

== Full Configuration Example

#block[
  #set text(size: 15pt)
  ```typst
  #show: shuimu-touying-theme.with(
    aspect-ratio: "16-9",
    display-section-slides: true,
    footer-reporter: self => none,
    config-info(
      title: [Research Report Title],
      reporter: ([*Speaker A*], [*Speaker B*]),
      author: [*Author Name*],
      supervisor: [*Prof. Advisor*],
      date: datetime.today(),
      institution: [Tsinghua University],
      short-title: [Short Title],
    ),
  )
  ```
]

// =========================================
// SECTION 6: Color Scheme
// =========================================
= Color Scheme

== Tsinghua Purple Palette

The theme uses a minimal, institutional palette from the *Tsinghua University Visual Identity System*:

#table(
  columns: 3,
  align: (left, left, left),
  table.header(
    [*Token*], [*Hex*], [*Usage*],
  ),
  [`primary`], [`#660874`], [Title bars, nav bar, footer, focus bg, titled-block, headings, links, list markers],
  [`primary-dark`], [`#320439`], [Navigation bar background],
  [`neutral-lightest`], [`#ffffff`], [Text on colored surfaces],
  [`neutral-darkest`], [`#000000`], [Default body text],
)

Internally derived: `primary.lighten(90%)` for titled-block content areas, and `transparentize(60%)` for inactive navigation elements.

== Font Stack

Default: *Linux Libertine*, Palatino, Noto Serif CJK SC, Songti SC

- *Linux Libertine* -- Primary English serif
- *Palatino* -- English fallback
- *Noto Serif CJK SC* -- Primary Chinese font
- *Songti SC* -- Chinese fallback (macOS)

Both English and Chinese fonts must be installed locally. Default text size: `20pt`.

// =========================================
// SECTION 7: Summary
// =========================================
= Summary

== Feature Recap

Shuimu Touying provides:

+ *5 slide types* -- title, content, outline, new-section, focus
+ *Themed blocks* (`titled-block`) with gradient dividers for theorems and callouts
+ *Mini-frames navigation* -- section dots with active/inactive highlighting
+ *Four-segment footer* -- reporter, author, title, page counter
+ *Chinese-first metadata* -- `reporter`, `supervisor`, `author` with Chinese prefixes
+ *Tsinghua purple palette* -- derived from the official Visual Identity System
+ *Equation numbering* -- global and per-equation control
+ *Multi-column layouts* -- `#slide[...][...]` for side-by-side content
+ *Incremental reveal* -- `#pause` for step-by-step builds
+ *Configurable section dividers* -- `display-section-slides: true`

// =========================================
// Closing Focus Slide
// =========================================
#focus-slide[
  Thank you! \
  Q & A
]
