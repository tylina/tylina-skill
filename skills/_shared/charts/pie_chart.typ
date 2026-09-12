#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": pie-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 市场份额分布

#let segment-data = (
  ("公司A", 35, rgb("#2196F3")),
  ("公司B", 25, rgb("#4CAF50")),
  ("公司C", 20, rgb("#FF9800")),
  ("公司D", 12, rgb("#9C27B0")),
  ("其他",   8, rgb("#607D8B")),
)

#figure[
  #grid(columns: (2fr, 1fr), gutter: 24pt,
    align(center + horizon)[
      #pie-chart(
        (
          labels: segment-data.map(s => s.at(0)),
          values: segment-data.map(s => s.at(1)),
        ),
        size: 260pt,
        title: none,
        theme: (
          palette: segment-data.map(s => s.at(2)),
          background: none,
        ),
      )
    ],

    align(left + horizon)[
      *市场份额*
      #for seg in segment-data {
        let name = seg.at(0)
        let pct = seg.at(1)
        let col = seg.at(2)
        let amount = 120 * pct / 100
        block(below: 8pt, width: 100%)[
          #grid(columns: (auto, 1fr, auto), gutter: 8pt,
            rect(width: 20pt, height: 20pt, fill: col, radius: 4pt),
            [#name],
            align(right)[*#amount 亿 (#pct%)*],
          )
        ]
      }
      #line(length: 100%, stroke: 1pt + rgb("#E0E0E0"))
      #grid(columns: (1fr, auto),
        [*市场总规模*],
        [*120亿 (100%)*],
      )
    ],
  )

  #align(right)[2025年第三季度 · 行业整体市场规模 120亿]
]