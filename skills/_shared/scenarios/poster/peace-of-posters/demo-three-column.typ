// A0 landscape, three-column evidence atlas using peace-of-posters 0.6.0.
// The study, organizations, sites, and measurements are fictional demonstration data.
#import "@preview/peace-of-posters:0.6.0" as pop

#let ink = rgb("#173238")
#let spruce = rgb("#245B56")
#let moss = rgb("#6E8D6A")
#let citron = rgb("#D9C45A")
#let clay = rgb("#C86E4C")
#let paper = rgb("#F4F0E7")
#let wash = rgb("#E4ECE7")

#let poster-theme = (
  "body-box-args": (
    inset: 1.15em,
    width: 100%,
    fill: white,
    stroke: 1.2pt + rgb("#B7C5BD"),
  ),
  "body-text-args": (fill: ink),
  "heading-box-args": (
    inset: 1.05em,
    width: 100%,
    fill: spruce,
    stroke: none,
  ),
  "heading-text-args": (fill: white, weight: "semibold"),
  "title-box-args": (inset: 1.1em, width: 100%, fill: ink, stroke: none),
  "title-text-args": (fill: paper, weight: "regular"),
)

#let sample-strip(values) = {
  let palette = (moss, wash, citron, clay, spruce)
  grid(
    columns: values.len() * (1fr,),
    gutter: 0.18em,
    ..values.enumerate().map(((i, value)) => {
      let color = palette.at(value)
      block(width: 100%, height: 2.4em, fill: color)[
        #align(center + horizon)[
          #text(size: 0.72em, weight: "bold", fill: if value == 4 { white } else { ink })[
            #str(i + 1)
          ]
        ]
      ]
    }),
  )
}

#let reading(value, label, fill: wash) = block(
  width: 100%,
  fill: fill,
  inset: 0.8em,
  stroke: (top: 6pt + spruce),
)[
  #text(size: 2.0em, weight: "bold", fill: ink)[#value]
  #linebreak()
  #text(weight: "semibold")[#label]
]

#let comparison(label, control, treatment) = grid(
  columns: (7.2em, 1fr, 1fr),
  column-gutter: 0.45em,
  align: (left, center, center),
  [#text(weight: "semibold")[#label]],
  [#block(width: 100%, fill: rgb("#E8E4DD"), inset: 0.38em)[
    #align(center)[#text(weight: "bold", fill: clay)[#control]]
  ]],
  [#block(width: 100%, fill: wash, inset: 0.38em)[
    #align(center)[#text(weight: "bold", fill: spruce)[#treatment]]
  ]],
)

#let landscape-layout = pop.layout-a0 + (
  "body-size": 28pt,
  "heading-size": 39pt,
  "title-size": 66pt,
  "subtitle-size": 48pt,
  "authors-size": 38pt,
  "institutes-size": 34pt,
  "keywords-size": 29pt,
)

#set page(paper: "a0", flipped: true, margin: 1.4cm, fill: paper)
#set text(font: "Arial", size: landscape-layout.at("body-size"), fill: ink)
#set par(justify: true, leading: 0.68em)
#let box-spacing = 1.05em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#pop.set-poster-layout(landscape-layout)
#pop.update-poster-layout(spacing: box-spacing)
#pop.set-theme(poster-theme)

#pop.title-box(
  "Cool Roof, Quiet Room",
  subtitle: "A paired classroom pilot separates thermal relief from comfort claims",
  authors: "Maya Chen¹ · Elias Ward² · Noor Patel¹",
  institutes: "¹School Environments Lab · ²Municipal Building Office",
  keywords: "paired rooms · roof reflectance · indoor heat · decision-grade field evidence",
)

#v(0.45em)

