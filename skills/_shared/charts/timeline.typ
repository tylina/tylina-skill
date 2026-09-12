#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 产品发展路线图

#let color-done = rgb("#4CAF50")
#let color-active = rgb("#2196F3")
#let color-plan = rgb("#BDBDBD")

#let milestones = (
  ("2024 Q1", "产品立项",  "完成需求分析\n制定技术方案", "done"),
  ("2024 Q2", "MVP开发",   "核心功能上线\n内测验证",     "done"),
  ("2024 Q3", "公测上线",  "开放用户注册\n用户达5000+",  "done"),
  ("2024 Q4", "功能迭代",  "AI功能集成\n多端适配",      "active"),
  ("2025 Q2", "商业化",    "会员体系上线\n启动推广",     "plan"),
  ("2026 Q1", "规模化",    "国际化扩张\n生态建设",      "plan"),
)

// 根据状态返回对应颜色
#let status-color(status) = {
  if status == "done" { color-done }
  else if status == "active" { color-active }
  else { color-plan }
}

// 卡片组件
#let milestone-card(time, title, desc, status) = {
  let col = status-color(status)
  let bg = if status == "done" { rgb("#F1F8E9") }
           else if status == "active" { rgb("#E3F2FD") }
           else { rgb("#FAFAFA") }
  box(width: 100%)[
    #rect(width: 100%,
      fill: bg,
      stroke: (paint: col, thickness: 1.2pt),
      radius: 6pt,
      inset: 8pt,
    )[
      #align(center)[
        #text(size: 12pt, fill: col, weight: "bold")[#time]
        #v(-2pt)
        #text(size: 14pt, weight: "bold", fill: rgb("#333"))[#title]
        #v(-2pt)
        #text(size: 10pt, fill: rgb("#888"))[#desc]
      ]
    ]
    // "进行中"标签
    #if status == "active" {
      v(-8pt)
      align(center,
        box(inset: (x: 6pt, y: 6pt), radius: 8pt, fill: color-active)[
          #text(size: 12pt, fill: white, weight: "bold")[进行中]
        ]
      )
    }
  ]
}

// 虚线连接线
#let dashed-connector(status) = {
  let col = status-color(status).lighten(30%)
  align(center,
    line(length: 24pt, angle: 90deg,
      stroke: (paint: col, thickness: 1.2pt, dash: "dashed"))
  )
}

// 节点圆圈（用 place 在 box 内部精确叠加三层：外圈、内圈、图标）
#let timeline-node(status) = {
  let col = status-color(status)
  let icon = if status == "done" [✓]
             else if status == "active" [●]
             else [○]
  let size = 28pt
  align(center,
    box(width: size, height: size)[
      #place(center + horizon, circle(radius: 14pt, fill: white, stroke: 2.5pt + col))
      #place(center + horizon, circle(radius: 10pt, fill: col, stroke: none))
      #place(center + horizon, text(size: 9pt, fill: white, weight: "bold")[#icon])
    ]
  )
}

#figure[
#{
  let col-count = milestones.len()

  align(horizon,
    grid(
        columns: (1fr,) * col-count,
        row-gutter: 0pt,
      ..milestones.enumerate().map(((i, m)) => {
          if calc.even(i) {
            grid.cell(align: bottom, milestone-card(m.at(0), m.at(1), m.at(2), m.at(3)))
          } else {
            []
          }
        }),
        // 第 2 行：上方虚线连接（偶数索引显示）
        ..milestones.enumerate().map(((i, m)) => {
          if calc.even(i) {
            dashed-connector(m.at(3))
          } else {
            []
          }
        }),
        // 第 3 行：节点圆圈 + 横线（place 精确叠加，横线和节点都居中对齐）
        ..milestones.enumerate().map(((i, m)) => {
          grid.cell(
            align: center + horizon,
            box(width: 100%, height: 28pt)[
              #place(center + horizon, line(length: 100%, stroke: (paint: rgb("#E0E0E0"), thickness: 4pt)))
              #place(center + horizon, timeline-node(m.at(3)))
            ]
          )
        }),
        // 第 4 行：下方虚线连接（奇数索引显示）
        ..milestones.enumerate().map(((i, m)) => {
          if calc.odd(i) {
            dashed-connector(m.at(3))
          } else {
            []
          }
        }),
        // 第 5 行：下方卡片（奇数索引显示，偶数索引留空，顶部对齐以紧贴虚线）
        ..milestones.enumerate().map(((i, m)) => {
          if calc.odd(i) {
            grid.cell(align: top, milestone-card(m.at(0), m.at(1), m.at(2), m.at(3)))
          } else {
            []
          }
        }),
      )
    )
  }

  #align(right)[
    #stack(dir: ltr, spacing: 16pt,
      stack(dir: ltr, spacing: 4pt, circle(radius: 6pt, fill: color-done, stroke: none), [已完成]),
      stack(dir: ltr, spacing: 4pt, circle(radius: 6pt, fill: color-active, stroke: none), [进行中]),
      stack(dir: ltr, spacing: 4pt, circle(radius: 6pt, fill: color-plan, stroke: none), [计划中]),
    )
  ]

  #align(right)[2024年 – 2026年 · 关键里程碑]
]
