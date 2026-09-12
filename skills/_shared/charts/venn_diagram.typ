#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 核心能力交叉分析

#let color-a = rgb("#5C6BC0")
#let color-b = rgb("#EF5350")
#let color-c = rgb("#66BB6A")

#let domains = (
  ("技术", "Technology", color-a, ("自主研发引擎", "AI算法", "云原生架构")),
  ("市场", "Market", color-b, ("全渠道覆盖", "品牌认知领先", "用户增长飞轮")),
  ("运营", "Operations", color-c, ("供应链优化", "智能仓储", "精细化成本管控")),
)

#figure[
  #grid(columns: (1fr, 1fr), column-gutter: 16pt,
    // 左侧：韦恩图（cetz）
    align(center + horizon,
      cetz.canvas(length: 32pt, {
        import cetz.draw: *

        let radius = 3.2
        let offset = 1.8
        let centers = (
          (-offset * 0.5, offset * 0.5),
          (offset * 0.5, offset * 0.5),
          (0, -offset * 0.4),
        )

        // 绘制三个半透明圆
        for (i, center) in centers.enumerate() {
          let col = domains.at(i).at(2)
          circle(center, radius: radius, fill: col.lighten(80%).transparentize(30%), stroke: 1pt + col.lighten(30%))
        }

        // 圆心标签
        content((-3.0, 1.8), text(size: 14pt, weight: "bold", fill: color-a)[技术])
        content((3.0, 1.8), text(size: 14pt, weight: "bold", fill: color-b)[市场])
        content((0, -3.0), text(size: 14pt, weight: "bold", fill: color-c)[运营])

        // 交叉区域标签
        content((0, 1.6), text(size: 9pt, fill: rgb("#666"))[产品创新])
        content((-1.2, -0.6), text(size: 9pt, fill: rgb("#666"))[技术运维])
        content((1.2, -0.6), text(size: 9pt, fill: rgb("#666"))[客户运营])
        content((0, 0.3), text(size: 10pt, weight: "bold", fill: rgb("#333"))[核心竞争力])
      })
    ),
    // 右侧：说明卡片
    stack(dir: ttb, spacing: 12pt,
      ..domains.map(d => {
        let (label, en, col, items) = d
        rect(
          width: 100%, inset: 12pt,
          fill: rgb("#FAFAFA"),
          stroke: (left: 3pt + col, rest: 0.5pt + rgb("#E8E8E8")),
          radius: 4pt,
        )[
          #set align(left)
          #stack(dir: ltr, spacing: 8pt,
            circle(radius: 9pt, fill: col),
            text(size: 18pt, weight: "bold")[#label],
          )
          #text(size: 14pt, fill: rgb("#666"))[#items.join("  ·  ")]
        ]
      }),
      // 底部总结
      rect(
        width: 100%, inset: 10pt,
        fill: rgb("#F5F0FF"),
        stroke: (top: 2pt + rgb("#7E57C2"), rest: 0.5pt + rgb("#E0D8F0")),
        radius: 4pt,
      )[
        #set align(center)
        #text(size: 14pt, fill: rgb("#5C6BC0"))[核心竞争力 = ]
        #text(size: 14pt, weight: "bold", fill: color-a)[技术]
        #text(size: 14pt, fill: rgb("#5C6BC0"))[ × ]
        #text(size: 14pt, weight: "bold", fill: color-b)[市场]
        #text(size: 14pt, fill: rgb("#5C6BC0"))[ × ]
        #text(size: 14pt, weight: "bold", fill: color-c)[运营]
      ]
    ),
  )

  #align(right)[圆形面积表示能力覆盖范围，交叉区域表示协同价值]
]
