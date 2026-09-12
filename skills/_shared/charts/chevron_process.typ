#import "@preview/touying:0.7.4": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: chevron
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 数字化转型方法论

#let phases = (
  ("诊断评估", "PHASE 01", "2-4周", rgb("#7E57C2"),
    ("现状能力评估", "痛点问题识别", "成熟度测评", "目标差距分析"),
    ("诊断报告", "能力成熟度评分卡")),
  ("规划设计", "PHASE 02", "4-6周", rgb("#42A5F5"),
    ("顶层架构设计", "技术选型评估", "路线图编制", "投资回报测算"),
    ("转型蓝图", "ROI分析报告")),
  ("试点验证", "PHASE 03", "8-12周", rgb("#26A69A"),
    ("选定试点场景", "MVP快速上线", "效果数据采集", "用户反馈迭代"),
    ("试点总结报告", "推广可行性评估")),
  ("规模推广", "PHASE 04", "12-16周", rgb("#FFA726"),
    ("全业务线推广", "组织变革配套", "培训赋能计划", "标准化流程建设"),
    ("推广实施方案", "组织能力建设手册")),
  ("持续优化", "PHASE 05", "持续", rgb("#EF5350"),
    ("运营效果监测", "数据驱动优化", "技术迭代升级", "新场景拓展"),
    ("运营看板", "季度优化报告")),
)

#figure[
  // 箭头行 — 使用 fletcher chevron 形状
  #diagram(
    node-stroke: none,
    spacing: (6pt, 0pt),
    {
      for (i, p) in phases.enumerate() {
        let (title, phase, _, col, _, _) = p
        node(
          (i, 0),
          [#set align(center)
           #text(size: 14pt, weight: "bold", fill: white)[#title]
           #v(-6pt)
           #text(size: 12pt, fill: white.darken(15%))[#phase]],
          shape: chevron,
          fill: col,
          width: 150pt,
          height: 44pt,
          inset: 8pt,
        )
      }
    }
  )

  #v(2pt)

  // 时长标签行
  #grid(columns: (1fr,) * phases.len(), column-gutter: 2pt,
    ..phases.map(p => {
      let (_, _, duration, col, _, _) = p
      align(center,
        box(inset: (x: 10pt, y: 3pt), radius: 10pt, fill: col.lighten(88%), stroke: 0.5pt + col.lighten(60%))[
          #text(size: 12pt, fill: col)[#duration]
        ]
      )
    })
  )

  #v(4pt)

  // 详情卡片行
  #grid(columns: (1fr,) * phases.len(), column-gutter: 2pt,
    ..phases.map(p => {
      let (title, _, _, col, items, deliverables) = p
      rect(
        width: 100%, inset: 8pt,
        fill: rgb("#FAFAFA"),
        stroke: (top: 2.5pt + col, rest: 0.5pt + rgb("#E8E8E8")),
        radius: (bottom-left: 6pt, bottom-right: 6pt),
      )[
        #set align(center)
        #text(size: 14pt, weight: "bold")[#title]
        #v(4pt)
        #set align(left)
        #set text(size: 12pt, fill: rgb("#666"))
        #for item in items [· #item \ ]
        #v(4pt)
        #text(size: 12pt, weight: "bold", fill: col)[交付物:]
        #v(1pt)
        #set text(size: 12pt, fill: rgb("#888"))
        #for d in deliverables [#d \ ]
      ]
    })
  )

  #align(right)[各阶段可根据企业实际情况灵活调整时长和交付物]
]
