// Demo: Vermillion Theme — Creative Agency Pitch
// Showcases all slide types and components for a lifestyle brand presentation.

#import "template.typ": *

#show: vermillion-theme.with(
  config-info(
    title: [Ember & Clay Studio],
    subtitle: [Brand Strategy & Creative Direction for Modern Living],
    author: [Sofia Terracini, Creative Director],
    institution: [Vermillion Creative Partners],
    date: datetime(year: 2025, month: 6, day: 12),
  ),
  config-common(breakable: false),
  footer: [Ember & Clay Studio | Confidential],
)

#set text(font: ("IBM Plex Sans", "Heiti SC"))
#show raw: set text(font: "IBM Plex Mono")

// ─── Title Slide (auto-generated) ───

#title-slide()

// ─── Section: Brand Vision ───

= Brand Vision

== Our Philosophy

#cols(
  lazy-layout: true,
  columns: (1fr, 1fr),
  gutter: 1.2em,
  kiln-card([Warmth First], [
    Every touchpoint should feel like sunlight on terracotta.
    We design for emotion before conversion — confidence,
    comfort, and quiet sophistication.
  ]),
  kiln-card([Artful Simplicity], [
    Less noise, more resonance. Our approach strips away
    the superfluous to reveal what matters: authentic
    human connection through beautiful craft.
  ], accent: palette.accent),
)

== Brand Metrics

#stack(
  spacing: .8em,
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 1em,
    hearth-stat([Brand Recall], [87%]),
    hearth-stat([Engagement Rate], [4.2x], color: palette.accent),
    hearth-stat([NPS Score], [+72], color: palette.secondary),
    hearth-stat([Year-over-Year Growth], [156%]),
  ),
  terrace-divider(color: palette.border, width: 50%),
)

// ─── Section: Strategy ───

= Strategy

== Market Positioning

#cols(
  lazy-layout: true,
  columns: (1fr, 1fr),
  gutter: 1.2em,
  clay-box([Premium Lifestyle], [
    Position at the intersection of accessible luxury and
    authentic craftsmanship. Target audience: design-conscious
    professionals aged 28-45 who value quality over quantity.
  ]),
  clay-box([Channel Strategy], [
    #stack(spacing: .8em,
      [#ember-tag[Instagram] #ember-tag(color: palette.accent)[Pinterest]
       #ember-tag(color: palette.secondary)[Editorial]],
      [Lead with visual storytelling across curated channels.
       Prioritize organic community building over paid acquisition.],
    )
  ], accent: palette.secondary),
)

== Creative Pillars

#stack(
  spacing: .8em,
  foundry-highlight([Mediterranean Warmth], [
    Draw from terracotta textures, sun-drenched palettes, and the
    unhurried elegance of coastal living. Every visual asset should
    evoke the feeling of a golden afternoon.
  ]),
  [
    - *Authentic materials* — Photography that celebrates imperfection and craft

    - *Warm typography* — Rounded serifs and generous spacing convey approachability

    - *Earth-toned palette* — Vermillion, sienna, olive, and warm whites throughout

    - *Organic shapes* — Arches, waves, and rounded geometry over sharp angles
  ],
)

// ─── Focus slide ───

#focus-slide[
  "Good design is like a warm room — \
  you feel it before you understand it."
]

// ─── Section: Deliverables ───

= Deliverables

== Project Timeline

#stack(
  spacing: .8em,
  cols(
    lazy-layout: true,
    columns: (1fr, 1fr),
    gutter: 1.5em,
    kiln-card([Phase 1: Discovery], [
      *Weeks 1-3* \
      Brand audit, stakeholder interviews, competitive
      landscape analysis, audience persona development.
    ]),
    kiln-card([Phase 2: Creation], [
      *Weeks 4-8* \
      Visual identity system, brand guidelines,
      campaign creative, content templates, asset library.
    ], accent: palette.accent),
  ),
  cols(
    lazy-layout: true,
    columns: (1fr, 1fr),
    gutter: 1.5em,
    kiln-card([Phase 3: Launch], [
      *Weeks 9-11* \
      Campaign rollout, channel activation,
      influencer partnerships, community seeding.
    ], accent: palette.secondary),
    kiln-card([Phase 4: Growth], [
      *Weeks 12+* \
      Performance monitoring, iterative optimization,
      quarterly content refreshes, ongoing creative support.
    ], accent: palette.text-light),
  ),
)

== Investment & Returns

#cols(
  columns: (2fr, 1fr),
  gutter: 1.5em,
  foundry-highlight([Expected Outcomes], [
    Based on comparable campaigns for lifestyle brands in
    the premium segment, we project:

    - *3.5x* return on creative investment within 6 months

    - *40%* increase in qualified inbound leads

    - *2x* social engagement vs. current baseline
  ]),
  stack(spacing: 0.8em,
    hearth-stat([Project Investment], [\$85,000]),
    hearth-stat([Estimated Return on Investment], [350%], color: palette.accent),
  ),
)

// ─── Ending Slide ───

#ending-slide[Thank You]
