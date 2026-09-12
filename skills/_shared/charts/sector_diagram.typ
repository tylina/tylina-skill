#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 企业服务生态体系

#let sectors = (
  ("数据智能", "AI分析引擎 · 实时洞察与预测", rgb("#26A69A")),
  ("技术研发", "全栈技术能力 · 云原生+微服务", rgb("#42A5F5")),
  ("客户成功", "专属客户经理 · 7×24响应保障", rgb("#EF5350")),
  ("生态集成", "200+ API接口 · 主流系统无缝对接", rgb("#FFA726")),
  ("培训赋能", "线上线下培训 · 认证体系与知识库", rgb("#9C27B0")),
  ("安全合规", "等保三级认证 · SOC2/GDPR/ISO27001", rgb("#78909C")),
)

#figure[
  #cetz.canvas(length: 26pt, {
    import cetz.draw: *

    let center = (0, -0.3)
    let hub-r = 1.8
    let spoke-r = 4.8
    let n = sectors.len()

    // 辐射连线
    for i in range(n) {
      let angle = 90deg - i * 360deg / n
      let sx = spoke-r * calc.cos(angle)
      let sy = center.at(1) + spoke-r * calc.sin(angle)
      let col = sectors.at(i).at(2)
      line(center, (sx, sy), stroke: 0.8pt + col.lighten(60%))
    }

    // 中心节点
    circle(center, radius: hub-r, fill: rgb("#1A237E"), stroke: 3pt + rgb("#1A237E").lighten(50%))
    content((0, -.3), text(size: 16pt, weight: "bold", fill: white)[核心\ 平台])

    // 外围节点
    for i in range(n) {
      let angle = 90deg - i * 360deg / n
      let sx = spoke-r * calc.cos(angle)
      let sy = center.at(1) + spoke-r * calc.sin(angle)
      let (label, sub, col) = sectors.at(i)

      // 彩色圆
      circle((sx, sy), radius: 1.3, fill: col, stroke: none)
      content((sx, sy), text(size: 14pt, weight: "bold", fill: white)[#label])

      // 说明卡片（偏移到外侧）
      let card-x = sx + (if sx >= 0 { 2.4 } else { -2.4 })
      let card-y = sy
      let anchor = if sx >= 0 { "west" } else { "east" }

      content(
        (card-x, card-y),
        anchor: anchor,
        box(width: 140pt, inset: 4pt, fill: white, stroke: 0.5pt + rgb("#E0E0E0"))[
          #text(size: 14pt, weight: "bold", fill: rgb("#333"))[#label]
          #v(0pt)
          #text(size: 10pt, fill: col)[#sub]
        ]
      )
    }
  })

  #align(right)[六大核心服务能力环绕中心平台]
]
