#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas.with(length: 1pt),
  cover: cetz.draw.hide.with(bounds: true),
)

== 战略能力金字塔

// 从底部（最宽）到顶部（最窄）排列
#let layers = (
  ("基础运营体系", "精细化运营管理，全球化供应链", rgb("#FFB74D")),
  ("技术研发能力", "500+核心专利，深厚技术积累", rgb("#4DB6AC")),
  ("品牌影响力", "打造行业领先品牌认知与忠诚", rgb("#64B5F6")),
  ("创新驱动", "构建持续创新机制与商业模式", rgb("#9575CD")),
  ("愿景引领", "确立行业地位与长期方向", rgb("#7E57C2")),
)

#let pyramid-bot-w = 340
#let pyramid-top-w = 0
#let pyramid-h = 300
#let n = layers.len()
#let gap = 4
#let step-h = (pyramid-h - gap * (n - 1)) / n
#let delta = (pyramid-bot-w - pyramid-top-w) / n
#let cx = pyramid-bot-w / 2
#let card-x-start = pyramid-bot-w + 40
#let card-w = 280
#let card-h = step-h - 2

#figure[
  #cetz-canvas({
    import cetz.draw: *

    // 绘制金字塔层
    for i in range(n) {
      let (name, _, col) = layers.at(i)
      let bot-w = pyramid-bot-w - i * delta
      let top-w = pyramid-bot-w - (i + 1) * delta
      let y-bot = i * (step-h + gap)
      let y-top = y-bot + step-h

      line(
        (cx - bot-w / 2, y-bot),
        (cx + bot-w / 2, y-bot),
        (cx + top-w / 2, y-top),
        (cx - top-w / 2, y-top),
        close: true,
        fill: col,
        stroke: none,
      )

          let cy = (y-top + y-bot) / 2
          // 顶层文字缩小并下移，避免被塔尖截断
          let text-y = if i == n - 1 { cy - 12 } else { cy }
          let text-sz = if i == n - 1 { 9pt } else { 11pt }
          content((cx, text-y),
            text(size: text-sz, weight: "bold", fill: white)[#name],
            anchor: "center")
    }

    // 虚线 + 右侧说明卡片（在同一个 canvas 中绘制，确保对齐）
    for i in range(n) {
      let (label, desc, col) = layers.at(i)
      let bot-w = pyramid-bot-w - i * delta
      let y-bot = i * (step-h + gap)
      let cy = y-bot + step-h / 2
      let right-edge = cx + bot-w / 2

      // 虚线从金字塔右边缘到卡片左边缘
      line(
        (right-edge + 4, cy),
        (card-x-start - 4, cy),
        stroke: (paint: rgb("#CCCCCC"), thickness: 0.6pt, dash: "dashed"),
      )

      // 右侧说明卡片
      let card-y-bot = y-bot + 1
      let card-y-top = y-bot + card-h
      rect(
        (card-x-start, card-y-bot),
        (card-x-start + card-w, card-y-top),
        fill: rgb("#FAFAFA"),
        stroke: none,
        radius: 0.15,
      )
      // 左侧色条
      line(
        (card-x-start, card-y-bot + 2),
        (card-x-start, card-y-top - 2),
        stroke: 3pt + col,
      )
      // 卡片文字
      content((card-x-start + 14, cy + 6),
        text(size: 10pt, weight: "bold", fill: rgb("#333"))[#label],
        anchor: "west")
      content((card-x-start + 14, cy - 8),
        text(size: 7.5pt, fill: rgb("#777"))[#desc],
        anchor: "west")
    }
  })

  #align(right)[层级越高代表战略价值越大，底层是上层的支撑基础]
]
