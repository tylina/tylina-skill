#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist

#set text(font: ("Arial", "PingFang SC"), size: 11pt)

#show: checklist.with(stroke: palette.accent, radius: 0.2em)

#show: ai-capital-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [2026 全球 AI 资本格局],
    subtitle: [Capital, Compute, and the Closed Loop],
    author: [PPT Master Industry Insight],
    date: datetime.today(),
  ),
)

// ═══ Page 1: Cover ═══

#cover-slide(
  bg-image: "images/cover_atmosphere.png",
  title: [2026 全球 AI 资本格局],
  subtitle: [Capital, Compute, and the Closed Loop],
  info-left: [
    作者 · PPT Master 行业洞察 / Author · PPT Master Industry Insight\
    数据截至 / Data as of *2026-05-15*
  ],
  info-right: [\$297B · 81% · 4 deals],
  source: [Sources: Crunchbase · Bloomberg · CNBC · TechCrunch · Anthropic · OpenAI],
)

// ═══ Page 2: Editor's Note ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PROLOGUE · 02]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #text(size: 20pt, weight: "bold", fill: palette.primary)[编辑导语 / Editor's Note]
  #v(2pt)
  #text(size: 28pt, fill: palette.accent)["]
  #v(2pt)
  #pad(left: 3%)[
    #text(size: 14pt, fill: palette.primary)[三组数字，足以定义 2026 年的 AI 资本格局。]
  ]

  #v(6pt)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 24pt,
    [
      #hero-num([\$297B], size: 48pt)
      #v(3pt)
      #text(size: 9pt, fill: palette.body)[单季全球 VC 总额 · AI 占 *81%*]
      #v(4pt)
      #block(width: 70%, stroke: (top: 0.5pt + palette.border))[]
    ],
    [
      #hero-num([\$188B], size: 48pt)
      #v(3pt)
      #text(size: 9pt, fill: palette.body)[四笔交易合计 · 占全季 VC *65%*]
      #v(4pt)
      #block(width: 70%, stroke: (top: 0.5pt + palette.border))[]
    ],
    [
      #hero-num([+46pt], size: 48pt)
      #v(3pt)
      #text(size: 9pt, fill: palette.body)[Capex 与 AI 收入增速差距 · 已超 *2001 电信泡沫*]
      #v(4pt)
      #block(width: 70%, stroke: (top: 0.5pt + palette.border))[]
    ],
  )

  #v(6pt)

  #text(size: 10pt, fill: palette.body)[
    这一期，我们用 18 张数据图，回答一个问题：\
    当全球风险资本以前所未有的集中度涌入 AI，#text(weight: "bold", fill: palette.primary)[这究竟是基建周期的开端，还是泡沫膨胀的中段？]\
    不要急着下结论。我们先把六个维度的数字铺开。
  ]

  #v(1fr)
  #accent-rule(width: 40pt, thickness: 2pt)
  #v(3pt)
  #text(size: 9pt, fill: palette.faint, style: "italic")[— Editorial Desk, 2026-05-16]

  #v(4pt)
  #std-footer[Capital, Compute, and the Closed Loop · 2026 Industry Briefing]
]

// ═══ Page 3: Contents ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[CONTENTS · 03]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #text(size: 24pt, weight: "bold", fill: palette.primary)[目录 / Contents]
  #v(2pt)
  #text(size: 9pt, fill: palette.gray)[Six parts · Eighteen data charts · 2026 全球 AI 资本格局]

  #v(8pt)

  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    [
      #toc-entry[I][全景][Landscape][P04 — P05][Q1 风投 · Hyperscaler \$725B Capex]
      #v(6pt)
      #toc-entry[II][三巨头][The Big Three][P06 — P09][OpenAI · Anthropic · xAI]
      #v(6pt)
      #toc-entry[III][中国阵营][China Camp][P10 — P11][DeepSeek \$50B 领跑 · 中美双轨]
    ],
    [
      #toc-entry[IV][二线梯队][The Second Tier][P12][SSI · Perplexity · Mistral · Cohere]
      #v(6pt)
      #toc-entry[V][基建与闭环][Infrastructure][P13 — P16][Nvidia 闭环 · Stargate \$500B]
      #v(6pt)
      #toc-entry[VI][泡沫与判断][The Bubble][P17 — P20][Capex/Revenue 鸿沟 · 六大判断]
    ],
  )

  #v(1fr)

  #text(size: 9pt, fill: palette.gray)[阅读建议 / Reading note]
  #v(2pt)
  #text(size: 9pt, fill: palette.body, weight: "bold")[每章约 3-5 分钟，推荐顺序阅读，数据均附 § VIII 来源列表]

  #v(8pt)
  #std-footer[Capital, Compute, and the Closed Loop · 2026 Industry Briefing]
]

// ═══ Page 4: Q1 VC Landscape ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART I · LANDSCAPE · 04]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(3pt)
  #page-title[2026 Q1 全球风投：][\$297B 创纪录，AI 拿走 81%]
  #v(2pt)
  #page-subtitle[Global VC Q1 2026 — four mega-deals carry the quarter]

  #v(.8em)

  #grid(columns: (48%, 4%, 48%), column-gutter: 0pt,
    // Left: 2x2 KPI grid
    grid(columns: (1fr, 1fr), rows: (auto, auto), column-gutter: 10pt, row-gutter: 8pt,
      kpi-card[单季 VC 总额 / Q1 VC][\$297#text(size: 16pt)[B]][单季历史最高 · Single-quarter record][来源：Crunchbase],
      kpi-card[AI 占全季 VC / AI share][81#text(size: 16pt)[%]][约 *\$242B* 流入 AI 行业][来源：Crunchbase / PitchBook],
      kpi-card[Top 4 笔大单 / Top 4 deals][\$188#text(size: 16pt)[B]][OpenAI · Anthropic · xAI · Waymo][来源：PitchBook Q1 2026 Report],
      kpi-card[集中度 / Concentration][65#text(size: 16pt)[%]][Top 4 占全季全球 VC 比例][钱不是更多，是更集中],
    ),
    [],
    // Right: editorial note
    pad(left: 8pt)[
      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[EDITORIAL NOTE]
      #v(6pt)
      #text(size: 14pt, weight: "bold", fill: palette.primary)[钱没变多，]
      #v(2pt)
      #text(size: 14pt, weight: "bold", fill: palette.primary)[是更集中。]
      #v(8pt)
      #text(size: 9pt, fill: palette.body)[
        "While more money than ever is being invested in the private markets, that's thanks to #text(fill: palette.accent)[larger checks, not more of them] — capital concentrated into a select few companies and a single industry."
      ]
      #v(6pt)
      #text(size: 8pt, fill: palette.faint, style: "italic")[— Crunchbase, Q1 2026 venture report]
      #v(14pt)
      #block(stroke: (top: 0.5pt + palette.border), width: 100%)[
        #v(4pt)
        #grid(columns: (1fr, auto),
          text(size: 9pt, fill: palette.gray)[三大模型公司单季合计],
          hero-num([\$172B], size: 18pt),
        )
      ]
    ],
  )

  #v(1fr)
  #std-footer[Sources: Crunchbase · PitchBook Q1 2026 Venture Reports]
]

