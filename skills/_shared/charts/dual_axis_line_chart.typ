#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 温湿度变化曲线

#let data-points = (
  (0,   20, 65),
  (60,  85, 85),
  (300, 85, 85),
  (420, -40, 30),
  (660, -40, 30),
  (720, 20, 65),
)

#let t-min = -60
#let t-max = 90
#let h-min = 0
#let h-max = 100

#let humidity-to-temp(h) = t-min + (h - h-min) * (t-max - t-min) / (h-max - h-min)

#let x-vals = data-points.map(p => p.at(0))
#let temp-vals = data-points.map(p => p.at(1))
#let humi-vals = data-points.map(p => humidity-to-temp(p.at(2)))

#figure[
  #lq.diagram(
    width: 560pt, height: 230pt,
    xaxis: (
      ticks: ((0, "0"), (60, "60"), (300, "300"), (420, "420"), (660, "660"), (720, "720")),
      label: "时间 (min)",
    ),
    yaxis: (
      ticks: ((-60, "-60"), (-30, "-30"), (0, "0"), (30, "30"), (60, "60"), (90, "90")),
      label: "温度 (℃)",
    ),
    lq.plot(x-vals, temp-vals, stroke: rgb("#111111") + 2pt),
    lq.plot(x-vals, humi-vals, stroke: (paint: rgb("#666666"), thickness: 2pt, dash: "dashed")),
  )

  #align(right)[
    #stack(dir: ltr, spacing: 24pt,
      stack(dir: ltr, spacing: 6pt,
        rect(width: 30pt, height: 16pt, fill: rgb("#111111")),
        [温度 (℃)],
      ),
      stack(dir: ltr, spacing: 6pt,
        rect(width: 30pt, height: 16pt, fill: rgb("#666666")),
        [相对湿度 (%) — 右轴: 0%→-60℃, 100%→90℃],
      ),
    )
  ]

  #align(right)[实验过程监测数据]
]
