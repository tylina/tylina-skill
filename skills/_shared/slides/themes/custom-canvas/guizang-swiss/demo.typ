#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#show: swiss-theme.with(
  aspect-ratio: "16-9",
  preset: "ikb",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Thin Harness\ Architecture],
    subtitle: [Intelligence Up -- Execution Down],
    author: [Claude Code Team],
    date: datetime.today(),
    institution: [Anthropic],
  ),
)

// ═══ Slide 1: Title / Cover ═══

#title-slide()

// ═══ Slide 2: Architecture — plain-slide with chrome-min ═══

#plain-slide[
  #kicker[THREE LAYERS]
  #v(2pt)
  #chrome-min([SECTION 01 · ARCHITECTURE · 1-3架构], [01 / 08])
  #v(6pt)
  #text(size: 1.8em, weight: 200)[把#text(fill: palette.accent)[智能]推上去 · 把#text(fill: palette.accent)[执行]推下去]
  #v(14pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    {
      block(width: 100%, fill: palette.grey-1, inset: 12pt)[
        #text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)[LAYER 01]
        #v(10pt)
        #text(size: 14pt, weight: 400, fill: palette.ink)[#sym.plus.o]
        #v(6pt)
        #text(size: 14pt, weight: 500, fill: palette.ink)[Fat Skills]
        #v(4pt)
        #set text(size: 9pt, weight: 400, fill: palette.grey-3)
        Markdown 的技能库、提示词、模板和上下文，90% 的智能在这里。
      ]
    },
    {
      block(width: 100%, fill: palette.grey-1, inset: 12pt)[
        #text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)[LAYER 02 · \~200 LINES]
        #v(10pt)
        #text(size: 14pt, weight: 400, fill: palette.ink)[—]
        #v(6pt)
        #text(size: 14pt, weight: 500, fill: palette.ink)[Thin CLI Harness]
        #v(4pt)
        #set text(size: 9pt, weight: 400, fill: palette.grey-3)
        JSON in · text out · read-only by default. 不超 40 个工具函数和半个 context window.
      ]
    },
    {
      block(width: 100%, fill: palette.grey-1, inset: 12pt)[
        #text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)[LAYER 03 · DETERMINISTIC]
        #v(10pt)
        #text(size: 14pt, weight: 400, fill: palette.ink)[#sym.equiv]
        #v(6pt)
        #text(size: 14pt, weight: 500, fill: palette.ink)[Application]
        #v(4pt)
        #set text(size: 9pt, weight: 400, fill: palette.grey-3)
        QueryDB · ReadDoc · Search · Timeline. 固件输入 · 永远固件输出，「我们的载体」.
      ]
    },
  )
  #v(1fr)
  #grid(
    columns: (1fr, auto),
    {
      set text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)
      upper[#sym.arrow.t thin harness intelligence up]
    },
    {
      set text(size: 8pt, weight: 500, fill: palette.grey-3, tracking: 0.5pt)
      [#sym.arrow.r KEEP 7128]
    },
  )
]

// ═══ Slide 3: Core Thesis — thesis-slide ═══

