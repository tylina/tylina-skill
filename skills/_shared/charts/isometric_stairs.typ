#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cetz:0.5.2"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 数字化转型六阶段

#let stage-colors = (rgb("#EF5350"), rgb("#FFA726"), rgb("#FFCA28"), rgb("#66BB6A"), rgb("#42A5F5"), rgb("#7E57C2"))

#let stage-labels = (
  ("基础信息化", "IT基础设施建设"),
  ("流程数字化", "核心业务在线化"),
  ("数据驱动", "决策数据化运营"),
  ("智能赋能", "AI+业务深度融合"),
  ("生态连接", "产业链协同平台"),
  ("全面引领", "行业标准制定者"),
)

// 3D isometric cuboid component
#let iso-cuboid(w: 130, d: 80, h: 40, color: blue) = {
  cetz.canvas(length: 1pt, {
    import cetz.draw: *
    ortho(x: 10deg, y: 60deg, {
      let top-color = color.lighten(15%)
      let front-color = color
      let side-color = color.darken(25%)
      line((0, 0, d), (w, 0, d), (w, h, d), (0, h, d), close: true, fill: front-color, stroke: 0.5pt + white)
      line((0, h, 0), (w, h, 0), (w, h, d), (0, h, d), close: true, fill: top-color, stroke: 0.5pt + white)
      line((w, 0, 0), (w, 0, d), (w, h, d), (w, h, 0), close: true, fill: side-color, stroke: 0.5pt + white)
    })
  })
}

// Step offset: tuned to eliminate gaps between cuboids
// In isometric projection (35.264°, 45°), a cuboid with w=130 projects to:
//   horizontal shift ≈ 0.707 * w ≈ 92pt, vertical shift ≈ 0.408 * w + 0.816 * h ≈ 86pt
// But canvas bounding box adds padding, so we need empirical tuning.
#let dx = 68pt
#let dy = 44pt

#figure[
  #v(-60pt)
  #box(width: 780pt, height: 340pt)[
    // Place cuboids: back (i=5) first, front (i=0) last for correct overlap
    #for j in range(6) {
      let i = 5 - j
      let x = 5pt + i * dx
      let y = 390pt - 100pt - i * dy
      place(dx: x, dy: y, iso-cuboid(color: stage-colors.at(i)))

      // Number centered on top face
      place(dx: x + 26pt, dy: y + 26pt,
        text(size: 22pt, weight: "bold", fill: white)[#{ i + 1 }]
      )

      // Text label: to the right of the front face, clear of next step's side
      let (title, sub) = stage-labels.at(i)
      place(dx: x + dx + 80pt, dy: y + 30pt,
        align(left)[
          #text(size: 14pt, weight: "bold", fill: rgb("#333"))[#title] \
          #text(size: 12pt, fill: rgb("#999"))[#sub]
        ]
      )
    }

    // Vertical arrow on the right
    #place(dx: 748pt, dy: 20pt)[
      #cetz.canvas(length: 1pt, {
        import cetz.draw: *
        line((0, 0), (0, 280), stroke: 1.5pt + rgb("#BDBDBD"), mark: (end: "stealth", fill: rgb("#BDBDBD")))
      })
    ]
    #place(dx: 756pt, dy: 100pt, text(size: 16pt, fill: rgb("#999"), tracking: 3pt)[#stack(dir: ttb, spacing: 2pt, ..("数字化成熟度").clusters().map(c => c))])
  ]

  #align(right, text(size: 14pt, fill: rgb("#666"))[从基础信息化到全面引领，六大阶梯逐步构建企业数字化核心竞争力])
]
