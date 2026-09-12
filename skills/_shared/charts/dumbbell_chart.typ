#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== AI Economic Impact Index Rankings

#let color-black = rgb("#1A1A1A")
#let color-pink = rgb("#E91E8C")
#let color-cyan = rgb("#00B8D4")
#let color-yellow = rgb("#FFD600")

#let economies = (
  ("Argentina",   28, 12, 22, 32),
  ("Brazil",      35, 18, 28, 38),
  ("China",       52, 38, 45, 55),
  ("Germany",     58, 42, 52, 68),
  ("South Korea", 62, 48, 55, 65),
  ("Sweden",      65, 45, 58, 78),
  ("Switzerland", 68, 50, 62, 76),
  ("UK",          70, 52, 65, 78),
  ("Singapore",   72, 55, 68, 75),
  ("US",          78, 68, 75, 80),
)

#let country-count = economies.len()
#let y-positions = range(country-count)
#let country-labels = y-positions.map(i => (i, economies.at(i).at(0)))

#figure[
  #stack(dir: ltr, spacing: 20pt,
    stack(dir: ltr, spacing: 6pt, circle(radius: 5pt, fill: color-black), [Overall Score]),
    stack(dir: ltr, spacing: 6pt, circle(radius: 5pt, fill: color-pink), [Innovation]),
    stack(dir: ltr, spacing: 6pt, circle(radius: 5pt, fill: color-cyan), [Diffusion]),
    stack(dir: ltr, spacing: 6pt, circle(radius: 5pt, fill: color-yellow), [Adaptation]),
  )

  #lq.diagram(
    width: 560pt, height: 240pt,
    xaxis: (
      ticks: ((0, "0"), (20, "20"), (40, "40"), (60, "60"), (80, "80"), (100, "100")),
      subticks: none,
    ),
    yaxis: (
      ticks: country-labels,
      subticks: none,
    ),
    ..economies.enumerate().map(((i, entry)) => {
      let innov = entry.at(2)
      let diff = entry.at(3)
      let adapt = entry.at(4)
      let x-min = calc.min(innov, diff, adapt)
      let x-max = calc.max(innov, diff, adapt)
      lq.plot((x-min, x-max), (i, i), stroke: rgb("#CCCCCC") + 1.5pt)
    }),
    lq.scatter(economies.map(e => e.at(2)), y-positions, color: color-pink, size: 6pt, mark: "o", label: none),
    lq.scatter(economies.map(e => e.at(3)), y-positions, color: color-cyan, size: 6pt, mark: "o", label: none),
    lq.scatter(economies.map(e => e.at(4)), y-positions, color: color-yellow, size: 6pt, mark: "o", label: none),
    lq.scatter(economies.map(e => e.at(1)), y-positions, color: color-black, size: 7pt, mark: "o", label: none),
  )

  #align(right)[Potential to realize AI benefits by economy — 2025 Report · Source: Capital Economics]
]
