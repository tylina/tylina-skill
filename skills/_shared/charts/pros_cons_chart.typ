#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 方案优劣势对比

#let color-pro = rgb("#4CAF50")
#let color-con = rgb("#F44336")

#let pros = (
  ("产品质量领先", "核心技术自主可控，用户满意度持续高于行业均值15%"),
  ("品牌认知度高", "全渠道覆盖率85%，品牌知名度位列细分市场TOP3"),
  ("用户生态完善", "用户留存率/分享率/复购率远超行业平均水平"),
)

#let cons = (
  ("产品迭代周期长", "从用户反馈到功能上线平均需12周，竞品仅需6-8周"),
  ("下沉市场薄弱", "二三线城市渗透率仅23%，经销商网络覆盖不足"),
  ("服务响应待提升", "售后工单平均响应时长48h，客户流失风险增大"),
)

#let item-card(title, desc, col, icon) = {
  rect(
    width: 100%, inset: 12pt,
    fill: col.lighten(95%),
    stroke: (left: 3pt + col, rest: 0.5pt + rgb("#E8E8E8")),
    radius: 6pt,
  )[
    #grid(columns: (auto, 1fr), column-gutter: 10pt,
      align(horizon, circle(radius: 12pt, fill: col.lighten(85%))[
        #set align(center + horizon)
        #text(size: 10pt, fill: col, weight: "bold")[#icon]
      ]),
      [
        #text(size: 12pt, weight: "bold", fill: rgb("#333"))[#title]
        #v(2pt)
        #text(size: 9pt, fill: rgb("#777"))[#desc]
      ],
    )
  ]
}

#figure[
  #grid(columns: (1fr, 1fr), column-gutter: 24pt, row-gutter: 10pt,
    // 标题行
    align(center, text(size: 16pt, weight: "bold", fill: color-pro)[优势 PROS]) + v(8pt),
    align(center, text(size: 16pt, weight: "bold", fill: color-con)[劣势 CONS]) + v(8pt),
    // 内容行
    ..pros.zip(cons).map(pair => {
      let (pro, con) = pair
      (
        item-card(pro.at(0), pro.at(1), color-pro, "✓"),
        item-card(con.at(0), con.at(1), color-con, "✗"),
      )
    }).flatten()
  )

  // 底部建议
  #rect(
    width: 100%, inset: 12pt,
    fill: rgb("#F5F5F5"),
    stroke: (bottom: 2pt + rgb("#888888"), rest: 0.5pt + rgb("#E0E0E0")),
    radius: 6pt,
  )[
    #set align(center)
    #text(size: 12pt, weight: "bold")[建议策略]
    #v(2pt)
    #text(size: 10pt, fill: rgb("#666"))[巩固产品与品牌优势，同步加速迭代节奏、拓展下沉渠道、强化售后响应体系]
  ]
]
