#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 营收与利润趋势

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")

#let months = ("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月")
#let revenue = (32, 38, 45, 52, 58, 62, 68, 75, 78, 82, 88, 92)
#let profit = (12, 15, 18, 22, 25, 28, 32, 36, 38, 42, 48, 52)
#let x = range(12).map(i => i + 1)

#figure[
  #lq.diagram(
    width: 560pt,
    height: 240pt,
    xaxis: (
      ticks: range(12).map(i => (i+1, months.at(i))),
      subticks: none,
    ),
    yaxis: (
      ticks: ((0, "0"), (20, "20"), (40, "40"), (60, "60"), (80, "80"), (100, "100")),
      subticks: none,
    ),
    lq.plot(x, revenue, stroke: 2pt + color-blue, label: none),
    lq.plot(x, profit, stroke: 2pt + color-green, label: none),
  )

  #align(right)[
    #stack(dir: ltr, spacing: 20pt,
      stack(dir: ltr, spacing: 4pt,
        rect(width: 20pt, height: 14pt, fill: color-blue, radius: 1pt),
        [营收],
      ),
      stack(dir: ltr, spacing: 4pt,
        rect(width: 20pt, height: 14pt, fill: color-green, radius: 1pt),
        [净利润],
      ),
    )
  ]

  #align(right)[2024年 1月 - 12月 · 单位：百万元]
]
