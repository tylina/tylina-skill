#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": gauge-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#empty-slide[
  // 根据百分比获取状态文字
  #let get-status-text(pct) = {
    if pct >= 80 { "优秀" }
    else if pct >= 60 { "良好" }
    else { "需关注" }
  }

  #let get-status-color(pct) = {
    if pct >= 80 { rgb("#7EC87E") }
    else if pct >= 60 { rgb("#F5A623") }
    else { rgb("#F4847C") }
  }

  // 单个仪表盘卡片（primaviz gauge-chart + 标签）
  #let gauge-card(pct, label) = {
    let col = get-status-color(pct)
    let status = get-status-text(pct)

    box(width: 240pt)[
      #align(center)[
        #gauge-chart(
          pct,
          title: none,
          theme: (background: none, border-color: none),
        )
        #v(-24pt)
        #text(size: 11pt, weight: "bold", fill: rgb("#333333"))[#label]
        #v(-4pt)
        #box(
          inset: (x: 10pt, y: 3pt),
          radius: 10pt,
          stroke: 0.8pt + col,
        )[#text(size: 8pt, fill: col)[#status]]
      ]
    ]
  }

  // 标题区域
  #align(center)[
    #text(size: 22pt, weight: "bold", fill: rgb("#333333"))[业务核心指标仪表盘]

    #text(size: 11pt, fill: rgb("#999999"))[2025年第四季度实时数据]
  ]

  // 仪表盘区域
  #figure[
    #stack(dir: ltr, spacing: 16pt,
      gauge-card(85, "销售完成率"),
      gauge-card(72, "客户满意度"),
      gauge-card(58, "库存周转率"),
    )

    // 底部图例
    #box(
      inset: (x: 16pt, y: 8pt),
      radius: 6pt,
      stroke: 0.5pt + rgb("#E0E0E0"),
    )[
      #set text(size: 12pt, fill: rgb("#666666"))
      #stack(dir: ltr, spacing: 20pt,
        stack(dir: ltr, spacing: 4pt,
          rect(width: 12pt, height: 12pt, fill: rgb("#F4847C"), radius: 2pt),
          [危险 (0–60%)],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 12pt, height: 12pt, fill: rgb("#F5A623"), radius: 2pt),
          [警告 (60–80%)],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 12pt, height: 12pt, fill: rgb("#7EC87E"), radius: 2pt),
          [优秀 (80–100%)],
        ),
        [目标: 80%],
      )
    ]

    #text(size: 7pt, fill: rgb("#AAAAAA"))[数据来源: 业务数据平台 · 实时更新]
  ]
]
