#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Serif-first typography: classic newspaper feel
#set text(font: "Libertinus Serif", size: 18pt)

// Build palette for inline use in slides
#let pal = build-palette("broadsheet")

#show: newspaper-theme.with(
  aspect-ratio: "16-9",
  preset: "broadsheet",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Quarterly Record],
    subtitle: [Q4 Financial Results & Market Analysis],
    author: [Research Division],
    date: datetime.today(),
    institution: [THE QUARTERLY RECORD],
  ),
)

// ===== Title / Masthead =====

#title-slide()

// ============================================================
// Section 1: Market Overview
// ============================================================

= Market Overview

// ============================================================
// Slide 1 -- Key Performance Indicators
// ============================================================

#slide(title: [Q4 Key Performance Indicators])[
  #news-grid(cols: 3,
    edition-stat([\$12.4B], "Revenue", description: [Up 18% year-over-year, exceeding analyst consensus of \$11.8B]),
    edition-stat([\$3.2B], "Net Income", description: [Operating margin expanded 340bps to 26.1% driven by cost efficiencies]),
    edition-stat([847M], "Active Users", description: [Monthly active users grew 23% with strong retention in enterprise tier]),
  )
  #v(0.8em)
  #byline-tag("Research Division", date: [Q4 2025 Earnings Report])
]

// ============================================================
// Slide 2 -- Dark: Market Headlines
// ============================================================

#dark-slide(
  title: none,
  ghost: [Q4],
  ghost-size: 200pt,
  ghost-dy: -30pt,
  ghost-dx: -10pt,
  header-left: [MARKETS DESK],
  header-right: [QUARTERLY RECORD -- 2025],
)[
  #text(size: 38pt, weight: "bold", font: _serif-font)[
    Revenue Surges Past Expectations#linebreak()as Enterprise Demand Accelerates
  ]

  #v(0.4em)

  #text(size: 9pt, weight: "medium", tracking: 1.8pt, fill: pal.bg.transparentize(50%), font: _mono-font)[LEAD STORY]

  #v(0.6em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 20pt,
    block(width: 100%)[
      #text(size: 13pt, weight: "bold", fill: pal.bg.transparentize(20%))[Enterprise Growth]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(40%), font: _serif-font)[
        Enterprise contracts grew 42% with average deal size increasing to \$2.1M from \$1.5M in the prior quarter.
      ]
    ],
    block(width: 100%)[
      #text(size: 13pt, weight: "bold", fill: pal.bg.transparentize(20%))[Geographic Expansion]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(40%), font: _serif-font)[
        APAC revenue doubled year-over-year. European operations turned profitable for the first time since market entry.
      ]
    ],
    block(width: 100%)[
      #text(size: 13pt, weight: "bold", fill: pal.bg.transparentize(20%))[Product Pipeline]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(40%), font: _serif-font)[
        Three new product lines launching in Q1 2026 targeting healthcare, financial services, and government sectors.
      ]
    ],
  )

  #v(0.5em)

  #block(
    width: 100%,
    stroke: (left: 2pt + pal.bg.transparentize(60%)),
    inset: (left: 1em, y: 0.3em),
  )[
    #text(size: 11pt, style: "italic", fill: pal.bg.transparentize(20%), font: _serif-font)[
      "This quarter demonstrates that our platform strategy is working. Enterprise customers are consolidating on our stack."
    ]
    #h(1em)
    #text(size: 9pt, fill: pal.bg.transparentize(50%), font: _mono-font)[-- CEO, Earnings Call]
  ]
]

// ============================================================
// Slide 3 -- Revenue Breakdown (light, columned)
// ============================================================

#slide(title: [Revenue Breakdown by Segment])[
  #news-grid(cols: 2,
    // Left column: headline card
    headline-card([Cloud Services -- \$7.8B], [
      Cloud infrastructure revenue grew 24% year-over-year, driven primarily by AI workload demand. Compute utilization reached 89% across all regions. New GPU clusters came online in Q3 and are already operating at full capacity. Customer churn fell to historic low of 1.2%.
    ]),
    // Right column: headline card
    headline-card([Enterprise Software -- \$4.6B], [
      License revenue remained stable while subscription conversion accelerated. Annual recurring revenue now represents 78% of total enterprise revenue, up from 61% in the year-ago quarter. Professional services margin improved with automation of deployment workflows.
    ]),
  )
  #v(0.6em)
  #classified-box([Market Note], [
    Forward guidance indicates Q1 2026 revenue of \$13.0B--\$13.4B, representing 20--23% growth. Capital expenditure planned at \$4.2B for data center expansion across three new geographic regions. Board approved additional \$5B share repurchase authorization.
  ])
]

// ============================================================
// Section 2: Analysis
// ============================================================

= Analysis

// ============================================================
// Slide 4 -- Focus: Editorial Quote
// ============================================================

