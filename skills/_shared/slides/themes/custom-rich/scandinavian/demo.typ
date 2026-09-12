#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Avenir", "Arial", "PingFang SC"), size: 20pt)

#show: scandinavian-theme.with(
  aspect-ratio: "16-9",
  footer: [Nordic Design Studio],
  config-common(breakable: false),
  config-info(
    title: [Sustainable Product Design],
    subtitle: [Principles for a Thoughtful Future],
    author: [Anna Lindqvist],
    date: datetime.today(),
    institution: [Nordic Design Studio],
  ),
)

#title-slide()

#outline-slide()

= Design Philosophy

== Less is More

The Scandinavian approach to product design centers on reduction -- removing everything that does not serve a clear purpose.

- *Functional minimalism*: every element serves a purpose
- *Natural materials*: wood, stone, linen, wool
- *Honest construction*: visible joints, raw edges
- *Longevity over trends*: designs that age gracefully

#linen-divider()

#birch-tag[Sustainability] #birch-tag[Minimalism] #birch-tag[Craft]

== Core Principles

#cols(columns: (1fr, 1fr))[
  #hygge-card([Material Honesty], [
    Let materials speak for themselves. Birch shows its grain, ceramic reveals its glaze, wool displays its texture. No veneers, no pretense.
  ])
][
  #hygge-card([Purposeful Form], [
    Shape follows function with quiet confidence. Curves exist for ergonomics, angles for structure. Nothing decorative without utility.
  ])
]

== The Nordic Palette

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #stone-stat([87%], [Natural Materials])
][
  #stone-stat([12], [Core Colors], accent: palette.secondary)
][
  #stone-stat([3x], [Product Lifespan])
]

= Sustainable Materials

== Material Selection Framework

#nature-box([Guiding Principle], [
  Choose materials that tell a story of responsible sourcing. Every material decision is an environmental statement.
])

#v(0.5em)

#figure[
  #scandi-table(
    ([Material], [Source], [Lifecycle], [Carbon Impact]),
    (
      ([FSC Birch], [Scandinavia], [25+ years], [Low]),
      ([Recycled Wool], [Local mills], [15+ years], [Very Low]),
      ([Bio-ceramic], [Regional clay], [Indefinite], [Medium]),
      ([Hemp Linen], [Organic farms], [20+ years], [Very Low]),
    ),
  )
]

== Wood and Its Stories

#cols(columns: (3fr, 2fr))[
  Every piece of wood carries a narrative -- growth rings mark seasons, knots reveal branches that once reached for light.

  - *Birch*: light, resilient, Nordic staple
  - *Oak*: strength, warmth, ages beautifully
  - *Pine*: accessible, aromatic, sustainable

  #warm-box([Craftsmanship Note], [
    We source exclusively from FSC-certified forests within 200km of our workshop.
  ])
][
  #fjord-quote(
    [Wood is universally beautiful to man. It is the most humanly intimate of all materials.],
    author: [Frank Lloyd Wright],
  )

  #v(1em)

  #hygge-card([Workshop Practice], [
    Zero-waste policy: offcuts become smaller products or biomass fuel for our heating.
  ], accent: palette.secondary)
]

= Process and Method

== Our Design Process

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #hygge-card([01 -- Observe], [
    Spend time in the spaces where products live. Watch how people interact with objects in their daily rituals.
  ])
][
  #hygge-card([02 -- Reduce], [
    Strip away assumptions. What is truly essential? What can be removed without loss of function?
  ], accent: palette.secondary)
][
  #hygge-card([03 -- Refine], [
    Iterate with materials in hand. Prototypes reveal what sketches cannot -- weight, texture, presence.
  ], accent: palette.stone)
]

== Measuring Impact

#cols(columns: (1fr, 1fr))[
  #stone-stat([94%], [Recyclable Components])

  #v(0.8em)

  #stone-stat([2.1 kg], [Avg CO2 per Product], accent: palette.secondary)
][
  #nature-box([Environmental Commitment], [
    Our lifecycle assessment covers raw material extraction through end-of-life recycling. Every product includes a material passport for future disassembly.
  ])

  #v(0.8em)

  #birch-tag[Carbon Neutral] #birch-tag[B-Corp] #birch-tag[EU Ecolabel]
]

= Case Studies

== The Hygge Chair

#cols(columns: (2fr, 3fr))[
  #stone-stat([4.2 kg], [Total Weight])

  #v(0.6em)

  #stone-stat([100%], [Recyclable])

  #v(0.6em)

  #stone-stat([50 yr], [Design Life])
][
  #fjord-quote(
    [A chair should be more than a place to sit. It should be an invitation to pause, to breathe, to be present in the moment.],
    author: [Anna Lindqvist],
  )

  #v(0.8em)

  #nature-box([Design Achievement], [
    Winner of the Nordic Design Award 2025. Assembled without glue using traditional joinery -- fully disassemblable for repair or recycling.
  ])
]

== Material Passport

#figure[
  #scandi-table(
    ([Component], [Material], [Weight], [End of Life]),
    (
      ([Frame], [FSC Birch Ply], [2.8 kg], [Compost / Reuse]),
      ([Seat Pad], [Recycled Wool], [0.9 kg], [Textile Recycle]),
      ([Fasteners], [Stainless Steel], [0.3 kg], [Metal Recycle]),
      ([Finish], [Linseed Oil], [0.2 kg], [Biodegradable]),
    ),
  )
]

#v(0.5em)

#warm-box([Circular Design], [
  Every component can be separated by hand in under 3 minutes. No adhesives, no composite materials, no hidden fasteners.
])

#focus-slide[
  Good design is as little design as possible.

  #text(size: 0.5em, weight: "regular")[-- Dieter Rams]
]

= Future Direction

== Roadmap 2026-2028

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #hygge-card([Near Term], [
    - Bio-based polymer research
    - Regional material mapping
    - Repair workshop network
    - Digital material passports
  ])
][
  #hygge-card([Long Term], [
    - Carbon-negative production
    - Closed-loop material cycles
    - Open-source design files
    - Community craft programs
  ], accent: palette.secondary)
]

== Guiding Questions

#fjord-quote(
  [Will this object still be loved in twenty years? Will the earth be grateful we made it? These are the only questions that matter.],
  author: [Nordic Design Manifesto],
)

#v(0.8em)

#cols(columns: (1fr, 1fr, 1fr))[
  #birch-tag[Longevity]
][
  #birch-tag[Responsibility]
][
  #birch-tag[Beauty]
]

#ending-slide[Tak for idag]
