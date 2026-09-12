#import "@preview/touying:0.7.4": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 客户生命周期旅程

#let steps = (
  ("品牌认知", "广告触达用户", rgb("#7E57C2")),
  ("兴趣激发", "内容种草引导", rgb("#42A5F5")),
  ("考虑对比", "产品评测对比", rgb("#78909C")),
  ("首次购买", "下单转化", rgb("#26A69A")),
  ("使用体验", "产品交付使用", rgb("#66BB6A")),
  ("售后服务", "问题响应解决", rgb("#FFA726")),
  ("忠诚复购", "二次购买转化", rgb("#42A5F5")),
  ("口碑传播", "裂变推荐新客", rgb("#EF5350")),
)

#let fmt-num(n) = {
  if n < 10 { "0" + str(n) } else { str(n) }
}

#figure[
  #pad(x: 20pt, diagram(
    node-stroke: none,
    spacing: (28pt, 16pt),
    {
      // === 第一行：左到右 (步骤 1-4) ===
      for i in range(4) {
        let (title, sub, col) = steps.at(i)
        // 圆形编号节点
        node(
          (i, 0),
          text(size: 16pt, weight: "bold", fill: white, fmt-num(i + 1)),
          shape: circle,
          width: 52pt, height: 52pt,
          fill: col,
          stroke: 2.5pt + col.lighten(40%),
        )
        // 标签节点（放在圆形下方）
        node(
          (i, 1),
          align(center)[
            #text(size: 11pt, weight: "bold", fill: rgb("#333"))[#title]
            #v(1pt)
            #text(size: 8pt, fill: rgb("#888"))[#sub]
          ],
          stroke: none, fill: none,
          width: 110pt,
        )
      }

      // 第一行水平箭头
      for i in range(3) {
        edge((i, 0), (i + 1, 0), "-|>", stroke: 1.2pt + rgb("#CCCCCC"))
      }

      // === 右侧弧线：从步骤 4 到步骤 5（往右弯） ===
      edge((3, 0), (3, 3), "-|>", stroke: 1.2pt + rgb("#CCCCCC"), bend: 50deg)

      // === 第二行：右到左 (步骤 5-8) ===
      for i in range(4) {
        let step-idx = 4 + i   // 4,5,6,7
        let col-idx = 3 - i    // 3,2,1,0
        let (title, sub, col) = steps.at(step-idx)
        // 圆形编号节点
        node(
          (col-idx, 3),
          text(size: 16pt, weight: "bold", fill: white, fmt-num(step-idx + 1)),
          shape: circle,
          width: 52pt, height: 52pt,
          fill: col,
          stroke: 2.5pt + col.lighten(40%),
        )
        // 标签节点（放在圆形下方）
        node(
          (col-idx, 4),
          align(center)[
            #text(size: 11pt, weight: "bold", fill: rgb("#333"))[#title]
            #v(1pt)
            #text(size: 8pt, fill: rgb("#888"))[#sub]
          ],
          stroke: none, fill: none,
          width: 110pt,
        )
      }

      // 第二行水平箭头（从右到左）
      for i in range(3) {
        edge((3 - i, 3), (2 - i, 3), "-|>", stroke: 1.2pt + rgb("#CCCCCC"))
      }

      // === 底部弧线：从步骤 8 向左下延伸再向右（绕过标签） ===
      edge((0, 3), (0, 6), "-", stroke: 1.2pt + rgb("#CCCCCC"), bend: -60deg)
      edge((0, 6), (3, 6), "-|>", stroke: 1.2pt + rgb("#CCCCCC"))
    }
  ))

  #v(-10pt)

  // 底部总结
  #rect(
    width: 80%, inset: 6pt,
    fill: rgb("#F5F5F5"),
    stroke: 0.5pt + rgb("#E0E0E0"),
    radius: 8pt,
  )[
    #set align(center)
    #text(size: 12pt, weight: "bold")[全生命周期闭环]
    #v(2pt)
    #text(size: 9pt, fill: rgb("#666"))[从品牌认知到口碑传播，形成自增长飞轮，平均客户 LTV 提升 3.2 倍]
  ]
]
