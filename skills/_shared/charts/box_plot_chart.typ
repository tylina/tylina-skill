#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 部门薪酬分布分析

#let departments = (
  ("技术部", 15, 25, 35, 45, 58, rgb("#2196F3")),
  ("产品部", 12, 22, 28, 38, 50, rgb("#4CAF50")),
  ("设计部", 10, 18, 24, 32, 42, rgb("#F57C00")),
  ("市场部",  8, 15, 22, 30, 45, rgb("#7B1FA2")),
  ("运营部",  8, 14, 20, 26, 38, rgb("#D32F2F")),
)

#figure[
  #lq.diagram(
    width: 560pt,
    height: 230pt,
    xaxis: (label: "年薪（万元）"),
    yaxis: (label: "部门"),
    ..departments.enumerate().map(((i, (dept, min-v, q1, med, q3, max-v, col))) => {
      lq.boxplot(
        (min-v, q1, med, q3, max-v),
        x: i + 1,
        width: 0.6,
        fill: col.transparentize(60%),
        stroke: 1.5pt + col,
      )
    })
  )

  #align(right)[
    #stack(dir: ltr, spacing: 16pt,
      ..departments.map(((dept, _, _, _, _, _, col)) => stack(dir: ltr, spacing: 4pt,
        rect(width: 24pt, height: 16pt, fill: col.transparentize(40%), stroke: 1pt + col, radius: 2pt),
        [#dept],
      ))
    )
  ]

  #align(right)[2025年度 · 年薪统计（万元）]
]
