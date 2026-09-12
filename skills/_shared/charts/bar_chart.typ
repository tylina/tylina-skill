#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 各区域销售额对比

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")
#let color-orange = rgb("#FF9800")

#let categories = ("华东", "华南", "华北", "西南", "华中", "东北")
#let values = (185, 142, 128, 96, 73, 52)

#let bar-colors = values.map(v => {
  if v > 100 { color-blue }
  else if v >= 60 { color-green }
  else { color-orange }
})

#figure[
  #lq.diagram(
    width: 560pt, height: 240pt,
    xaxis: (ticks: range(6).map(i => (i+1, categories.at(i))), subticks: none),
    yaxis: (ticks: ((0, "0"), (50, "50"), (100, "100"), (150, "150"), (200, "200"))),
    lq.bar(
      range(6).map(i => i+1),
      values,
      fill: bar-colors,
      width: 70%,
    )
  )

  #align(right, stack(dir: ltr, spacing: 20pt,
    stack(dir: ltr, spacing: 4pt,
      rect(width: 20pt, height: 16pt, fill: color-blue, radius: 2pt),
      [高增长区域 (>100M)],
    ),
    stack(dir: ltr, spacing: 4pt,
      rect(width: 20pt, height: 16pt, fill: color-green, radius: 2pt),
      [稳定区域 (50-100M)],
    ),
    stack(dir: ltr, spacing: 4pt,
      rect(width: 20pt, height: 16pt, fill: color-orange, radius: 2pt),
      [潜力区域 (\<50M)],
    ),
  ))

  #align(right)[2025年第三季度 · 单位：百万元]
]
