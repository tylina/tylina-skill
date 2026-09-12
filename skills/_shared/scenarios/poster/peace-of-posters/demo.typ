// Concrete, asset-free adaptation of the official peace-of-posters 0.6.0 starter.
// The study, organizations, route, and measurements are illustrative demo data.
#import "@preview/peace-of-posters:0.6.0" as pop

#let navy = rgb("#12324A")
#let blue = rgb("#276A8B")
#let sky = rgb("#9BC7D5")
#let amber = rgb("#E2A84A")
#let coral = rgb("#C75B4A")
#let mist = rgb("#EDF4F5")

#let metric(value, label, note: []) = block(
  width: 100%,
  fill: mist,
  inset: 0.75em,
  stroke: (left: 6pt + blue),
)[
  #text(size: 2.1em, weight: "bold", fill: navy)[#value]
  #linebreak()
  #text(size: 1.05em, weight: "bold")[#label]
  #if note != [] { linebreak(); text(size: 0.82em, fill: rgb("#51616B"), note) }
]

#let heat-grid() = {
  let cells = (
    sky, sky, amber, coral, coral,
    sky, amber, amber, coral, navy,
    rgb("#D6E4D4"), sky, amber, blue, navy,
    rgb("#D6E4D4"), rgb("#D6E4D4"), sky, blue, blue,
  )
  block(width: 100%, height: 9.4em, fill: navy, inset: 0.45em)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      rows: (1fr, 1fr, 1fr, 1fr),
      gutter: 0.18em,
      ..cells.map(c => rect(width: 100%, height: 100%, fill: c)),
    )
    #place(dx: 4%, dy: 11%)[#line(length: 84%, angle: 14deg, stroke: 7pt + white)]
    #place(dx: 7%, dy: 73%)[#line(length: 73%, angle: -9deg, stroke: 5pt + white)]
    #place(dx: 71%, dy: 28%)[#circle(radius: 0.22em, fill: white)]
  ]
}

#let delta-bar(label, value, width, fill) = grid(
  columns: (6em, 1fr, 3.5em),
  column-gutter: 0.45em,
  align: (left, left, right),
  [#text(weight: "bold")[#label]],
  [#block(width: 100%, fill: rgb("#E7ECEF"))[
    #rect(width: width, height: 1.15em, fill: fill)
  ]],
  [#text(weight: "bold", fill: fill)[+#value °C]],
)

#show: pop.a1-poster
#pop.set-theme(pop.uni-fr)

#pop.title-box(
  "Where the Street Holds Heat",
  subtitle: "Repeat bicycle transects reveal block-scale thermal contrast after sunset",
  authors: "Maya Chen¹ · Jonas Reed² · Amina Okafor¹",
  institutes: "¹City Signals Lab · ²Department of Urban Ecology",
  keywords: "mobile sensing, urban heat, reproducible field methods · illustrative demo study",
)

#columns(2, [
  #pop.column-box(heading: "Question & Study Design")[
    Can a low-cost bicycle sensor identify persistent evening heat pockets without pretending one
    ride represents an entire neighborhood?

    #v(0.55em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      metric([6], [repeat rides], note: [same 8.4 km loop]),
      metric([612], [matched points], note: [after quality filters]),
      metric([19:00], [start window], note: [± 12 minutes]),
    )
  ]

  #pop.column-box(heading: "The Route Is Part of the Evidence")[
    #heat-grid()
    #v(0.55em)
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: 0.45em,
      [#rect(width: 1.1em, height: 0.75em, fill: sky) cooler],
      [#rect(width: 1.1em, height: 0.75em, fill: amber) warm],
      [#rect(width: 1.1em, height: 0.75em, fill: coral) hot],
      [#align(right)[each tile = matched street segment]],
    )

    Every point was matched to the same 20 m segment and compared with a shaded reference segment
    ridden in the same time window. The map is schematic; the workflow is the transferable part.

    #v(0.45em)
    #block(width: 100%, fill: rgb("#F7F1E3"), inset: 0.65em)[
      *Protocol:* calibrate before/after · hold route and start window · flag stops over 45 s ·
      compare matched segments only.
    ]
  ]

  #pop.column-box(heading: "What We Would Publish", stretch-to-next: true)[
    #block(width: 100%)[
      #grid(
        rows: (auto, auto, auto),
        gutter: 0.6em,
        ..(
          ("01", "Route file", "Time-stamped geometry, stop flags, and segment identifiers."),
          ("02", "Calibration record", "Pre/post reference checks and the correction equation."),
          ("03", "Analysis notebook", "Filters, matched comparisons, uncertainty, and rejected passes."),
        ).map(((n, title, copy)) => block(width: 100%, fill: mist, inset: 0.7em)[
          #text(size: 1.25em, weight: "bold", fill: blue)[#n]
          #h(0.45em)
          #text(weight: "bold")[#title]
          #linebreak()
          #copy
        ]),
      )
    ]
  ]

  #colbreak()

  #pop.column-box(heading: "Evening Thermal Contrast")[
    #text(size: 0.82em, fill: rgb("#51616B"))[
      Median paired difference from the shaded reference · illustrative values
    ]
    #v(0.45em)
    #delta-bar([Asphalt retail], [2.8], 93%, coral)
    #v(0.35em)
    #delta-bar([Bus interchange], [2.3], 77%, amber)
    #v(0.35em)
    #delta-bar([Brick housing], [1.4], 47%, blue)
    #v(0.35em)
    #delta-bar([Tree corridor], [0.4], 14%, sky)
    #v(0.6em)
    The ranking repeated on five of six rides. One windy evening compressed all segment
    differences and is shown rather than silently removed.
  ]

  #pop.column-box(heading: "Defining Evidence")[
    #table(
      columns: (1.35fr, 0.8fr, 0.85fr, 0.9fr),
      inset: 0.35em,
      stroke: (x, y) => if y > 0 { (top: 0.6pt + gray) },
      [*Segment*], [*Passes*], [*Δ median*], [*IQR*],
      [Retail asphalt], [6], [+2.8 °C], [0.6 °C],
      [Bus interchange], [6], [+2.3 °C], [0.8 °C],
      [Brick housing], [5], [+1.4 °C], [0.5 °C],
      [Tree corridor], [6], [+0.4 °C], [0.4 °C],
    )
  ]

  #pop.column-box(heading: "Interpretation", stretch-to-next: true)[
    The illustrative pattern supports a narrow operational claim: on repeated evening rides, two
    hard-surface corridors stayed warmer than the shaded reference. It does *not* estimate resident
    exposure, daytime heat risk, or conditions beyond the sampled route.

    #v(0.55em)
    #block(width: 100%, fill: rgb("#FFF1D8"), inset: 0.75em, stroke: (left: 6pt + amber))[
      #text(weight: "bold", fill: navy)[DECISION USE]
      #linebreak()
      Prioritize these corridors for a fixed-sensor follow-up before proposing an intervention.
    ]

    #v(0.55em)
    #block(width: 100%, fill: mist, inset: 0.72em, stroke: (left: 6pt + blue))[
      *Limits:* six evenings, one mobile route, unresolved traffic and wind effects, and no claim
      about seasonal exposure. The map and values are fictional demonstration material.
    ]
  ]
])

#pop.bottom-box()[
  ILLUSTRATIVE DEMO DATA · Protocol, map, people, and measurements are fictional ·
  city-signals.example/methods · #raw("maya.chen@example.com")
]
