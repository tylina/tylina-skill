#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/pintorita:0.1.4"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 产品战略思维导图

#figure[
  #pintorita.render(
    style: "default",
    ```
    mindmap
    + 产品战略
    ++ 技术
    +++ 架构升级方案
    +++ AI能力集成
    +++ 安全合规建设
    ++ 产品
    +++ 用户体验优化
    +++ 功能迭代路线
    +++ 质量标准体系
    -- 市场
    --- 品牌定位策略
    --- 渠道拓展计划
    --- 竞品分析跟踪
    -- 运营
    --- 用户增长策略
    --- 供应链优化
    --- 数据驱动决策
    ```.text,
    factor: .8,
  )

  #align(right)[中心主题向四大维度发散，每个维度下展开细分子项]
]
