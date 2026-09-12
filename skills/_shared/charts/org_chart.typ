#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/tdtr:0.6.1": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 公司组织架构图

#let color-ceo  = rgb("#2C3E50")
#let color-vp   = rgb("#4CAF50")
#let color-dept = rgb("#2196F3")

#let org-draw-node = ((label, pos, ..)) => {
  let depth = pos.i
  if depth == 0 {
    (label: text(size: 14pt)[#label],
     fill: color-ceo.lighten(80%), stroke: 1.5pt + color-ceo,
     width: 80pt, height: 42pt, corner-radius: 6pt)
  } else if depth == 1 {
    (label: text(size: 12pt)[#label],
     fill: color-vp.lighten(80%), stroke: 1.2pt + color-vp,
     width: 72pt, height: 38pt, corner-radius: 5pt)
  } else {
    (label: text(size: 11pt)[#label],
     fill: color-dept.lighten(85%), stroke: 1pt + color-dept,
     width: 64pt, height: 34pt, corner-radius: 4pt)
  }
}

#figure[
  #tidy-tree-graph(
    draw-node: (org-draw-node, (shape: rect)),
    draw-edge: (marks: "-", stroke: 0.8pt + rgb("#AAAAAA")),
    spacing: (16pt, 60pt),
    node-stroke: 0.25pt,
    compact: true,
  )[
    - *CEO*\ 张三
      - *技术VP*\ 李四
        - 前端团队\ 12人
        - 后端团队\ 15人
      - *产品VP*\ 王五
        - 产品设计\ 8人
        - 用户研究\ 5人
      - *销售VP*\ 赵六
        - 华东区\ 20人
        - 华南区\ 18人
      - *财务VP*\ 钱七
        - 财务核算\ 6人
        - 预算管理\ 4人
      - *人力VP*\ 孙八
        - 招聘培训\ 5人
        - 薪酬福利\ 3人
  ]

  #align(right)[2025年12月 · 5个VP部门]
]
