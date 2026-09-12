#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": word-cloud

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 行业热点关键词

#let words-data = (
  words: (
    (text: "人工智能", weight: 100),
    (text: "大模型", weight: 85),
    (text: "数字化转型", weight: 82),
    (text: "云计算", weight: 60),
    (text: "智能制造", weight: 58),
    (text: "区块链", weight: 55),
    (text: "量子计算", weight: 40),
    (text: "数据安全", weight: 38),
    (text: "物联网", weight: 36),
    (text: "自动驾驶", weight: 35),
    (text: "元宇宙", weight: 33),
    (text: "Web3.0", weight: 32),
    (text: "边缘计算", weight: 30),
    (text: "低代码", weight: 20),
    (text: "RPA", weight: 18),
    (text: "DevOps", weight: 17),
    (text: "数字孪生", weight: 16),
    (text: "AIGC", weight: 15),
    (text: "多模态", weight: 14),
    (text: "机器学习", weight: 13),
    (text: "知识图谱", weight: 12),
    (text: "零信任", weight: 11),
    (text: "隐私计算", weight: 10),
    (text: "联邦学习", weight: 9),
    (text: "GPT", weight: 8),
  ),
)

#figure[
  #word-cloud(
    words-data,
    width: 700pt,
    height: 290pt,
    min-size: 8pt,
    max-size: 36pt,
    title: none,
    shape: "rectangle",
    theme: (
      background: none,
      border-color: none,
      palette: (
        rgb("#5C6BC0"), rgb("#26A69A"), rgb("#66BB6A"), rgb("#EF5350"),
        rgb("#FFA726"), rgb("#42A5F5"), rgb("#78909C"), rgb("#9C27B0"),
        rgb("#7E57C2"), rgb("#FF7043"),
      ),
    ),
  )

  #align(right)[数据来源: 行业报告与社交媒体分析 · 2025年度]
]