#focus-slide[
  The market no longer rewards growth alone. \
  Profitability and efficiency now command \
  the premium multiples once reserved \
  for hypergrowth narratives.
]

// ============================================================
// Slide 5 -- Strategic Priorities (columned)
// ============================================================

#slide(title: [Strategic Priorities for FY2026])[
  #news-grid(cols: 3,
    block(width: 100%, inset: (y: 0.3em))[
      #text(size: typo.subhead, weight: "bold", font: _serif-font, fill: pal.accent)[I.]
      #v(0.15em)
      #text(size: 15pt, weight: "bold", font: _serif-font)[Platform Consolidation]
      #v(0.3em)
      #text(size: typo.body, fill: pal.ink-light, font: _serif-font)[
        Unify three separate product lines into a single integrated platform. Reduce operational complexity and improve cross-sell rates by 35%.
      ]
      #lazy-v(1fr)
    ],
    block(width: 100%, inset: (y: 0.3em))[
      #text(size: typo.subhead, weight: "bold", font: _serif-font, fill: pal.accent)[II.]
      #v(0.15em)
      #text(size: 15pt, weight: "bold", font: _serif-font)[AI-Native Features]
      #v(0.3em)
      #text(size: typo.body, fill: pal.ink-light, font: _serif-font)[
        Embed AI capabilities across all product tiers. Target 60% of workflows to have AI-assisted components by end of FY2026.
      ]
      #lazy-v(1fr)
    ],
    block(width: 100%, inset: (y: 0.3em))[
      #text(size: typo.subhead, weight: "bold", font: _serif-font, fill: pal.accent)[III.]
      #v(0.15em)
      #text(size: 15pt, weight: "bold", font: _serif-font)[Global Operations]
      #v(0.3em)
      #text(size: typo.body, fill: pal.ink-light, font: _serif-font)[
        Expand data center presence to 12 new regions. Achieve data residency compliance in all major regulatory jurisdictions.
      ]
      #lazy-v(1fr)
    ],
  )
  #v(0.4em)
  #pull-quote([In an era of platform convergence, the winners will be those who deliver integrated value rather than point solutions.], cite: [Chief Strategy Officer])
]

// ============================================================
// Slide 6 -- Risk Factors (dark)
// ============================================================

#dark-slide(
  title: none,
  ghost: [!],
  ghost-size: 160pt,
  header-left: [RISK ASSESSMENT],
  header-right: [CONFIDENTIAL],
)[
  #text(size: 9pt, weight: "medium", tracking: 1.8pt, fill: pal.bg.transparentize(50%), font: _mono-font)[MATERIAL RISK FACTORS]
  #v(0.4em)
  #text(size: 32pt, weight: "bold", font: _serif-font)[
    Key Risks to Monitor
  ]
  #v(0.5em)

  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    block(width: 100%)[
      #text(size: 12pt, weight: "bold", fill: pal.bg.transparentize(10%))[Regulatory Headwinds]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(35%), font: _serif-font)[
        EU AI Act compliance costs estimated at \$180M. New data sovereignty requirements may fragment product architecture.
      ]
      #v(0.6em)
      #text(size: 12pt, weight: "bold", fill: pal.bg.transparentize(10%))[Talent Competition]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(35%), font: _serif-font)[
        AI researcher attrition rate of 15% in Q4. Compensation costs for ML engineering up 28% year-over-year.
      ]
    ],
    block(width: 100%)[
      #text(size: 12pt, weight: "bold", fill: pal.bg.transparentize(10%))[Supply Chain Concentration]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(35%), font: _serif-font)[
        GPU procurement remains single-sourced. Lead times extended to 9 months for next-generation hardware.
      ]
      #v(0.6em)
      #text(size: 12pt, weight: "bold", fill: pal.bg.transparentize(10%))[Macro Environment]
      #v(0.2em)
      #text(size: 11pt, fill: pal.bg.transparentize(35%), font: _serif-font)[
        Enterprise IT budgets under pressure. 34% of surveyed CIOs plan to reduce discretionary spending in H1 2026.
      ]
    ],
  )
]

// ============================================================
// Slide 7 -- Summary Stats
// ============================================================

#slide(title: [Financial Summary -- Full Year 2025])[
  #news-grid(cols: 3,
    edition-stat([\$48.2B], "Annual Revenue", description: [Full year revenue grew 22% year-over-year]),
    edition-stat([34.1\%], "Operating Margin", description: [Expanded from 28.7\% in FY2024]),
    edition-stat([\$8.41], "EPS", description: [Diluted earnings per share, up 31\%]),
  )
  #v(0.8em)
  #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
  #v(0.4em)
  #byline-tag("Investor Relations", date: [Filed with SEC -- Form 10-K])
]

// ===== Ending =====

#ending-slide[The Quarterly Record]
