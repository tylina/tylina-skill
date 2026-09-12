#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 广告投入与销售额关系分析

#let color-online = rgb("#2196F3")
#let color-offline = rgb("#4CAF50")

#let online = (
  (10, 200), (15, 210), (20, 300), (25, 260), (30, 280),
  (40, 400), (45, 440), (50, 460), (55, 550), (60, 540),
  (65, 650), (70, 700), (80, 730), (85, 780), (90, 790),
  (95, 810), (100, 820),
)
#let offline = (
  (10, 150), (15, 160), (20, 220), (25, 230), (30, 300),
  (35, 310), (40, 360), (45, 370), (50, 430), (55, 460),
  (60, 480), (70, 530), (75, 540), (80, 580), (85, 600),
  (90, 610), (95, 650), (100, 660),
)

#figure[
  #grid(columns: (1fr, 150pt), gutter: 40pt,
    align(center + horizon)[
      #lq.diagram(
        width: 480pt, height: 240pt,
        legend: none,
        xlim: (0, 115),
        ylim: (0, 880),
        xaxis: (
          label: [广告投入（万元）],
          ticks: ((0, "0"), (20, "20"), (40, "40"), (60, "60"), (80, "80"), (100, "100")),
          subticks: none,
        ),
        yaxis: (
          label: [销售额（万元）],
          ticks: ((0, "0"), (200, "200"), (400, "400"), (600, "600"), (800, "800")),
          subticks: none,
        ),
        lq.plot((0, 115), (130, 870),
          stroke: (paint: color-online.transparentize(50%), thickness: 1.2pt, dash: "dashed"), label: none),
        lq.plot((0, 115), (100, 720),
          stroke: (paint: color-offline.transparentize(50%), thickness: 1.2pt, dash: "dashed"), label: none),
        lq.scatter(online.map(p => p.at(0)), online.map(p => p.at(1)),
          color: color-online, mark: "o", size: 5pt),
        lq.scatter(offline.map(p => p.at(0)), offline.map(p => p.at(1)),
          color: color-offline, mark: "o", size: 5pt),
      )
    ],

    align(left + horizon)[
      #box(width: 100%, inset: 10pt, radius: 6pt, stroke: 0.5pt + rgb("#E0E0E0"))[
        *统计摘要*
        #stack(dir: ltr, spacing: 4pt,
          circle(radius: 4pt, fill: color-online, stroke: none), [*线上渠道*])
        R² = 0.94 · 斜率 = 6.8
        #stack(dir: ltr, spacing: 4pt,
          circle(radius: 4pt, fill: color-offline, stroke: none), [*线下渠道*])
        R² = 0.91 · 斜率 = 5.2
      ]
      #box(width: 100%, inset: 8pt, radius: 4pt, fill: rgb("#E3F2FD"))[
        线上渠道ROI高于线下 31%，建议增加线上投入
      ]
    ],
  )

  #align(right)[2025年各区域数据 · 样本量 N=24 · 数据来源: 市场营销部门]
]
