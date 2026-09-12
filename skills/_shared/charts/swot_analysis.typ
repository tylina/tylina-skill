#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== SWOT Strategic Analysis

#let color-s = rgb("#4CAF50")
#let color-w = rgb("#E74C3C")
#let color-o = rgb("#2196F3")
#let color-t = rgb("#FF9800")

// 单个象限卡片：接收 content body（原生列表语法）
#let swot-card(letter, title, col, body) = {
  rect(
    width: 100%, height: 100%,
    fill: col.lighten(92%),
    stroke: (paint: col, thickness: 2pt),
    radius: 10pt,
    inset: 0pt,
  )[
    #box(width: 100%, inset: (x: 12pt, y: 8pt),
      fill: col, radius: (top-left: 8pt, top-right: 8pt),
    )[
      #text(size: 16pt, weight: "bold", fill: white)[#letter #h(4pt) #title]
    ]
    #v(1fr)
    #pad(x: 12pt)[
      #set text(size: 13pt, fill: rgb("#444"))
      #set list(marker: circle(radius: 3pt, fill: col, stroke: none), body-indent: 6pt, spacing: 5pt)
      #body
    ]
    #v(1fr)
  ]
}

// swot 函数：接收 4 个 content body（S、W、O、T）+ 可选参数
#let swot(
  strengths,
  weaknesses,
  opportunities,
  threats,
  colors: (rgb("#4CAF50"), rgb("#E74C3C"), rgb("#2196F3"), rgb("#FF9800")),
  x-labels: ("Helpful", "Harmful"),
  y-labels: ("Internal", "External"),
) = {
  let (color-s, color-w, color-o, color-t) = (colors.at(0), colors.at(1), colors.at(2), colors.at(3))
  block(width: 100%, height: 1fr, inset: (x: 36pt, y: 4pt))[
    // 轴标签
    #grid(columns: (20pt, 1fr, 1fr), gutter: 6pt,
      [],
      align(center, text(size: 14pt, weight: "bold", fill: color-s)[#x-labels.at(0)]),
      align(center, text(size: 14pt, weight: "bold", fill: color-w)[#x-labels.at(1)]),
    )

    #grid(
      columns: (20pt, 1fr, 1fr),
      rows: (1fr, 1fr),
      gutter: 6pt,

      grid.cell(rowspan: 1,
        align(horizon + center, rotate(-90deg,
          text(size: 14pt, fill: rgb("#999"))[#y-labels.at(0)]))
      ),
      swot-card("S", "Strengths", color-s, strengths),
      swot-card("W", "Weaknesses", color-w, weaknesses),

      grid.cell(rowspan: 1,
        align(horizon + center, rotate(-90deg,
          text(size: 14pt, fill: rgb("#999"))[#y-labels.at(1)]))
      ),
      swot-card("O", "Opportunities", color-o, opportunities),
      swot-card("T", "Threats", color-t, threats),
    )
  ]
  v(20pt)
}

#figure[
  #block(width: 100%, height: 70%)[
    #set align(left)
    #swot[
      - Strong R&D team, 200+ tech patents
      - High brand recognition, 85% customer loyalty
      - Complete supply chain, 15% cost advantage
      - Strong cash flow, stable financials
      - Efficient management team, strong execution
    ][
      - Insufficient marketing investment
      - Single product line, core product dependency
      - Lack of overseas market experience
      - High talent turnover rate (12%)
      - After-sales response needs improvement
    ][
      - AI industry growing at 25% CAGR
      - Increased policy support and subsidies
      - Strong demand in emerging markets (SEA)
      - Competitors repositioning, market share available
      - Digital transformation driving enterprise demand
    ][
      - Intensified competition, giants entering market
      - Rapid technology iterations, R&D pressure
      - Rising raw material costs, margin squeeze
      - Stricter regulations, compliance costs rising
      - Economic uncertainty, client budgets tightening
    ]
  ]

  #align(right)[ABC Tech Company – 2025 Market Competition Assessment]
]
