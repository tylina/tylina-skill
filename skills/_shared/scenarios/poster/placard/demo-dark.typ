// A1 landscape, three-column dark-system poster using placard 0.1.0.
// The route, agency, observations, and performance values are fictional demo material.
#import "@preview/placard:0.1.0": card, placard

#let ink = rgb("#0D1418")
#let panel = rgb("#151F24")
#let line-color = rgb("#34444A")
#let paper = rgb("#F4F0E8")
#let teal = rgb("#5EC3B4")
#let amber = rgb("#F1B45A")
#let coral = rgb("#EF7467")
#let blue = rgb("#75A9D4")

#let stat(value, label, fill) = block(
  width: 100%,
  fill: fill,
  inset: 0.75em,
  radius: 0.18em,
)[
  #text(size: 2.05em, weight: "bold", fill: ink)[#value]
  #linebreak()
  #text(size: 0.9em, weight: "semibold", fill: ink)[#label]
]

#let window-row(time, planned, observed, status, fill) = grid(
  columns: (4.2em, 1fr, 1fr, 5em),
  column-gutter: 0.42em,
  align: (left, center, center, right),
  [#text(weight: "semibold")[#time]],
  [#text(fill: rgb("#A9B6BA"))[#planned]],
  [#text(weight: "bold")[#observed]],
  [#block(width: 100%, fill: fill, inset: 0.28em, radius: 0.12em)[
    #align(center)[#text(size: 0.78em, weight: "bold", fill: ink)[#status]]
  ]],
)

#let event(n, title, copy, fill) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.55em,
  align: (center, left),
  [#circle(radius: 0.82em, fill: fill)[
    #align(center + horizon)[#text(fill: ink, weight: "bold")[#n]]
  ]],
  [#text(weight: "semibold")[#title] #linebreak() #text(size: 0.9em)[#copy]],
)

#show: placard.with(
  title: "The Last Bus Is a System, Not a Timestamp",
  authors: ("Maya Chen", "Diego Santos", "Noor Patel"),
  scheme: "dark",
  paper: "a1",
  flipped: true,
  num-columns: 3,
  gutter: 1.15em,
  scaling: 1.00,
  colors: (
    paper-fill: ink,
    card-fill: panel,
    card-border: line-color,
    title: paper,
    heading: paper,
    text: paper,
    accent: teal,
    footer-text: rgb("#A9B6BA"),
  ),
  styles: (
    title-smallcaps: false,
    h1-smallcaps: false,
    h2-smallcaps: false,
  ),
  footer: (
    content: [Illustrative demo data · night-network.example/transfer-audit],
  ),
)

#card(title: "Decision Frame")[
  A late service succeeds only when a rider can complete the transfer. We audited one fictional
  suburban interchange to decide whether to hold the final feeder bus, retime it, or add staff.

  #v(0.55em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.48em,
    stat([12], [observation nights], rgb("#CFE9E4")),
    stat([4], [arrival waves], rgb("#F4DFC1")),
    stat([186], [transfer attempts], rgb("#D5E3EF")),
  )
]

#card(title: "What Counts as a Miss")[
  A transfer was marked missed only when the inbound train arrived before the feeder departed, the
  rider reached the signed bay, and no later scheduled bus served the same destination.

  #v(0.5em)
  #block(width: 100%, fill: rgb("#262D30"), inset: 0.75em, stroke: (left: 5pt + amber))[
    Late inbound trains, wrong-bay wayfinding, and a full feeder were logged as distinct mechanisms.
  ]
]

#card(title: "Night-shift Protocol")[
  #event([01], [Sync], [Set all clocks from the same station display.], teal)
  #v(0.4em)
  #event([02], [Shadow], [Follow the rider path without intercepting.], blue)
  #v(0.4em)
  #event([03], [Code], [Record arrival, bay arrival, departure, load, and reason.], amber)
  #v(0.4em)
  #event([04], [Debrief], [Reconcile observer notes before the next service night.], coral)

  #v(0.55em)
  #block(width: 100%, fill: rgb("#262D30"), inset: 0.7em)[
    *Release bundle:* de-identified event ledger, timetable version, walking-time audit, and notebook.
  ]
]

