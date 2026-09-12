#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": waterfall-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

#let color-up = rgb("#4CAF50")

== 年度利润变化分析

#figure[
  #stack(dir: ltr, spacing: 14pt,
    stack(dir: ltr, spacing: 4pt, rect(width: 18pt, height: 18pt, fill: rgb("#546E7A"), radius: 2pt), [起止值]),
    stack(dir: ltr, spacing: 4pt, rect(width: 18pt, height: 18pt, fill: rgb("#4CAF50"), radius: 2pt), [增加]),
    stack(dir: ltr, spacing: 4pt, rect(width: 18pt, height: 18pt, fill: rgb("#EF5350"), radius: 2pt), [减少]),
  )

  #waterfall-chart(
    (
      labels: ("2024利润", "营收增长", "新产品", "原材料", "人力成本", "营销投入", "运营优化", "2025利润"),
      values: (280, 120, 65, -45, -35, -25, 40, 400),
    ),
    width: 800pt,
    height: 200pt,
    show-values: true,
    title: none,
    theme: (background: none, border-color: none),
  )

  #v(-20pt)

  #align(right)[2024年 vs 2025年 · 单位：百万元]
]

#block(width: 100%, inset: (x: 12pt, y: 10pt), radius: 4pt,
  fill: rgb("#E8F5E9"), stroke: (left: 3pt + color-up))[
  *净增长 120M (+42.9%)* \
  增加项合计: +225M | 减少项合计: –105M | 净增长: +120M
]
