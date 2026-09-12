#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": timeline-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 2025年度战略路线图

#let timeline-data = (
  events: (
    (date: "2025 Q1", title: "组织架构升级", description: "完成事业部制改革，成立三大业务线独立运营单元", category: "已完成"),
    (date: "2025 Q1末", title: "A轮融资关闭", description: "完成A轮¥5000万融资，估值达到¥3亿", category: "已完成"),
    (date: "2025 Q2", title: "产品V2.0发布", description: "集成AI引擎，上线智能推荐和自动化工作流", category: "进行中"),
    (date: "2025 Q3", title: "海外市场试水", description: "东南亚三国试点运营，验证本地化策略", category: "计划"),
    (date: "2025 Q4", title: "B轮融资启动", description: "目标估值¥10亿，完成规模化扩张资金储备", category: "计划"),
  ),
)

#let goals = (
  ("营收目标", "¥1.5亿", "ARR", rgb("#7E57C2")),
  ("用户增长", "500万", "注册用户", rgb("#26A69A")),
  ("团队规模", "300人", "年末编制", rgb("#FFA726")),
)

#let strategies = (
  "产品驱动增长（PLG）策略",
  "企业客户大单突破",
  "海外市场 PMF 验证",
  "AI 技术壁垒构建",
)

#figure[
  #grid(columns: (2fr, 1fr), column-gutter: 16pt,
    // 左侧：primaviz 垂直时间轴
    align(center + horizon)[
      #timeline-chart(
        timeline-data,
        width: 340pt,
        event-gap: 44pt,
        title: none,
        theme: (
          background: none,
          border-color: none,
          palette: (rgb("#7E57C2"), rgb("#42A5F5"), rgb("#78909C")),
        ),
      )
    ],
    // 右侧：年度核心目标
    align(horizon)[
      #rect(
        width: 100%, inset: 12pt,
        fill: rgb("#FAFAFA"),
        stroke: 0.5pt + rgb("#E0E0E0"),
        radius: 8pt,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[年度核心目标]
        #v(6pt)
        #stack(dir: ttb, spacing: 8pt,
          ..goals.map(g => {
            let (label, value, unit, col) = g
            grid(columns: (auto, 1fr, auto),
              circle(radius: 5pt, fill: col),
              pad(left: 6pt)[
                #text(size: 8pt, fill: rgb("#666"))[#label]
                #v(-2pt)
                #text(size: 18pt, weight: "bold", fill: col)[#value]
              ],
              align(horizon, text(size: 8pt, fill: rgb("#999"))[#unit]),
            )
          })
        )
      ]

      #v(8pt)

      #text(size: 11pt, weight: "bold")[关键策略]
      #v(3pt)
      #stack(dir: ttb, spacing: 3pt,
        ..strategies.enumerate().map(((i, s)) => {
          rect(
            width: 100%, inset: 6pt,
            fill: rgb("#F8F6FF").darken(i * 2%),
            radius: 4pt,
          )[
            #text(size: 8pt, fill: rgb("#555"))[#{i + 1}. #s]
          ]
        })
      )
    ],
  )
]
