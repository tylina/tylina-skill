#import "@preview/touying:0.7.4": *
#import themes.university: *

#import "@preview/numbly:0.1.0": numbly

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [University Theme Demo],
    subtitle: [Professional Institutional Design],
    author: [Academic Programs Office],
    date: datetime.today(),
    institution: [Open Presentation Lab],
    contact: [hello\@seaslides.dev],
    logo: emoji.school,
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide(authors: ([Research Group], [Teaching Lab]))

= Institutional Foundations

== Academic Rhythm

#cols(columns: (1fr, 1fr), gutter: 2em)[
  *Teach with structure*

  - State the learning goal
  - Build one idea at a time
][
  *Report with evidence*

  - Separate findings from claims
  - Close with the next decision
]

== Key Features

- Progress bar at the top
- Three-column footer (author, title, date + page)
- Logo in the header
- Matrix slide layout

#focus-slide[
  Evidence earns institutional trust.
]

== Matrix Layout

#matrix-slide(config: config-common(detect-overflow: false))[
  *Teach* \
  Share methods clearly
][
  *Research* \
  Test ideas rigorously
][
  *Serve* \
  Turn insight into impact
]

#matrix-slide(
  config: config-common(detect-overflow: false),
  columns: 1,
)[
  *Evidence* \
  Establish what the data supports
][
  *Decision* \
  Choose the next responsible action
]
