#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Product Quality Issue Pareto Analysis

#let color-key = rgb("#F5A623")
#let color-minor = rgb("#2196F3")
#let color-line = rgb("#E74C3C")
#let color-threshold = rgb("#E8A838")

#let items = (
  ("Function Error",  35, 350, 35),
  ("Appearance",      22, 220, 57),
  ("Missing Parts",   15, 150, 72),
  ("Ship Damage",     12, 120, 84),
  ("Manual Error",     7,  70, 91),
  ("Packaging",        5,  50, 96),
  ("Other",            4,  40, 100),
)

#let total = 1000
#let max-count = 450  // Y 轴最大值
#let threshold-idx = 4  // 前4个为关键因素（累计≤80%）

// 柱子颜色：前4个橙色，后3个蓝色
#let bar-colors = range(items.len()).map(i => {
  if i < threshold-idx { color-key } else { color-minor }
})

// X 位置
#let x-positions = range(items.len()).map(i => i + 1)

// 累积折线 Y 值（映射到左侧 Y 轴：0-100% → 0-max-count）
#let cum-y-values = items.map(it => it.at(3) / 100 * max-count)

#figure[
  #stack(dir: ltr, spacing: 16pt,
    stack(dir: ltr, spacing: 4pt, rect(width: 12pt, height: 12pt, fill: color-key, radius: 2pt), [Key Factors (80%)]),
    stack(dir: ltr, spacing: 4pt, rect(width: 12pt, height: 12pt, fill: color-minor, radius: 2pt), [Minor Factors]),
    stack(dir: ltr, spacing: 4pt, circle(radius: 3.5pt, fill: color-line, stroke: none), [Cumulative %]),
  )

  #lq.diagram(
    width: 520pt,
    height: 190pt,
    legend: none,
    xlim: (0.3, items.len() + 0.7),
    ylim: (0, max-count),
    xaxis: (
      ticks: range(items.len()).map(i => {
        let it = items.at(i)
        (i + 1, [#text(size: 6.5pt)[#it.at(0)\ (#{ str(it.at(1)) }%)]])
      }),
      subticks: none,
    ),
    yaxis: (
      ticks: ((0, "0"), (100, "100"), (200, "200"), (300, "300"), (400, "400")),
      subticks: none,
      label: text(size: 7pt)[Complaint Count],
    ),

    // 80% 参考线（虚线）
    lq.plot(
      (0.3, items.len() + 0.7),
      (0.8 * max-count, 0.8 * max-count),
      stroke: (paint: color-threshold, thickness: 1.5pt, dash: "dashed"),
    ),

    // 80% 标注（放在虚线左上方，避免遮挡柱子数值）
    lq.place(0.5, 0.8 * max-count + 10,
      text(size: 6pt, fill: color-threshold, weight: "bold")[80% Key Factor Line]),

    // 柱状图
    lq.bar(
      x-positions,
      items.map(it => it.at(2)),
      fill: bar-colors,
      width: 70%,
      label: none,
    ),

    // 柱子上方数值标注
    ..items.enumerate().map(((i, it)) => {
      let count = it.at(2)
      let col = if i < threshold-idx { color-key } else { color-minor }
      lq.place(i + 1, count + 10,
        text(size: 7pt, weight: "bold", fill: col)[#{ str(count) }])
    }),

    // 累积折线
    lq.plot(
      x-positions.map(x => float(x)),
      cum-y-values,
      stroke: 2pt + color-line,
      mark: "o",
      mark-size: 4pt,
    ),

    // 累积百分比标注（折线点上方）
    ..items.enumerate().map(((i, it)) => {
      let cum-pct = it.at(3)
      let cum-y = cum-pct / 100 * max-count
      lq.place(i + 1, cum-y + 14,
        text(size: 6pt, fill: color-line.darken(10%), weight: "bold")[#{ str(cum-pct) }%])
    }),
  )

  #align(right)[2025 Q4 – Customer Complaint Attribution (Total: #{ str(total) } cases)]
]

#block(
  width: 100%,
  inset: (x: 12pt, y: 6pt),
  radius: 4pt,
  fill: rgb("#FFF8F0"),
  stroke: (left: 3pt + color-line),
)[
  *Key Finding:* Top 4 issues account for 84% of complaints – prioritize resolution \
  _Action: Enhance QC process, optimize logistics packaging, improve parts checklist verification_
]
