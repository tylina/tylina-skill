#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 各季度产品线销售对比

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")
#let color-orange = rgb("#FF9800")

#let quarters = ("Q1", "Q2", "Q3", "Q4")
#let series = (
  ("产品线A", color-blue,   (120, 145, 168, 185)),
  ("产品线B", color-green,  (85,  98,  112, 125)),
  ("产品线C", color-orange, (65,  78,  92,  108)),
)

#let bar-w = 25%
#let offsets = (-0.27, 0, 0.27)

#figure[
  #lq.diagram(
    width: 730pt, height: 240pt,
    xaxis: (
      ticks: range(4).map(i => (i + 1, quarters.at(i))),
      subticks: none,
    ),
    yaxis: (
      ticks: ((0, "0"), (50, "50"), (100, "100"), (150, "150"), (200, "200")),
    ),
    ..range(series.len()).map(si => {
      let name = series.at(si).at(0)
      let col  = series.at(si).at(1)
      let vals = series.at(si).at(2)
      lq.bar(
        range(4).map(i => i + 1),
        vals,
        fill: col,
        width: bar-w,
        offset: offsets.at(si),
        label: name,
      )
    })
  )

  #align(right)[
    #stack(dir: ltr, spacing: 20pt,
      ..series.map(s => stack(dir: ltr, spacing: 4pt,
        rect(width: 20pt, height: 16pt, fill: s.at(1), radius: 2pt),
        [#s.at(0)],
      ))
    )
  ]

  #align(right)[2025年度 · 单位：百万元]
]