// ═══ Page 5: Hyperscaler CapEx ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART I · LANDSCAPE · 05]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[四家 Hyperscaler 2026 Capex：][\$725B，同比 +77%]
  #v(2pt)
  #page-subtitle[Microsoft · Alphabet · Amazon · Meta — combined AI infrastructure capex]

  #v(6pt)

  #grid(columns: (70%, 30%), column-gutter: 0pt,
    // Bar chart area
    [
      #v(4pt)
      #grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
        chart-bar(100, [\$200B], [Amazon], [行业最高], variant: "accent", max-height: 180pt),
        chart-bar(95, [\$190B], [Microsoft], [含 \$25B 存储芯片], variant: "gray", max-height: 180pt),
        chart-bar(95, [\$190B], [Alphabet], [指引上调 \$5B], variant: "accent", max-height: 180pt),
        chart-bar(72, [\$145B+], [Meta], [电力土地紧张], variant: "gray", max-height: 180pt),
      )
    ],
    // Right: observation panel
    pad(left: 8pt)[
      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[KEY OBSERVATION]
      #v(4pt)
      #hero-num([\$725B], size: 40pt)
      #v(3pt)
      #text(size: 9pt, fill: palette.body)[2026 合计 Capex · 同比 *+77%*]
      #v(12pt)
      #text(size: 12pt, weight: "bold", fill: palette.primary)[资源约束已转向电力]
      #v(6pt)
      #text(size: 9pt, fill: palette.body)[
        #text(fill: palette.accent, weight: "bold")[60%+] 资本流向电力基础设施、冷却、土建——而不是芯片本身。
      ]
      #v(8pt)
      #text(size: 9pt, fill: palette.body)[
        下一道护城河不是算力，是 #text(fill: palette.accent, weight: "bold")[GW 级供电]。
      ]
      #v(10pt)
      #text(size: 8pt, fill: palette.faint, style: "italic")[— Tom's Hardware / Statista, 2026 outlook]
    ],
  )

  #v(1fr)
  #std-footer[Sources: Tom's Hardware · Statista · NextWaves · Company guidance Q1 2026]
]

// ═══ Page 6: Big Three Valuation Leap (Dumbbell) ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART II · THE BIG THREE · 06]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[三巨头估值跃迁：从年初到 Q2 的][双倍线]
  #v(2pt)
  #page-subtitle[OpenAI · Anthropic · xAI — six-month valuation deltas]

  #v(6pt)

  // Legend
  #grid(columns: (auto, auto, 1fr), column-gutter: 16pt, align: horizon,
    [#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.gray) #text(size: 8pt, fill: palette.gray)[Year-Start 2026]],
    [#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent) #text(size: 8pt, fill: palette.gray)[Latest (May 2026)]],
    [],
  )

  #v(8pt)

  // Dumbbell chart approximation
  #block(width: 100%, inset: (x: 4pt, y: 0pt), stroke: (left: 0.5pt + palette.border, bottom: 0.5pt + palette.border))[
    // OpenAI row
    #grid(columns: (12%, 88%), align: (right + horizon, left + horizon),
      [
        #text(size: 11pt, weight: "bold", fill: palette.primary)[OpenAI]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[consumer + IPO]
      ],
      pad(y: 10pt)[
        #block(width: 100%, height: 30pt)[
          // Bar from $300B to $852B
          #place(left, dx: 22%, dy: 10pt)[#block(width: 40%, height: 2pt, fill: palette.primary)]
          #place(left, dx: 22%, dy: 6pt)[#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.gray)]
          #place(left, dx: 62%, dy: 6pt)[#box(width: 10pt, height: 10pt, radius: 5pt, fill: palette.accent)]
          #place(left, dx: 21%, dy: -4pt)[#text(size: 8pt, fill: palette.gray)[\$300B]]
          #place(left, dx: 59%, dy: -4pt)[#text(size: 9pt, fill: palette.accent, weight: "bold")[\$852B]]
          #place(left, dx: 38%, dy: 20pt)[#text(size: 8pt, fill: palette.green, weight: "bold")[+184%]]
        ]
      ],
    )

    #v(4pt)
    #block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(50%)))[]
    #v(4pt)

    // Anthropic row
    #grid(columns: (12%, 88%), align: (right + horizon, left + horizon),
      [
        #text(size: 11pt, weight: "bold", fill: palette.primary)[Anthropic]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[enterprise]
      ],
      pad(y: 10pt)[
        #block(width: 100%, height: 30pt)[
          #place(left, dx: 5%, dy: 10pt)[#block(width: 33%, height: 2pt, fill: palette.primary)]
          #place(left, dx: 5%, dy: 6pt)[#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.gray)]
          #place(left, dx: 38%, dy: 6pt)[#box(width: 10pt, height: 10pt, radius: 5pt, fill: palette.accent)]
          #place(left, dx: 38%, dy: 18pt)[#block(width: 32%, height: 1pt, stroke: (bottom: stroke(paint: palette.amber, thickness: 1pt, dash: "dashed")))]
          #place(left, dx: 4%, dy: -4pt)[#text(size: 8pt, fill: palette.gray)[\$61.5B]]
          #place(left, dx: 33%, dy: -4pt)[#text(size: 9pt, fill: palette.accent, weight: "bold")[\$380B (G)]]
          #place(left, dx: 65%, dy: -4pt)[#text(size: 8pt, fill: palette.amber)[→ \$900B (在谈)]]
          #place(left, dx: 16%, dy: 20pt)[#text(size: 8pt, fill: palette.green, weight: "bold")[+518%]]
        ]
      ],
    )

    #v(4pt)
    #block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(50%)))[]
    #v(4pt)

    // xAI row
    #grid(columns: (12%, 88%), align: (right + horizon, left + horizon),
      [
        #text(size: 11pt, weight: "bold", fill: palette.primary)[xAI]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[SpaceX merger]
      ],
      pad(y: 10pt)[
        #block(width: 100%, height: 30pt)[
          #place(left, dx: 4%, dy: 10pt)[#block(width: 15%, height: 2pt, fill: palette.primary)]
          #place(left, dx: 4%, dy: 6pt)[#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.gray)]
          #place(left, dx: 19%, dy: 6pt)[#box(width: 10pt, height: 10pt, radius: 5pt, fill: palette.accent)]
          #place(left, dx: 3%, dy: -4pt)[#text(size: 8pt, fill: palette.gray)[\$50B]]
          #place(left, dx: 17%, dy: -4pt)[#text(size: 9pt, fill: palette.accent, weight: "bold")[\$230B]]
          #place(left, dx: 82%, dy: -4pt)[#text(size: 8pt, fill: palette.amber)[→ \$1.25T（合并）]]
          #place(left, dx: 8%, dy: 20pt)[#text(size: 8pt, fill: palette.green, weight: "bold")[+360%]]
        ]
      ],
    )
    #v(4pt)

    // X-axis scale labels
    #grid(columns: (12%, 88%), column-gutter: 0pt,
      [],
      [
        #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 0pt,
          text(size: 7pt, fill: palette.faint)[\$0],
          text(size: 7pt, fill: palette.faint)[\$200B],
          text(size: 7pt, fill: palette.faint)[\$400B],
          text(size: 7pt, fill: palette.faint)[\$600B],
          text(size: 7pt, fill: palette.faint)[\$800B],
          text(size: 7pt, fill: palette.faint)[\$1.0T],
          text(size: 7pt, fill: palette.faint)[\$1.2T],
        )
      ],
    )
  ]

  #v(6pt)
  // Bottom editorial take
  #block(width: 100%, stroke: (top: 0.5pt + palette.accent))[
    #v(4pt)
    #grid(columns: (auto, 1fr), column-gutter: 16pt,
      text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[EDITORIAL TAKE],
      text(size: 10pt, fill: palette.body)[六个月里，三家公司的合计估值从 \$411B 跃至 #text(fill: palette.accent, weight: "bold")[\$1.46T]——3.6 倍。],
    )
  ]

  #v(1fr)
  #std-footer[Sources: CNBC · Bloomberg · TechCrunch · Anthropic / OpenAI press · Fortune Feb 2026]
]