#thesis-slide[
  #grid(
    columns: (3fr, 2fr),
    column-gutter: 24pt,
    {
      // Left: big statement
      kicker[CORE THESIS]
      v(8pt)
      text(size: 2.6em, weight: 200, fill: palette.ink)[The \ harness \ #text(fill: palette.accent, style: "italic")[is the] \ product]
    },
    {
      // Right: info box and grid
      block(width: 100%, fill: palette.grey-1, inset: 12pt)[
        #set text(size: 9pt, weight: 400, fill: palette.ink)
        Anthropic 决把 Claude Code 整套源码搬到了 npm · #text(weight: 600)[512,000 行], 答案都在里面。
      ]
      v(10pt)
      grid(
        columns: (1fr, 1fr),
        column-gutter: 8pt,
        row-gutter: 10pt,
        {
          block(width: 100%, stroke: (left: 0.5pt + palette.grey-2), inset: (left: 8pt, y: 4pt))[
            #set text(size: 8.5pt, weight: 400, fill: palette.ink)
            Live repo context
          ]
        },
        {
          block(width: 100%, stroke: (left: 0.5pt + palette.grey-2), inset: (left: 8pt, y: 4pt))[
            #set text(size: 8.5pt, weight: 400, fill: palette.ink)
            Prompt caching
          ]
        },
        {
          block(width: 100%, stroke: (left: 0.5pt + palette.grey-2), inset: (left: 8pt, y: 4pt))[
            #set text(size: 8.5pt, weight: 400, fill: palette.ink)
            Purpose-built tools
          ]
        },
        {
          block(width: 100%, stroke: (left: 0.5pt + palette.grey-2), inset: (left: 8pt, y: 4pt))[
            #set text(size: 8.5pt, weight: 400, fill: palette.ink)
            Structured memory
          ]
        },
      )
      v(10pt)
      set text(size: 7.5pt, weight: 400, fill: palette.grey-3)
      [要持平 agent 的完整问题，在 AI 属性型的重要性。]
      v(4pt)
      [这些都不是模型的射幕，只是正确的附加到操作上下文。]
    },
  )
]

// ═══ Slide 4: Dark slide — two-column layout ═══

#dark-slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 16pt,
    {
      // Left: big statement text
      text(size: 3.2em, weight: 200, fill: white)[Open in #text(fill: palette.accent, style: "italic")[blue]. \ Close in #text(fill: palette.accent, style: "italic")[blue].]
      v(1fr)
      set text(size: 9pt, weight: 400, fill: palette.grey-3)
      [约短版 IKB,封页也是 IKB——互相呼应·负向互锁 \ 请,尽管这份 deck 不过一个优化的载体。]
      v(8pt)
      set text(size: 7.5pt, weight: 500, fill: palette.grey-3)
      [IKB · 5 / 7 PAGES]
    },
    {
      // Right: 3 numbered items
      v(1fr)
      grid(
        columns: (auto, 1fr),
        column-gutter: 14pt,
        row-gutter: 16pt,
        text(size: 20pt, weight: 200, fill: white)[01],
        {
          text(size: 11pt, weight: 500, fill: white)[规则,优于品味]
          v(2pt)
          set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
          [就严的工艺规范比好口感的眼光既比其面量出发且合的美德感。]
        },
        text(size: 20pt, weight: 200, fill: white)[02],
        {
          text(size: 11pt, weight: 500, fill: white)[克制,优于堆叠]
          v(2pt)
          set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
          [你是一个色、一个滤镜、一个边距/规范间为一个故事。]
        },
        text(size: 20pt, weight: 200, fill: white)[03],
        {
          text(size: 11pt, weight: 500, fill: white)[闭环,优于结尾]
          v(2pt)
          set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
          [首尾一致用 IKB 蓝填充方式比配色大协——信我试完就有足够用性以。]
        },
      )
      v(1fr)
    },
  )
]

// ═══ Slide 5: Self-Expression Loop — plain-slide with numbered-item ═══

