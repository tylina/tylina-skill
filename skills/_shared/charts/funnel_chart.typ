#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas.with(length: 1pt),
  cover: cetz.draw.hide.with(bounds: true),
)

// 千分位格式化
#let fmt-num(n) = {
  let s = str(int(n))
  let result = ""
  for (i, c) in s.rev().clusters().enumerate() {
    if i > 0 and calc.rem(i, 3) == 0 { result = "," + result }
    result = c + result
  }
  result
}

== 销售转化漏斗

#let stages = (
  ("潜在客户", 10000, 100, rgb("#003F5C")),
  ("意向客户",  4500,  45, rgb("#2F6B8E")),
  ("商务洽谈",  1800,  18, rgb("#5B9AAD")),
  ("成交客户",   650, 6.5, rgb("#F5A623")),
)

#let kpi-items = (
  ("总转化率", "6.5%", rgb("#2196F3")),
  ("平均客单价", "¥125K", rgb("#9C27B0")),
  ("总成交额", "¥81.3M", rgb("#4CAF50")),
  ("平均周期", "42天", rgb("#FF9800")),
)

#figure[
  #grid(columns: (160pt, 1fr), gutter: 40pt,
    align(left + horizon)[
      #rect(fill: rgb("#F8F9FA"), stroke: rgb("#E0E0E0") + 0.5pt, radius: 8pt, inset: 12pt, width: 100%)[
        *关键指标*
        #for (label, value, accent) in kpi-items {
          stack(dir: ltr, spacing: 6pt,
            rect(width: 4pt, height: 36pt, fill: accent, radius: 2pt),
            [#text(size: 10pt, fill: rgb("#888"))[#label] \ #text(size: 17pt, weight: "bold", fill: accent)[#value]],
          )
        }
      ]
    ],

    align(center + horizon)[
      #let funnel-top-w = 420
      #let funnel-bot-w = 180
      #let funnel-h = 250
      #let n = stages.len()
      #let gap = 6
      #let step-h = (funnel-h - gap * (n - 1)) / n
      #let delta = (funnel-top-w - funnel-bot-w) / n

      #cetz-canvas({
        import cetz.draw: *

        let cx = funnel-top-w / 2

        for (i, (name, count, pct, col)) in stages.enumerate() {
          let top-w = funnel-top-w - i * delta
          let bot-w = funnel-top-w - (i + 1) * delta
          let y-top = -i * (step-h + gap)
          let y-bot = y-top - step-h

          line(
            (cx - top-w / 2, y-top),
            (cx + top-w / 2, y-top),
            (cx + bot-w / 2, y-bot),
            (cx - bot-w / 2, y-bot),
            close: true,
            fill: col,
            stroke: none,
          )

          let cy = (y-top + y-bot) / 2
          content((cx, cy + 10),
            text(size: 14pt, weight: "bold", fill: white)[#name: #fmt-num(count)],
            anchor: "center")
          content((cx, cy - 10),
            text(size: 11pt, fill: white.transparentize(15%))[#pct%],
            anchor: "center")

          if i < n - 1 {
            let prev-count = count
            let next-count = stages.at(i + 1).at(1)
            let lost = prev-count - next-count
            let conv-rate = calc.round(next-count / prev-count * 100, digits: 0)

            let arrow-y = y-bot - gap / 2
            let arrow-x-start = cx + bot-w / 2 + 14
            let arrow-x-end = arrow-x-start + 36

            line(
              (arrow-x-start, arrow-y),
              (arrow-x-end, arrow-y),
              stroke: 1.5pt + rgb("#E74C3C"),
              mark: (end: "stealth", fill: rgb("#E74C3C")),
            )

            content((arrow-x-end + 8, arrow-y + 8),
              text(size: 11pt, weight: "bold", fill: rgb("#E74C3C"))[流失 #fmt-num(lost)],
              anchor: "west")
            content((arrow-x-end + 8, arrow-y - 8),
              text(size: 10pt, fill: rgb("#888888"))[转化率: #conv-rate%],
              anchor: "west")
          }
        }
      })
    ],
  )
]

#rect(fill: rgb("#FFF8E1"), stroke: rgb("#FFB74D") + 1pt, radius: 6pt, inset: (x: 14pt, y: 6pt), width: 100%)[
  💡 意向客户到商务洽谈阶段转化率偏低 (40%)，建议加强跟进频率和提案质量；商务洽谈到成交的转化率 (36%)，需优化报价策略和商务条款灵活性
]

// 底部没位置，放在页面右上角
#place(right + top)[
  2025年第三季度 · 总线索数 10,000 · 数据来源: CRM系统统计
]
