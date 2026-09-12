#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": treemap, themes as pv-themes

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 年度预算分配总览

#figure[
  #treemap(
    (
      labels: ("薪资福利", "办公场地", "广告投放", "研发投入", "设备采购", "品牌活动", "培训发展", "招聘成本", "日常运营", "其他支出"),
      values: (336, 150, 144, 120, 90, 96, 72, 72, 60, 60),
    ),
    width: 100%,
    height: 250pt,
    title: none,
    show-values: true,
    gap: 2pt,
    theme: (
      palette: (
        rgb("#4285F4"),  // 薪资福利
        rgb("#4CAF50"),  // 办公场地
        rgb("#FF9800"),  // 广告投放
        rgb("#9C27B0"),  // 研发投入
        rgb("#66BB6A"),  // 设备采购
        rgb("#F57C00"),  // 品牌活动
        rgb("#42A5F5"),  // 培训发展
        rgb("#64B5F6"),  // 招聘成本
        rgb("#388E3C"),  // 日常运营
        rgb("#607D8B"),  // 其他支出
      ),
      background: none,
      border-color: none,
    ),
  )

  #align(right)[
    #stack(dir: ltr, spacing: 16pt,
      ..for (col, label) in (
        (rgb("#4285F4"), "人力成本 40%"),
        (rgb("#4CAF50"), "运营成本 25%"),
        (rgb("#FF9800"), "营销费用 20%"),
        (rgb("#9C27B0"), "研发投入 10%"),
        (rgb("#607D8B"), "其他支出 5%"),
      ) {
        (stack(dir: ltr, spacing: 4pt,
          rect(width: 18pt, height: 18pt, fill: col, radius: 2pt),
          [#label],
        ),)
      }
    )
  ]

  #align(right)[2025年度预算 · 总额 1,200万元 · 面积代表预算占比]
]
