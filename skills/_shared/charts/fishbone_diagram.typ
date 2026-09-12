#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 客户流失根因分析

#let categories = (
  ("产品", rgb("#7E57C2"), ("Bug太多", "功能缺失", "体验差")),
  ("服务", rgb("#26A69A"), ("流程繁琐", "响应慢", "态度差")),
  ("价格", rgb("#FFA726"), ("隐性收费", "性价比低", "涨价频繁")),
  ("竞品", rgb("#42A5F5"), ("切换成本低", "对手创新快", "价格战")),
  ("运营", rgb("#EF5350"), ("预警缺失", "触达不足", "续费引导差")),
  ("口碑", rgb("#9C27B0"), ("社区维护差", "负面评价多", "成功案例少")),
)

// 预构建类别标签（避免 cetz canvas 内 rect 的 radius 参数冲突）
#let cat-label(label, col) = box(
  width: 80pt, height: 28pt,
  fill: col, radius: 14pt,
)[
  #set align(center + horizon)
  #text(size: 10pt, fill: white, weight: "bold")[#label]
]

#figure[
  #cetz.canvas(length: 24pt, {
    import cetz.draw: *

    // 主骨（水平线）
    let spine-y = 0
    let spine-left = -12
    let spine-right = 12
    line((spine-left, spine-y), (spine-right, spine-y), stroke: 2.5pt + rgb("#333"))

    // 鱼头（右侧箭头）
    let head-x = spine-right - .6
    line((spine-right, 0.8), (head-x + 2, 0), stroke: 2pt + rgb("#EF5350"))
    line((spine-right, -0.8), (head-x + 2, 0), stroke: 2pt + rgb("#EF5350"))
    content((head-x + 3.8, 0), cat-label([客户流失], rgb("#EF5350")))

    // 上方 3 个分支（产品、服务、价格）
    let top-cats = categories.slice(0, 3)
    let top-x-positions = (-8, -2, 4)

    for (i, cat) in top-cats.enumerate() {
      let (label, col, causes) = cat
      let base-x = top-x-positions.at(i)

      line((base-x, spine-y), (base-x - 1.5, 4), stroke: 1.5pt + col)
      content((base-x - 2.5, 5.2), cat-label(label, col))

      for (j, cause) in causes.enumerate() {
        let cy = 1.0 + j * 1.2
        let cx = base-x - (cy / 4 * 1.5)
        line((cx - 2, cy), (cx, cy), stroke: 0.8pt + col.lighten(30%))
        content((cx - 3.8, cy), text(size: 8pt, fill: rgb("#555"))[#cause])
      }
    }

    // 下方 3 个分支（竞品、运营、口碑）
    let bot-cats = categories.slice(3)
    let bot-x-positions = (-8, -2, 4)

    for (i, cat) in bot-cats.enumerate() {
      let (label, col, causes) = cat
      let base-x = bot-x-positions.at(i)

      line((base-x, spine-y), (base-x - 1.5, -4), stroke: 1.5pt + col)
      content((base-x - 2.5, -5.2), cat-label(label, col))

      for (j, cause) in causes.enumerate() {
        let cy = -(1.0 + j * 1.2)
        let cx = base-x - (calc.abs(cy) / 4 * 1.5)
        line((cx - 2, cy), (cx, cy), stroke: 0.8pt + col.lighten(30%))
        content((cx - 3.8, cy), text(size: 8pt, fill: rgb("#555"))[#cause])
      }
    }
  })

  #align(right)[鱼骨图（石川图）：系统化梳理问题的各维度根因]
]
