#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 各季度收入构成分析

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")
#let color-orange = rgb("#FF9800")
#let color-purple = rgb("#9C27B0")

// 数据：各季度的堆叠分量
#let quarters = ("Q1'24", "Q2'24", "Q3'24", "Q4'24", "Q1'25")
#let segments = (
  ("产品销售", color-blue),
  ("服务收入", color-green),
  ("订阅收入", color-orange),
  ("其他收入", color-purple),
)
// 每季度各分量值（行=季度，列=分量）
#let data = (
  (128, 80, 48, 64),
  (144, 88, 56, 72),
  (160, 96, 64, 80),
  (168, 104, 72, 76),
  (192, 112, 80, 96),
)

// 预计算每个分量的 base（前几层的累积和）
// base.(si).(qi) = 第 si 层在第 qi 季度的底部值
#let bases = range(segments.len()).map(si =>
  range(quarters.len()).map(qi =>
    range(si).fold(0, (acc, j) => acc + data.at(qi).at(j))
  )
)

#let totals = range(quarters.len()).map(qi => data.at(qi).fold(0, (a, b) => a + b))

#figure[
  #grid(columns: (1fr, 140pt), gutter: 10pt,
    align(center + horizon)[
      #lq.diagram(
          width: 480pt, height: 240pt,
          legend: none,
          xlim: (0.3, quarters.len() + 0.7),
          ylim: (0, 520),
          xaxis: (
            ticks: range(quarters.len()).map(i => (i + 1, quarters.at(i))),
            subticks: none,
          ),
          yaxis: (
            ticks: ((0, "0"), (100, "100"), (200, "200"), (300, "300"), (400, "400"), (500, "500")),
            subticks: none,
          ),
          // 堆叠柱状图（从最上层到最底层绘制，避免后画的覆盖前面的）
          ..range(segments.len()).rev().map(si => {
            let seg-col = segments.at(si).at(1)
            let top-vals = range(quarters.len()).map(qi =>
              range(si + 1).fold(0, (acc, j) => acc + data.at(qi).at(j))
            )
            lq.bar(
              range(quarters.len()).map(i => i + 1),
              top-vals,
              fill: seg-col,
              width: 60%,
              label: none,
            )
          }),
          // 柱顶总数标注
          ..range(quarters.len()).map(qi => {
            let total = totals.at(qi)
            lq.place(qi + 1, total + 12,
              text(size: 7pt, weight: "bold", fill: rgb("#333"))[#{ str(total) }])
          }),
        )
      ],

  align(left + horizon)[
    #box(width: 100%, inset: 10pt, radius: 6pt, stroke: 0.5pt + rgb("#E0E0E0"))[
      *收入类别*
      #v(8pt)
      #for (name, col) in segments {
        block(below: 6pt)[
          #stack(dir: ltr, spacing: 5pt,
            rect(width: 12pt, height: 12pt, fill: col, radius: 2pt),
            [#name],
          )
        ]
      }
    ]
    ],
  )

  #align(right)[2024–2025年度 · 单位：百万元 · 数据来源: 财务部门报表]
]