#plain-slide[
  #chrome-min([SECTION 12 · THE SELF-EXPRESSION LOOP · SKILL 闭环], [03 / 08])
  #v(4pt)

  #text(size: 1.5em, weight: 300)[系统读自己的#text(weight: 500)[输#text(fill: palette.accent)[出]] · 改自己的 #text(fill: palette.accent)[skill].]
  #v(12pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    {
      // Left: numbered items using numbered-item component
      numbered-item([01], [数据], [读 NPS · 12% 用户"差"评价?])
      v(8pt)
      numbered-item([02], [特征], [抽出"运行但不够好"的共性模式])
      v(8pt)
      numbered-item([03], [行动], [写回 skill 文件 · 无人触碰 harness])
      v(8pt)
      numbered-item([04], [衡量], [下一次部: 会阻断器 skill · 12%#sym.arrow.r 4%])
    },
    {
      // Right: loop diagram
      set align(center)
      v(4pt)
      block(width: 100%, height: 200pt)[
        #place(center + horizon,
          circle(radius: 72pt, stroke: 1pt + palette.grey-2, fill: none)
        )
        #place(center + horizon,
          text(size: 14pt, weight: 300, fill: palette.accent)[improves]
        )
        #place(center + top, dy: 6pt)[
          #set text(size: 7pt, weight: 500, fill: palette.grey-3)
          #text(size: 6pt, fill: palette.grey-3)[01] \
          Read NPS
        ]
        #place(right + horizon, dx: -6pt)[
          #set text(size: 7pt, weight: 500, fill: palette.grey-3)
          #text(size: 6pt, fill: palette.grey-3)[02] \
          Extract
        ]
        #place(center + bottom, dy: -6pt)[
          #set text(size: 7pt, weight: 500, fill: palette.grey-3)
          #text(size: 6pt, fill: palette.grey-3)[03] \
          Rewrite
        ]
        #place(left + horizon, dx: 6pt)[
          #set text(size: 7pt, weight: 500, fill: palette.grey-3)
          #text(size: 6pt, fill: palette.grey-3)[DETAIL] \
          Run
        ]
      ]
    },
  )
  #v(1fr)
  #dot-matrix(rows: 1, cols: 16, size: 2pt)
]

// ═══ Slide 6: Context · Opportunity · Impact — plain-slide ═══

#plain-slide[
  #chrome-min([SECTION 10 · ANT NPR · 能信级的分级整理进], [05 / 08])
  #v(6pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12pt,
    {
      block(width: 100%, fill: palette.grey-1, inset: 14pt)[
        #text(size: 16pt, weight: 300, fill: palette.ink)[Context.]
        #v(8pt)
        #set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
        过去三年，要从 GPT-3 到 Claude 4.7, 每次 700 行。prompt 已对不起了的长，在上下文 AI prompt 直往上冲。
        #v(4pt)
        已做到程度比较好吗但是估值真的很贵。
      ]
    },
    {
      block(width: 100%, fill: palette.grey-1, inset: 14pt)[
        #text(size: 16pt, weight: 300, fill: palette.ink)[Opportunity.]
        #v(8pt)
        #set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
        精准给力的了一个场景去上下文一工具加持 · 注册拓宽, 28 层级拉丰的器，全主打归的了 agent skill 不要被挡, 在 2028 内前端出标准化。
      ]
    },
    {
      block(width: 100%, fill: palette.grey-1, inset: 14pt)[
        #text(size: 16pt, weight: 300, fill: palette.accent)[Impact.]
        #v(8pt)
        #set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
        一台 skill 级的设计让 agent 甩出对手所有做的事。入八家难道让没有这些领域已一大通过在的 skill library.
      ]
    },
  )
  #v(1fr)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12pt,
    {
      text(size: 48pt, weight: 200, fill: palette.ink)[01]
    },
    {
      text(size: 48pt, weight: 200, fill: palette.ink)[02]
    },
    {
      text(size: 48pt, weight: 200, fill: palette.accent)[03]
    },
  )
  #v(4pt)
  #grid(
    columns: (1fr, auto),
    {
      set text(size: 7pt, weight: 500, fill: palette.grey-3)
      [上下文 · REPO · 不用做装饰]
    },
    {
      grid(
        columns: 8,
        column-gutter: 4pt,
        ..range(8).map(_ => block(width: 4pt, height: 4pt, fill: palette.accent)),
      )
    },
  )
]

// ═══ Slide 7: Performance Chart — kpi-slide ═══

