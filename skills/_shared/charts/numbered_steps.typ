#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas.with(length: 1pt),
  cover: cetz.draw.hide.with(bounds: true),
)

== 实施路径五步法

#let steps = (
  ("需求分析", "Requirements", rgb("#7E57C2"), "2周",
    ("梳理业务目标", "调研用户需求", "分析竞品现状", "确定核心指标")),
  ("方案设计", "Design", rgb("#42A5F5"), "3周",
    ("架构方案评审", "技术选型确认", "里程碑规划", "资源分配方案")),
  ("开发实施", "Develop", rgb("#66BB6A"), "6周",
    ("核心模块开发", "持续集成部署", "代码审查流程", "单元测试覆盖")),
  ("测试验证", "Testing", rgb("#FFA726"), "3周",
    ("功能回归测试", "性能压力测试", "用户验收测试", "Bug修复闭环")),
  ("上线运维", "Launch", rgb("#42A5F5"), "持续",
    ("灰度发布策略", "监控告警配置", "数据效果追踪", "持续迭代优化")),
)

#figure[
  // 步骤圆圈 + 箭头 + 虚线（在 cetz canvas 中绘制）
  #let n = steps.len()
  #let circle-r = 24
  #let spacing = 150
  #let arrow-color = rgb("#CCCCCC")

  #cetz-canvas({
    import cetz.draw: *

    for i in range(n) {
      let (_, _, col, _, _) = steps.at(i)
      let cx = i * spacing

      // 圆圈
      circle((cx, 0), radius: circle-r, fill: col, stroke: 3pt + col.lighten(60%))
      // 编号
      content((cx, 4),
        text(size: 16pt, weight: "bold", fill: white)[#{if i + 1 < 10 { "0" } else { "" }}#{i + 1}],
        anchor: "center")
      content((cx, -8),
        text(size: 7pt, fill: white.darken(10%))[STEP],
        anchor: "center")

      // 箭头（圆圈之间）
      if i < n - 1 {
        let arrow-start = cx + circle-r + 8
        let arrow-end = (i + 1) * spacing - circle-r - 8
        line(
          (arrow-start, 0),
          (arrow-end, 0),
          stroke: 1.2pt + arrow-color,
          mark: (end: "stealth", fill: arrow-color),
        )
      }

      // 虚线（圆圈下方到卡片上方）
      line(
        (cx, -circle-r - 4),
        (cx, -circle-r - 84),
        stroke: (paint: col.lighten(40%), thickness: 1pt, dash: "dashed"),
      )
    }
  })

  #v(-20pt)

  // 详情卡片行
  #grid(columns: (1fr,) * n, column-gutter: 4pt,
    ..steps.map(step => {
      let (title, en, col, duration, items) = step
      rect(
        width: 100%, inset: 8pt,
        fill: rgb("#FAFAFA"),
        stroke: (top: 2.5pt + col, rest: 0.5pt + rgb("#E8E8E8")),
        radius: (bottom-left: 6pt, bottom-right: 6pt),
      )[
        #set align(center)
        #text(size: 14pt, weight: "bold")[#title]
        #v(0pt)
        #text(size: 12pt, fill: col)[#en]
        #v(0pt)
        #block[
          #set align(left)
          #set text(size: 12pt, fill: rgb("#666"))
          #for item in items [· #item \ ]
        ]
        #v(0pt)
        #align(center,
          box(inset: (x: 8pt, y: 3pt), radius: 10pt,
            stroke: 0.5pt + col, fill: col.lighten(92%),
          )[#text(size: 12pt, fill: col)[#duration]]
        )
      ]
    })
  )

  #align(right)[总周期约14周 · 各阶段可根据项目规模灵活调整]
]
