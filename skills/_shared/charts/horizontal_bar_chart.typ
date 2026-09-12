#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 品牌认知度排行榜

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")
#let color-orange = rgb("#F5A623")

#let brands = (
  ("品牌A (市场领导者)", 92),
  ("品牌B (新锐品牌)", 78),
  ("品牌C (经典品牌)", 65),
  ("品牌D (区域品牌)", 52),
  ("品牌E (性价比品牌)", 45),
  ("品牌F (高端品牌)", 38),
  ("品牌G (新进入者)", 25),
  ("其他品牌", 12),
)

#let num-brands = brands.len()
#let y-positions = range(num-brands).map(i => num-brands - i)
#let percentages = brands.map(b => b.at(1))

#let bar-colors = percentages.map(p => {
  if p >= 50 { color-blue }
  else if p >= 30 { color-green }
  else { color-orange }
})

#let y-ticks = brands.enumerate().map(((i, b)) => {
  (num-brands - i, b.at(0))
})

#figure[
  #lq.diagram(
    width: 600pt, height: 260pt,
    legend: none,
    xlim: (0, 108),
    ylim: (0.3, num-brands + 0.7),
    xaxis: (
      ticks: ((0, "0%"), (20, "20%"), (40, "40%"), (60, "60%"), (80, "80%"), (100, "100%")),
      subticks: none,
    ),
    yaxis: (
      ticks: y-ticks,
      subticks: none,
    ),
    lq.hbar(
      percentages,
      y-positions,
      fill: bar-colors,
      width: 70%,
      label: none,
    ),
    ..brands.enumerate().map(((i, b)) => {
      let pct = b.at(1)
      lq.place(pct + 2, num-brands - i, text(size: 8pt, fill: rgb("#555"))[#{ str(pct) }%])
    }),
  )

  #align(right)[
    #stack(dir: ltr, spacing: 24pt,
      stack(dir: ltr, spacing: 4pt, rect(width: 14pt, height: 14pt, fill: color-blue, radius: 2pt), [高认知度 (≥50%)]),
      stack(dir: ltr, spacing: 4pt, rect(width: 14pt, height: 14pt, fill: color-green, radius: 2pt), [中等认知度 (30–50%)]),
      stack(dir: ltr, spacing: 4pt, rect(width: 14pt, height: 14pt, fill: color-orange, radius: 2pt), [低认知度 (\<30%)]),
    )
  ]

  #align(right)[2025年消费者调研报告 · 样本量 N=5,000 · 数据来源: 市场研究部门]
]
