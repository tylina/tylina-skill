#import "@preview/touying:0.7.4": *
#import "@preview/cetz:0.5.2": canvas, draw
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 产品组合矩阵分析

#let products = (
  ("产品A", 0.75, 0.72, 3.2, "star"),
  ("产品G", 0.60, 0.65, 1.4, "star"),
  ("产品B", 0.82, 0.22, 4.8, "cash"),
  ("产品F", 0.62, 0.30, 1.8, "cash"),
  ("产品C", 0.28, 0.78, 1.6, "question"),
  ("产品D", 0.35, 0.60, 1.2, "question"),
  ("产品E", 0.18, 0.20, 0.5, "dog"),
)

// 象限颜色：(背景色, 气泡色)
#let quadrant-meta = (
  question: (bg: rgb("#FFF3E0"), accent: rgb("#FF9800"), label: "问题产品", en: "Question Marks", desc: "高投入 · 低回报"),
  star:     (bg: rgb("#E8F5E9"), accent: rgb("#4CAF50"), label: "明星产品", en: "Stars",          desc: "高投入 · 高回报"),
  dog:      (bg: rgb("#FFEBEE"), accent: rgb("#E74C3C"), label: "瘦狗产品", en: "Dogs",           desc: ""),
  cash:     (bg: rgb("#E3F2FD"), accent: rgb("#2196F3"), label: "现金牛产品", en: "Cash Cows",     desc: ""),
)

// === 坐标系参数 ===
#let chart-w = 10    // 图表宽度（cetz 单位）
#let chart-h = 7     // 图表高度
#let half-w = chart-w / 2
#let half-h = chart-h / 2
#let axis-color = rgb("#1a2a3a")
#let arrow-size = 0.25

