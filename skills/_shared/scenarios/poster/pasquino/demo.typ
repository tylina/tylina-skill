// A 75 x 100 cm minimalist two-column poster using pasquino 0.1.0.
// The school, streets, observations, and measurements are fictional demo material.
#import "@preview/pasquino:0.1.0": poster, section

#let ink = rgb("#183239")
#let teal = rgb("#2B7A78")
#let aqua = rgb("#A9D8D3")
#let apricot = rgb("#E9A36A")
#let coral = rgb("#C95E56")
#let paper = rgb("#F7F4ED")
#let mist = rgb("#E8EFED")

#let metric(value, label, note) = block(
  width: 100%,
  fill: mist,
  inset: 0.65em,
  stroke: (top: 5pt + teal),
)[
  #text(size: 1.85em, weight: "bold", fill: ink)[#value]
  #linebreak()
  #text(weight: "semibold")[#label]
  #linebreak()
  #text(size: 0.78em, fill: rgb("#59696C"))[#note]
]

#let peak-row(label, value, width, fill) = grid(
  columns: (6.5em, 1fr, 3.6em),
  column-gutter: 0.45em,
  align: (left, left, right),
  [#text(weight: "semibold")[#label]],
  [#block(width: 100%, fill: rgb("#E6E5DF"))[
    #rect(width: width, height: 1.0em, fill: fill)
  ]],
  [#text(weight: "bold", fill: fill)[#value]],
)

#let moment(time, title, copy, fill) = grid(
  columns: (5.4em, 1fr),
  column-gutter: 0.6em,
  align: (left, left),
  [#block(width: 100%, fill: fill, inset: 0.35em)[
    #align(center)[#text(weight: "bold", fill: ink)[#time]]
  ]],
  [#text(weight: "semibold")[#title] #linebreak() #text(size: 0.9em)[#copy]],
)

#set page(footer: [
  #block(width: 100%, fill: ink, inset: (x: 0.65em, y: 0.25em))[
    #text(size: 15pt, fill: white)[
      ILLUSTRATIVE DEMO · all people, sites, observations, values, and links are fictional ·
      school-environments.example/curb-air
    ]
  ]
])

#show: poster.with(
  title: [Curbside Air Is a Scheduling Problem],
  authors: ("Maya Chen", "Elias Ward", "Noor Patel"),
  info: (
    [School Environments Lab · North Gate Primary · illustrative demonstration study],
    [Paired curb / courtyard monitoring · 15 school days · preregistered time windows],
  ),
  theme: gradient.linear(rgb("#A9D8D3"), paper, angle: 90deg),
  banner-height: 18%,
  gutter: 54pt,
  title-size: 67pt,
  heading-size: 47pt,
  body-size: 28pt,
  meta-size: 28pt,
  caption-size: 20pt,
)

#set text(fill: ink)
#set par(justify: true, leading: 0.72em)
#show strong: set text(fill: teal)

#section(title: "Question, paired in space")[
  Does the vehicle queue at the school gate create a repeatable pollution peak during arrival—and
  can a low-cost staggered drop-off trial reduce it without moving exposure to the courtyard?

  #v(0.55em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.5em,
    metric([15], [school days], [same term]),
    metric([2], [monitor sites], [curb + courtyard]),
    metric([1 min], [sample rate], [07:30–09:15]),
  )
]

#section(title: "The queue has a signature")[
  #text(size: 0.82em, fill: rgb("#667477"))[
    Median particle-count index by 15-minute window · curb monitor · illustrative values
  ]
  #v(0.45em)
  #peak-row([07:30], [18], 26%, aqua)
  #v(0.3em)
  #peak-row([07:45], [31], 45%, teal)
  #v(0.3em)
  #peak-row([08:00], [67], 96%, coral)
  #v(0.3em)
  #peak-row([08:15], [55], 79%, apricot)
  #v(0.3em)
  #peak-row([08:30], [29], 42%, teal)
  #v(0.3em)
  #peak-row([08:45], [17], 24%, aqua)

  #v(0.55em)
  The curb index peaked in the same arrival window on 12 of 15 days. The courtyard rose only when
  wind carried the plume across the building, so the paired site remained part of every decision.
]

