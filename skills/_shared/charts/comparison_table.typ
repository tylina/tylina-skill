#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 解决方案对比评估

// 方案配色
#let col-a = rgb("#7C4DFF")   // 紫色
#let col-b = rgb("#26C6A0")   // 绿色（推荐）
#let col-c = rgb("#29B6F6")   // 蓝色

// 星级评分辅助函数
#let stars(filled, total: 5) = {
  let filled-star = text(fill: rgb("#FFA726"))[★]
  let empty-star = text(fill: rgb("#DDD"))[☆]
  range(total).map(i => if i < filled { filled-star } else { empty-star }).join()
}

// 单元格样式：普通行
#let cell-bg = rgb("#F7F8FA")
// 推荐列高亮边框
#let highlight-stroke = 1.5pt + col-b

// 数据定义
#let dimensions = (
  ("部署成本\n\n\n",   ("¥500万", "偏高", rgb("#E65100")),   ("¥180万", "最优", col-b),         ("¥80万/年", "中等", rgb("#FF7043"))),
  ("数据安全",   (stars(5),),                          (stars(4),),                        (stars(3),)),
  ("弹性扩展",   (stars(2),),                          (stars(5),),                        (stars(5),)),
  ("上线周期",   ("6-12个月",),                        ("3-5个月",),                       ("1-2个月",)),
  ("定制化程度", (stars(5),),                          (stars(4),),                        (stars(2),)),
)

// 单个数据单元格
#let data-cell(data, is-highlight: false) = {
  let content = if data.len() >= 3 {
    // 有主值 + 标签 + 标签色
    let (value, label, label-col) = data
    align(center)[
      #text(size: 14pt, weight: "bold")[#value]
      #v(1pt)
      #text(size: 8pt, fill: label-col)[#label]
    ]
  } else {
    // 仅有值（如星级）
    align(center, text(size: 12pt, data.at(0)))
  }
  let cell-stroke = if is-highlight { highlight-stroke } else { 0.5pt + rgb("#EEEEEE") }
  rect(
    width: 100%, inset: (x: 8pt, y: 10pt),
    fill: if is-highlight { col-b.lighten(95%) } else { white },
    stroke: cell-stroke,
    radius: 6pt,
  )[#content]
}

// 维度标签单元格
#let dim-cell(label) = {
  rect(
    width: 100%, inset: (x: 8pt, y: 10pt),
    fill: cell-bg,
    stroke: 0.5pt + rgb("#EEEEEE"),
    radius: 6pt,
  )[
    #align(center, text(size: 11pt, fill: rgb("#555"))[#label])
  ]
}

#figure[
  #pad(x: 16pt)[
    // 表头行
    #grid(
      columns: (1.2fr, 1.5fr, 1.5fr, 1.5fr),
      column-gutter: 6pt,
      row-gutter: 12pt,
      // 评估维度标签
      rect(width: 100%, height: 50pt, inset: (x: 8pt, y: 10pt), fill: cell-bg, stroke: 0.5pt + rgb("#EEE"), radius: 6pt)[
        #align(center, text(size: 11pt, fill: rgb("#888"))[评估维度])
      ],
      // 方案 A
      rect(width: 100%, height: 50pt, inset: (x: 8pt, y: 8pt), fill: col-a, radius: 6pt)[
        #align(center)[
          #text(size: 12pt, weight: "bold", fill: white)[方案 A]
          #v(1pt)
          #text(size: 8pt, fill: white.darken(10%))[自建私有化部署]
        ]
      ],
      // 方案 B（推荐）
      stack(dir: ttb,
        place(
          dy: -2pt, block(width: 100%, align(center, box(inset: (x: 8pt, y: 2pt), fill: rgb("#FF9800"), radius: 8pt)[
          #text(size: 7pt, weight: "bold", fill: white)[推荐]
        ]))),
        rect(width: 100%, height: 50pt, inset: (x: 8pt, y: 8pt), fill: col-b, radius: 6pt)[
          #align(center)[
            #text(size: 12pt, weight: "bold", fill: white)[方案 B]
            #v(1pt)
            #text(size: 8pt, fill: white.darken(10%))[混合云架构]
          ]
        ],
      ),
      // 方案 C
      rect(width: 100%, height: 50pt, inset: (x: 8pt, y: 8pt), fill: col-c, radius: 6pt)[
        #align(center)[
          #text(size: 12pt, weight: "bold", fill: white)[方案 C]
          #v(1pt)
          #text(size: 8pt, fill: white.darken(10%))[纯SaaS订阅]
        ]
      ],
      ..for (dim-name, data-a, data-b, data-c) in dimensions {
        (
          dim-cell(dim-name),
          data-cell(data-a),
          data-cell(data-b, is-highlight: true),
          data-cell(data-c),
        )
      },
      dim-cell("综合评分"),
      rect(width: 100%, inset: (x: 8pt, y: 8pt), fill: white, stroke: 0.5pt + rgb("#EEE"), radius: 6pt)[
        #align(center, text(size: 20pt, weight: "bold", fill: col-a)[72])
      ],
      rect(width: 100%, inset: (x: 8pt, y: 8pt), fill: col-b.lighten(95%), stroke: highlight-stroke, radius: 6pt)[
        #align(center, text(size: 20pt, weight: "bold", fill: col-b)[91])
      ],
      rect(width: 100%, inset: (x: 8pt, y: 8pt), fill: white, stroke: 0.5pt + rgb("#EEE"), radius: 6pt)[
        #align(center, text(size: 20pt, weight: "bold", fill: col-c)[68])
      ],
    )
  ]
]
