// A1 landscape, visual-first diagnostic poster using peace-of-posters 0.6.0.
// The utility, streets, trial, events, and performance values are fictional demo material.
#import "@preview/peace-of-posters:0.6.0" as pop

#let night = rgb("#171C2E")
#let violet = rgb("#5A4C9B")
#let electric = rgb("#20A7A0")
#let signal = rgb("#E95F5A")
#let sand = rgb("#F0D692")
#let paper = rgb("#F6F3EC")
#let mist = rgb("#E6E8F0")

#let poster-theme = (
  "body-box-args": (
    inset: 1.05em,
    width: 100%,
    fill: white,
    stroke: 1.1pt + rgb("#C9CBD4"),
  ),
  "body-text-args": (fill: night),
  "heading-box-args": (
    inset: 0.9em,
    width: 100%,
    fill: night,
    stroke: none,
  ),
  "heading-text-args": (fill: white, weight: "semibold"),
  "title-box-args": (inset: 1.0em, width: 100%, fill: violet, stroke: none),
  "title-text-args": (fill: white, weight: "regular"),
)

#let visual-layout = pop.layout-a1 + (
  "body-size": 23pt,
  "heading-size": 32pt,
  "title-size": 55pt,
  "subtitle-size": 39pt,
  "authors-size": 30pt,
  "institutes-size": 27pt,
  "keywords-size": 23pt,
)

#let waveform-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 330">
  <rect width="1200" height="330" fill="#171C2E"/>
  <g stroke="#5A6279" stroke-width="2" opacity="0.45">
    <path d="M0 55H1200M0 110H1200M0 165H1200M0 220H1200M0 275H1200"/>
    <path d="M100 0V330M300 0V330M500 0V330M700 0V330M900 0V330M1100 0V330"/>
  </g>
  <path d="M0 174 L38 169 L76 176 L114 166 L152 172 L190 164 L228 178 L266 168
           L304 175 L342 165 L380 174 L418 166 L456 171 L494 161 L532 176 L570 167
           L608 173 L646 158 L684 181 L722 153 L760 188 L798 142 L836 203 L874 115
           L912 229 L950 86 L988 248 L1026 127 L1064 202 L1102 151 L1140 183 L1200 169"
        fill="none" stroke="#20A7A0" stroke-width="10" stroke-linejoin="round"/>
  <path d="M0 184 L60 180 L120 188 L180 177 L240 185 L300 179 L360 186 L420 180
           L480 187 L540 178 L600 184 L660 178 L720 186 L780 179 L840 184 L900 178
           L960 185 L1020 180 L1080 186 L1140 179 L1200 184"
        fill="none" stroke="#F0D692" stroke-width="5" opacity="0.8"/>
  <rect x="840" y="24" width="220" height="282" fill="none" stroke="#E95F5A" stroke-width="7"/>
  <circle cx="950" cy="165" r="18" fill="#E95F5A"/>
