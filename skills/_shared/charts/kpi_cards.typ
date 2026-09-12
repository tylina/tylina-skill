#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 关键业绩指标

#let color-up = rgb("#4CAF50")
#let color-down = rgb("#F44336")
#let card-bg = rgb("#F7F8FA")
#let card-border = rgb("#EAEDF0")

#let kpis = (
  ("总收入", "Total Revenue", "¥2.45", "亿", "+18.5%", true, "较去年同期", rgb("#2196F3")),
  ("活跃用户", "Active Users", "128.3", "万", "+12.3%", true, "月同比增长", rgb("#4CAF50")),
  ("平均客单价", "Avg Order Value", "¥432", "", "-3.2%", false, "环比上月", rgb("#F5A623")),
  ("转化率", "Conversion Rate", "8.7%", "", "+0.8%", true, "百分点提升", rgb("#9C27B0")),
)

#let kpi-card(title-cn, title-en, value, unit, change, is-up, change-desc, accent-color) = {
  let trend-color = if is-up { color-up } else { color-down }
  let trend-icon = if is-up { "▲" } else { "▼" }

  box(
    width: 100%, height: 100%,
    radius: 10pt,
    fill: card-bg,
    stroke: 0.5pt + card-border,
    clip: true,
  )[
    // 左侧彩色竖条 + 内容
    #grid(
      columns: (5pt, 1fr),
      rows: 100%,
      gutter: 0pt,
      // 彩色竖条
      rect(width: 5pt, height: 100%, fill: accent-color, radius: (left: 10pt)),
      // 卡片内容
      pad(left: 16pt, top: 16pt, bottom: 16pt, right: 16pt)[
        // 中文标题
        #text(size: 12pt, weight: "medium", fill: rgb("#333333"))[#title-cn]
        #v(1pt)
        // 英文副标题
        #text(size: 8pt, fill: rgb("#AAAAAA"))[#title-en]

        // 大数值 + 单位
        #stack(dir: ltr, spacing: 6pt,
          text(size: 32pt, weight: "bold", fill: rgb("#1A1A1A"))[#value],
          if unit != "" {
            pad(top: 6pt, text(size: 14pt, fill: rgb("#666666"))[#unit])
          },
        )

        // 趋势指标
        #stack(dir: ltr, spacing: 8pt,
          // 圆形图标背景
          box(
            width: 20pt, height: 20pt,
            radius: 10pt,
            fill: trend-color.lighten(85%),
          )[
            #set align(center + horizon)
            #text(size: 8pt, fill: trend-color)[#trend-icon]
          ],
          // 百分比
          pad(top: 6pt, text(size: 12pt, weight: "bold", fill: trend-color)[#change]),
          // 说明
          pad(top: 6pt, text(size: 9pt, fill: rgb("#999999"))[#change-desc]),
        )
      ],
    )
  ]
}

#figure[
  #block(
    width: 80%,
    height: 80%,
    grid(
      columns: (1fr, 1fr),
      rows: (1fr, 1fr),
      gutter: 16pt,
      ..kpis.map(((tcn, ten, val, unit, chg, up, desc, col)) => {
        kpi-card(tcn, ten, val, unit, chg, up, desc, col)
      })
    )
  )

  #align(right)[数据截至 2025年11月 | Data as of Nov 2025]
]