// ═══ Page 7: Bubble Chart — Valuation vs Revenue ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART II · THE BIG THREE · 07]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[估值兑现度：][气泡大小 = 投资人数]
  #v(2pt)
  #page-subtitle[Valuation × ARR × investor count — who is most over-extended?]

  #v(6pt)

  // Chart area with axes
  #block(width: 100%, height: 250pt, stroke: (left: 0.5pt + palette.border, bottom: 0.5pt + palette.border))[
    // Y axis label
    #place(left, dx: -14pt, dy: 130pt)[
      #rotate(-90deg)[#text(size: 7pt, fill: palette.faint)[VALUATION (\$B) →]]
    ]

    // Grid lines (horizontal)
    #place(left, dx: 0pt, dy: 20%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
    #place(left, dx: 0pt, dy: 40%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
    #place(left, dx: 0pt, dy: 60%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
    #place(left, dx: 0pt, dy: 80%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]

    // Y axis labels
    #place(left, dx: -20pt, dy: 1%)[#text(size: 7pt, fill: palette.faint)[\$1000B]]
    #place(left, dx: -20pt, dy: 25%)[#text(size: 7pt, fill: palette.faint)[\$750B]]
    #place(left, dx: -20pt, dy: 50%)[#text(size: 7pt, fill: palette.faint)[\$500B]]
    #place(left, dx: -20pt, dy: 75%)[#text(size: 7pt, fill: palette.faint)[\$250B]]
    #place(left, dx: -20pt, dy: 95%)[#text(size: 7pt, fill: palette.faint)[\$0]]

    // X axis labels
    #place(bottom, dx: 15%, dy: 14pt)[#text(size: 7pt, fill: palette.faint)[\$10B]]
    #place(bottom, dx: 40%, dy: 14pt)[#text(size: 7pt, fill: palette.faint)[\$20B]]
    #place(bottom, dx: 65%, dy: 14pt)[#text(size: 7pt, fill: palette.faint)[\$30B]]
    #place(bottom, dx: 90%, dy: 14pt)[#text(size: 7pt, fill: palette.faint)[\$40B]]

    // Diagonal "fair valuation" trend
    #place(left + bottom, dx: 5%, dy: -5%)[
      #rotate(-35deg)[#block(width: 300pt, stroke: (top: 0.5pt + palette.border.transparentize(30%)))[]]
    ]
    #place(top + right, dx: -5%, dy: 10%)[#text(size: 7pt, fill: palette.faint)[implied "fair valuation" trend]]

    // xAI bubble (low ARR, $230B val)
    #place(left, dx: 12%, dy: 60%)[
      #block(width: 56pt, height: 56pt, radius: 28pt, stroke: 1pt + palette.amber, fill: palette.amber.transparentize(80%))[
        #set align(center + horizon)
        #box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.amber)
      ]
    ]
    #place(left, dx: 12%, dy: 82%)[
      #align(center)[
        #text(size: 9pt, weight: "bold", fill: palette.primary)[xAI]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[\$5B / \$230B · 8+ investors]
      ]
    ]

    // OpenAI bubble (high ARR $24B, $852B val)
    #place(left, dx: 50%, dy: 12%)[
      #block(width: 70pt, height: 70pt, radius: 35pt, stroke: 1pt + palette.accent, fill: palette.accent.transparentize(80%))[
        #set align(center + horizon)
        #box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent)
      ]
    ]
    #place(left, dx: 50%, dy: 38%)[
      #align(center)[
        #text(size: 9pt, weight: "bold", fill: palette.primary)[OpenAI]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[\$24B / \$852B · 7+ investors]
      ]
    ]

    // Anthropic bubble ($30B ARR, $380B val)
    #place(left, dx: 72%, dy: 34%)[
      #block(width: 60pt, height: 60pt, radius: 30pt, stroke: 1pt + palette.accent, fill: palette.accent.transparentize(80%))[
        #set align(center + horizon)
        #box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent)
      ]
    ]
    #place(left, dx: 72%, dy: 55%)[
      #align(center)[
        #text(size: 9pt, weight: "bold", fill: palette.primary)[Anthropic]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[\$30B / \$380B · 5 investors]
      ]
    ]
    // Anthropic in-talks dashed
    #place(left, dx: 85%, dy: 18%)[
      #box(width: 20pt, height: 20pt, radius: 10pt, stroke: (paint: palette.amber, thickness: 1pt, dash: "dashed"))[]
    ]
    #place(left, dx: 82%, dy: 12%)[#text(size: 7pt, fill: palette.amber)[→ \$900B (in talks)]]
  ]

  // X axis label
  #align(center)[#text(size: 7pt, fill: palette.faint)[ANNUALIZED REVENUE (ARR, \$B) →]]

  #v(2pt)
  // Bottom insight bar
  #block(fill: palette.card, inset: 8pt, width: 100%, radius: 2pt, stroke: (left: 3pt + palette.accent))[
    #text(size: 9pt, fill: palette.body)[
      所有气泡都站在"公允线"上方——估值跑得比收入快；其中 #text(fill: palette.accent, weight: "bold")[xAI 偏离最远]（ARR 估算最低却估值 \$230B），#text(fill: palette.amber, weight: "bold")[Anthropic 兑现度最高]（ARR \$30B）。
    ]
  ]

  #v(1fr)
  #std-footer[Sources: Bloomberg · TechCrunch · Anthropic press 2026-02 / 2026-04 · OpenAI funding 2026-03]
]

// ═══ Page 8: OpenAI Investor Donut ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART II · THE BIG THREE · 08]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(3pt)
  #page-title[OpenAI ][\$122B][  这笔钱，从哪来]
  #v(2pt)
  #page-subtitle[Composition of OpenAI's March 2026 mega-round (post-money \$852B)]

  #v(4pt)

  #grid(columns: (50%, 50%), column-gutter: 0pt,
    // Left: donut chart using conic gradient ring
    align(center + horizon)[
      #block(width: 240pt, height: 290pt)[
        // Donut ring using conic-gradient: Amazon 41%, Nvidia 25%, SoftBank 25%, Others 9%
        // Amazon (accent #E63946): 0deg-147.6deg
        // Nvidia (amber #F4A261): 147.6deg-237.6deg
        // SoftBank (primary #E8E6E1): 237.6deg-327.6deg
        // Others (gray #8A857E): 327.6deg-360deg
        #place(center, dy: 10pt)[
          #box(width: 220pt, height: 220pt, radius: 110pt,
            fill: gradient.conic(
              palette.accent, palette.accent,
              palette.amber, palette.amber,
              palette.primary, palette.primary,
              palette.gray, palette.gray, palette.accent,
              angle: -90deg,
              space: color.hsl,
            ).sharp(4, smoothness: 0%),
          )
        ]
        // Inner hole — creates the donut shape
        #place(center, dy: 10pt)[
          #box(width: 130pt, height: 130pt, radius: 65pt, fill: palette.bg)[
            #set align(center + horizon)
            #text(size: 28pt, weight: "bold", fill: palette.primary)[\$122B]
            #v(3pt)
            #text(size: 7pt, fill: palette.faint, tracking: 1pt)[TOTAL ROUND]
            #v(1pt)
            #text(size: 7pt, fill: palette.faint)[\@ \$852B post-money]
          ]
        ]
        // Stacked horizontal bar legend below the ring
        #place(bottom + center, dy: -10pt)[
          #block(width: 220pt)[
            #block(width: 100%, height: 10pt, radius: 2pt)[
              #grid(columns: (41%, 25%, 25%, 9%), column-gutter: 0pt,
                block(width: 100%, height: 10pt, fill: palette.accent, radius: (left: 2pt)),
                block(width: 100%, height: 10pt, fill: palette.amber),
                block(width: 100%, height: 10pt, fill: palette.primary),
                block(width: 100%, height: 10pt, fill: palette.gray, radius: (right: 2pt)),
              )
            ]
            #v(4pt)
            #grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 2pt,
              text(size: 7pt, fill: palette.accent)[Amazon 41%],
              text(size: 7pt, fill: palette.amber)[Nvidia 25%],
              text(size: 7pt, fill: palette.primary)[SoftBank 25%],
              text(size: 7pt, fill: palette.gray)[Others 9%],
            )
          ]
        ]
      ]
    ],
    // Right: investor breakdown (left border acts as vertical divider)
    block(stroke: (left: 1pt + palette.border), inset: (left: 16pt))[
      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[INVESTOR BREAKDOWN]
      #v(10pt)

      // Amazon
      #grid(columns: (3pt, 1fr), column-gutter: 12pt,
        block(width: 3pt, height: 36pt, fill: palette.accent),
        [
          #grid(columns: (1fr, auto), align: (left, right),
            text(size: 12pt, weight: "bold", fill: palette.primary)[Amazon],
            hero-num([\$50B], size: 18pt),
          )
          #v(2pt)
          #grid(columns: (1fr, auto), align: (left, right),
            [],
            text(size: 8pt, fill: palette.gray)[41% · AWS 算力承诺],
          )
        ],
      )
      #v(6pt)

      // Nvidia
      #grid(columns: (3pt, 1fr), column-gutter: 12pt,
        block(width: 3pt, height: 36pt, fill: palette.amber),
        [
          #grid(columns: (1fr, auto), align: (left, right),
            text(size: 12pt, weight: "bold", fill: palette.primary)[Nvidia],
            hero-num([\$30B], size: 18pt, variant: "amber"),
          )
          #v(2pt)
          #grid(columns: (1fr, auto), align: (left, right),
            [],
            text(size: 8pt, fill: palette.gray)[25% · 10GW 系统部署],
          )
        ],
      )
      #v(6pt)

      // SoftBank
      #grid(columns: (3pt, 1fr), column-gutter: 12pt,
        block(width: 3pt, height: 36pt, fill: palette.primary),
        [
          #grid(columns: (1fr, auto), align: (left, right),
            text(size: 12pt, weight: "bold", fill: palette.primary)[SoftBank],
            text(size: 18pt, weight: "bold", fill: palette.primary)[\$30B],
          )
          #v(2pt)
          #grid(columns: (1fr, auto), align: (left, right),
            [],
            text(size: 8pt, fill: palette.gray)[25% · Stargate 联合主体],
          )
        ],
      )
      #v(6pt)

      // MSFT + others
      #grid(columns: (3pt, 1fr), column-gutter: 12pt,
        block(width: 3pt, height: 36pt, fill: palette.gray),
        [
          #grid(columns: (1fr, auto), align: (left, right),
            text(size: 12pt, weight: "bold", fill: palette.primary)[MSFT + a16z + 其他],
            text(size: 18pt, weight: "bold", fill: palette.primary)[\$12B],
          )
          #v(2pt)
          #grid(columns: (1fr, auto), align: (left, right),
            [],
            text(size: 8pt, fill: palette.gray)[9% · 包含 T. Rowe Price 等],
          )
        ],
      )
      #v(8pt)

      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[OBSERVATION]
      #v(4pt)
      #text(size: 10pt, fill: palette.body)[三大投资人合计 *91%*——同时是 OpenAI 的 #text(fill: palette.accent, weight: "bold")[最大客户]]
    ],
  )

  #v(1fr)
  #std-footer[Sources: OpenAI press 2026-03-31 · Bloomberg · TechCrunch · CNBC]
]