#colbreak()

#card(title: "The Four Transfer Windows")[
  #grid(
    columns: (4.2em, 1fr, 1fr, 5em),
    column-gutter: 0.42em,
    [*Wave*], [*Planned*], [*Observed*], [*State*],
  )
  #line(length: 100%, stroke: 0.8pt + line-color)
  #v(0.35em)
  #window-row([22:40], [6 min], [5.4 min], [stable], teal)
  #v(0.35em)
  #window-row([23:10], [5 min], [2.1 min], [fragile], amber)
  #v(0.35em)
  #window-row([23:40], [5 min], [−0.8 min], [failed], coral)
  #v(0.35em)
  #window-row([00:10], [7 min], [6.2 min], [stable], teal)

  #v(0.55em)
  #text(size: 0.82em, fill: rgb("#A9B6BA"))[
    Observed window = feeder departure minus train-door opening · illustrative medians
  ]
]

#card(title: "One Wave Drove Most Misses")[
  #align(center)[
    #text(size: 4.0em, weight: "bold", fill: coral)[23:40]
    #linebreak()
    #text(size: 1.0em, weight: "semibold")[accounted for 14 of 19 qualifying missed transfers]
  ]

  #v(0.6em)
  The scheduled five-minute connection became negative on eight nights because the feeder left by
  timetable while the platform path still held transferring riders.

  #v(0.45em)
  A simulated three-minute hold would have protected 11 of 14 misses and delayed no documented
  onward departure. It is a scheduling hypothesis, not causal proof.
]

#card(title: "Defining Evidence")[
  #table(
    columns: (1.1fr, 0.7fr, 0.9fr, 1.2fr),
    inset: 0.4em,
    stroke: (x, y) => if y > 0 { (top: 0.7pt + line-color) },
    [*Wave*], [*Attempts*], [*Missed*], [*Primary mechanism*],
    [22:40], [48], [1], [Wrong bay],
    [23:10], [51], [3], [Short walk window],
    [23:40], [46], [14], [Feeder departed],
    [00:10], [41], [1], [Capacity],
  )
]

#colbreak()

#card(title: "Failure Modes Are Different Fixes")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5em,
    stat([14], [feeder departed], rgb("#F1C5C1")),
    stat([2], [wrong bay], rgb("#D5E3EF")),
    stat([2], [capacity], rgb("#F4DFC1")),
    stat([1], [walking delay], rgb("#CFE9E4")),
  )
]

#card(title: "What Changes Monday")[
  #block(width: 100%, fill: rgb("#223732"), inset: 0.8em, stroke: (left: 6pt + teal))[
    *Trial a conditional three-minute hold at 23:40 for four weeks.* Trigger it only when the inbound
    train is on the platform and the feeder has available capacity.
  ]

  #v(0.55em)
  + Move the bay sign into the platform sightline.
  + Log each hold, protected transfer, and delayed onward trip.
  + Publish the trial rule so riders and operators see the same promise.
]

#card(title: "Limits, Next Test & Stop Rule")[
  - The observation is not randomized and covers one interchange.
  - Weather, events, and mobility needs are incompletely sampled.
  - A simulated hold is not a measured network effect; all values are fictional.

  #v(0.5em)
  Run the hold for four weeks and compare matched service nights. Stop if onward delay exceeds four
  minutes twice in one week or capacity prevents boarding on three nights.

  #v(0.55em)
  #block(width: 100%, fill: rgb("#302C21"), inset: 0.75em, stroke: (left: 5pt + amber))[
    *Decision after the trial:* keep, retime, or withdraw the hold using protected transfers and
    downstream delay—not punctuality alone.
  ]
]
