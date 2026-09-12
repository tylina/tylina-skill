// Concrete, asset-free adaptation of the official pollux 0.1.0 starter.
// The study, participants, organizations, and measurements are illustrative demo data.
#import "@preview/pollux:0.1.0": *

#let navy = rgb("#14324A")
#let blue = rgb("#2C6686")
#let cyan = rgb("#78B8C4")
#let yellow = rgb("#F0C95A")
#let red = rgb("#C95F4A")
#let pale = rgb("#EDF4F5")

#let stage(number, title, copy, fill) = block(
  width: 100%,
  fill: fill,
  inset: 0.8em,
  radius: 0.18em,
)[
  #text(size: 1.2em, weight: "bold", fill: navy)[#number]
  #h(0.5em)
  #text(weight: "bold")[#title]
  #linebreak()
  #copy
]

#let score-bar(label, value, width, fill) = grid(
  columns: (7.5em, 1fr, 3.5em),
  column-gutter: 0.55em,
  align: (left, left, right),
  [#text(weight: "bold")[#label]],
  [#block(width: 100%, fill: rgb("#E5EAED"))[
    #rect(width: width, height: 1.3em, fill: fill)
  ]],
  [#text(weight: "bold", fill: fill)[#value%]],
)

#set-theme(steel-blue)
#set page("a0", margin: 0cm)
#set-poster-layout(layout-a0)
#set columns(gutter: 2.0em)
#set text(font: "IBM Plex Sans")
#show math.equation: set text(font: "New Computer Modern Math")

#title-box(
  "A Chart Is Not Accessible Until Its Meaning Travels",
  authors: "Maya Chen¹, Amina Okafor², Jonas Reed¹",
  institutes: "¹Inclusive Systems Lab · ²Civic Data Studio · illustrative demo study",
)

#v(-1.0cm)

