#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": sankey-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

// 桑基图：使用 primaviz 包绘制
// 布局：收入源 → 部门 → 支出类型
// 总预算 $100M
// 节点索引：0-2 收入源, 3-6 部门, 7-10 支出类型

== Annual Budget Allocation Flow

#align(center)[
  #sankey-chart(
    (
      nodes: (
        "Product Sales", "Service Revenue", "Investment",
        "R&D", "Sales & Marketing", "Operations", "Admin",
        "Personnel", "Marketing Spend", "Infrastructure", "Other",
      ),
      flows: (
        // Revenue → Department
        (from: 0, to: 3, value: 25),
        (from: 0, to: 4, value: 20),
        (from: 0, to: 5, value: 15),
        (from: 1, to: 3, value: 10),
        (from: 1, to: 4, value: 5),
        (from: 1, to: 5, value: 10),
        (from: 1, to: 6, value: 5),
        (from: 2, to: 6, value: 10),
        // Department → Expense
        (from: 3, to: 7, value: 25),
        (from: 3, to: 9, value: 10),
        (from: 4, to: 7, value: 10),
        (from: 4, to: 8, value: 15),
        (from: 5, to: 7, value: 10),
        (from: 5, to: 8, value: 5),
        (from: 5, to: 9, value: 10),
        (from: 6, to: 10, value: 15),
      ),
    ),
    show-values: true,
    title: none,
    width: 800pt,
    height: 240pt,
    theme: (
      palette: (
        rgb("#2196F3"), rgb("#00BCD4"), rgb("#E91E63"),
        rgb("#4CAF50"), rgb("#FF9800"), rgb("#9C27B0"), rgb("#607D8B"),
        rgb("#3F51B5"), rgb("#F44336"), rgb("#009688"), rgb("#795548"),
      ),
      background: none,
    ),
  )

  #grid(columns: (1fr,) * 4, gutter: 12pt,
    ..for (lbl, value, col) in (
      ("Total Revenue", "$100M", rgb("#2196F3")),
      ("Largest Dept", "R&D 35%", rgb("#4CAF50")),
      ("Personnel Cost", "45%", rgb("#3F51B5")),
      ("Efficiency", "1.2x", rgb("#FF9800")),
    ) {
      (box(inset: (x: 12pt, y: 5pt), radius: 4pt, fill: col.lighten(90%), stroke: 0.5pt + col)[
        #text(fill: col, weight: "bold")[#lbl]\ *#value*
      ],)
    }
  )

  #align(right)[2025 FY — Total Budget: \$100M]
]