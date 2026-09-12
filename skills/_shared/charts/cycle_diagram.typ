#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 持续改进循环

#let stages = (
  ("调研分析", rgb("#7E57C2")),
  ("方案设计", rgb("#42A5F5")),
  ("执行落地", rgb("#66BB6A")),
  ("效果评估", rgb("#FFA726")),
  ("迭代优化", rgb("#EF5350")),
)

#let descs = (
  "深入了解现状，收集数据与用户反馈",
  "制定改进方案，明确目标与关键路径",
  "推进方案实施，协调资源与跟踪进度",
  "量化成果输出，对比目标达成率",
  "总结经验教训，进入下一轮改进循环",
)

#figure[
  #grid(columns: (3fr, 2fr), column-gutter: 16pt,
    // 左侧：循环图（cetz）
    align(center + horizon,
      cetz.canvas(length: 28pt, {
        import cetz.draw: *

        let n = stages.len()
        let radius = 4.0
        let node-r = 1.2

        // 外圈虚线
        circle((0, 0), radius: radius, stroke: (paint: rgb("#E0E0E0"), thickness: 1pt, dash: "dashed"), fill: none)

        // 中心文字
        content((0, 0.3), text(size: 12pt, weight: "bold", fill: rgb("#333"))[持续循环])
        content((0, -0.3), text(size: 8pt, fill: rgb("#999"))[Continuous Loop])

        // 节点
        for i in range(n) {
          let angle = 90deg - i * 360deg / n
          let cx = radius * calc.cos(angle)
          let cy = radius * calc.sin(angle)
          let col = stages.at(i).at(1)

          circle((cx, cy), radius: node-r, fill: col, stroke: none)
          content((cx, cy + 0.2), text(size: 10pt, weight: "bold", fill: white)[#{if i + 1 < 10 { "0" } else { "" }}#{i + 1}])
          content((cx, cy - 0.3), text(size: 7pt, fill: white)[#stages.at(i).at(0)])
        }
      })
    ),
    // 右侧：说明卡片
    stack(dir: ttb, spacing: 8pt,
      ..stages.enumerate().map(((i, stage)) => {
        let (label, col) = stage
        rect(
          width: 100%, inset: 10pt,
          fill: rgb("#FAFAFA"),
          stroke: (left: 3pt + col, rest: 0.5pt + rgb("#E8E8E8")),
          radius: 4pt,
        )[
          #set std.align(left)
          #text(size: 11pt, weight: "bold", fill: col)[#{if i + 1 < 10 { "0" } else { "" }}#{i + 1} #label]
          #v(2pt)
          #text(size: 9pt, fill: rgb("#777"))[#descs.at(i)]
        ]
      })
    ),
  )

  #align(right)[每完成一个循环，整体能力向上跃迁一个台阶]
]