</svg>
```.text

#let stat(value, label, fill) = block(
  width: 100%,
  fill: fill,
  inset: 0.7em,
)[
  #align(center)[
    #text(size: 2.2em, weight: "bold", fill: night)[#value]
    #linebreak()
    #text(size: 0.88em, weight: "semibold")[#label]
  ]
]

#let step(n, title, copy) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.55em,
  align: (center, left),
  [#circle(radius: 0.8em, fill: violet)[
    #align(center + horizon)[#text(fill: white, weight: "bold")[#n]]
  ]],
  [#text(weight: "semibold")[#title] #linebreak() #text(size: 0.9em)[#copy]],
)

#set page(paper: "a1", flipped: true, margin: 1.25cm, fill: paper)
#set text(font: "Arial", size: visual-layout.at("body-size"), fill: night)
#set par(justify: true, leading: 0.7em)
#let box-spacing = 0.9em
#set block(spacing: box-spacing)
#pop.set-poster-layout(visual-layout)
#pop.update-poster-layout(spacing: box-spacing)
#pop.set-theme(poster-theme)

#pop.title-box(
  "Listen Before You Lift the Street",
  subtitle: "A night-shift acoustic triage keeps uncertainty attached to every excavation decision",
  authors: "Maya Chen¹ · Diego Santos² · Noor Patel¹",
  institutes: "¹Civic Systems Lab · ²North Loop Water Operations",
  keywords: "acoustic sensing · leak triage · field validation · evidence-to-action",
)

#v(0.38em)

#grid(
  columns: (0.82fr, 2.18fr),
  column-gutter: box-spacing,
  pop.column-box(heading: "The Decision")[
    Operators had one overnight closure window and 14 candidate pipe segments. Which segment should
    receive a verification dig first—and what evidence would justify waiting?

    #v(0.55em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.5em,
      stat([14], [candidate segments], mist),
      stat([3], [repeat passes], rgb("#ECE5D3")),
      stat([90 min], [closure window], rgb("#E8DDE7")),
      stat([1], [verification dig], rgb("#DDECEA")),
    )
  ],
  pop.column-box(heading: "One Signal Became Actionable Only After It Repeated")[
    #image(bytes(waveform-svg), width: 100%, height: 11.5em, fit: "stretch")
    #v(0.35em)
    #grid(
      columns: (auto, 1fr, auto, 1fr),
      column-gutter: 0.4em,
      [#line(length: 2.2em, stroke: 6pt + electric)], [suspected leak band],
      [#line(length: 2.2em, stroke: 4pt + sand)], [ambient baseline],
    )
    #v(0.35em)
    The highlighted band appeared at the same chainage on three passes, remained after traffic
    subsided, and was absent from the paired reference segment. The waveform is schematic.
  ],
)

#v(0.42em)

#grid(
  columns: (1.02fr, 1.28fr, 1fr),
  column-gutter: box-spacing,
  pop.column-box(heading: "Field Sequence", stretch-to-next: true)[
    #step([01], [Listen], [Hold direction and sensor spacing.])
    #v(0.34em)
    #step([02], [Repeat], [Return after traffic falls.])
    #v(0.34em)
    #step([03], [Cross-check], [Use pressure, valves, and a quiet segment.])
    #v(0.34em)
    #step([04], [Verify], [Dig only after the anomaly repeats.])

    #v(0.62em)
    #block(width: 100%, fill: mist, inset: 0.75em, stroke: (left: 6pt + violet))[
      *Threshold:* the same 8 m band must exceed baseline twice and survive the traffic check.
    ]
  ],
  pop.column-box(heading: "Evidence Ledger", stretch-to-next: true)[
    #table(
      columns: (1.1fr, 0.8fr, 0.8fr, 0.85fr),
      inset: (x: 0.45em, y: 0.38em),
      stroke: (x, y) => if y > 0 { (top: 0.6pt + rgb("#D1D3DA")) },
      [*Segment*], [*Passes*], [*Repeat*], [*Action*],
      [S-04], [3], [3 / 3], [Verify dig],
      [S-07], [3], [1 / 3], [Monitor],
      [S-09], [2], [0 / 2], [Release],
      [S-12], [3], [2 / 3], [Pressure check],
    )

    #v(0.6em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      stat([3 / 3], [repeat anomaly], rgb("#DDECEA")),
      stat([8 m], [localized band], rgb("#ECE5D3")),
      stat([0], [open tickets nearby], rgb("#E8DDE7")),
    )

    #v(0.6em)
    The fictional S-04 dig found a leak within 2 m of the prioritized band; this is not a validated
    detection-rate claim.
  ],
  pop.column-box(heading: "Decision, Boundaries, Next Test", stretch-to-next: true)[
    #align(center)[
      #text(size: 3.1em, weight: "bold", fill: signal)[DIG S-04]
      #linebreak()
      #text(size: 0.95em, weight: "semibold")[verify first; keep S-12 under pressure review]
    ]

    #v(0.6em)
    *Supported:* repeated, localized evidence was sufficient to prioritize one verification dig.

    #v(0.4em)
    *Not supported:* city-wide accuracy, avoided-loss estimates, or operator replacement.

    #v(0.55em)
    #block(width: 100%, fill: rgb("#F2E1DE"), inset: 0.75em, stroke: (left: 6pt + signal))[
      *Stop rule:* wait when the signal does not repeat, localize, and agree with operational records.
    ]

    #v(0.55em)
    *Next test:* blind the triage team, sample four pipe materials, and publish false priorities.
  ],
)

#pop.bottom-box()[
  ILLUSTRATIVE DEMO DATA · Utility, streets, waveform, events, and performance are fictional ·
  civic-systems.example/demo
]
