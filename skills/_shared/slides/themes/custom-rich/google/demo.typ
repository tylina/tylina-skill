#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist
#import "@preview/lilaq:0.6.0" as lq

#show: checklist.with(stroke: palette.blue, radius: 0.2em)

#show: google-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Google Cloud Annual Report 2024],
    subtitle: [Innovation, Growth & Cloud Transformation],
    author: [Alex Chen],
    date: datetime.today(),
    institution: [Google Cloud],
  ),
)

#set text(font: ("Arial", "Noto Sans SC"))

// ═══ Cover ═══

#title-slide()

// ═══ Table of Contents ═══

#outline-slide(
  title: [Contents],
  (
    [Year in Review],
    [Cloud Infrastructure],
    [AI & Innovation],
    [Customer Success],
    [2025 Outlook],
  ),
)

= Year in Review

== Key Performance Indicators

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #kpi-card(
    [Annual Revenue],
    [\$33.1B],
    trend: [#sym.arrow.t 26%],
    trend-color: palette.success,
    accent: palette.blue,
  )
][
  #kpi-card(
    [Enterprise Clients],
    [12,400+],
    trend: [#sym.arrow.t 34%],
    trend-color: palette.success,
    accent: palette.red,
  )
][
  #kpi-card(
    [Global Regions],
    [40],
    trend: [+5 new],
    trend-color: palette.success,
    accent: palette.yellow,
  )
][
  #kpi-card(
    [Net Promoter Score],
    [78],
    trend: [#sym.arrow.t 12pts],
    trend-color: palette.success,
    accent: palette.green,
  )
]

#v(0.6em)

#insight-box([Year Highlights])[\
  Revenue surpassed \$33B for the first time, driven by strong enterprise adoption of generative AI services and multi-cloud solutions. Operating margin improved 400bps year-over-year.
]

== Financial Overview

#stack(
  spacing: 0.8em,
  [
    #cols(columns: (3fr, 2fr))[
      #data-table(
        ([Metric], [FY2023], [FY2024], [Growth]),
        (
          ([Revenue], [\$26.3B], [\$33.1B], [+26%]),
          ([Gross Profit], [\$14.5B], [\$19.2B], [+32%]),
          ([Operating Income], [\$1.9B], [\$3.8B], [+100%]),
          ([Free Cash Flow], [\$3.2B], [\$5.1B], [+59%]),
          ([Backlog], [\$64B], [\$83B], [+30%]),
        ),
      )
    ][
      #success-box([Profitability Milestone])[\
        - First full year of sustained profitability
        - Gross margin expanded to 58%
        - FCF conversion rate improved to 15.4%
        - Backlog grew to \$83B (+30%)
      ]
    ]
  ],
  [
    #lq.diagram(
      width: 90%,
      height: 48pt,
      xaxis: (
        ticks: ((1, [FY2023]), (2, [FY2024])),
        subticks: none,
        mirror: false,
      ),
      yaxis: (
        subticks: none,
        mirror: false,
      ),
      lq.bar(
        (1, 2),
        (26.3, 33.1),
        width: 0.5,
        fill: palette.blue,
      ),
    )
  ],
)

= Cloud Infrastructure

== Infrastructure Scale

#stat-row(
  (value: [40], label: [Regions]),
  (value: [121], label: [Zones]),
  (value: [187], label: [Edge PoPs]),
  (value: [99.99%], label: [Uptime]),
)

#cols(columns: (1fr, 1fr, 1fr, 1fr))[
  #feature-card(1, [Compute], [\
    Axion C4: +50% price-perf
  ])
][
  #feature-card(2, [Storage], [\
    Autoclass: −30% cost
  ])
][
  #feature-card(3, [BigQuery], [\
    BI Engine: 10x faster
  ])
][
  #feature-card(4, [GKE], [\
    Autopilot: 60% adoption
  ])
]

== Performance Benchmarks

#cols(columns: (3fr, 2fr), lazy-layout: true)[
  #data-table(
    ([Service], [Improvement], [Benchmark]),
    (
      ([Compute (C4)], [+50%], [Price-perf vs. prev gen]),
      ([Storage I/O], [+80%], [IOPS throughput]),
      ([Network], [200 Gbps], [Max bandwidth/VM]),
      ([BigQuery], [10x], [BI Engine acceleration]),
      ([GKE Deploy], [-40%], [Pod startup latency]),
    ),
  )
][
  #insight-box([Infrastructure Edge])[\
    Custom silicon strategy (Axion, TPU v5p) delivers consistent advantages over commodity hardware. Network fabric redesign enables 200 Gbps per VM.
  ]
]

= AI & Innovation