#figure[
  #grid(columns: (1fr, 230pt), gutter: 12pt,
    align(center + horizon)[
        #canvas(length: 36pt, {
          import draw: *

          // --- 四象限背景 ---
          rect((0, half-h), (half-w, chart-h), fill: quadrant-meta.question.bg, stroke: none)
          rect((half-w, half-h), (chart-w, chart-h), fill: quadrant-meta.star.bg, stroke: none)
          rect((0, 0), (half-w, half-h), fill: quadrant-meta.dog.bg, stroke: none)
          rect((half-w, 0), (chart-w, half-h), fill: quadrant-meta.cash.bg, stroke: none)

          // --- 象限标签 ---
          // 左上：问题产品
          content((0.3, chart-h - 0.3), anchor: "north-west",
            text(size: 12pt, weight: "bold", fill: quadrant-meta.question.accent)[问题产品])
          content((0.3, chart-h - 0.7), anchor: "north-west",
            text(size: 7pt, fill: quadrant-meta.question.accent)[Question Marks])
          content((0.3, chart-h - 1.0), anchor: "north-west",
            text(size: 7pt, fill: rgb("#888"))[高投入 · 低回报])

          // 右上：明星产品
          content((half-w + 0.3, chart-h - 0.3), anchor: "north-west",
            text(size: 12pt, weight: "bold", fill: quadrant-meta.star.accent)[明星产品])
          content((half-w + 0.3, chart-h - 0.7), anchor: "north-west",
            text(size: 7pt, fill: quadrant-meta.star.accent)[Stars])
          content((half-w + 0.3, chart-h - 1.0), anchor: "north-west",
            text(size: 7pt, fill: rgb("#888"))[高投入 · 高回报])

          // 左下：瘦狗产品
          content((0.3, 0.65), anchor: "south-west",
            text(size: 12pt, weight: "bold", fill: quadrant-meta.dog.accent)[瘦狗产品])
          content((0.3, 0.35), anchor: "south-west",
            text(size: 7pt, fill: quadrant-meta.dog.accent)[Dogs])

          // 右下：现金牛产品
          content((half-w + 0.3, 0.65), anchor: "south-west",
            text(size: 12pt, weight: "bold", fill: quadrant-meta.cash.accent)[现金牛产品])
          content((half-w + 0.3, 0.35), anchor: "south-west",
            text(size: 7pt, fill: quadrant-meta.cash.accent)[Cash Cows])

          // --- 十字轴线（粗黑线 + 三角箭头） ---
          // 水平轴
          line((0, half-h), (chart-w, half-h),
            stroke: (paint: axis-color, thickness: 2.5pt))
          // 水平箭头（右端三角形）
          line((chart-w, half-h - 0.22), (chart-w + 0.45, half-h), (chart-w, half-h + 0.22),
            close: true, fill: axis-color, stroke: none)

          // 垂直轴
          line((half-w, 0), (half-w, chart-h),
            stroke: (paint: axis-color, thickness: 2.5pt))
          // 垂直箭头（上端三角形）
          line((half-w - 0.22, chart-h), (half-w, chart-h + 0.45), (half-w + 0.22, chart-h),
            close: true, fill: axis-color, stroke: none)

          // --- 气泡 ---
          for (name, raw-x, raw-y, revenue, quad) in products {
            let accent = quadrant-meta.at(quad).accent
            let cx = raw-x * chart-w
            let cy = raw-y * chart-h
            let bubble-radius = calc.max(calc.sqrt(revenue) * 0.38, 0.35)

            // 气泡圆形（带轻微阴影效果）
            circle((cx, cy), radius: bubble-radius + 0.04,
              fill: accent.darken(15%).transparentize(30%),
              stroke: none)
            circle((cx, cy), radius: bubble-radius,
              fill: accent,
              stroke: none)

            // 气泡内文字（白色）
            content((cx, cy + 0.12),
              text(size: 8pt, weight: "bold", fill: white)[#name])
            content((cx, cy - 0.18),
              text(size: 7pt, fill: white.transparentize(15%))[¥#{ str(revenue) }亿])
          }

          // --- 轴标签 ---
          // Y 轴：左侧竖排
          content((-0.6, half-h), angle: 90deg,
            text(size: 7pt, fill: rgb("#999"))[Growth Rate])
          content((-1.0, half-h), angle: 90deg,
            text(size: 9pt, weight: "bold", fill: rgb("#666"))[市场增长率])

          // Y 轴高低标注
          content((-0.4, chart-h - 0.5), anchor: "east",
            text(size: 7pt, fill: rgb("#666"))[高\ High])
          content((-0.4, 0.5), anchor: "east",
            text(size: 7pt, fill: rgb("#666"))[低\ Low])

          // X 轴：底部
          content((half-w, -0.55),
            text(size: 9pt, weight: "bold", fill: rgb("#666"))[市场占有率 Market Share])

          // X 轴高低标注
          content((0.2, -0.25), anchor: "north-west",
            text(size: 7pt, fill: rgb("#666"))[低 Low])
          content((chart-w - 0.2, -0.25), anchor: "north-east",
            text(size: 7pt, fill: rgb("#666"))[高 High])

          // 数据来源（放在画布内，X轴标签下方）
          content((half-w, -1.0),
            text(size: 6pt, fill: rgb("#AAAAAA"))[数据来源: 市场研究部门分析 | Source: Market Research Department])
        })
      ],

  align(left + horizon)[
    #box(width: 100%, inset: 12pt, radius: 6pt, stroke: 0.5pt + rgb("#E0E0E0"))[
      *战略建议*
      #v(10pt)
      #for (quad-key, advice) in (
        ("star",     "持续投资"),
        ("question", "选择性投资"),
        ("cash",     "收割"),
        ("dog",      "撤资"),
      ) {
        let meta = quadrant-meta.at(quad-key)
        block(below: 12pt)[
          #stack(dir: ltr, spacing: 6pt,
            circle(radius: 4pt, fill: meta.accent, stroke: none),
            text(fill: meta.accent, weight: "bold")[#{ meta.label }: #advice],
          )
        ]
      }
      气泡大小 = 营收规模
    ]
  ],
  )

  #align(right)[Boston Matrix · 市场增长率 vs 市场占有率 · 数据来源: 市场研究部门]
]
