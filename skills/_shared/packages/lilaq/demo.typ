#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Lilaq Demo — Direct Plot Composition

#let quarters = (1, 2, 3, 4)
#let revenue = (18, 25, 31, 44)
#let margin = (12, 16, 21, 29)

#align(center)[
  #lq.diagram(
    width: 560pt,
    height: 250pt,
    xaxis: (
      label: "Quarter",
      ticks: ((1, "Q1"), (2, "Q2"), (3, "Q3"), (4, "Q4")),
      subticks: none,
    ),
    yaxis: (label: "Index", subticks: none),
    lq.plot(quarters, revenue, stroke: 2pt + rgb("#2563eb"), label: "Revenue"),
    lq.plot(quarters, margin, stroke: 2pt + rgb("#16a34a"), label: "Margin"),
  )
]
