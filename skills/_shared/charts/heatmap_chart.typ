#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": heatmap

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 用户活跃度热力图

#let days = ("周一", "周二", "周三", "周四", "周五", "周六", "周日")
#let time-slots = ("6-9时", "9-12时", "12-14时", "14-17时", "17-19时", "19-21时", "21-23时", "23-6时")

#let data = (
  (35, 42, 40, 38, 28, 15, 10),
  (58, 65, 72, 68, 55, 45, 38),
  (75, 82, 88, 80, 70, 60, 65),
  (55, 62, 68, 60, 48, 72, 78),
  (32, 35, 38, 35, 28, 65, 70),
  (78, 85, 88, 86, 80, 95, 98),
  (62, 70, 72, 68, 65, 85, 82),
  (18, 15, 12, 15, 22, 35, 28),
)

#let all-values = data.flatten()
#let max-val = calc.max(..all-values)
#let min-val = calc.min(..all-values)
#let avg = calc.round(all-values.sum() / all-values.len())

#let max-row = 0
#let max-col = 0
#for (ri, row) in data.enumerate() {
  for (ci, val) in row.enumerate() {
    if val == max-val { max-row = ri; max-col = ci }
  }
}
#let min-row = 0
#let min-col = 0
#for (ri, row) in data.enumerate() {
  for (ci, val) in row.enumerate() {
    if val == min-val { min-row = ri; min-col = ci }
  }
}

#cols(columns: (auto, 1fr))[
  #heatmap(
    (rows: time-slots, cols: days, values: data),
    cell-size: 30pt,
    show-values: true,
    title: none,
    theme: (background: none, border-color: none),
  )
][
  #box(width: 100%, inset: 10pt, stroke: 0.5pt + rgb("#E0E0E0"), radius: 4pt)[
    *统计摘要*

    #text(fill: rgb("#E74C3C"))[🔺 峰值] #{ days.at(max-col) } #{ time-slots.at(max-row) } (#{ str(max-val) }K)

    #text(fill: rgb("#4A90D9"))[🔻 谷值] #{ days.at(min-col) } #{ time-slots.at(min-row) } (#{ str(min-val) }K)

    #text(fill: rgb("#F5A623"))[📊 均值] #{ str(avg) }K
  ]

  #block(width: 100%, inset: 10pt, stroke: 0.5pt + rgb("#7EC87E"), radius: 4pt, fill: rgb("#7EC87E").lighten(92%))[
    - 周末晚间活跃度最高
    - 工作日午间有小高峰
    - 凌晨时段流量最低

    _建议: 周末晚间增加服务器_
  ]

  按星期和时段统计 · 数值代表平均在线用户数（千人）
]
