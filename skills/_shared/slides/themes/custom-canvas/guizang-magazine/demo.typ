#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist

// The reusable theme is font-agnostic. This demo selects stacks verified with `typst fonts`.
#let display-font = ("Libertinus Serif", "Noto Serif SC", "Songti SC")
#let body-font = ("IBM Plex Sans", "PingFang SC")
#let meta-font = ("IBM Plex Mono", "PingFang SC")

// Build the active preset for Canvas-level inline treatments.
#let pal = build-palette("monocle")

#show: checklist.with(stroke: pal.ink, radius: 0.2em)

#show: magazine-theme.with(
  aspect-ratio: "16-9",
  preset: "monocle",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [AI Agent 时代的代码考古],
    subtitle: [当 Claude Code 写了 47% 的 fix commit],
    author: [归藏编辑部],
    date: datetime.today(),
    institution: [归藏杂志 GUIZANG],
  ),
)

#set text(font: display-font, size: 18pt)

// ===== Cover =====

#title-slide()
#speaker-note[开场介绍本期主题：从代码修复比例切入，讨论 Agent Harness 的真实边界。]

// ===== Dark editorial claim =====

#dark-slide(
  title: none,
  ghost: [47],
  ghost-dy: -30pt,
  ghost-dx: -10pt,
  ghost-size: 220pt,
  header-left: [数据 · 代码 · 反思],
  header-right: [GUIZANG AGENT ISSUE 2025],
)[
  #stack(
    spacing: .8em,
    text(size: 44pt, weight: 300)[47% 的 commit 都是 fix。],
    text(
      size: 9pt,
      weight: "medium",
      tracking: 1.8pt,
      fill: pal.paper.transparentize(40%),
      font: meta-font,
    )[COMMIT 统计],
    grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 16pt,
      stack(
        spacing: .8em,
        text(size: 14pt, weight: "bold", fill: pal.paper.transparentize(35%), style: "italic")[A.],
        text(size: 15pt, weight: "bold")[跨环境问题],
        text(size: 10.5pt, fill: pal.paper.transparentize(30%), font: body-font)[
          AI 编程工具在开发·测试·生产环境之间的差异问题上几乎无能为力。
        ],
      ),
      stack(
        spacing: .8em,
        text(size: 14pt, weight: "bold", fill: pal.paper.transparentize(35%), style: "italic")[B.],
        text(size: 15pt, weight: "bold")[特定领域知识],
        text(size: 10.5pt, fill: pal.paper.transparentize(30%), font: body-font)[
          AI 最怕没有文档的领域。定制中间件·行业协议·社内规范——全是盲区。
        ],
      ),
      stack(
        spacing: .8em,
        text(size: 14pt, weight: "bold", fill: pal.paper.transparentize(35%), style: "italic")[C.],
        text(size: 15pt, weight: "bold")[高层决策],
        text(size: 10.5pt, fill: pal.paper.transparentize(30%), font: body-font)[
          产品取舍·架构选型·代码风格——这些需要“品味”的东西，不在训练集里。
        ],
      ),
    ),
    pull-quote(inverted: true, pal: pal)[
      #text(font: body-font)[AI 不是万能，但每一次它做不到的地方，就是我们作为人的价值所在。]
    ],
  )
]
#speaker-note[解释三类高频修复来源：跨环境差异、缺失的领域知识，以及无法由训练数据替代的高层判断。]

// ===== Dark stat slide: varied label/value lengths exercise the stat API =====

#stat-slide(
  title: [当 Claude Code 源码泄露，#linebreak()人们数了一下行数。],
  align: top,
  kicker: "OBSERVATORY · AGENT INFRA DISSECTION",
  header-left: [SLI 2],
  header-right: [LEGITIMACY · AGENT · GLUING AWAY],
)[
  #stack(
    spacing: .8em,
    text(size: 10.5pt, fill: pal.paper.transparentize(25%), font: body-font)[
      Harness 不会消失；公开代码改变的是实现形态，而不是编排层存在的必要性。
    ],
    cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
      #stat-block(
        [八千多个源文件],
        [#text(font: display-font)[512,000 行]],
        description: [#text(font: body-font)[解密后的 TS/JS 源码规模，堪比中型操作系统。]],
        number-size: 38pt,
        inverted: true,
        pal: pal,
      )
    ][
      #stat-block(
        [巨头玩家],
        [#text(font: display-font)[3 家]],
        description: [#text(font: body-font)[OpenAI、Anthropic、Google 的 Agent 产品本质上都有 Harness。]],
        number-size: 38pt,
        inverted: true,
        pal: pal,
      )
    ][
      #stat-block(
        [模型内化比例],
        [#text(font: display-font)[0%]],
        description: [#text(font: body-font)[Web search、模型推理与工具调用仍由外部编排层连接。]],
        number-size: 44pt,
        inverted: true,
        pal: pal,
      )
    ],
  )
]
#speaker-note[用三个长度差异明显的指标说明：产品壁垒更多来自外部编排，而非模型内部新增能力。]

// ===== Light evolution slide =====

== 三年里脚手架没有消失——#linebreak()它只是换了名字。

#stack(
  spacing: .8em,
  text(size: 9pt, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: meta-font)[NO. 3 · THE EVOLUTION],
  kicker(pal: pal)[#text(font: meta-font)[三种“胶水层”的前世今生]],
  cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
    #pillar-card(1, [RAG Chains], [
      #text(font: body-font)[检索增强生成的早期形态。把外部知识拼接进 prompt，本质上是字符串拼接的升级版。]
    ], pal: pal)
  ][
    #pillar-card(2, [LangGraph], [
      #text(font: body-font)[用 DAG 编排 Agent 步骤，看似优雅，却引入大量样板代码与调试困难。]
    ], pal: pal)
  ][
    #pillar-card(3, [Agent Harness], [
      #text(font: body-font)[不再伪装成“框架”，直接承认自己是胶水、工具调用与循环。]
    ], pal: pal)
  ],
)
#speaker-note[按时间推进比较 RAG Chains、LangGraph 与 Agent Harness，强调名称变化背后的结构连续性。]

