#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": sunburst-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 产品战略优先级圈层

// 同心圆用 sunburst 的层级结构表达：中心 → 外层
#let priority-data = (
  name: "产品战略",
  value: 100,
  children: (
    (name: "核心产品", value: 60, children: (
      (name: "用户体验", value: 30),
      (name: "付费转化", value: 30),
    )),
    (name: "核心支撑", value: 25, children: (
      (name: "性能优化", value: 12),
      (name: "安全合规", value: 13),
    )),
    (name: "增长引擎", value: 10, children: (
      (name: "获客渠道", value: 5),
      (name: "商业化", value: 5),
    )),
    (name: "生态拓展", value: 5, children: (
      (name: "开放平台", value: 3),
      (name: "ISV合作", value: 2),
    )),
  ),
)

#let layer-info = (
  ("核心产品", "最高优先级", "用户核心体验功能，直接影响留存和付费转化", "投入60%资源 · 每双周迭代", rgb("#7E57C2")),
  ("核心支撑", "高优先级", "性能优化、安全合规、基础平台能力", "投入25%资源 · 月度迭代", rgb("#42A5F5")),
  ("增长引擎", "中优先级", "获客渠道建设、运营工具、商业化能力", "投入10%资源 · 季度规划", rgb("#26A69A")),
  ("生态拓展", "探索优先级", "开放平台、ISV合作、行业解决方案", "投入5%资源 · 半年度评审", rgb("#FFA726")),
)

#figure[
  #grid(columns: (1fr, 1fr), column-gutter: 16pt,
    // 左侧：primaviz sunburst 同心圆
    align(center + horizon)[
      #sunburst-chart(
        priority-data,
        size: 250pt,
        title: none,
        theme: (
          background: none,
          border-color: none,
          palette: (rgb("#7E57C2"), rgb("#42A5F5"), rgb("#26A69A"), rgb("#FFA726")),
        ),
      )
    ],
    // 右侧：说明卡片
    stack(dir: ttb, spacing: 8pt,
      ..layer-info.enumerate().map(((i, layer)) => {
        let (label, priority, desc, resource, col) = layer
        rect(
          width: 100%, inset: 10pt,
          fill: rgb("#FAFAFA"),
          stroke: (left: 3pt + col, rest: 0.5pt + rgb("#E8E8E8")),
          radius: 4pt,
        )[
          #set align(left)
          #stack(
            spacing: 10pt,
            grid(columns: (auto, 1fr), column-gutter: 8pt,
              circle(radius: 10pt, fill: col)[
                #set align(center + horizon)
                #text(size: 16pt, fill: white, weight: "bold")[#{i + 1}]
              ],
              [
                #text(size: 16pt, weight: "bold")[#label] #h(4pt)
                #text(size: 14pt, fill: col)[· #priority]
              ],
            ),
            text(size: 12pt, fill: rgb("#666"))[#desc],
            text(size: 12pt, fill: col)[#resource],
          )
        ]
      })
    ),
  )

  #place(left)[越靠近圆心优先级越高，资源投入越集中]
]