#columns(3, [
  #pop.column-box(heading: "01 · Question & Pairing")[
    Could a reversible reflective roof coating reduce occupied-hour heat in one top-floor classroom
    without changing ventilation, shading, or teaching schedules?

    #v(0.45em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      reading([2], [matched rooms]),
      reading([15], [school days], fill: rgb("#F4EBCB")),
      reading([5 min], [logging interval], fill: rgb("#F3DDD4")),
    )

    #v(0.45em)
    The rooms shared orientation, floor, window area, and timetable. Room B received the coating;
    Room A remained unchanged. The intervention threshold was defined before logging began.
  ]

  #pop.column-box(heading: "Measurement Contract")[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.65em,
      row-gutter: 0.5em,
      [#text(size: 1.4em, weight: "bold", fill: spruce)[01]], [Calibrate both loggers in the same shaded room.],
      [#text(size: 1.4em, weight: "bold", fill: spruce)[02]], [Compare only periods when both rooms were occupied.],
      [#text(size: 1.4em, weight: "bold", fill: spruce)[03]], [Record window state and fan use at every lesson change.],
      [#text(size: 1.4em, weight: "bold", fill: spruce)[04]], [Keep cloudy and hot days visible; do not retain only dramatic contrasts.],
    )
  ]

  #pop.column-box(heading: "Sampling Ledger", stretch-to-next: true)[
    #text(size: 0.84em, fill: rgb("#596965"))[Each tile is one valid occupied-hour comparison · illustrative pattern]
    #v(0.45em)
    #sample-strip((1, 1, 2, 2, 3, 1, 3, 2, 2, 4, 3, 1))
    #v(0.35em)
    #sample-strip((1, 2, 2, 3, 3, 2, 3, 3, 4, 4, 2, 1))
    #v(0.55em)
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: 0.5em,
      [#rect(width: 1em, height: 0.65em, fill: moss) mild],
      [#rect(width: 1em, height: 0.65em, fill: citron) warm],
      [#rect(width: 1em, height: 0.65em, fill: clay) hot],
      [#align(right)[logger status retained with each interval]],
    )

    #block(width: 100%, fill: paper, inset: 0.8em, stroke: (left: 6pt + citron))[
      *Exclusion rule:* remove an interval only when either logger failed, occupancy differed, or a
      window-state record was missing. Twelve of 312 intervals were excluded under this rule.
    ]
  ]

  #colbreak()

  #pop.column-box(heading: "02 · Primary Contrast")[
    #align(center)[
      #text(size: 4.8em, weight: "bold", fill: spruce)[2.6 °C]
      #linebreak()
      #text(size: 1.1em, weight: "semibold")[lower median occupied-hour peak in the coated room]
    ]
    #v(0.55em)
    The direction favored the coated room on 12 of 15 days. The widest paired difference occurred
    after two cloudless mornings; the smallest occurred on a windy, overcast day.
  ]

  #pop.column-box(heading: "Conditions, Not One Average")[
    #text(size: 0.82em, fill: rgb("#596965"))[
      Room A = unchanged control · Room B = reflective coating · fictional values
    ]
    #v(0.45em)
    #comparison([Median peak], [31.8 °C], [29.2 °C])
    #v(0.35em)
    #comparison([Hot-day peak], [34.1 °C], [30.7 °C])
    #v(0.35em)
    #comparison([Overcast peak], [27.4 °C], [26.8 °C])
    #v(0.35em)
    #comparison([Morning gap], [0.4 °C], [0.3 °C])
  ]

  #pop.column-box(heading: "Evidence That Could Change the Decision")[
    #table(
      columns: (1.7fr, 0.8fr, 1.35fr),
      inset: (x: 0.52em, y: 0.4em),
      stroke: (x, y) => if y > 0 { (top: 0.7pt + rgb("#C9D1CD")) },
      [*Check*], [*Pass?*], [*Interpretation*],
      [Occupied intervals align], [Yes], [Supports paired comparison],
      [Window use balanced], [Mostly], [Retain as a sensitivity check],
      [Comfort surveyed], [No], [Do not claim comfort benefit],
      [Winter monitored], [No], [Heating tradeoff unknown],
    )
  ]

  #pop.column-box(heading: "Robustness & Audit", stretch-to-next: true)[
    + *Sensitivity:* without the hottest day, 2.6 °C became 2.3 °C; direction unchanged.
    + *Audit bundle:* logger, occupancy, exclusions, coating specification, and notebook.
  ]

  #colbreak()

  #pop.column-box(heading: "03 · What the Pilot Supports")[
    #block(width: 100%, fill: rgb("#E4ECE7"), inset: 0.85em, stroke: (left: 7pt + spruce))[
      During matched occupied periods in this two-room pilot, the coated roof reduced measured
      indoor peak temperature enough to justify a broader, preregistered trial.
    ]

    #v(0.55em)
    It does *not* establish improved learning, thermal comfort, annual energy savings, or performance
    in other roof assemblies.
  ]

  #pop.column-box(heading: "Trade-off Register")[
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.55em,
      block(width: 100%, fill: rgb("#F4EBCB"), inset: 0.75em)[
        *Benefit to test*\
        Lower afternoon peaks during hot weather.
      ],
      block(width: 100%, fill: rgb("#F3DDD4"), inset: 0.75em)[
        *Cost to test*\
        Glare, maintenance, winter heat loss, and roof compatibility.
      ],
      block(width: 100%, fill: wash, inset: 0.75em)[
        *Equity question*\
        Which rooms experience the highest cumulative heat burden?
      ],
      block(width: 100%, fill: rgb("#E8E4DD"), inset: 0.75em)[
        *Operations question*\
        Can work happen between terms without displacing classes?
      ],
    )
  ]

  #pop.column-box(heading: "Next Study, Fixed Before Expansion")[
    + Twelve schools stratified by roof type and shade.
    + One full warm season plus the following winter.
    + Room temperature, radiant temperature, occupancy, comfort, and energy use.
    + Installation and maintenance costs reported beside effects.
  ]

  #pop.column-box(heading: "Decision", stretch-to-next: true)[
    #align(center)[
      #text(size: 2.6em, weight: "bold", fill: clay)[PILOT AGAIN]
      #linebreak()
      #text(size: 1.05em, weight: "semibold")[do not scale procurement from this result alone]
    ]

    #v(0.7em)
    Commission the multi-school trial only if roof-condition surveys find at least eight comparable
    candidate buildings and the monitoring plan includes winter performance.

    #line(length: 100%, stroke: 1.2pt + rgb("#B7C5BD"))
    #v(0.35em)
    #text(size: 0.86em, fill: rgb("#596965"))[
      *Stop condition:* abandon the coating route if glare or membrane-compatibility testing fails.
    ]
  ]
])

#pop.bottom-box()[
  ILLUSTRATIVE DEMO DATA · All rooms, people, organizations, measurements, and links are fictional ·
  school-environments.example/cool-roof · #raw("maya.chen@example.com")
]
