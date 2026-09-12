#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 网站访问量趋势分析

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")

#let months = ("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月")
#let pc-data = (320, 280, 350, 420, 480, 520, 580, 620, 550, 490, 460, 520)
#let mobile-data = (180, 160, 210, 280, 350, 420, 480, 540, 500, 460, 430, 490)
#let x = range(12).map(i => i + 1)

#figure[
  #lq.diagram(
    width: 560pt,
    height: 240pt,
    xaxis: (
      ticks: range(12).map(i => (i+1, months.at(i))),
    ),
    yaxis: (
      ticks: ((0, "0"), (200, "200"), (400, "400"), (600, "600"), (800, "800")),
      subticks: none,
    ),
    lq.fill-between(x, pc-data, fill: color-blue.transparentize(60%), stroke: none, z-index: 1),
    lq.fill-between(x, mobile-data, fill: color-green.transparentize(70%), stroke: none, z-index: 1),
    lq.plot(x, pc-data, stroke: 2pt + color-blue, label: none, z-index: 3),
    lq.plot(x, mobile-data, stroke: 2pt + color-green, label: none, z-index: 3),
  )

  #align(right)[
    #stack(dir: ltr, spacing: 20pt,
      stack(dir: ltr, spacing: 4pt,
        rect(width: 20pt, height: 14pt, fill: color-blue.transparentize(30%), radius: 1pt),
        [PC端],
      ),
      stack(dir: ltr, spacing: 4pt,
        rect(width: 20pt, height: 14pt, fill: color-green.transparentize(30%), radius: 1pt),
        [移动端],
      ),
    )
  ]

  #align(right)[2024年度 · 年度总访问量 10,240万 · PC端 55.8% · 移动端 44.2% · 同比 +23.5%]
]