// ═══ Page 9: Big Three Comparison ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART II · THE BIG THREE · 09]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(3pt)
  #page-title[三种成长曲线 / ][Three Growth Curves]
  #v(1pt)
  #page-subtitle[OpenAI is the consumer machine. Anthropic is the enterprise machine. xAI is the merger machine.]

  #v(4pt)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
    // OpenAI
    company-card("CONSUMER · IPO", "OpenAI", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[OpenAI]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[消费驱动 · IPO 临门]
      #v(2pt)
      #hero-num([\$852B], size: 22pt)
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[Valuation \@ 2026-03]
      #v(2pt)
      #text(size: 10pt, weight: "bold", fill: palette.primary)[~\$24B]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[ARR · \$2B/月]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[
        · *9 亿*周活\
        · 企业收入占比 *40%+*\
        · Q4 IPO 目标 #text(fill: palette.accent)[\$1T]
      ]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["The consumer giant turning enterprise."]
    ], variant: "accent"),

    // Anthropic
    company-card("ENTERPRISE · OVERTAKE", "Anthropic", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[Anthropic]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[企业驱动 · 估值反超]
      #v(2pt)
      #hero-num([\$380B], size: 22pt)
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[Series G · 在谈 \$900B]
      #v(2pt)
      #text(size: 10pt, weight: "bold", fill: palette.primary)[\$30B+]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[ARR · 历史最快爬升]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[
        · 25 → 26 年初：\$9B → \$30B\
        · Google 累计承诺 *\$40B*\
        · #text(fill: palette.accent)[在谈估值已超 OpenAI]
      ]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["The enterprise stack ascending."]
    ], variant: "amber"),

    // xAI
    company-card("SPACEX MERGER", "xAI + SpaceX", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[xAI]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[合并叙事 · 协同效应]
      #v(2pt)
      #text(size: 22pt, weight: "bold", fill: palette.primary)[\$1.25T]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[合并实体估值 (xAI: \$230B)]
      #v(2pt)
      #text(size: 10pt, weight: "bold", fill: palette.primary)[~\$5B]
      #v(1pt)
      #text(size: 7pt, fill: palette.gray)[ARR 估算（X / Grok）]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[
        · Jan 2026：\$15B → 超募 \$20B\
        · Tesla 投资 *\$2B*\
        · Feb 与 SpaceX 合并 #text(fill: palette.accent)[IPO 铺路]
      ]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["Musk's vertically-integrated bet."]
    ], variant: "gray"),
  )

  #v(4pt)
  #block(width: 100%, stroke: (top: 0.5pt + palette.accent))[
    #v(4pt)
    #align(center)[
      #text(size: 10pt, fill: palette.body)[三家估值合计 #text(fill: palette.accent, weight: "bold")[\$2.48T] — 超过同期苹果市值的 *2/3*。]
    ]
  ]

  #v(1fr)
  #std-footer[Sources: company press releases · Bloomberg · CNBC · TechCrunch · Fortune Q1 2026]
]

