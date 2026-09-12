#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial"), size: 20pt)

#let pal = build-palette("washi")

#show: origami-theme.with(
  aspect-ratio: "16-9",
  preset: "washi",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Design Systems & Visual Communication],
    subtitle: [Folding complexity into clarity],
    author: [Studio Origami],
    date: datetime.today(),
    institution: [ORIGAMI DESIGN LAB],
  ),
)

// ===== Title Slide =====

#title-slide()

// ============================================================
// Section 1 -- Foundations
// ============================================================

= Foundations

// ============================================================
// Slide: Dark slide with fold-quote and stats
// ============================================================

#dark-slide(title: [The Art of Reduction])[
  #text(size: 28pt, weight: "bold")[Every fold removes complexity.]

  #fold-quote([
    A design system is not a collection of components. It is a shared language -- a set of constraints that paradoxically enables freedom.
  ], cite: "Dieter Rams", pal: build-palette("twilight"))

  #cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
    #facet-stat([47], [COMPONENTS], pal: build-palette("twilight"))
  ][
    #facet-stat([12], [PRINCIPLES], pal: build-palette("twilight"))
  ][
    #facet-stat([3], [LAYERS], pal: build-palette("twilight"))
  ]
]

// ============================================================
// Slide: Standard slide with origami-cards
// ============================================================

== Core Principles

#paper-tag([DESIGN PHILOSOPHY], color: pal.accent)

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
  #origami-card([Constraint], [
    Limitation breeds creativity. Every fold line is a decision that eliminates infinite alternatives.
  ])
][
  #origami-card([Hierarchy], [
    Visual weight guides the eye. The largest facet catches attention first; smaller folds reveal detail.
  ])
][
  #origami-card([Consistency], [
    Repeated patterns build trust. When users recognize structure, they navigate with confidence.
  ])
]

// ============================================================
// Slide: Crane divider and tessellation grid
// ============================================================

== Visual Language

#crane-divider(width: 80%)

#v(0.3em)

#tessellation-grid((
  [
    #text(weight: "bold")[Typography] \
    Font choices signal intent. Sans-serif for clarity, monospace for precision.
  ],
  [
    #text(weight: "bold")[Color] \
    Palette constraints ensure harmony. Three to five colors create unity without monotony.
  ],
  [
    #text(weight: "bold")[Space] \
    Negative space is a design element. It gives content room to breathe and creates focus.
  ],
))

// ============================================================
// Section 2 -- Structure
// ============================================================

= Structure

// ============================================================
// Slide: focus-slide
// ============================================================

#focus-slide[
  Form follows function -- \
  but function follows intention.
]

// ============================================================
// Slide: Standard with mixed components
// ============================================================

== Component Architecture

#paper-tag([SYSTEMS THINKING], color: pal.secondary)

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 20pt)[
  #block(width: 100%)[
    #origami-card([Atomic Design], [
      Start with atoms: a button, a color token, a type scale. Compose molecules from atoms. Build organisms from molecules.
    ])
    #v(0.4em)
    #paper-tag([METHODOLOGY])
    #h(0.3em)
    #paper-tag([SCALABLE], color: pal.secondary)
  ]
][
  #block(width: 100%)[
    #origami-card([Token System], [
      Design tokens are the subatomic particles -- named values that encode decisions about color, spacing, and motion.
    ])
    #v(0.4em)
    #fold-quote([Tokens are decisions, not just values.], cite: "Jina Anne")
  ]
]

// ============================================================
// Slide: Dark slide with statistics
// ============================================================

#dark-slide(title: [Adoption Metrics])[
  #text(size: 24pt, weight: "bold")[Measuring design system impact]

  #v(0.5em)

  #cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 14pt, lazy-layout: true)[
    #facet-stat([92%], [ADOPTION], pal: build-palette("twilight"))
  ][
    #facet-stat([3.2x], [VELOCITY], pal: build-palette("twilight"))
  ][
    #facet-stat([68%], [REUSE], pal: build-palette("twilight"))
  ][
    #facet-stat([41%], [LESS CSS], pal: build-palette("twilight"))
  ]

  #v(0.5em)

  #crane-divider(width: 100%)
]

// ============================================================
// Section 3 -- Communication
// ============================================================

= Communication

// ============================================================
// Slide: Tessellation grid with detailed content
// ============================================================

== Channels of Expression

#tessellation-grid((
  [
    #text(weight: "bold")[Documentation] \
    Living docs that evolve with the system. Code examples, usage guidelines, do/don't patterns.
  ],
  [
    #text(weight: "bold")[Storybook] \
    Interactive component playground. Designers and developers share a single source of truth.
  ],
  [
    #text(weight: "bold")[Design Tokens] \
    Cross-platform constants. One decision propagates to web, iOS, Android simultaneously.
  ],
  [
    #text(weight: "bold")[Contribution Model] \
    Open governance. Anyone can propose; a review board ensures coherence without gatekeeping.
  ],
  [
    #text(weight: "bold")[Versioning] \
    Semantic releases with changelogs. Breaking changes are communicated early and migrated smoothly.
  ],
  [
    #text(weight: "bold")[Workshops] \
    Hands-on sessions bridge theory and practice. Teams learn by building, not just reading.
  ],
))

// ============================================================
// Slide: Quote and reflection
// ============================================================

== Philosophy in Practice

#fold-quote([
  The goal of a design system is to make the right thing the easy thing. When defaults are good, teams move faster without sacrificing quality.
], cite: "Brad Frost")

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true)[
  #origami-card([Principle: Least Surprise], [
    Components should behave as users expect. Familiar patterns reduce cognitive load and accelerate adoption.
  ])
][
  #origami-card([Principle: Progressive Disclosure], [
    Reveal complexity gradually. Simple defaults first; advanced options available but not overwhelming.
  ])
]

// ============================================================
// Ending Slide
// ============================================================

#ending-slide[Thank You]
