#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 营收来源构成趋势

#let color-blue = rgb("#2196F3")
#let color-green = rgb("#4CAF50")
#let color-orange = rgb("#FF9800")
#let color-purple = rgb("#9C27B0")

#let months = ("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月")
// 各系列月度数据（从下到上堆叠）
#let series = (
  ("订阅收入", color-blue,   (45,48,52,55,58,62,68,72,70,68,75,82)),
  ("广告收入", color-green,  (25,28,30,32,35,38,42,45,43,40,45,50)),
  ("增值服务", color-orange, (15,16,18,20,22,25,28,30,28,26,30,35)),
  ("其他",     color-purple, (8, 8,10,10,12,12,15,15,14,14,15,18)),
)

// 预计算每层的累积底部值
#let n = 12
#let cumulative-layers = {
  let result = ()
  let running = range(n).map(_ => 0)
  for si in range(series.len()) {
    result = result + (running,)
    let s-data = series.at(si).at(2)
    running = range(n).map(i => running.at(i) + s-data.at(i))
  }
  result
}

// 计算每层的顶部累积值
#let top-layers = range(series.len()).map(si => {
  let s-data = series.at(si).at(2)
  range(n).map(i => cumulative-layers.at(si).at(i) + s-data.at(i))
})

#figure[
  #stack(dir: ltr, spacing: 14pt,
    ..series.map(s => stack(dir: ltr, spacing: 4pt,
      rect(width: 20pt, height: 18pt, fill: s.at(1), radius: 2pt),
      [#s.at(0)],
    ))
  )

  #lq.diagram(
        width: 540pt, height: 190pt,
        legend: none,
        xlim: (0.5, 12.5),
        ylim: (0, 210),
        xaxis: (
          ticks: range(12).map(i => (i + 1, months.at(i))),
          subticks: none,
        ),
        yaxis: (
          ticks: ((0, "0"), (50, "50"), (100, "100"), (150, "150"), (200, "200")),
          subticks: none,
        ),
        // 从上到下绘制填充区域（倒序，让底层覆盖上层）
        ..range(series.len()).rev().map(si => {
          let s-col = series.at(si).at(1)
          let y-top = top-layers.at(si)
          let x = range(12).map(i => float(i + 1))
          lq.fill-between(x, y-top,
            fill: s-col.transparentize(30%),
            stroke: none,
            label: none,
          )
        }),
        // 顶部轮廓线（从上到下）
        ..range(series.len()).rev().map(si => {
          let s-col = series.at(si).at(1)
          let y-top = top-layers.at(si)
          let x = range(12).map(i => float(i + 1))
          lq.plot(x, y-top, stroke: s-col + 1.5pt, label: none)
        }),
  )

  #grid(columns: (1fr,) * 5, gutter: 6pt,
    ..for (label, value, share, delta, col) in (
      ("订阅收入", "755M", "占比 48.5%", "↑12%", color-blue),
      ("广告收入", "453M", "占比 29.1%", "↑8%", color-green),
      ("增值服务", "293M", "占比 18.8%", "↑15%", color-orange),
      ("其他收入", "56M",  "占比 3.6%",  "↑5%", color-purple),
      ("年度总营收", "1,557M", "", "+11.2%", rgb("#333")),
    ) {
      (box(
        width: 100%, inset: (x: 8pt, y: 5pt), radius: 4pt,
        stroke: 0.5pt + col.lighten(50%), fill: col.lighten(92%))[
          #set text(15pt)
          #text(fill: col, weight: "bold")[#label] *#value* \
          #share #text(fill: rgb("#4CAF50"))[#delta]
      ],)
    }
  )

  #align(right)[2025年度月度数据 · 单位：百万元]
]
