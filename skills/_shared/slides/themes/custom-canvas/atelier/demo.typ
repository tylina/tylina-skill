#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Font configuration
#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 18pt)

#show: atelier-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Brand Identity & Visual Direction],
    subtitle: [A Strategic Framework for Creative Expression],
    author: [Studio Meridian],
    date: datetime.today(),
    institution: [Atelier Creative Agency],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Creative Strategy
// ============================================================

= Creative Strategy

== The Power of Visual Storytelling

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.primary, font: _mono-font)[STRATEGIC FOUNDATION]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: typo.body, fill: palette.ink, font: _sans-font)[
      Every brand carries a visual DNA -- a unique combination of color, form,
      typography, and gesture that communicates its values before a single word
      is read. Our approach begins with understanding this DNA at its deepest level.
    ]
    #v(0.5em)
    #text(size: typo.body, fill: palette.ink, font: _sans-font)[
      Through immersive workshops and collaborative sketching sessions,
      we translate abstract brand values into tangible visual systems that
      resonate across every touchpoint.
    ]
  ],
  block(width: 100%)[
    #pigment-stat([BRAND RECALL], [89%], description: [Increase in brand recognition after visual identity refresh])
    #v(0.5em)
    #pigment-stat([ENGAGEMENT], [3.2x], description: [Multiplier in audience engagement with cohesive visual systems])
  ],
)


// ============================================================
// Dark Slide: Bold Statement
// ============================================================

#dark-slide(
  title: none,
  header-left: [INSIGHT],
  header-right: [BRAND STRATEGY 2025],
)[
  #text(size: 36pt, weight: "bold", fill: palette.bg)[Design Is Not Decoration.#linebreak()It Is Communication.]

  #v(0.3em)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.bg.transparentize(40%), font: _mono-font)[ATELIER PHILOSOPHY]

  #v(0.6em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: palette.bg.transparentize(40%), font: _mono-font)[DISCOVERY]
      #v(0em)
      #text(size: 42pt, weight: "bold", fill: palette.bg)[01]
      #v(0em)
      #text(size: 11pt, fill: palette.bg.transparentize(30%), font: _sans-font)[
        Deep-dive research into brand heritage, competitive landscape, and audience psychology.
      ]
    ],
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: palette.bg.transparentize(40%), font: _mono-font)[CREATION]
      #v(0em)
      #text(size: 42pt, weight: "bold", fill: palette.bg)[02]
      #v(0em)
      #text(size: 11pt, fill: palette.bg.transparentize(30%), font: _sans-font)[
        Iterative design sprints exploring color, form, and typography through rapid prototyping.
      ]
    ],
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: palette.bg.transparentize(40%), font: _mono-font)[ACTIVATION]
      #v(0em)
      #text(size: 42pt, weight: "bold", fill: palette.bg)[03]
      #v(0em)
      #text(size: 11pt, fill: palette.bg.transparentize(30%), font: _sans-font)[
        Systematic rollout across channels with living brand guidelines and asset libraries.
      ]
    ],
  )

  #v(0.4em)

  #block(
    width: 100%,
    stroke: (left: 1.5pt + palette.bg.transparentize(60%)),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: palette.bg.transparentize(20%))[
      "The best brands don't just look different -- they feel inevitable."
    ]
  ]
]


// ============================================================
// Slide: Service Pillars (Cards)
// ============================================================

== Our Creative Disciplines

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.primary, font: _mono-font)[STUDIO CAPABILITIES]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
  #canvas-card([Brand Identity], [
    Logo systems, color palettes, typography selection, brand voice definition.
    We build visual languages that scale from business card to billboard.
  ])
][
  #canvas-card([Art Direction], [
    Campaign concepting, photography direction, illustration style,
    motion design language. Every visual choice serves the narrative.
  ])
][
  #canvas-card([Design Systems], [
    Component libraries, spacing systems, responsive grids, token-based
    design that ensures consistency across teams and platforms.
  ])
]


// ============================================================
// Slide: Metrics with pigment-stat
// ============================================================

