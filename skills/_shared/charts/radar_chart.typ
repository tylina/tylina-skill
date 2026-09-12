#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": radar-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 综合能力评估对比

#figure[
  #radar-chart(
    (
      labels: ("性能", "安全性", "易用性", "价格竞争力", "售后服务", "创新能力"),
      series: (
        (name: "产品A", values: (90, 85, 75, 70, 80, 88)),
        (name: "产品B", values: (75, 90, 85, 80, 70, 65)),
      ),
    ),
    title: none,
    size: 300pt,
    theme: (
      palette: (rgb("#2196F3"), rgb("#4CAF50")),
      background: none,
    ),
  )

  #place(right + bottom)[产品 A vs 产品 B · 六维度分析]
]
