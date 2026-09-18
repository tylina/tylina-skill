#import "@preview/lilaq:0.6.0" as lq

#set page(paper: "a4", margin: 22mm)
#set text(size: 11pt)

= Lilaq direct plot composition

#let quarters = (1, 2, 3, 4)
#let revenue = (18, 25, 31, 44)
#let margin = (12, 16, 21, 29)

#align(center)[
  #lq.diagram(
    width: 155mm,
    height: 82mm,
    xaxis: (
      label: "Quarter",
      ticks: ((1, "Q1"), (2, "Q2"), (3, "Q3"), (4, "Q4")),
      subticks: none,
    ),
    yaxis: (label: "Index", subticks: none),
    lq.plot(
      quarters,
      revenue,
      stroke: 2pt + rgb("#2563eb"),
      mark: "o",
      smooth: false,
      label: "Revenue",
    ),
    lq.plot(
      quarters,
      margin,
      stroke: 2pt + rgb("#16a34a"),
      mark: "o",
      smooth: false,
      label: "Margin",
    ),
  )
]