== Impact by the Numbers

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.primary, font: _mono-font)[2024 STUDIO REPORT]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
  pigment-stat([PROJECTS], [47], description: [Brand identities delivered across 12 industries]),
  pigment-stat([AWARDS], [16], description: [International design recognitions including D&AD]),
  pigment-stat([RETENTION], [94%], description: [Client retention rate over 3-year engagements]),
  pigment-stat([NPS], [78], description: [Net promoter score from annual client survey]),
)

#v(0.4em)
#brushstroke-divider(color: palette.primary, total-width: 100%)
#v(0.4em)

#text(size: 13pt, fill: palette.ink-dim, font: _sans-font)[
  Our work spans luxury fashion, technology startups, cultural institutions,
  hospitality brands, and sustainable consumer goods. Each project receives
  the same depth of strategic thinking regardless of scale.
]


// ============================================================
// Section 2: Design Process
// ============================================================

= Design Process

== From Brief to Brand

#grid(columns: (2fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #easel-box[
      Our process begins long before any visual work. We invest in understanding
      the complete ecosystem: competitors, audience archetypes, cultural context,
      and business objectives. This research phase typically spans 2-3 weeks and
      produces a Brand Platform document that becomes the foundation for all
      creative decisions.

      #v(0.4em)
      The translation from strategy to design happens through rapid iteration.
      We present 3 distinct creative territories, each exploring a different
      emotional register while remaining true to the strategic foundation.
    ]
  ],
  block(width: 100%)[
    #swatch-tag([Research])
    #v(0.3em)
    #swatch-tag([Strategy], color: palette.accent)
    #v(0.3em)
    #swatch-tag([Ideation])
    #v(0.3em)
    #swatch-tag([Refinement], color: palette.accent)
    #v(0.5em)
    #palette-highlight(color: palette.accent)[
      Average project timeline: 8--12 weeks from brief to final delivery.
      Includes 3 revision rounds and a comprehensive brand book.
    ]
  ],
)


// ============================================================
// Slide: Focus Quote
// ============================================================

#focus-slide[
  "Color is a power which directly influences the soul."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: palette.ink.transparentize(30%))[
    -- Wassily Kandinsky
  ]
]


// ============================================================
// Slide: Case Study with studio-note
// ============================================================

== Case Study: Voltera Rebrand

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #studio-note([
      Voltera came to us with a 15-year-old identity that no longer reflected
      their position as a market leader in sustainable energy. The challenge:
      modernize without losing the trust built over a decade and a half.
    ], cite: "Project Lead, 2024")
    #v(0.5em)
    #text(size: 13pt, fill: palette.ink-dim, font: _sans-font)[
      We developed a visual system rooted in natural geometry -- the golden ratio
      expressed through clean, confident forms. The new mark retains the equity of
      the original while projecting innovation and environmental stewardship.
    ]
  ],
  block(width: 100%)[
    #pigment-stat([BRAND LIFT], [+42%], description: [Increase in unaided brand awareness post-launch])
    #v(0.4em)
    #pigment-stat([REVENUE], [+28%], description: [Year-over-year growth in the 12 months following rebrand])
    #v(0.4em)
    #gesso-badge([CASE STUDY])
  ],
)


// ============================================================
// Section 3: Creative Direction
// ============================================================

= Creative Direction

== Color Theory in Practice

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.primary, font: _mono-font)[CHROMATIC STRATEGY]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #canvas-card([Warm Palette], [
      Cadmium red, burnt sienna, raw umber, yellow ochre.
      Evokes passion, craft, heritage, and human warmth.
      Best for luxury, artisanal, and hospitality brands.
    ])
    #v(0.5em)
    #canvas-card([Cool Palette], [
      Ultramarine, cerulean, cobalt, prussian blue.
      Communicates trust, depth, intelligence, and precision.
      Ideal for technology, finance, and healthcare.
    ])
  ],
  block(width: 100%)[
    #palette-highlight(color: palette.primary)[
      *The 60-30-10 Rule*

      Primary color occupies 60% of visual space.
      Secondary fills 30% for balance.
      Accent at 10% creates focal points and hierarchy.
    ]
    #v(0.5em)
    #palette-highlight(color: palette.accent)[
      *Contrast Accessibility*

      All color combinations tested to WCAG AA minimum.
      Large text meets AAA. Interactive elements achieve
      4.5:1 contrast ratio against their backgrounds.
    ]
  ],
)