#box(inset: 2.0cm)[
  #columns(2, [
    #column-box(heading: "Why Alt Text Fails")[
      A chart description can name every visible object and still omit the decision a reader needs
      to make. We tested a compact authoring sequence that separates *structure*, *pattern*,
      *uncertainty*, and *takeaway* before prose is written.

      #v(0.65em)
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 0.55em,
        stage([12], [analysts], [Mixed chart experience.], pale),
        stage([36], [charts], [Bars, lines, scatterplots.], rgb("#F8F2DD")),
        stage([432], [tasks], [Timed interpretation.], rgb("#F3E3DE")),
      )
    ]

    #v(0.8em)
    #column-box(heading: "The Four-Pass Authoring Loop")[
      #grid(
        columns: (1fr, 1fr),
        gutter: 0.65em,
        stage([01], [Structure], [Chart type, axes, units, series, and time range.], pale),
        stage([02], [Pattern], [Largest change, ranking, crossing, or cluster.], rgb("#DDECEF")),
        stage([03], [Uncertainty], [Missing data, interval, baseline, and limits.], rgb("#F8F2DD")),
        stage([04], [Takeaway], [The narrow conclusion the chart supports.], rgb("#F3E3DE")),
      )

      #v(0.65em)
      #block(width: 100%, fill: navy, inset: 0.8em)[
        #set text(fill: white)
        *Authoring rule:* write one sentence per pass, then remove repetition. Do not begin by
        narrating colors or marks in reading order.
      ]
    ]

    #v(0.8em)
    #column-box(heading: "Worked Example")[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 0.8em,
        [
          #text(weight: "bold", fill: red)[OBJECT-ONLY DESCRIPTION]
          #v(0.35em)
          “A blue line and an orange line rise from January to June. The blue line ends higher.”
        ],
        [
          #text(weight: "bold", fill: blue)[MEANING-PRESERVING DESCRIPTION]
          #v(0.35em)
          “Both services improved, but the assisted route overtook self-service in April and ended
          14 points higher; March has incomplete records.”
        ],
      )
      #v(0.65em)
      #text(size: 0.9em, fill: rgb("#53616A"))[
        The second version adds a comparison, a crossing, a magnitude, and the missing-data caveat.
        It remains shorter than a point-by-point narration.
      ]
    ]

    #v(0.8em)
    #column-box(heading: "Authoring Rubric")[
      #table(
        columns: (1.05fr, 1.8fr, 1.2fr),
        inset: 0.42em,
        stroke: (x, y) => if y > 0 { (top: 0.6pt + gray) },
        [*Pass*], [*Question*], [*Minimum evidence*],
        [Structure], [What is encoded?], [Axes, units, series],
        [Pattern], [What changes or differs?], [Direction + magnitude],
        [Uncertainty], [What could mislead?], [Gap, interval, baseline],
        [Takeaway], [What may the reader conclude?], [One bounded claim],
      )
    ]

    #colbreak()

    #column-box(heading: "Evaluation Design")[
      Each analyst completed matched chart questions with two description styles in counterbalanced
      order. A correct response had to recover the chart's main comparison and avoid a claim beyond
      the visible evidence.

      #v(0.55em)
      + *Primary outcome:* correct interpretation within 45 seconds.
      + *Secondary outcomes:* time, confidence, and unsupported inference.
      + *Audit:* two reviewers scored answers blind to description style.
    ]

    #v(0.8em)
    #column-box(heading: "Meaning Reached More Readers")[
      #text(size: 0.86em, fill: rgb("#53616A"))[
        Correct interpretation within 45 seconds · illustrative values
      ]
      #v(0.55em)
      #score-bar([Object list], [61], 61%, red)
      #v(0.45em)
      #score-bar([Four-pass], [84], 84%, blue)
      #v(0.45em)
      #score-bar([Four-pass + audit], [91], 91%, navy)

      #v(0.8em)
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 0.65em,
        stage([−18 s], [median time], [Relative to object-only prose.], pale),
        stage([−63%], [unsupported claims], [After the uncertainty pass.], rgb("#F8F2DD")),
      )
    ]

    #v(0.8em)
    #column-box(heading: "Where Descriptions Still Broke")[
      #table(
        columns: (1.7fr, 0.7fr, 2.2fr),
        inset: 0.42em,
        stroke: (x, y) => if y > 0 { (top: 0.6pt + gray) },
        [*Failure*], [*Cases*], [*Repair*],
        [Baseline omitted], [9], [Name the reference and direction.],
        [Missing interval], [7], [State that precision is limited.],
        [Series swapped], [4], [Use labels, not color alone.],
        [Takeaway too broad], [3], [Return to the chart's sampled scope.],
      )
    ]

    #v(0.8em)
    #column-box(heading: "Implementation Checklist")[
      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.6em,
        [#text(size: 1.4em, weight: "bold", fill: blue)[✓]], [Expose a short description next to the chart.],
        [#text(size: 1.4em, weight: "bold", fill: blue)[✓]], [Provide the data table or long description on demand.],
        [#text(size: 1.4em, weight: "bold", fill: blue)[✓]], [Keep series names and units consistent across modalities.],
        [#text(size: 1.4em, weight: "bold", fill: blue)[✓]], [Test with screen-reader users, not only automated checks.],
      )
    ]

    #v(0.8em)
    #column-box(heading: "Limits & Next Study")[
      - The sample is small and uses short interpretation tasks.
      - Analysts are not a substitute for the full range of screen-reader users.
      - The example descriptions are English-only and chart types are limited.
      - All values and organizations on this poster are fictional demonstration material.

      #v(0.6em)
      Next, test the loop in live dashboards with user-authored questions, multilingual output, and
      revision logs that reveal which pass changed the interpretation.
    ]
  ])
]

#v(0.8em)
#box(width: 100%, inset: (x: 2.0cm))[
  #block(width: 100%, height: 11.2cm, fill: navy, inset: 1.2em)[
    #align(horizon)[
      #set text(size: 28pt, fill: white)
      #grid(
        columns: (1fr, 1fr, 1fr, 1.15fr),
        column-gutter: 1em,
        [
          #text(size: 34pt, weight: "bold", fill: yellow)[01 · DESCRIBE]
          #linebreak()
          Name structure, pattern, uncertainty, and the bounded takeaway.
        ],
        [
          #text(size: 34pt, weight: "bold", fill: yellow)[02 · EXPOSE]
          #linebreak()
          Pair the short description with data or a long-description route.
        ],
        [
          #text(size: 34pt, weight: "bold", fill: yellow)[03 · TEST]
          #linebreak()
          Check whether the intended reader recovers the decision—not the colors.
        ],
        [
          #text(size: 34pt, weight: "bold", fill: yellow)[DEMO ONLY]
          #linebreak()
          Illustrative study and values. Copy the method, not the fictional result.
        ],
      )
    ]
  ]
]