// ═══ Page 10: China Five Ranking ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART III · CHINA CAMP · 10]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[中国 AI 五雄：][DeepSeek][  领跑，估值阶梯分明]
  #v(2pt)
  #page-subtitle[China's AI five — privately valued vs. publicly listed]

  #v(10pt)

  // Horizontal bar chart
  #block(width: 100%, inset: (left: 0pt), stroke: (left: 0.5pt + palette.border))[
    #v(6pt)
    #hbar([DeepSeek], [national fund-led], [\$50B], "67%", variant: "accent")
    #v(10pt)
    #hbar([Zhipu AI 智谱], [HK listed · market cap], [\$56.1B], "75%", variant: "amber")
    #v(10pt)
    #hbar([MiniMax], [HK listed · market cap], [\$37.2B], "50%", variant: "amber")
    #v(10pt)
    #hbar([Moonshot (Kimi)], [Series D · 美团领投], [\$20B], "27%", variant: "gray")
    #v(10pt)
    #hbar([StepFun 阶跃], [in talks · ~\$2.5B raise], [~\$8B], "11%", variant: "gray")
    #v(6pt)
  ]

  #v(4pt)

  // Legend
  #grid(columns: (auto, auto, auto, auto, 1fr, auto), column-gutter: 16pt, align: horizon,
    [#box(width: 10pt, height: 10pt, fill: palette.accent) #text(size: 7pt, fill: palette.gray)[国家大基金领投]],
    [#box(width: 10pt, height: 10pt, fill: palette.amber) #text(size: 7pt, fill: palette.gray)[港股上市]],
    [#box(width: 10pt, height: 10pt, fill: palette.gray) #text(size: 7pt, fill: palette.gray)[私募]],
    [#box(width: 10pt, height: 10pt, fill: palette.faint) #text(size: 7pt, fill: palette.gray)[在谈]],
    [],
    [
      #text(size: 8pt, fill: palette.accent, tracking: 1pt)[DATA NOTE]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint)[港股市值 vs 私募估值\ 不直接可比，仅供量级参考]
    ],
  )

  #v(1fr)
  #std-footer[Sources: BigGo Finance · TechCrunch · KuCoin · Reuters · HKEX 上市文件 2026-01]
]

// ═══ Page 11: US-China Dual Track ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART III · CHINA CAMP · 11]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[中美 AI 资本：][两条路径][，两种节奏]
  #v(2pt)
  #page-subtitle[Two markets, two playbooks — the structural divergence in 2026]

  #v(8pt)

  // Table header
  #grid(columns: (22%, 40%, 38%), column-gutter: 0pt,
    block(inset: (y: 4pt))[#text(size: 8pt, fill: palette.faint, tracking: 1.5pt)[DIMENSION]],
    block(inset: (y: 4pt))[#text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[UNITED STATES]],
    block(inset: (y: 4pt))[#text(size: 8pt, fill: palette.amber, tracking: 1.5pt)[CHINA]],
  )
  #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]

  #table-row[单轮规模][Single-round scale][\$30B – \$122B][OpenAI \$122B 史上最大][\$2B – \$4B][Moonshot \$2B 单轮最大]
  #table-row[IPO 节奏][IPO timing][推迟 · 私募延后][Q4 2026 目标 \$1T][Q1 已落港][Zhipu / MiniMax 2026-01]
  #table-row[政府角色][Government role][市场驱动][私营 capex · 监管框架][大基金领投][DeepSeek 首次国家大基金]
  #table-row[估值峰值][Peak valuation][#text(fill: palette.accent)[\$852B]][OpenAI · 私募][#text(fill: palette.accent)[\$56B]][Zhipu · 港股市值]
  #table-row[退出路径][Exit path][超大私募 → 推迟 IPO][Anthropic Series G \$30B][二级市场优先][港交所是出口]

  #v(1fr)
  #std-footer[Sources: Crunchbase · HKEX 招股书 · BigGo Finance · 综合公开披露]
]

// ═══ Page 12: Second Tier ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART IV · THE SECOND TIER · 12]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(3pt)
  #page-title[二线梯队：][\$10B-\$50B][  的精英层]
  #v(1pt)
  #page-subtitle[Four companies in the next league — each chasing a different niche]

  #v(4pt)

  #grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 8pt,
    company-card("SAFE SUPERINTELLIGENCE", "SSI", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[SSI]
      #v(2pt)
      #hero-num([\$32B], size: 20pt)
      #v(2pt)
      #text(size: 7pt, fill: palette.gray)[最新估值 / Latest valuation]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[Ilya Sutskever 创立]
      #v(1pt)
      #text(size: 8pt, fill: palette.accent)[\$5B → \$32B]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[半年 6 倍跳涨]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["Single product:\ a safe superintelligence."]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint)[\$2B raised · Alphabet/Nvidia in]
    ], variant: "accent"),

    company-card("SEARCH CHALLENGER", "Perplexity", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[Perplexity]
      #v(2pt)
      #hero-num([\$21B], size: 20pt)
      #v(2pt)
      #text(size: 7pt, fill: palette.gray)[最新估值 / Latest valuation]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[月活 #text(fill: palette.accent)[4500 万]]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[Series E-6 完成]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[直挑 Google 搜索]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["Answer engine,\ not search engine."]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint)[\$200M \@ \$21B · 18 months to here]
    ], variant: "accent"),

    company-card("SOVEREIGN EU AI", "Mistral AI", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[Mistral AI]
      #v(2pt)
      #hero-num([\$13.7B], size: 20pt)
      #v(2pt)
      #text(size: 7pt, fill: palette.gray)[最新估值 / Latest valuation]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[\$830M 债务融资]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[巴黎数据中心]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[#text(fill: palette.accent)[13,800 张] Nvidia GPU]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["Europe's open-source\ sovereign answer."]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint)[Debt-funded · own data-center bet]
    ], variant: "gray"),

    company-card("TRANSATLANTIC MERGER", "Cohere + Aleph Alpha", [
      #text(size: 11pt, weight: "bold", fill: palette.primary)[Cohere +]
      #v(1pt)
      #text(size: 11pt, weight: "bold", fill: palette.primary)[Aleph Alpha]
      #v(2pt)
      #hero-num([\$20B], size: 20pt)
      #v(2pt)
      #text(size: 7pt, fill: palette.gray)[合并实体估值]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 8pt, fill: palette.body)[\$7B + \$3B (Aleph)]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[→ \$20B 合并溢价]
      #v(1pt)
      #text(size: 8pt, fill: palette.body)[ARR \$240M]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint, style: "italic")["Cross-Atlantic sovereign\ enterprise stack."]
      #v(2pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(2pt)
      #text(size: 7pt, fill: palette.faint)[Schwarz Group leads · 2026 deal]
    ], variant: "gray"),
  )

  #v(3pt)
  #block(width: 100%, stroke: (top: 0.5pt + palette.accent))[
    #v(4pt)
    #align(center)[
      #text(size: 10pt, fill: palette.body)[四家公司合计估值 #text(fill: palette.accent, weight: "bold")[\$86.7B]——仅占同期 OpenAI 估值的 *10%*。]
    ]
  ]

  #v(1fr)
  #std-footer[Sources: TechCrunch · CNBC · Tracxn · TechFundingNews 2026 Q1-Q2]
]

// ═══ Page 13: Chapter Nvidia ═══

#chapter-slide(
  bg-image: "images/nvidia_circular.png",
  part-label: "PART V · INFRASTRUCTURE · 13",
  roman: "V",
  cn-title: [闭环],
  en-title: [The Closed Loop],
  subtitle: [当芯片商同时是大股东],
  bullets: (
    [Nvidia 2026 至今股权投资 \$40B+],
    [OpenAI \$30B + xAI + Anthropic + Mistral 全到位],
    [收入 85% 来自 6 个客户],
  ),
)

// ═══ Page 14: Nvidia Sankey ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART V · INFRASTRUCTURE · 14]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(3pt)
  #page-title[钱怎么转：Nvidia 的][圆形投资]
  #v(1pt)
  #page-subtitle[\$40B equity out → AI labs → multi-year compute commitments back to Nvidia]

  #v(3pt)

  // Column headers
  #grid(columns: (16%, 5%, 42%, 5%, 32%), column-gutter: 0pt,
    text(size: 8pt, fill: palette.faint, tracking: 1.5pt)[SOURCE],
    [],
    text(size: 8pt, fill: palette.faint, tracking: 1.5pt)[RECIPIENT],
    [],
    text(size: 8pt, fill: palette.faint, tracking: 1.5pt)[RETURN FLOW],
  )

  #v(4pt)

  // Sankey approximation — source → recipients → return
  #grid(columns: (16%, 5%, 42%, 5%, 32%), column-gutter: 0pt, align: (center, center + horizon, center, center + horizon, center),
    // Source: Nvidia block
    block(fill: palette.accent, inset: 12pt, width: 100%, radius: 4pt)[
      #v(2pt)
      #text(size: 10pt, fill: white, weight: "bold")[Nvidia]
      #v(4pt)
      #text(size: 22pt, fill: white, weight: "bold")[\$40B+]
      #v(3pt)
      #text(size: 8pt, fill: white.transparentize(20%))[equity invested]
      #v(1pt)
      #text(size: 8pt, fill: white.transparentize(20%))[YTD 2026]
      #v(2pt)
    ],

    // Arrow connector: source → recipients
    [
      #text(size: 16pt, fill: palette.accent)[→]
      #v(3pt)
      #text(size: 16pt, fill: palette.accent)[→]
      #v(3pt)
      #text(size: 16pt, fill: palette.accent)[→]
    ],

    // Middle: recipient cards with flow lines
    pad(x: 4pt)[
      #flow-card[OpenAI][\$30B]
      #v(3pt)
      #flow-card[xAI][~\$3B]
      #v(3pt)
      #flow-card[Anthropic][~\$2B]
      #v(3pt)
      #flow-card[Mistral][~\$1B]
      #v(3pt)
      #flow-card[CoreWeave + 其他][~\$4B]
    ],

    // Arrow connector: recipients → return
    [
      #text(size: 16pt, fill: palette.accent)[→]
      #v(3pt)
      #text(size: 16pt, fill: palette.accent)[→]
      #v(3pt)
      #text(size: 16pt, fill: palette.accent)[→]
    ],

    // Return: chip purchases
    block(fill: palette.accent, inset: 12pt, width: 100%, radius: 4pt)[
      #text(size: 10pt, fill: white, weight: "bold")[芯片采购]
      #v(3pt)
      #text(size: 8pt, fill: white.transparentize(20%))[multi-year compute\ commitments]
      #v(6pt)
      #text(size: 22pt, fill: white, weight: "bold")[\$100B+]
      #v(3pt)
      #text(size: 8pt, fill: white.transparentize(20%))[implied return]
      #v(6pt)
      #block(width: 80%, stroke: (top: 0.5pt + white.transparentize(50%)))[]
      #v(3pt)
      #text(size: 8pt, fill: white.transparentize(20%))[10GW (OpenAI)\ + multi-cluster GPU\ deployment]
    ],
  )

  #v(4pt)
  #block(width: 100%, stroke: (top: 0.5pt + palette.accent))[
    #v(3pt)
    #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[WEDBUSH]
    #v(2pt)
    #text(size: 9pt, fill: palette.body, style: "italic")[
      "It fits #text(fill: palette.accent)[squarely into the circular investment theme] that's been driving fears around the market's durability."
    ]
  ]

  #v(1fr)
  #std-footer[Sources: CNBC · The Decoder · NVIDIA newsroom · Bloomberg AI Circular Deals visualization]
]