#kpi-slide[
  #chrome-min([SECTION 18 · PERF CHART · HARNESS 黑板运行 · 性能速算], [06 / 08])
  #v(4pt)
  #grid(
    columns: (5fr, 2fr, 2fr, 2fr),
    column-gutter: 12pt,
    {
      text(size: 1.8em, weight: 200, fill: palette.ink)[General \ harness \ performance \ basis]
    },
    {
      set text(size: 7pt, weight: 600, fill: palette.grey-3, tracking: 1pt)
      upper[operations]
      v(4pt)
      text(size: 36pt, weight: 200, fill: palette.ink)[530]
      v(2pt)
      set text(size: 8pt, weight: 400, fill: palette.grey-3)
      [calls / hour]
    },
    {
      set text(size: 7pt, weight: 600, fill: palette.grey-3, tracking: 1pt)
      upper[throughput]
      v(4pt)
      text(size: 36pt, weight: 200, fill: palette.ink)[60]
      v(2pt)
      set text(size: 8pt, weight: 400, fill: palette.grey-3)
      [hz baseline]
    },
    {
      set text(size: 7pt, weight: 600, fill: palette.grey-3, tracking: 1pt)
      upper[RT / time]
      v(4pt)
      text(size: 36pt, weight: 200, fill: palette.ink)[\~13]
      v(2pt)
      set text(size: 8pt, weight: 400, fill: palette.grey-3)
      [seconds / cycle]
    },
  )
  #v(6pt)
  #hairline-rule()
  #v(6pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    {
      // Left: categories + stat
      grid(
        columns: (auto, auto, auto, auto),
        column-gutter: 16pt,
        {
          set text(size: 8pt, weight: 400, fill: palette.grey-3)
          [01 ]
          text(fill: palette.ink)[Reasoning]
        },
        {
          set text(size: 8pt, weight: 400, fill: palette.grey-3)
          [02 ]
          text(fill: palette.ink)[Coding]
        },
        {
          set text(size: 8pt, weight: 400, fill: palette.grey-3)
          [03 ]
          text(fill: palette.ink)[Browse]
        },
        {
          set text(size: 8pt, weight: 400, fill: palette.grey-3)
          [04 ]
          text(fill: palette.ink)[Research]
        },
      )
      v(6pt)
      set text(size: 7.5pt, weight: 400, fill: palette.grey-3)
      [假设是了 2026 年 07 总部 harness 轴上，不可及生产行代, 合计 agent 可到达率。]
      v(6pt)
      grid(
        columns: (auto, 1fr),
        column-gutter: 14pt,
        text(size: 42pt, weight: 200, fill: palette.ink)[74],
        {
          v(6pt)
          text(size: 12pt, weight: 300, fill: palette.ink)[Yearly goal: ]
          text(size: 12pt, weight: 500, fill: palette.accent)[85]
          v(4pt)
          bar-chart-row([Enhancing performance], 74, max-value: 100)
          v(2pt)
          grid(
            columns: (auto, auto),
            column-gutter: 20pt,
            {
              set text(size: 7.5pt, weight: 400, fill: palette.grey-3)
              [Reliability]
            },
            {
              set text(size: 7.5pt, weight: 400, fill: palette.grey-3)
              [Research]
            },
          )
        },
      )
    },
    {
      // Right: Inclusive harness experience
      v(1fr)
      set align(right)
      text(size: 11pt, weight: 500, fill: palette.ink)[Inclusive \ harness experience]
      v(4pt)
      set text(size: 7pt, weight: 400, fill: palette.grey-3)
      [+21% YoY · 运行 1600 次达标]
      v(8pt)
      set align(right)
      grid(
        columns: (8pt, 8pt, 8pt, 8pt, 8pt),
        column-gutter: 3pt,
        align: bottom,
        block(width: 8pt, height: 20pt, fill: palette.ink),
        block(width: 8pt, height: 28pt, fill: palette.ink),
        block(width: 8pt, height: 24pt, fill: palette.ink),
        block(width: 8pt, height: 32pt, fill: palette.ink),
        block(width: 8pt, height: 40pt, fill: palette.ink),
      )
    },
  )
]

// ═══ Slide 8: Ending ═══

#ending-slide[
  Thin Harness\ Architecture

  #v(4pt)
  #text(size: 0.4em, weight: 400, fill: palette.grey-3)[Intelligence Up -- Execution Down]
]
