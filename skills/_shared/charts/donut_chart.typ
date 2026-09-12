#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": pie-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 产品线营收占比

#let segment-data = (
  ("企业服务", 35, rgb("#2196F3"), "¥1.82亿"),
  ("消费电子", 28, rgb("#4CAF50"), "¥1.46亿"),
  ("云计算",   20, rgb("#FF9800"), "¥1.04亿"),
  ("物联网",   12, rgb("#9C27B0"), "¥0.62亿"),
  ("其他",      5, rgb("#95A5A6"), "¥0.26亿"),
)

#figure[
  #grid(columns: (auto, auto), gutter: 24pt,
    align(center + horizon)[
      #pie-chart(
        (
          labels: segment-data.map(s => s.at(0)),
          values: segment-data.map(s => s.at(1)),
        ),
        size: 270pt,
        donut: true,
        title: none,
        theme: (
          palette: segment-data.map(s => s.at(2)),
          background: none,
        ),
      )
    ],

    align(left + horizon)[
      #for seg in segment-data {
        let name = seg.at(0)
        let pct = seg.at(1)
        let col = seg.at(2)
        let amount = seg.at(3)
        block(below: 10pt)[
          #stack(dir: ltr, spacing: 8pt,
            rect(width: 20pt, height: 20pt, fill: col, radius: 2pt),
            [*#name* \ #pct% · #amount],
          )
        ]
      }
    ],
  )

  #align(right)[2025年第三季度 · 总收入 5.2亿元]
]