// ═══ Page 15: Nvidia Pareto ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART V · INFRASTRUCTURE · 15]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[单点风险：Nvidia 收入 ][85% 来自 6 个客户]
  #v(2pt)
  #page-subtitle[Pareto view — when six customers carry the entire upstream supply chain]

  #v(.8em)

  #grid(columns: (68%, 32%), column-gutter: 0pt,
    // Left: pareto chart approximation
    [
      // Bar chart with cumulative line
      #block(width: 100%, height: 230pt, stroke: (left: 0.5pt + palette.border, bottom: 0.5pt + palette.border))[
        // Y axis labels
        #place(left, dx: 4pt, dy: 5%)[#text(size: 7pt, fill: palette.faint)[100%]]
        #place(left, dx: 4pt, dy: 25%)[#text(size: 7pt, fill: palette.faint)[75%]]
        #place(left, dx: 4pt, dy: 50%)[#text(size: 7pt, fill: palette.faint)[50%]]
        #place(left, dx: 4pt, dy: 75%)[#text(size: 7pt, fill: palette.faint)[25%]]
        #place(left, dx: 4pt, dy: 95%)[#text(size: 7pt, fill: palette.faint)[0]]

        // Grid lines
        #place(left, dx: 0pt, dy: 25%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
        #place(left, dx: 0pt, dy: 50%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
        #place(left, dx: 0pt, dy: 75%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]

        // Bars (bottom-aligned)
        #place(bottom + left, dx: 6%)[
          #block(width: 40pt, height: 46pt, fill: palette.accent, radius: (top: 2pt))[]
        ]
        #place(bottom + left, dx: 6%, dy: -50pt)[#text(size: 8pt, fill: palette.accent)[18%]]

        #place(bottom + left, dx: 20%)[
          #block(width: 40pt, height: 42pt, fill: palette.accent, radius: (top: 2pt))[]
        ]
        #place(bottom + left, dx: 20%, dy: -46pt)[#text(size: 8pt, fill: palette.accent)[16%]]

        #place(bottom + left, dx: 34%)[
          #block(width: 40pt, height: 39pt, fill: palette.accent, radius: (top: 2pt))[]
        ]
        #place(bottom + left, dx: 34%, dy: -43pt)[#text(size: 8pt, fill: palette.accent)[15%]]

        #place(bottom + left, dx: 48%)[
          #block(width: 40pt, height: 29pt, fill: palette.amber, radius: (top: 2pt))[]
        ]
        #place(bottom + left, dx: 48%, dy: -33pt)[#text(size: 8pt, fill: palette.body)[11%]]

        #place(bottom + left, dx: 62%)[
          #block(width: 40pt, height: 34pt, fill: palette.amber, radius: (top: 2pt))[]
        ]
        #place(bottom + left, dx: 62%, dy: -38pt)[#text(size: 8pt, fill: palette.body)[13%]]

        #place(bottom + left, dx: 76%)[
          #block(width: 40pt, height: 31pt, fill: palette.amber, radius: (top: 2pt))[]
        ]
        #place(bottom + left, dx: 76%, dy: -35pt)[#text(size: 8pt, fill: palette.body)[12%]]

        // Cumulative line segments connecting dots
        #place(bottom + left, dx: calc.min(10%, 10%) + 3pt, dy: -54pt)[
          #line(start: (0pt, 0pt), end: (14% - 3pt, -36pt), stroke: 1pt + palette.primary)
        ]
        #place(bottom + left, dx: calc.min(24%, 24%) + 3pt, dy: -90pt)[
          #line(start: (0pt, 0pt), end: (14% - 3pt, -36pt), stroke: 1pt + palette.primary)
        ]
        #place(bottom + left, dx: calc.min(38%, 38%) + 3pt, dy: -126pt)[
          #line(start: (0pt, 0pt), end: (14% - 3pt, -30pt), stroke: 1pt + palette.primary)
        ]
        #place(bottom + left, dx: calc.min(52%, 52%) + 3pt, dy: -156pt)[
          #line(start: (0pt, 0pt), end: (14% - 3pt, -34pt), stroke: 1pt + palette.primary)
        ]
        #place(bottom + left, dx: calc.min(66%, 66%) + 3pt, dy: -190pt)[
          #line(start: (0pt, 0pt), end: (14% - 3pt, -30pt), stroke: 1pt + palette.primary)
        ]

        // Cumulative line dots
        #place(bottom + left, dx: 10%, dy: -54pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)]
        #place(bottom + left, dx: 10%, dy: -62pt)[#text(size: 7pt, fill: palette.primary)[18%]]
        #place(bottom + left, dx: 24%, dy: -90pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)]
        #place(bottom + left, dx: 24%, dy: -98pt)[#text(size: 7pt, fill: palette.primary)[34%]]
        #place(bottom + left, dx: 38%, dy: -126pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)]
        #place(bottom + left, dx: 38%, dy: -134pt)[#text(size: 7pt, fill: palette.primary)[49%]]
        #place(bottom + left, dx: 52%, dy: -156pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)]
        #place(bottom + left, dx: 52%, dy: -164pt)[#text(size: 7pt, fill: palette.primary)[60%]]
        #place(bottom + left, dx: 66%, dy: -190pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)]
        #place(bottom + left, dx: 66%, dy: -198pt)[#text(size: 7pt, fill: palette.primary)[73%]]
        #place(bottom + left, dx: 80%, dy: -220pt)[#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent)]
        #place(bottom + left, dx: 80%, dy: -226pt)[#text(size: 9pt, fill: palette.accent, weight: "bold")[85%]]

        // Company labels at bottom
        #place(bottom + left, dx: 6%, dy: 30pt)[#text(size: 8pt, fill: palette.body)[MSFT]]
        #place(bottom + left, dx: 20%, dy: 30pt)[#text(size: 8pt, fill: palette.body)[Meta]]
        #place(bottom + left, dx: 34%, dy: 30pt)[#text(size: 8pt, fill: palette.body)[Google]]
        #place(bottom + left, dx: 48%, dy: 30pt)[#text(size: 8pt, fill: palette.body)[Amazon]]
        #place(bottom + left, dx: 62%, dy: 30pt)[#text(size: 8pt, fill: palette.body)[OpenAI]]
        #place(bottom + left, dx: 74%, dy: 30pt)[#text(size: 7pt, fill: palette.body)[CoreWeave]]
      ]
    ],

    // Right: concentration risk panel
    pad(left: 12pt)[
      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[CONCENTRATION RISK]
      #v(6pt)
      #hero-num([85%], size: 36pt)
      #v(3pt)
      #text(size: 10pt, fill: palette.body)[Nvidia 收入来自 6 个客户]
      #v(6pt)
      #text(size: 14pt, weight: "bold", fill: palette.primary)[前 4 名 = 60%]
      #v(3pt)
      #text(size: 9pt, fill: palette.body)[MSFT + Meta + Google + Amazon]
      #v(6pt)
      #text(size: 10pt, fill: palette.accent)[任一家 hyperscaler 砍 capex]
      #v(2pt)
      #text(size: 9pt, fill: palette.body)[→ 级联打击 Nvidia 财报]
      #v(2pt)
      #text(size: 9pt, fill: palette.body)[→ 全 AI 供应链承压]
      #v(6pt)
      #block(width: 100%, stroke: (top: 0.5pt + palette.border))[]
      #v(4pt)
      #text(size: 8pt, fill: palette.faint, style: "italic")["Binary risk — by design."]
    ],
  )

  #v(1fr)
  #std-footer[Sources: Nvidia 10-Q · Seeking Alpha · KuCoin · 估算口径以官方披露为准]
]