== Gemini Ecosystem

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #kpi-card([Gemini API Calls], [2B+ / day], accent: palette.blue)
][
  #kpi-card([AI Developers], [4M+], accent: palette.green)
][
  #kpi-card([Model Variants], [15+], accent: palette.yellow)
]

#v(0.3em)

#cols(columns: (1fr, 1fr))[
  === Gemini Models

  - *Ultra* — Complex reasoning
  - *Pro* — Performance & cost balance
  - *Flash* — Low latency, high throughput
  - *Nano* — On-device, privacy-first
][
  === Vertex AI Platform

  - Model Garden: 150+ foundation models
  - Grounding with Google Search
  - Agent Builder: low-code AI agents
  - MLOps: automated training pipelines
]

== AI-Powered Solutions

#v(2.5em)

#block(height: 235pt)[
  #cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
    #phase-card([Solution], [Document AI], [\
      - 98% extraction accuracy
      - 200+ document types
      - Custom processors
    ], accent: palette.blue)
  ][
    #phase-card([Solution], [Contact Center AI], [\
      - 35% call deflection
      - Real-time agent assist
      - Sentiment analysis
    ], accent: palette.red)
  ][
    #phase-card([Solution], [Healthcare AI], [\
      - Med-PaLM 2 integration
      - FHIR-native pipelines
      - Clinical trial matching
    ], accent: palette.yellow)
  ][
    #phase-card([Solution], [Retail AI], [\
      - Visual search
      - Recommendations AI
      - Shelf intelligence
    ], accent: palette.green)
  ]
]

= Customer Success

== Enterprise Adoption

#cols[
  #data-table(
    ([Industry], [Clients], [YoY Growth]),
    (
      ([Financial Services], [2,800+], [+28%]),
      ([Healthcare], [1,500+], [+42%]),
      ([Retail & CPG], [2,200+], [+31%]),
      ([Manufacturing], [1,400+], [+38%]),
      ([Public Sector], [900+], [+25%]),
    ),
  )
][
  #kpi-card([Total Enterprise Clients], [12,400+],
    trend: [#sym.arrow.t 34% YoY], trend-color: palette.success, accent: palette.blue)

  #alert-box([Challenge])[
    Skilled cloud talent shortage remains the #1 barrier to adoption. Google Cloud Skills Boost program trained 1.2M professionals in 2024.
  ]
]

== Customer Impact Stories

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #feature-card(1, [Deutsche Bank], [\
    GKE migration: 3x faster trading, 40% cost cut
  ])
][
  #feature-card(2, [Mayo Clinic], [\
    Med-PaLM: 25% faster diagnostics
  ])
][
  #feature-card(3, [Walmart], [\
    Vertex AI: 15% larger baskets for 240M+ users
  ])
][
  #feature-card(4, [Airbus], [\
    Digital twin: weeks to hours in design
  ])
]

= 2025 Outlook

== Strategic Roadmap

#v(2em)

#stack(
  spacing: 0.8em,
  [
    #block(height: 165pt)[
      #cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
        #phase-card([H1 2025], [Foundation], [\
          - Gemini 2.0 launch
          - Axion Gen2 rollout
        ], accent: palette.blue)
      ][
        #phase-card([H1 2025], [Expansion], [\
          - Sovereign cloud (EU)
          - Partner ecosystem 2x
        ], accent: palette.red)
      ][
        #phase-card([H2 2025], [Innovation], [\
          - Multimodal agents
          - Quantum-safe crypto
        ], accent: palette.yellow)
      ][
        #phase-card([H2 2025], [Scale], [\
          - \$40B revenue target
          - Carbon-free energy
        ], accent: palette.green)
      ]
    ]
  ],
  [
    #block(height: 80pt)[
      #set text(size: 0.9em)
      #insight-box([2025 Vision])[\
        *Infrastructure*, *AI Leadership*, and *Customer Obsession* drive sustainable growth toward \$40B.
      ]
    ]
  ],
)

== 2025 Launch Readiness

#block(height: 225pt)[
  #success-box([H1 2025 Checklist])[\
    - [x] Gemini 2.0 architecture finalized and staged rollout approved
    - [x] Axion Gen2 silicon tape-out complete and sampling to partners
    - [/] Sovereign Cloud EU regulatory review and data residency certification
    - [/] Partner ecosystem expansion program onboarding second cohort
    - [ ] Multimodal agent framework beta released to enterprise customers
    - [ ] Carbon-free energy commitments validated across all 40 regions
  ]
]

#focus-slide[
  _"The best way to predict the future is to build it."_

  -- Google Cloud Team
]

#ending-slide[Thank You]