#section(title: "Field contract")[
  #moment([07:20], [Co-locate], [Check both monitors against the same inlet before deployment.], aqua)
  #v(0.42em)
  #moment([07:30], [Separate], [Move one monitor to the gate and one to the courtyard.], rgb("#CFE4E0"))
  #v(0.42em)
  #moment([09:15], [Reunite], [Repeat the check; flag drift before analysis.], rgb("#F2D7C1"))
  #v(0.42em)
  #moment([Same day], [Join], [Match queue count, wind, delivery events, and school timetable.], rgb("#E8D1CF"))

  #v(0.55em)
  #block(width: 100%, fill: paper, inset: 0.75em, stroke: (left: 6pt + apricot))[
    *Exclusion rule:* a time window is removed only when calibration fails, either monitor is absent,
    or the wind record is missing. Rainy days remain visible.
  ]
]

#section(title: "What ships with the claim")[
  + Minute-level monitor files and calibration checks
  + Queue counts, wind observations, and exclusion flags
  + Analysis notebook and the exact trial trigger
  + A plain-language note stating that all values here are fictional
]

#section(title: "The burden belongs in the result")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.45em,
    block(width: 100%, fill: mist, inset: 0.55em)[*Staff*\ minutes at each gate],
    block(width: 100%, fill: rgb("#F2D7C1"), inset: 0.55em)[*Safety*\ crossing conflicts],
    block(width: 100%, fill: rgb("#E8D1CF"), inset: 0.55em)[*Access*\ late arrivals],
  )
]

#colbreak()

#section(title: "The peak followed cars, not the bell")[
  #align(center)[
    #text(size: 4.3em, weight: "bold", fill: coral)[2.3×]
    #linebreak()
    #text(size: 1.0em, weight: "semibold")[curb index at the queue peak versus the pre-arrival baseline]
  ]

  #v(0.6em)
  The bell time did not move during the study. On days with fewer idling vehicles, the peak was
  smaller even when the number of arriving pupils was similar. This supports a queue-management
  trial; it does not identify a clinical exposure effect.
]

#section(title: "Defining evidence")[
  #table(
    columns: (1.45fr, 0.75fr, 0.85fr, 1.15fr),
    inset: (x: 0.48em, y: 0.38em),
    stroke: (x, y) => if y > 0 { (top: 0.7pt + rgb("#CCD2D0")) },
    [*Condition*], [*Days*], [*Peak index*], [*Courtyard*],
    [Queue above 24], [6], [67], [Low on 4 / 6],
    [Queue 12–24], [5], [43], [Low on 4 / 5],
    [Queue below 12], [4], [28], [Low on 4 / 4],
  )

  #v(0.6em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.6em,
    block(width: 100%, fill: mist, inset: 0.7em)[
      *Repeated pattern*\
      Peak timing aligned with the vehicle queue on 12 / 15 days.
    ],
    block(width: 100%, fill: rgb("#F2D7C1"), inset: 0.7em)[
      *Important exception*\
      Cross-building wind raised the courtyard on two high-queue days.
    ],
  )
]

#section(title: "The trial is operational, not cosmetic")[
  #block(width: 100%, fill: teal, inset: 0.8em)[
    #set text(fill: white)
    *Four-week trial:* open a second arrival gate at 07:55, move deliveries after 09:00, and ask
    drivers to switch engines off while stationary.
  ]

  #v(0.55em)
  The trial succeeds only if the curb peak falls *and* the courtyard stays at or below its baseline.
  Report walking burden, late arrivals, and staff time beside the environmental measure.
]

#section(title: "Claim boundary & stop rule")[
  *Supported:* a repeated, localized curbside peak is credible enough to test a queue intervention.

  #v(0.35em)
  *Not supported:* health benefit, annual exposure, causality, or performance at another school.

  #v(0.55em)
  Stop the trial if the second gate creates an unsafe crossing, the courtyard index increases on
  three matched days, or late arrival rises by more than five percentage points.
]

#section(title: "Decision after four weeks")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.5em,
    block(width: 100%, fill: rgb("#CFE4E0"), inset: 0.65em)[
      *KEEP*\
      Peak and courtyard both improve.
    ],
    block(width: 100%, fill: rgb("#F2D7C1"), inset: 0.65em)[
      *ADAPT*\
      Peak falls but burden shifts.
    ],
    block(width: 100%, fill: rgb("#E8D1CF"), inset: 0.65em)[
      *STOP*\
      Safety or courtyard rule fails.
    ],
  )

]

#section(title: "If the trial works")[
  Repeat the protocol at three schools with different street geometry, publish the transferability
  limits, and keep the paired courtyard monitor. A lower curb peak is not a license to move the plume.
]
