#import "@preview/touying:0.7.4": *
#import themes.simple: *
#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 2025年Q4 OKR进度追踪

#let color-green = rgb("#4CAF50")
#let color-blue = rgb("#2196F3")
#let color-orange = rgb("#F5A623")
#let color-red = rgb("#F44336")

// 根据进度返回颜色和状态
#let get-status(pct) = {
  if pct >= 80 { (color-green, "超前") }
  else if pct >= 70 { (color-blue, "进行中") }
  else if pct >= 60 { (color-orange, "滞后") }
  else { (color-red, "风险") }
}

// OKR 数据：(目标名称, 进度%, 目标描述, 实际描述)
#let okrs = (
  ("营收目标",   92, "目标: 5000万", "实际: 4600万"),
  ("新客户获取", 85, "目标: 200家",  "实际: 170家"),
  ("产品发布",   75, "目标: 4个功能", "实际: 3个功能"),
  ("团队扩张",   68, "目标: 25人",   "实际: 17人"),
  ("成本控制",   55, "目标: 降低20%", "实际: 降低11%"),
  ("品牌建设",   66, "目标: 知名度+30%", "实际: +20%"),
)

// 单行进度条组件
#let progress-row(name, pct, target, actual) = {
  let result = get-status(pct)
  let col = result.at(0)
  let status = result.at(1)
  grid(columns: (120pt, 1fr, 50pt, 50pt), column-gutter: 8pt,
    // 左侧标签
    align(right + horizon)[
      #text(size: 10pt, weight: "bold", fill: rgb("#333"))[#name]
      #v(-3pt)
      #text(size: 6.5pt, fill: rgb("#999"))[#target | #actual]
    ],
    // 进度条
    align(horizon)[
      #box(width: 100%, height: 16pt)[
        // 背景轨道
        #place(left + horizon,
          rect(width: 100%, height: 16pt, fill: rgb("#F0F0F0"), radius: 8pt))
        // 进度填充
        #place(left + horizon,
          rect(width: calc.min(pct, 100) * 1% / 1, height: 16pt, fill: col, radius: 8pt))
      ]
    ],
    // 百分比
    align(center + horizon)[
      #text(size: 12pt, weight: "bold", fill: col)[#{ str(pct) }%]
    ],
    // 状态标签
    align(center + horizon)[
      #box(inset: (x: 6pt, y: 2pt), radius: 10pt,
        stroke: 0.5pt + col, fill: col.lighten(90%),
      )[
        #text(size: 7pt, fill: col, weight: "bold")[#status]
      ]
    ],
  )
}

// 整体完成度
#let overall-pct = calc.round(okrs.map(o => o.at(1)).fold(0, (a, b) => a + b) / okrs.len(), digits: 1)

#figure[
  #grid(columns: (1fr, auto),
    [截止日期: 2025年12月31日 · 剩余 20 天],
    box(inset: (x: 12pt, y: 6pt), radius: 6pt, stroke: 0.5pt + rgb("#E0E0E0"))[
      整体完成度 *#{ str(overall-pct) }%* / 目标 100%
    ],
  )

  #stack(dir: ttb, spacing: 10pt,
    ..okrs.map(o => progress-row(o.at(0), o.at(1), o.at(2), o.at(3)))
  )

  #align(right)[
    #stack(dir: ltr, spacing: 16pt,
      ..for (col, label) in (
        (color-green, "达标/超前 (≥80%)"),
        (color-blue, "进行中 (70–80%)"),
        (color-orange, "滞后 (60–70%)"),
        (color-red, "风险 (<60%)"),
      ) {
        (stack(dir: ltr, spacing: 4pt,
          circle(fill: col, radius: 8pt),
          [#label],
        ),)
      }
    )
  ]

  #align(right)[数据来源: OKR管理系统]
]