// ═══ Page 16: Stargate Hub ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART V · INFRASTRUCTURE · 16]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[Stargate：][\$500B · 10GW][  · 7 站点]
  #v(2pt)
  #page-subtitle[OpenAI + Oracle + SoftBank · the largest private AI infrastructure program ever announced]

  #v(4pt)

  #grid(columns: (68%, 32%), column-gutter: 0pt,
    // Left: hub-spoke diagram approximation
    align(center)[
      // Top spoke: Abilene
      #pad(x: 20%)[#spoke-node([Abilene, TX], [~1 GW by mid-2026], variant: "active")]
      #v(1pt)

      // Second row: Shackelford + Doña Ana
      #grid(columns: (1fr, 1fr), column-gutter: 8pt,
        spoke-node[Shackelford TX][Planned · Oracle],
        spoke-node[Doña Ana NM][Planned · Oracle],
      )
      #v(1pt)

      // Hub center + side spokes
      #grid(columns: (1fr, auto, 1fr), column-gutter: 6pt, align: center + horizon,
        spoke-node[Saline MI][1 GW · \$7B · build],
        hub-node("STARGATE", [\$500B], [10 GW · 4 YRS]),
        spoke-node[Midwest (TBD)][Site undisclosed],
      )

      #v(1pt)

      // Bottom row
      #grid(columns: (1fr, 1fr), column-gutter: 8pt,
        spoke-node[Lordstown OH][SoftBank · ~0.75 GW],
        spoke-node[Milam TX][SoftBank · ~0.75 GW],
      )
    ],

    // Right: stats panel
    pad(left: 12pt)[
      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[CURRENT PROGRESS]
      #v(3pt)
      #hero-num([7 GW], size: 24pt)
      #v(2pt)
      #text(size: 9pt, fill: palette.body)[已规划容量 · planned capacity]
      #v(4pt)
      #hero-num([\$400B], size: 24pt)
      #v(2pt)
      #text(size: 9pt, fill: palette.body)[未来 3 年投入 · 3-yr commit]
      #v(4pt)
      #text(size: 14pt, weight: "bold", fill: palette.primary)[GB200]
      #v(2pt)
      #text(size: 9pt, fill: palette.body)[Abilene 机架已交付]
      #v(4pt)

      #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[PARTNERS]
      #v(3pt)
      #text(size: 10pt, fill: palette.primary)[OpenAI #h(12pt) Oracle #h(12pt) SoftBank]
      #v(3pt)
      #text(size: 8pt, fill: palette.faint, style: "italic")["Up and running"\ — Sam Altman on Abilene]
    ],
  )

  #v(1fr)
  #std-footer[Sources: OpenAI press 2026-09/2026-02 · DataCenterDynamics · IntuitionLabs · NVIDIA newsroom]
]

// ═══ Page 17: Chapter Bubble ═══

#chapter-slide(
  bg-image: "images/bubble_tension.png",
  part-label: "PART VI · THE BUBBLE · 17",
  roman: "VI",
  cn-title: [泡沫],
  en-title: [The Bubble Question],
  subtitle: [资本与商业现实的剪刀差],
  bullets: (
    [Hyperscaler capex #text(fill: palette.accent)[\$400B] · 企业 AI 收入仅 #text(fill: palette.accent)[\$100B]],
    [增速差距 #text(fill: palette.accent)[46 个百分点] · 2001 电信泡沫期为 32%],
    [MIT 研究：#text(fill: palette.accent)[95%] 生成式 AI 试点未产生商业价值],
  ),
)

// ═══ Page 18: Capex vs Revenue Dual Axis ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART VI · THE BUBBLE · 18]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[资本与营收的鸿沟：][\$725B 投入 vs \$100B 营收]
  #v(2pt)
  #page-subtitle[Hyperscaler capex (LHS, \$B) vs Global Enterprise AI revenue (RHS, \$B), 2020–2026]

  #v(6pt)

  // Dual axis line chart approximation
  #block(width: 100%, height: 240pt, stroke: (left: 0.5pt + palette.border, bottom: 0.5pt + palette.border, right: 0.5pt + palette.border))[
    // Left Y axis labels
    #place(left, dx: 4pt, dy: 2%)[#text(size: 7pt, fill: palette.faint)[\$800B]]
    #place(left, dx: 4pt, dy: 25%)[#text(size: 7pt, fill: palette.faint)[\$600B]]
    #place(left, dx: 4pt, dy: 50%)[#text(size: 7pt, fill: palette.faint)[\$400B]]
    #place(left, dx: 4pt, dy: 75%)[#text(size: 7pt, fill: palette.faint)[\$200B]]
    #place(left, dx: 4pt, dy: 95%)[#text(size: 7pt, fill: palette.faint)[\$0]]

    // Right Y axis labels
    #place(right, dx: -4pt, dy: 2%)[#align(right)[#text(size: 7pt, fill: palette.faint)[\$160B]]]
    #place(right, dx: -4pt, dy: 25%)[#align(right)[#text(size: 7pt, fill: palette.faint)[\$120B]]]
    #place(right, dx: -4pt, dy: 50%)[#align(right)[#text(size: 7pt, fill: palette.faint)[\$80B]]]
    #place(right, dx: -4pt, dy: 75%)[#align(right)[#text(size: 7pt, fill: palette.faint)[\$40B]]]
    #place(right, dx: -4pt, dy: 95%)[#align(right)[#text(size: 7pt, fill: palette.faint)[\$0]]]

    // X axis labels
    #for (i, year) in ("2020", "2021", "2022", "2023", "2024", "2025", "2026").enumerate() {
      place(bottom, dx: (3 + i * 14) * 1%, dy: 14pt)[
        #text(size: 8pt, fill: if year == "2026" { palette.accent } else { palette.faint })[#year]
      ]
    }

    // Grid lines
    #place(left, dx: 0pt, dy: 25%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
    #place(left, dx: 0pt, dy: 50%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]
    #place(left, dx: 0pt, dy: 75%)[#block(width: 100%, stroke: (top: 0.5pt + palette.border.transparentize(60%)))[]]

    // ROI Gap shading (triangle between lines near the right)
    #place(right, dx: -5%, dy: 10%)[
      #block(width: 60pt, height: 100pt, fill: palette.accent.transparentize(80%), radius: 2pt)[]
    ]
    #place(right, dx: -3%, dy: 2%)[
      #text(size: 16pt, fill: palette.accent, weight: "bold")[ROI]
      #v(0pt)
      #text(size: 16pt, fill: palette.accent, weight: "bold")[GAP]
    ]

    // Capex line segments (red solid) connecting dots
    #place(bottom + left, dx: 5% + 3pt, dy: -10pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -4pt), stroke: 1.5pt + palette.accent)]
    #place(bottom + left, dx: 19% + 3pt, dy: -14pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -16pt), stroke: 1.5pt + palette.accent)]
    #place(bottom + left, dx: 33% + 3pt, dy: -30pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -20pt), stroke: 1.5pt + palette.accent)]
    #place(bottom + left, dx: 47% + 3pt, dy: -50pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -40pt), stroke: 1.5pt + palette.accent)]
    #place(bottom + left, dx: 61% + 3pt, dy: -90pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -50pt), stroke: 1.5pt + palette.accent)]
    #place(bottom + left, dx: 75% + 3pt, dy: -140pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -70pt), stroke: 1.5pt + palette.accent)]

    // Capex dots
    #place(bottom + left, dx: 5%, dy: -10pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)]
    #place(bottom + left, dx: 19%, dy: -14pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)]
    #place(bottom + left, dx: 33%, dy: -30pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)]
    #place(bottom + left, dx: 47%, dy: -50pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)]
    #place(bottom + left, dx: 61%, dy: -90pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)]
    #place(bottom + left, dx: 75%, dy: -140pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)]
    #place(bottom + left, dx: 89%, dy: -210pt)[#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent)]
    #place(bottom + left, dx: 83%, dy: -220pt)[#text(size: 9pt, fill: palette.accent, weight: "bold")[\$725B]]

    // Revenue line segments (green dashed) connecting dots
    #place(bottom + left, dx: 5% + 3pt, dy: -6pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -2pt), stroke: (paint: palette.green, thickness: 1.5pt, dash: "dashed"))]
    #place(bottom + left, dx: 19% + 3pt, dy: -8pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -6pt), stroke: (paint: palette.green, thickness: 1.5pt, dash: "dashed"))]
    #place(bottom + left, dx: 33% + 3pt, dy: -14pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -16pt), stroke: (paint: palette.green, thickness: 1.5pt, dash: "dashed"))]
    #place(bottom + left, dx: 47% + 3pt, dy: -30pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -20pt), stroke: (paint: palette.green, thickness: 1.5pt, dash: "dashed"))]
    #place(bottom + left, dx: 61% + 3pt, dy: -50pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -20pt), stroke: (paint: palette.green, thickness: 1.5pt, dash: "dashed"))]
    #place(bottom + left, dx: 75% + 3pt, dy: -70pt)[#line(start: (0pt, 0pt), end: (14% - 3pt, -20pt), stroke: (paint: palette.green, thickness: 1.5pt, dash: "dashed"))]

    // Revenue dots
    #place(bottom + left, dx: 5%, dy: -6pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.green)]
    #place(bottom + left, dx: 19%, dy: -8pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.green)]
    #place(bottom + left, dx: 33%, dy: -14pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.green)]
    #place(bottom + left, dx: 47%, dy: -30pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.green)]
    #place(bottom + left, dx: 61%, dy: -50pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.green)]
    #place(bottom + left, dx: 75%, dy: -70pt)[#box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.green)]
    #place(bottom + left, dx: 89%, dy: -90pt)[#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.green)]
    #place(bottom + left, dx: 83%, dy: -100pt)[#text(size: 9pt, fill: palette.green, weight: "bold")[~\$100B]]
  ]

  #v(14pt)
  // Legend
  #grid(columns: (auto, auto, auto, auto, 1fr), column-gutter: 20pt, align: horizon,
    [#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent) #text(size: 8pt, fill: palette.body)[Hyperscaler Capex (左轴 LHS, \$B)]],
    [#box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.green) #text(size: 8pt, fill: palette.body)[Enterprise AI Revenue (右轴 RHS, \$B)]],
    text(size: 9pt, fill: palette.accent)[差距 +46pt],
    text(size: 8pt, fill: palette.body)[vs 2001 电信泡沫期 +32pt],
    [],
  )

  #v(1fr)
  #std-footer[Sources: Goldman Sachs · Allianz Economic Research · KuCoin · Tom's Hardware · revenue 估算口径以行业披露为准]
]

