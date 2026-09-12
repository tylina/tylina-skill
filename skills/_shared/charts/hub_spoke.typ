#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 智慧企业能力中台

#let spokes = (
  ("用户体验", "低代码+设计系统", rgb("#7E57C2")),
  ("数据能力", "数据湖+实时分析", rgb("#26A69A")),
  ("AI引擎", "模型训练+推理服务", rgb("#FFA726")),
  ("业务引擎", "工作流+规则引擎", rgb("#42A5F5")),
  ("集成能力", "API网关+消息总线", rgb("#EF5350")),
  ("安全能力", "IAM+零信任架构", rgb("#9C27B0")),
)

#figure[
  #cetz.canvas(length: 22pt, {
    import cetz.draw: *

    let center = (0, 0)
    let hub-r = 2.0
    let spoke-r = 6.0
    let node-r = 1.5
    let n = spokes.len()

    // 辐射连线
    for i in range(n) {
      let angle = 90deg - i * 360deg / n
      let sx = spoke-r * calc.cos(angle)
      let sy = spoke-r * calc.sin(angle)
      let col = spokes.at(i).at(2)
      line(center, (sx, sy), stroke: 1pt + col.lighten(60%))
    }

    // 虚线外圈
    circle(center, radius: spoke-r - 1.0, stroke: (paint: rgb("#E0E0E0"), thickness: 0.8pt, dash: "dashed"), fill: none)

    // 中心 Hub
    circle(center, radius: hub-r, fill: rgb("#1565C0"), stroke: 3pt + rgb("#1565C0").lighten(40%))
    content((0, 0.0), text(size: 16pt, weight: "bold", fill: white)[智慧\ 中台])

    // 外围节点
    for i in range(n) {
      let angle = 90deg - i * 360deg / n
      let sx = spoke-r * calc.cos(angle)
      let sy = spoke-r * calc.sin(angle)
      let (label, sub, col) = spokes.at(i)

      // 节点框
      let box-w = 6.0
      let box-h = 2.0
      rect(
        (sx - box-w / 2, sy - box-h / 2),
        (sx + box-w / 2, sy + box-h / 2),
        fill: white,
        stroke: 1pt + col.lighten(40%),
        radius: 0.3,
      )

      // 小圆标识
      circle((sx - box-w / 2 + 0.6, sy + 0.2), radius: 0.4, fill: col, stroke: none)

      // 文字
      content((sx + 0.4, sy + 0.4), text(size: 14pt, weight: "bold", fill: rgb("#333"))[#label])
      content((sx + 0.4, sy - 0.4), text(size: 11pt, fill: rgb("#888"))[#sub])
    }
  })

  #align(right)[核心中台连接六大能力域，形成统一的企业数字化底座]
]
