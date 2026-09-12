#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Porter's Five Forces – Industry Analysis

#let col-red    = rgb("#E74C3C")
#let col-orange = rgb("#F39C12")
#let col-green  = rgb("#27AE60")
#let col-blue   = rgb("#2980B9")
#let col-lblue  = rgb("#3498DB")
#let col-center = rgb("#2C3E50")

// 力量卡片 Typst 组件（供 cetz content 使用）
#let force-card-box(card-w, title, level, desc, col, pct) = {
  box(width: card-w, inset: (x: 8pt, y: 6pt), radius: 6pt, fill: col)[
    #text(size: 9pt, weight: "bold", fill: white)[#title]
    #v(3pt)
    #stack(dir: ltr, spacing: 0pt,
      rect(width: pct * (card-w - 16pt) / 100, height: 5pt, fill: white, radius: 2.5pt),
      rect(width: (100 - pct) * (card-w - 16pt) / 100, height: 5pt, fill: white.transparentize(70%), radius: 2.5pt),
    )
    #v(2pt)
    #align(right)[#text(size: 7pt, weight: "bold", fill: white)[#level]]
    #v(1pt)
    #text(size: 6pt, fill: white.transparentize(15%))[#desc]
  ]
}

#figure[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *

    let cw = 3.6   // 卡片宽度
    let ch = 1.4   // 卡片高度
    let cr = 1.1   // 中心圆半径

    // === 中心圆 ===
    circle((0, 0), radius: cr, fill: col-center, stroke: 2pt + col-center.lighten(30%))
    content((0, 0.2), text(size: 13pt, weight: "bold", fill: white)[Industry])
    content((0, -0.15), text(size: 13pt, weight: "bold", fill: white)[Rivalry])
    content((0, -0.55), text(size: 9pt, fill: white.transparentize(20%))[High])

    // === 箭头连线 ===
    let arrow-col = rgb("#BBBBBB")
    // 上 → 中心
    line((0, 2.2), (0, cr + 0.15), stroke: 1.5pt + arrow-col, mark: (end: ">", fill: arrow-col))
    // 下 → 中心
    line((0, -2.2), (0, -cr - 0.15), stroke: 1.5pt + arrow-col, mark: (end: ">", fill: arrow-col))
    // 左 → 中心
    line((-3.8, 0), (-cr - 0.15, 0), stroke: 1.5pt + arrow-col, mark: (end: ">", fill: arrow-col))
    // 右 → 中心
    line((3.8, 0), (cr + 0.15, 0), stroke: 1.5pt + arrow-col, mark: (end: ">", fill: arrow-col))

    let card-w = cw * 1cm

    // === 上方：Threat of New Entrants ===
    content((0, 3.5), force-card-box(card-w, "Threat of New Entrants", "Medium", "Capital barriers, Tech accumulation needed", col-red, 55))

    // === 下方：Threat of Substitutes ===
    content((0, -3.5), force-card-box(card-w, "Threat of Substitutes", "Low", "Few effective alternatives", col-lblue, 30))

    // === 左侧：Bargaining Power of Suppliers ===
    content((-5.6, -0.2), force-card-box(card-w, "Bargaining Power of Suppliers", "Medium-High", "Cloud vendors concentrated", col-green, 65))

    // === 右侧：Bargaining Power of Buyers ===
    content((5.6, -0.2), force-card-box(card-w, "Bargaining Power of Buyers", "High", "Many choices, Low switching costs", col-blue, 75))

    // === 右上角：Competitive Rivalry ===
    content((5.6, 3.5), force-card-box(card-w, "Competitive Rivalry", "Very High", "Many competitors, Price wars common", col-orange, 90))

    // === 左上角：Strategic Advice ===
    content((-5.6, 3.5),
      box(width: card-w, inset: 8pt, radius: 6pt,
        stroke: 0.8pt + col-green.lighten(40%), fill: white,
      )[
        #text(size: 9pt, weight: "bold", fill: col-green)[Strategic Advice]
        #v(3pt)
        #set text(size: 6.5pt, fill: rgb("#555"))
        1. Build technical moats\
        2. Improve customer stickiness\
        3. Diversify supply chain\
        4. Focus on differentiation
      ]
    )

    // === 左下角：Overall Assessment ===
    content((-5.8, -3.6),
      box(width: card-w * 0.7, inset: 8pt, radius: 6pt,
        stroke: 0.8pt + rgb("#DDD"), fill: white,
      )[
        #text(size: 8pt, weight: "bold", fill: rgb("#333"))[Overall Assessment]
        #v(2pt)
        #text(size: 15pt, weight: "bold", fill: col-red)[3.4 #text(size: 10pt, fill: rgb("#999"))[\/] 5]
        #v(1pt)
        #text(size: 6.5pt, fill: rgb("#888"))[High Competition Intensity]
      ]
    )

    // === 底部图例 ===
    let ly = -5.4
    content((-5.5, ly), text(size: 7.5pt, weight: "bold", fill: rgb("#555"))[Threat Level:])
    rect((-4.0, ly - 0.12), (-3.5, ly + 0.12), fill: col-green, stroke: none, radius: 0.06)
    content((-3.2, ly), text(size: 7.5pt, fill: rgb("#555"))[Low])
    rect((-2.5, ly - 0.12), (-2.0, ly + 0.12), fill: col-orange, stroke: none, radius: 0.06)
    content((-1.5, ly), text(size: 7.5pt, fill: rgb("#555"))[Medium])
    rect((-0.8, ly - 0.12), (-0.3, ly + 0.12), fill: col-red, stroke: none, radius: 0.06)
    content((0.2, ly), text(size: 7.5pt, fill: rgb("#555"))[High])
  })

  #align(right)[Enterprise SaaS Market – Competitive Landscape Assessment 2025]
]