// ═══ Page 19: Four Risks Quadrant ═══

#slide(config: config-page(margin: (top: 2.5em, bottom: 2em, x: 2em), header: none, footer: none))[
  #section-label[PART VI · THE BUBBLE · 19]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #page-title[四大风险，][互相放大]
  #v(2pt)
  #page-subtitle[The four risk vectors that compound each other in 2026 AI capital]

  #v(10pt)

  // 2x2 Quadrant
  #grid(columns: (1fr, 1fr), rows: (auto, auto), column-gutter: 8pt, row-gutter: 8pt,
    risk-card("RISK 01", [Capex / Revenue 鸿沟], [Capex outruns commercial revenue], [
      · 增速差 #text(fill: palette.accent)[+46pt]\
      · 2001 电信泡沫期为 32pt\
      · #text(fill: palette.accent)[差距已超 2001 泡沫]
    ]),
    risk-card("RISK 02", [企业 ROI 难落地], [Enterprise ROI lags badly behind capex], [
      · MIT: #text(fill: palette.accent)[95%] AI 试点未产生商业价值\
      · 仅 #text(fill: palette.accent)[5%] 企业 EBIT 受 AI 显著影响\
      · 投资在赌"未来兑现"
    ]),
    risk-card("RISK 03", [客户集中度风险], [Six customers carry the whole supply chain], [
      · Nvidia 收入 #text(fill: palette.accent)[85%] 来自 6 家\
      · 前 4 名占近 60%\
      · 任一砍 capex → 级联冲击
    ], variant: "amber"),
    risk-card("RISK 04", [融资结构转向负债], [From operating cash flow to debt], [
      · 现金流融资 → #text(fill: palette.accent)[举债融资]\
      · 自由现金流开始转负\
      · 兑现时间表的耐心被压缩
    ], variant: "amber"),
  )

  // Center multiply symbol
  #place(center + horizon, dy: 20pt)[
    #block(width: 28pt, height: 28pt, radius: 14pt, fill: palette.card, stroke: 0.5pt + palette.border)[
      #set align(center + horizon)
      #text(size: 12pt, fill: palette.faint)[×]
    ]
  ]

  #v(1fr)
  #std-footer[Sources: MIT GenAI Pilot Study · Allianz · Seeking Alpha · Goldman Sachs 2026 outlook]
]

// ═══ Page 20: Closing ═══

#ending-slide[
  #section-label[CLOSING · 20]
  #v(2pt)
  #accent-rule(width: 50pt)
  #v(4pt)
  #grid(columns: (auto, auto), column-gutter: 12pt, align: bottom,
    text(size: 24pt, weight: "bold", fill: palette.primary)[六大判断 /],
    text(size: 24pt, weight: "bold", fill: palette.accent)[Six Takeaways],
  )
  #v(2pt)
  #page-subtitle[Closing notes on 2026's global AI capital landscape]

  #v(10pt)

  #grid(columns: (1fr, 1fr), column-gutter: 20pt,
    [
      #closing-item[1][资本集中度是 2026 主旋律][单季 65% 的全球 VC 进入 4 家公司——"钱没变多，是更集中"]
      #v(4pt)
      #closing-item[2][算力是 2026 的硬通货][Nvidia 既是基建供应商又是大股东，形成全行业闭环结构]
      #v(4pt)
      #closing-item[3][下一道护城河是电力，不是芯片][\$725B Capex 中 60%+ 流向电力 / 冷却 / 土建——资源约束已转移]
    ],
    [
      #closing-item[4][中美双轨结构已成型][美国推迟 IPO 嗜超大私募，中国二级市场全面打开，路径差异不再可逆]
      #v(4pt)
      #closing-item[5][真实 ROI 滞后但巨头未止血][95% 试点失败 vs \$725B capex 继续上调——这是赌"未来兑现"]
      #v(4pt)
      #closing-item[6][Anthropic 反超 OpenAI][在谈估值 \$900B vs \$852B；ARR 增速 Anthropic 已超越 OpenAI]
    ],
  )

  #v(6pt)

  // Editorial close
  #block(fill: palette.card, inset: 12pt, width: 100%, radius: 3pt,
    stroke: (left: 3pt + palette.accent, rest: 0.5pt + palette.border),
  )[
    #text(size: 8pt, fill: palette.accent, tracking: 1.5pt)[EDITORIAL CLOSE]
    #v(3pt)
    #text(size: 12pt, fill: palette.body, style: "italic")[
      "This is not yet the bubble bursting.\
      #text(fill: palette.accent)[It is the bubble compounding."]
    ]
  ]

  #v(4pt)
  #text(size: 8pt, fill: palette.faint, tracking: 1pt)[PRIMARY SOURCES]
  #v(2pt)
  #text(size: 7pt, fill: palette.faint)[
    Crunchbase · PitchBook · CNBC · Bloomberg · TechCrunch · OpenAI / Anthropic / xAI press · Tom's Hardware\
    Goldman Sachs · Allianz · Statista · MIT GenAI Pilot Study · BigGo Finance · TechFundingNews · DataCenterDynamics
  ]

  #v(1fr)
  #place(bottom + right, dx: -5%, dy: -2%)[
    #context { text(size: 7pt, fill: palette.faint)[#utils.slide-counter.display() / #utils.last-slide-number · End of briefing] }
  ]
]
