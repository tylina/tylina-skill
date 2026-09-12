// 24 x 18 in Better Poster composition using postercise 0.2.0.
// The clinic, participants, trial, measurements, and links are fictional demo material.
#import "@preview/postercise:0.2.0": *
#import themes.better: *

#let ink = rgb("#211B2B")
#let plum = rgb("#43375B")
#let paper = rgb("#F7F2E9")
#let apricot = rgb("#F2B27F")
#let coral = rgb("#E87565")
#let mint = rgb("#A9D5C8")

#set page(width: 24in, height: 18in)
#set text(font: "Arial", size: 22pt, fill: ink)

#show: theme.with(
  primary-color: plum,
  background-color: paper,
  accent-color: apricot,
  titletext-color: ink,
  titletext-size: 2.05em,
)

#set par(leading: 0.72em)

#poster-content[
  #poster-header(
    title: [Fewer Fields, Faster Care],
    subtitle: [Check-in redesign],
    authors: [Maya Chen · Noor Patel #linebreak() Elias Ward],
    affiliation: [Access & Operations Lab · Riverside Community Clinic],
  )

  #poster-footer[
    #set text(size: 0.82em, fill: ink)
    *Interpretation boundary*\
    One clinic, four weeks, no randomized allocation. The result supports a longer implementation
    trial, not a universal estimate of appointment access.

    #v(0.75em)
    *Release bundle*\
    De-identified event log · question wording · exclusion rules · analysis notebook

    #v(0.75em)
    *Illustrative demo data*\
    Clinic, people, observations, values, and links are fictional.

    #v(0.75em)
    access-operations.example/check-in
  ]

  = The decision
  The clinic could remove two repeated identity questions immediately, keep the current workflow,
  or commission a longer trial. The poster asks whether faster check-in also remained usable for
  patients needing language, mobility, or proxy support.

  = Four-week crossover
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    row-gutter: 0.35em,
    [#text(weight: "bold", fill: plum)[W1]], [Current seven-field form · baseline],
    [#text(weight: "bold", fill: plum)[W2]], [Five fields · remove duplicate identity prompts],
    [#text(weight: "bold", fill: plum)[W3]], [Five fields + staff language prompt],
    [#text(weight: "bold", fill: plum)[W4]], [Hold workflow · remove reminder signage],
  )

  #normal-box()[
    = Evidence, not speed alone
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.4em,
      [#align(center)[#text(size: 1.8em, weight: "bold")[624] #linebreak() #text(size: 0.65em)[visits]]],
      [#align(center)[#text(size: 1.8em, weight: "bold")[4] #linebreak() #text(size: 0.65em)[weeks]]],
      [#align(center)[#text(size: 1.8em, weight: "bold")[3] #linebreak() #text(size: 0.65em)[languages]]],
    )

    #v(0.5em)
    #grid(
      columns: (1.3fr, 0.95fr, 0.7fr),
      column-gutter: 0.35em,
      row-gutter: 0.25em,
      [*Time*], [12.6 → 5.2 min], [*−7.4*],
      [*Corrections*], [18% → 8%], [*−10 pp*],
      [*Assisted*], [91% → 93%], [*+2 pp*],
    )
  ]

  #focus-box[
    #set text(size: 0.62em, fill: white)
    #text(size: 0.85em, weight: "bold", fill: mint)[PRIMARY RESULT · ILLUSTRATIVE]
    #v(0.45em)
    #text(size: 4.0em, weight: "bold")[−7.4 min]
    #v(0.25em)
    #text(size: 1.15em, weight: "semibold")[median check-in time without a rise in assisted-completion failure]

    #v(0.8em)
    #line(length: 100%, stroke: 1.2pt + mint)
    #v(0.6em)

    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.8em,
      [
        #text(size: 0.85em, weight: "bold", fill: mint)[WHY IT MOVED]
        #v(0.25em)
        Two repeated identity prompts were removed; information already in the appointment record
        was shown for confirmation instead of re-entry.
      ],
      [
        #text(size: 0.85em, weight: "bold", fill: mint)[WHAT DID NOT MOVE]
        #v(0.25em)
        Assisted completion remained available, interpreter use was retained, and proxy check-in
        kept a separate verification step.
      ],
    )

    #v(0.8em)
    #block(width: 100%, fill: white.transparentize(88%), inset: 0.65em, stroke: 1pt + mint)[
      *Decision:* keep the five-field form for eight more weeks, retain the language prompt, and
      publish correction and assisted-completion rates beside time.
    ]

    #v(0.75em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.5em,
      [#align(center)[#text(size: 2.1em, weight: "bold", fill: mint)[−59%] #linebreak() #text(size: 0.72em)[time]]],
      [#align(center)[#text(size: 2.1em, weight: "bold", fill: mint)[−10 pp] #linebreak() #text(size: 0.72em)[corrections]]],
      [#align(center)[#text(size: 2.1em, weight: "bold", fill: mint)[+2 pp] #linebreak() #text(size: 0.72em)[assisted completion]]],
    )

    #v(0.75em)
    #text(size: 0.80em)[
      *Stop rule:* restore the prior workflow if proxy-verification errors rise, interpreter requests
      are deferred, or the correction rate exceeds 12% for two consecutive weeks.
    ]
  ]
]
