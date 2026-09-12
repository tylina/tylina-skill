#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 产品组合分析

#let products = (
  ("产品A", 120, 35, 28, rgb("#2196F3")),
  ("产品B",  85, 25, 18, rgb("#4CAF50")),
  ("产品C",  45, 42, 12, rgb("#FF9800")),
  ("产品D", 130,  8, 25, rgb("#9C27B0")),
  ("产品E",  30, -5,  8, rgb("#E74C3C")),
  ("产品F",  65, 15,  9, rgb("#607D8B")),
)

#cols(columns: (1fr, auto))[
  #figure[
    #lq.diagram(
      width: 340pt, height: 240pt,
      xaxis: (label: "市场规模（亿元）"),
      yaxis: (label: "市场增长率（%）"),
      lq.scatter(
        products.map(p => p.at(1)),
        products.map(p => p.at(2)),
        size: products.map(p => p.at(3) * 80),
        color: products.map(p => p.at(4)),
        mark: "o",
        alpha: 70%,
      ),
    )
  ]
][
  #for prod in products {
    let name = prod.at(0)
    let scale-val = prod.at(1)
    let growth = prod.at(2)
    let share = prod.at(3)
    let col = prod.at(4)
    block(below: 12pt)[
      #stack(dir: ltr, spacing: 6pt,
        rect(width: 10pt, height: 10pt, fill: col.transparentize(40%),
          stroke: 1pt + col, radius: 5pt),
        [*#name* \ 规模 #scale-val 亿 · 增长 #growth% · 份额 #share%],
      )
    ]
  }

  #v(10pt)

  气泡大小 = 市场份额
]
