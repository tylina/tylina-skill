#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 选择适合的方案

#let color-basic = rgb("#7E57C2")
#let color-pro = rgb("#26A69A")
#let color-ent = rgb("#455A64")

#let tiers = (
  (
    name: "基础版", sub: "适合个人与小团队",
    price: "¥99", period: "/月", col: color-basic, recommended: false,
    features: (
      (true, "5个项目空间"), (true, "10GB存储"), (true, "基础报表功能"), (true, "邮件支持"),
      (false, "API集成"), (false, "自定义工作流"), (false, "专属客户经理"), (false, "SLA保障"),
    ),
    cta: "开始使用",
  ),
  (
    name: "专业版", sub: "适合成长型企业",
    price: "¥399", period: "/月", col: color-pro, recommended: true,
    features: (
      (true, "无限项目空间"), (true, "100GB存储"), (true, "高级报表 + 仪表板"), (true, "优先工单支持"),
      (true, "API集成"), (true, "自定义工作流"), (false, "专属客户经理"), (false, "SLA保障"),
    ),
    cta: "立即升级",
  ),
  (
    name: "企业版", sub: "适合大型组织",
    price: "联系销售", period: "", col: color-ent, recommended: false,
    features: (
      (true, "无限项目空间"), (true, "无限存储"), (true, "全部报表 + BI分析"), (true, "7×24电话支持"),
      (true, "API集成 + Webhook"), (true, "自定义工作流"), (true, "专属客户经理"), (true, "99.9% SLA保障"),
    ),
    cta: "联系我们",
  ),
)

#let pricing-column(tier) = {
  let is-rec = tier.recommended
  let col = tier.col
  let elevation = if is-rec { 1pt + col } else { 0.5pt + rgb("#E0E0E0") }

  rect(
    width: 100%, inset: 0pt,
    fill: white,
    stroke: elevation,
    radius: 12pt,
  )[
    // 推荐标签
    #if is-rec {
      place(
        block(width: 100%, align(center, pad(top: -1pt,
          box(inset: (x: 12pt, y: 4pt), radius: (bottom-left: 8pt, bottom-right: 8pt), fill: col)[
            #text(size: 8pt, fill: white, weight: "bold")[最受欢迎]
          ]
        )))
      )
    }

    #v(20pt)

    #pad(x: 16pt, bottom: 16pt)[
      // 头部
      #stack(
        align(center)[
          #rect(width: 100%, inset: 12pt, fill: if is-rec { col } else { col.lighten(90%) }, radius: 8pt)[
            #text(size: 14pt, weight: "bold", fill: if is-rec { white } else { col })[#tier.name]
            #v(0pt)
            #text(size: 8pt, fill: if is-rec { white.darken(10%) } else { rgb("#888") })[#tier.sub]
            #v(-4pt)
            #text(size: 28pt, weight: "bold", fill: if is-rec { white } else { rgb("#333") })[#tier.price]
            #text(size: 10pt, fill: if is-rec { white.darken(15%) } else { rgb("#999") })[#tier.period]
          ]
        ],
        line(length: 100%, stroke: 0.5pt + rgb("#EEEEEE")),
      )
      #v(-8pt)

      // 功能列表
      #stack(dir: ttb, spacing: 6pt,
        ..tier.features.map(f => {
          let (enabled, label) = f
          let icon-col = if enabled { col } else { rgb("#CCCCCC") }
          stack(dir: ltr, spacing: 8pt,
            text(size: 10pt, fill: icon-col)[#if enabled [✓] else [—]],
            text(size: 10pt, fill: if enabled { rgb("#333") } else { rgb("#BBBBBB") })[#label],
          )
        })
      )

      // CTA 按钮
      #align(center,
        rect(
          width: 80%, inset: (y: 8pt),
          fill: if is-rec { col } else { white },
          stroke: 1pt + col,
          radius: 20pt,
        )[
          #set align(center)
          #text(size: 11pt, weight: "bold", fill: if is-rec { white } else { col })[#tier.cta]
        ]
      )
    ]
  ]
}

#figure[
  #cols(columns: (1fr, 1.1fr, 1fr), gutter: 16pt,
    ..tiers.map(t => pricing-column(t))
  )

  #align(right)[所有方案均含14天免费试用 · 支持随时升降级]
]