// ============================================================
// Dark Slide: Process Philosophy
// ============================================================

#dark-slide(
  title: none,
  header-left: [PHILOSOPHY],
  header-right: [CREATIVE DIRECTION],
)[
  #text(size: 28pt, weight: "bold", fill: palette.bg)[Constraints Are the Canvas.#linebreak()Limitations Breed Invention.]
  #v(0.15em)
  #block(width: 50pt, height: 2pt, fill: palette.primary)
  #v(0.5em)

  #grid(columns: (1fr, 1fr), column-gutter: 28pt,
    block(width: 100%, stroke: (left: 1.5pt + palette.primary), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: palette.bg.transparentize(40%), font: _mono-font)[MATERIAL HONESTY]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: palette.bg)[Work With, Not Against]
      #v(0.3em)
      #text(size: 12pt, fill: palette.bg.transparentize(25%), font: _sans-font)[
        Every medium has inherent qualities. Print has texture and permanence.
        Digital has motion and interactivity. We design for the medium, not
        despite it.
      ]
    ],
    block(width: 100%, stroke: (left: 1.5pt + palette.bg.transparentize(60%)), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: palette.bg.transparentize(40%), font: _mono-font)[INTENTIONAL REDUCTION]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: palette.bg)[Less, But Better]
      #v(0.3em)
      #text(size: 12pt, fill: palette.bg.transparentize(25%), font: _sans-font)[
        The strongest identities use the fewest elements. We pursue clarity through
        reduction: one typeface, limited colors, consistent spacing. What remains
        must be essential.
      ]
    ],
  )

  #v(0.6em)
  #text(size: 11pt, fill: palette.bg.transparentize(20%), font: _sans-font)[
    This philosophy guides every project -- from startup wordmarks to comprehensive enterprise design systems.
  ]
]


// ============================================================
// Slide: Typography Showcase
// ============================================================

== Typography as Brand Voice

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 12pt,
  canvas-card([Serif Heritage], [
    Traditional serifs convey authority and longevity. We pair them with
    generous leading and classical proportions for brands rooted in craft.
  ]),
  canvas-card([Geometric Modern], [
    Clean geometric sans-serifs project innovation and clarity. Balanced
    x-heights and open counters ensure readability at every scale.
  ]),
  canvas-card([Humanist Warmth], [
    Humanist typefaces carry the gesture of the hand. Slight stroke contrast
    and calligraphic roots make them approachable yet sophisticated.
  ]),
  canvas-card([Monospace Precision], [
    Fixed-width faces for technical brands, data visualization, and UI.
    They signal system thinking and engineering rigor.
  ]),
)


// ============================================================
// Focus: Key Insight
// ============================================================

#focus-slide[
  "Great design is not about making things beautiful.#linebreak()It is about making things work beautifully."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: palette.ink.transparentize(30%))[
    -- Studio Meridian Principles
  ]
]


// ============================================================
// Section 4: Deliverables
// ============================================================

= Deliverables

== What You Receive

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.primary, font: _mono-font)[PROJECT OUTPUTS]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #canvas-card([Brand Book], [
      60--100 page comprehensive guide covering logo usage, color specifications,
      typography scales, photography style, illustration guidelines, tone of voice,
      and application examples across all touchpoints.
    ])
    #v(0.5em)
    #canvas-card([Design Tokens], [
      Machine-readable design decisions: spacing scales, color values with dark mode
      variants, type ramp, border radii, shadow definitions. Exported as JSON, CSS
      custom properties, and Figma variables.
    ])
  ],
  block(width: 100%)[
    #canvas-card([Asset Library], [
      Production-ready logo files in SVG, PNG, EPS formats. Social media templates,
      presentation decks, email signatures, stationery layouts. All organized in a
      shared cloud workspace with version control.
    ])
    #v(0.5em)
    #canvas-card([Motion Toolkit], [
      Animation principles, easing curves, transition timing, micro-interaction
      patterns. Delivered as After Effects templates and Lottie files for seamless
      development handoff.
    ])
  ],
)


// ============================================================
// Ending
// ============================================================

#ending-slide[Thank You]
