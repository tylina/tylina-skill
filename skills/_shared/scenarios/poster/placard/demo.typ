// Concrete, asset-free adaptation of the official placard 0.1.0 starter.
// The study, sites, participants, and measurements are illustrative demo data.
#import "@preview/placard:0.1.0": card, placard

#let pine = rgb("#234B45")
#let mint = rgb("#CFE0D6")
#let cream = rgb("#F6F1E8")
#let tomato = rgb("#C85A42")
#let gold = rgb("#D5A13D")
#let ink = rgb("#22312E")

#let waste-bar(label, value, width, fill) = grid(
  columns: (5.2em, 1fr, 3.2em),
  column-gutter: 0.5em,
  align: (left, left, right),
  [#text(weight: "bold")[#label]],
  [#block(width: 100%, fill: rgb("#E7E3DC"))[
    #rect(width: width, height: 1.2em, fill: fill)
  ]],
  [#text(weight: "bold", fill: fill)[#value kg]],
)

#let label-card(number, title, copy, fill) = block(
  width: 100%,
  fill: fill,
  inset: 0.7em,
  radius: 0.25em,
)[
  #text(size: 1.35em, weight: "bold", fill: pine)[#number]
  #h(0.45em)
  #text(weight: "bold", fill: ink)[#title]
  #linebreak()
  #copy
]

#show: placard.with(
  title: "Tiny Labels, Less Waste",
  authors: ("Maya Chen", "Amina Okafor", "Jonas Reed"),
  paper: "a1",
  num-columns: 2,
  scaling: 1.20,
  colors: (
    accent: pine,
    title: ink,
  ),
  footer: (
    content: [DEMO ONLY · shared-kitchen.example],
  ),
)

#card(title: "Question")[
  Can a clearer owner-and-date label reduce avoidable food disposal in shared workplace kitchens
  without adding a new app, scanner, or enforcement role?

  #v(0.55em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.55em,
    label-card([3], [kitchens], [Same intervention sequence.], mint),
    label-card([28], [days], [Seven-day phases.], cream),
    label-card([1,146], [items], [Logged at disposal.], rgb("#F2DEC4")),
  )
]

#card(title: "Intervention")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.65em,
    label-card([01], [Name it], [Write the food, not “mine.”], mint),
    label-card([02], [Own it], [Add a team or first name.], cream),
    label-card([03], [Date it], [Use opened-on, not expiry guess.], rgb("#F2DEC4")),
    label-card([04], [Review it], [A two-minute Friday shelf check.], rgb("#E8D7D1")),
  )
]

#card(title: "Daily Discarded Food")[
  #text(size: 0.82em, fill: rgb("#65706C"))[
    Median kilograms per kitchen-day · illustrative values
  ]
  #v(0.55em)
  #waste-bar([Baseline], [4.8], 100%, tomato)
  #v(0.45em)
  #waste-bar([Date only], [3.6], 75%, gold)
  #v(0.45em)
  #waste-bar([Owner + date], [2.7], 56%, pine)
  #v(0.65em)
  #align(center)[
    #text(size: 2.4em, weight: "bold", fill: pine)[−44%]
    #linebreak()
    #text(weight: "bold")[from baseline in the final phase]
  ]
]

#card(title: "What Changed")[
  The largest decline came from opened milk, catered leftovers, and unlabeled meal-prep containers.
  Sealed single-serve items changed little. This pattern suggests that ambiguity—not only excess
  purchasing—was a tractable part of the waste stream.

  #v(0.6em)
  #block(width: 100%, fill: cream, inset: 0.75em, stroke: (left: 5pt + gold))[
    *Operational decision:* keep the owner-and-date label for six more weeks, then remeasure after
    the novelty period.
  ]
]

#colbreak()

#card(title: "Study Route")[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.65em,
    row-gutter: 0.5em,
    align: (center, left),
    [#circle(radius: 0.9em, fill: tomato)[#align(center + horizon)[#text(fill: white, weight: "bold")[A]]]],
    [*Days 1–7 · Baseline* #linebreak() Log item type, mass, and reason for disposal.],
    [#circle(radius: 0.9em, fill: gold)[#align(center + horizon)[#text(fill: white, weight: "bold")[B]]]],
    [*Days 8–14 · Date label* #linebreak() Add an opened-on date to shared items.],
    [#circle(radius: 0.9em, fill: pine)[#align(center + horizon)[#text(fill: white, weight: "bold")[C]]]],
    [*Days 15–21 · Owner + date* #linebreak() Add responsibility and the Friday shelf review.],
    [#circle(radius: 0.9em, fill: rgb("#627E78"))[#align(center + horizon)[#text(fill: white, weight: "bold")[D]]]],
    [*Days 22–28 · Hold* #linebreak() Keep the label; remove reminder messages.],
  )
]

#card(title: "Defining Evidence")[
  #table(
    columns: (1.15fr, 0.8fr, 0.8fr, 0.9fr),
    inset: 0.38em,
    [*Phase*], [*Items*], [*kg/day*], [*Unlabeled*],
    [Baseline], [302], [4.8], [41%],
    [Date only], [291], [3.6], [24%],
    [Owner + date], [279], [2.7], [8%],
    [Hold], [274], [2.9], [10%],
  )
]

#card(title: "Evidence Chain")[
  + Weighed waste at the same time each weekday.
  + Recorded item type and label state before disposal.
  + Reported kitchen-day medians so one large catering event did not dominate.
  + Kept the final reminder-free week to test whether the label itself carried the behavior.
]

#card(title: "Limits & Transfer")[
  - Phase order was not randomized; season and menu changes could contribute.
  - Logging may alter disposal behavior even before labels appear.
  - Three office kitchens cannot represent homes, schools, or restaurants.
  - The values on this poster are fictional and demonstrate layout and reasoning only.

  #v(0.55em)
  #block(width: 100%, fill: mint, inset: 0.75em)[
    *Next test:* rotate phase order across six kitchens and report both total mass and edible-food
    mass with confidence intervals.
  ]

  #v(0.55em)
  *Takeaway:* the label made ownership visible at the decision point—enough to justify a longer,
  randomized trial, not a universal waste-reduction claim.
]
