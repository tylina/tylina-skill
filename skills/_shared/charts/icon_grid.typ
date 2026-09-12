#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 核心产品功能

#let features = (
  ("≡", "智能数据分析", "Smart Analytics", rgb("#7E57C2"),
    "基于AI的多维数据分析引擎，自动发现趋势与异常，生成可视化洞察报告", "核心"),
  ("◎", "实时多人协作", "Real-time Collaboration", rgb("#42A5F5"),
    "支持团队成员同时在线编辑，实时同步变更、内置评论与版本回溯功能", "核心"),
  ("⊡", "安全与合规", "Security & Compliance", rgb("#66BB6A"),
    "企业级数据加密、权限管理，符合SOC2/GDPR等国际标准，审计日志完整留痕", "保障"),
  ("▷", "自动化工作流", "Workflow Automation", rgb("#FFA726"),
    "可视化流程编排，无代码配置触发条件与动作，消除重复性人工操作", "效率"),
  ("⊞", "开放API集成", "Open API Integration", rgb("#EF5350"),
    "提供200+标准API接口，支持主流SaaS/ERP/CRM系统无缝对接", "扩展"),
  ("◉", "智能报表中心", "Smart Reporting", rgb("#9C27B0"),
    "一键生成多维度数据报表，支持定时推送与自定义仪表板，辅助管理层决策", "洞察"),
)

#let feature-card(icon, title, en, col, desc, tag) = {
  rect(
    width: 100%, inset: 0pt,
    fill: rgb("#FAFAFA"),
    stroke: (top: 3pt + col, rest: 0.5pt + rgb("#E8E8E8")),
    radius: (bottom-left: 8pt, bottom-right: 8pt),
  )[
    #pad(12pt)[
      #set align(left)
      // 图标 + 标题
      #grid(columns: (auto, 1fr), column-gutter: 10pt,
        align(horizon,
          box(width: 36pt, height: 36pt, radius: 8pt, fill: col.lighten(88%))[
            #set align(center + horizon)
            #text(size: 24pt, fill: col, baseline: -.1em)[#icon]
          ]
        ),
        stack(
          spacing: 10pt,
          v(6pt),
          text(size: 12pt, weight: "bold", fill: rgb("#333"))[#title],
          text(size: 8pt, fill: col)[#en],
        ),
      )
      // 描述
      #text(size: 9pt, fill: rgb("#666"))[#desc]

      // 标签
      #box(inset: (x: 8pt, y: 3pt), radius: 10pt,
        stroke: 0.5pt + col, fill: col.lighten(92%),
      )[#text(size: 7pt, fill: col)[#tag]]
    ]
  ]
}

#figure[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 12pt,
    ..features.map(f => feature-card(..f))
  )
]