// ===== Semantic columns use Touying cols plus a decorative component =====

== Latent 留给我 · Deterministic 交给 AI。

#cols(columns: (1fr, 1fr))[
  #comparison-column(label: "LATENT · 留给人", strong: true, pal: pal)[
    #stack(
      spacing: .8em,
      text(size: 18pt, weight: "bold")[留给我自己],
      text(size: 13pt, fill: pal.ink-light, font: body-font)[判断——什么值得写],
      text(size: 13pt, fill: pal.ink-light, font: body-font)[定调——观点与情绪],
      text(size: 13pt, fill: pal.ink-light, font: body-font)[质格——最后一道把关],
    )
  ]
][
  #comparison-column(label: "DETERMINISTIC · 交给 AI", pal: pal)[
    #stack(
      spacing: .8em,
      text(size: 18pt, weight: "bold")[交给 AI / 自动化],
      text(size: 13pt, fill: pal.ink-light, font: body-font)[写初稿 · 格式变形],
      text(size: 13pt, fill: pal.ink-light, font: body-font)[信息团生成 · 数据抓取],
      text(size: 13pt, fill: pal.ink-light, font: body-font)[多平台分发 · 同步发布],
    )
  ]
]

#v(1fr)

#pull-quote(pal: pal)[
  #text(font: body-font)[AI 最需克制的瞬间，是把精确执行交给了会做梦的模型。]
]
#speaker-note[建立全篇的判断框架：人负责潜在空间中的取舍，机器负责可验证、可重复的执行。]

// ===== Auto-generated section divider =====

= 不是 AI 取代你——#linebreak()是 Harness 决定什么值得自动化。
#speaker-note[转入实践边界：真正需要治理的是编排层替团队做出的自动化选择。]

// ===== Expanded comparison =====

== 从“全部交给 AI”到“划清边界”。

#cols(columns: (1fr, 1fr))[
  #comparison-column(label: "LATENT · 留给人", strong: true, pal: pal)[
    #stack(
      spacing: .8em,
      text(size: 16pt, weight: "bold")[会做梦的那部分],
      text(size: 12pt, fill: pal.ink-light, font: body-font)[
        品味判断——哪些代码“不对劲” \
        架构直觉——什么该拆，什么该留 \
        审美选择——命名、注释、抽象层级 \
        伦理红线——哪些自动化不应该做
      ],
    )
  ]
][
  #comparison-column(label: "DETERMINISTIC · 交给 AI", pal: pal)[
    #stack(
      spacing: .8em,
      text(size: 16pt, weight: "bold")[能精确执行的那部分],
      text(size: 12pt, fill: pal.ink-light, font: body-font)[
        代码生成——样板代码、类型定义 \
        格式规范——lint / format / migration \
        信息检索——文档总结、API 查询 \
        重复劳动——测试用例、数据清洗
      ],
    )
  ]
]
#speaker-note[逐项给出团队可以采用的分界线，并提醒听众把伦理红线保留在人类决策链中。]

// ===== Focus synthesis =====

#focus-slide[
  #stack(
    spacing: .8em,
    [真正的分工，不是“人提出、AI 执行”。],
    text(size: 16pt, weight: "regular", style: "normal", fill: pal.ink-light, font: body-font)[
      而是把 latent judgment 留给人，把 deterministic work 交给机器。
    ],
  )
]
#speaker-note[用一句可复述的结论收束论证，为结束页建立明确落点。]

// ===== Ending =====

#ending-slide[Thank You]
#speaker-note[邀请听众讨论：团队目前有哪些自动化已经越过了应由人保留的判断边界？]
