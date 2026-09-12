#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 用户年龄分布对比

#let color-blue = rgb("#2196F3")
#let color-pink = rgb("#E91E63")

#let age-groups = ("60+", "50-59", "40-49", "30-39", "25-29", "20-24", "18-19", "<18")
#let male-pct = (3, 8, 15, 18, 16, 12, 6, 2)
#let female-pct = (4, 10, 17, 15, 14, 10, 5, 3)

#let y-positions = range(age-groups.len()).map(i => i)
#let male-values = male-pct.map(v => -v)
#let female-values = female-pct.map(v => v)

#figure[
  #lq.diagram(
    width: 600pt, height: 240pt,
    legend: (position: bottom + right),
    xaxis: (
      ticks: ((-20, "20%"), (-15, "15%"), (-10, "10%"), (-5, "5%"), (0, "0"), (5, "5%"), (10, "10%"), (15, "15%"), (20, "20%")),
      subticks: none,
      label: [← 男性　　女性 →],
    ),
    yaxis: (
      ticks: range(age-groups.len()).map(i => (i, age-groups.at(i))),
      subticks: none,
    ),
    lq.hbar(male-values, y-positions, fill: color-blue, width: 0.4, label: [男性用户]),
    lq.hbar(female-values, y-positions, fill: color-pink, width: 0.4, label: [女性用户]),
  )

  #align(right)[2025年度用户画像分析 · 样本量 N=50,000]
]
