#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Helvetica Neue", "Hiragino Sans GB"), size: 18pt)

#show: zen-garden-theme.with(
  aspect-ratio: "16-9",
  footer: [Zen Garden],
  config-info(
    title: [The Art of Emptiness],
    subtitle: [Principles of Karesansui Design],
    author: [Garden Studies Institute],
    date: datetime.today(),
    institution: [School of Contemplative Design],
  ),
  config-common(breakable: false),
)

#title-slide()

= Philosophy

== The Nature of Ma (間)

#cols[
  #stack(
    spacing: .8em,
    [In Japanese aesthetics, *ma* is the conscious use of negative space -- not absence, but presence of possibility.],
    moss-highlight([Core Insight], [
      Emptiness is not the lack of something. It is the fullness of nothing. Every gap in a zen garden is a deliberate invitation for the mind to rest.
    ]),
  )
][
  #stone-card([Three Readings of Ma], [
    - *Spatial*: the interval between objects
    - *Temporal*: the pause between sounds
    - *Relational*: the distance between people
  ])
]

#speaker-note[Introduce the concept of ma as the philosophical foundation. Emphasize that this is active, not passive emptiness.]

== Wabi-Sabi: Beauty in Imperfection

#stack(spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
    stone-card([Wabi], [
      The beauty of simplicity and quietude. Rustic elegance found in natural materials, weathered surfaces, handmade imperfection.
    ]),
    stone-card([Sabi], [
      The beauty of aging and patina. The passage of time made visible -- moss on stone, cracks in pottery, fading ink on paper.
    ], accent: palette.accent),
  ),
  garden-verse(
    [The quieter you become, the more you can hear.],
    author: [Ram Dass],
  ),
)

#speaker-note[Explain the paired concept of wabi-sabi. Use examples from everyday life that the audience can relate to.]

= Garden Elements

== Stone Arrangements (石組)

#stack(
  spacing: .8em,
  [The placement of stones in a karesansui follows principles older than written language.],
  cols(columns: (1fr, 1fr, 1fr), gutter: 12pt,
    pebble-stat([Ryoan-ji], [15]),
    pebble-stat([Traditional Groups 組石], [3-5-7], accent: palette.moss),
    pebble-stat([Viewing Angles], [360], accent: palette.accent),
  ),
  rock-grouping([Fundamental Rule], [
    No matter where you stand in Ryoan-ji temple, you can never see all fifteen stones at once. This incompleteness is the teaching itself.
  ]),
)

#speaker-note[The 15 stones of Ryoan-ji are the most famous example. The impossibility of seeing all at once represents the limits of human perception.]

== Raked Sand Patterns (砂紋)

#cols[
  #stack(spacing: .8em,
    zen-box([Parallel Lines], [
      Represent the ocean or flowing water. The rake creates uniform furrows suggesting infinite calm and regularity.
    ]),
    zen-box([Concentric Circles], [
      Raked around stones to suggest ripples. The stone "drops" into the sand-ocean, creating waves that extend outward.
    ]),
  )
][
  #stack(spacing: .8em,
    moss-highlight([Daily Practice], [
      Monks rake the garden each morning as meditation. The act of raking IS the purpose -- not the resulting pattern.

      The garden is remade daily. Nothing is permanent.
    ]),
    [#stone-tag([Impermanence]) #h(4pt) #stone-tag([Mindfulness], color: palette.moss) #h(4pt) #stone-tag([Ritual])],
  )
]

#speaker-note[Explain that the raking is a meditative practice. The pattern itself is secondary to the process of creating it.]

== Types of Zen Gardens

#figure[
  #table(
    columns: (auto, 1fr, 1fr),
    inset: 10pt,
    stroke: 0.5pt + palette.border,
    fill: (x, y) => if y == 0 { palette.card } else { palette.bg },
    [*Type*], [*Materials*], [*Purpose*],
    [Karesansui], [Sand, stone, moss], [Contemplation],
    [Tsuboniwa], [Stone, plants, water basin], [Inner courtyard peace],
    [Roji], [Stepping stones, lanterns], [Tea ceremony approach],
    [Chisen], [Pond, islands, bridges], [Walking meditation],
  )
]

#speaker-note[Overview of the four main garden types. Note how each serves a different contemplative purpose.]

= Principles

== Design Thinking Through Zen

#stack(spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
    moss-highlight([Subtraction], [
      The master gardener's art is knowing what to remove. Every stone that remains has survived the question: "Is this essential?"
    ]),
    moss-highlight([Asymmetry], [
      Perfect symmetry is dead. Odd numbers, irregular spacing, and deliberate imbalance create life and movement within stillness.
    ]),
  ),
  sand-divider(),
  cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
    stone-card([Borrowed Scenery (借景)], [
      Incorporating distant mountains or trees into the garden's composition. The boundary between garden and world dissolves.
    ]),
    stone-card([Hidden Depths (幽玄)], [
      Suggesting more than is shown. Mystery and depth arise from what is concealed, not what is displayed.
    ], accent: palette.accent),
  ),
)

#speaker-note[Connect zen garden principles to modern design thinking. These are not just aesthetic choices but philosophical positions.]

== Seven Principles of Zen Aesthetics

#cols(columns: (2fr, 3fr))[
  #stack(
    spacing: .8em,
    pebble-stat([Principles 原則], [7]),
    garden-verse(
      [In the beginner's mind there are many possibilities. In the expert's mind there are few.],
      author: [Shunryu Suzuki],
    ),
  )
][
  #grid(columns: (1fr, 1fr), column-gutter: 10pt, row-gutter: 10pt,
    zen-box([Kanso], [Simplicity, elimination of clutter]),
    zen-box([Fukinsei], [Asymmetry, irregularity]),
    zen-box([Koko], [Austerity, bare essentials]),
    zen-box([Shizen], [Naturalness without pretense]),
    zen-box([Yugen], [Subtle profound grace]),
    zen-box([Datsuzoku], [Freedom from the ordinary]),
  )
]

#speaker-note[The seven principles provide a framework for understanding zen aesthetics. Each principle can be applied to modern design challenges.]

== Applying Restraint

#stack(spacing: .8em,
  rock-grouping([The Paradox of Constraints], [
    When everything is possible, nothing is meaningful. Constraints create the conditions for creativity. The zen garden's limited palette -- sand, stone, moss -- produces infinite variation.
  ]),
  cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true,
    stone-card([Material], [
      Three elements: sand, stone, moss. Nothing more is needed.
    ]),
    stone-card([Color], [
      Warm greys, earth tones, occasional green. Restraint is the palette.
    ], accent: palette.accent),
    stone-card([Form], [
      Organic curves, no straight lines in nature. Imperfection is the geometry.
    ]),
  ),
)

#speaker-note[This slide demonstrates the principle of restraint by using minimal elements. The theme itself embodies what it teaches.]

#focus-slide[
  In a garden of carefully placed stones, \
  the most important element \
  is the empty space between them.
]

#speaker-note[A contemplative pause before the final section. Let the audience sit with this idea.]

#ending-slide[Thank You]
