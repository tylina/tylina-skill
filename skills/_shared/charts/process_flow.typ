#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/merman:0.1.0": show-mermaid-blocks

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

// 支持 markdown-like Mermaid 语法
#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 100%)

== 业务流程图

#align(horizon)[
  #figure[
    ```mermaid
    graph LR
      A([开始]) --> B[需求收集 · 1-2天]
      B --> C{是否可行?}
      C -->|是| D[方案设计 · 3-5天]
      C -->|否| E[重新评估]
      E -.->|调整需求| B
      D --> F[开发实施 · 7-14天]
      F --> G[测试验收 · 2-3天]
      G --> H([完成])
    ```

    #align(right)[总周期: *13-24天* · 步骤: *4个* · 决策: *1个* · 风险: *低*]
  ]
]
