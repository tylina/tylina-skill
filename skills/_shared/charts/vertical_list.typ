#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 五大核心竞争优势

#let items = (
  ("品牌影响力", "BRAND", "行业领先的品牌认知度与美誉度，覆盖全国主要市场，品牌价值连续三年位居行业 TOP3", rgb("#7E57C2")),
  ("技术研发能力", "TECH", "持续高研发投入占比 15%+，拥有 500+ 核心自主专利，AI 与大数据双引擎驱动创新", rgb("#66BB6A")),
  ("供应链管理", "SUPPLY", "全球化供应链布局与智能仓储物流体系，覆盖 300+ 城市，平均交付时效缩短 40%", rgb("#42A5F5")),
  ("客户服务体系", "SERVICE", "7×24 小时快速响应机制，客户满意度持续保持在 96% 以上，NPS 行业领先", rgb("#FFA726")),
  ("创新与智能化", "INNOVATION", "AI 与大数据赋能业务决策，每年推出 10+ 创新产品与解决方案，引领行业技术变革", rgb("#EF5350")),
)

#figure[
  #stack(dir: ttb, spacing: 12pt,
    ..items.enumerate().map(((i, item)) => {
      let (title, en, desc, col) = item
      grid(columns: (32pt, 1fr, auto), column-gutter: 8pt,
        // 编号圆
        align(center + horizon,
          circle(radius: 14pt, fill: col)[
            #set align(center + horizon)
            #text(size: 14pt, weight: "bold", fill: white)[#{if i + 1 < 10 { "0" } else { "" }}#{i + 1}]
          ]
        ),
        // 内容卡片
        rect(
          width: 100%, inset: (x: 10pt, y: 6pt),
          fill: col.lighten(95%),
          stroke: (left: 2pt + col, rest: 0.5pt + rgb("#E8E8E8")),
          radius: 4pt,
        )[
          #grid(
            columns: (auto, 1fr, auto),
            [
              #set std.align(left)
              #text(size: 16pt, weight: "bold", fill: rgb("#333"))[#title]
              #v(-4pt)
              #text(size: 12pt, fill: rgb("#666"))[#desc]

            ],
            none,
            // 右侧英文标签
            align(horizon,
              text(size: 16pt, weight: "bold", fill: col.lighten(60%))[#en]
            ),
          )
        ],
      )
    })
  )

  #align(right)[左侧编号轴标注顺序，右侧卡片展开要点详情]
]
