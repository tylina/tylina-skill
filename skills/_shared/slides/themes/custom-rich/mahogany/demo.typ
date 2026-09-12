#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Baskerville", "Times New Roman"))
#show raw: set text(font: "Menlo")

#show: mahogany-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Executive Leadership Forum 2026],
    subtitle: [Strategic Vision & Governance Report],
    author: [Victoria Ashworth, Managing Director],
    date: datetime.today(),
    institution: [Ashworth & Partners Advisory],
  ),
)

#title-slide()

= Strategic Overview

== Organizational Performance

#cols(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.8em,
  lazy-layout: true,
  kpi-card(
    [Annual Revenue],
    [\$284M],
    trend: [#sym.arrow.t 16%],
    trend-color: palette.positive,
  ),
  kpi-card(
    [Client Retention],
    [94.2%],
    trend: [#sym.arrow.t 3.1pp],
    trend-color: palette.positive,
  ),
  kpi-card(
    [Portfolio Value],
    [\$1.8B],
    trend: [#sym.arrow.t 22%],
    trend-color: palette.positive,
  ),
  kpi-card(
    [Team Growth],
    [+47],
    trend: [New hires YTD],
  ),
)

#v(0.6em)

#insight-box([Executive Summary])[
  Record performance across all divisions driven by strategic expansion into
  private equity advisory and cross-border M&A. Client satisfaction at historic
  highs with retention exceeding industry benchmark by 12 percentage points.
]

== Strategic Positioning

#cols(columns: (3fr, 2fr))[
  #executive-card([Market Leadership])[
    Our firm has consolidated its position as the premier advisory practice in
    three key verticals:

    - *Private Equity*: Lead advisor on 14 transactions valued at \$4.2B
    - *Infrastructure*: Sole advisor on 3 sovereign fund mandates
    - *Technology M&A*: Named \#1 boutique by Dealogic for mid-cap tech

    The combination of sector expertise and relationship depth creates a
    sustainable competitive moat.
  ]
][
  #stack(
    spacing: 0.8em,
    stat-card([Deal Volume], [\$4.2B], note: [+38% vs. prior year]),
    stat-card([Win Rate], [72%], note: [Competitive mandates]),
    stat-card([Avg. Fee], [1.4%], note: [Above market median]),
  )
]

== Governance Framework

#cols(lazy-layout: true)[
  #concept-card([Board Composition])[
    - 9 Directors (5 independent, 4 executive)
    - Average tenure: 6.2 years
    - Gender diversity: 44% women
    - Industry expertise spans banking, law, and technology
  ]
][
  #concept-card([Risk Oversight])[
    - Quarterly risk appetite review
    - Real-time compliance monitoring
    - Annual stress testing of capital adequacy
    - Independent audit committee with financial expert chair
  ]
][
  #concept-card([Succession Planning])[
    - Named successors for all C-suite roles
    - 18-month leadership development cohort
    - External benchmark of compensation structure
    - Board self-evaluation conducted annually
  ]
]

= Growth Strategy

== Investment Priorities

#stack(
  spacing: 0.8em,
  panel-box([Capital Allocation Philosophy])[
    We prioritize investments that strengthen our advisory capabilities,
    deepen client relationships, and expand geographic reach. Every allocation
    decision is evaluated against our three-year strategic plan with rigorous
    IRR hurdles.
  ],
  grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    stat-card([Technology], [\$18M], note: [AI & data platforms]),
    stat-card([Talent], [\$12M], note: [Recruitment & training]),
    stat-card([Expansion], [\$8M], note: [New office openings]),
  ),
)

== Market Opportunity

#cols(
  columns: (1fr, 1fr),
  gutter: 1em,
  stack(
    spacing: 0.8em,
    quote-card(
    [The firms that will dominate the next decade are those investing today in
    the intersection of human judgment and artificial intelligence.],
    author: [Harvard Business Review, 2025],
    ),
    callout-box([Key Insight])[
    Our proprietary deal-sourcing algorithm has increased qualified lead
    generation by 340% while reducing research analyst hours by 60%.
    This represents a paradigm shift in advisory productivity.
    ],
  ),
  stack(
    spacing: 0.8em,
    text(size: 1.1em, weight: "bold", fill: palette.text-dark)[Addressable Market],
    grid(
    columns: (1fr, 1fr),
    column-gutter: 0.6em,
    row-gutter: 0.6em,
    stat-card([Total TAM], [\$42B], note: [Global advisory fees]),
    stat-card([Our Share], [0.7%], note: [Significant runway]),
    stat-card([Growth Rate], [8.4%], note: [Market CAGR]),
    stat-card([Target], [1.2%], note: [By 2029]),
    ),
  ),
)

== Client Engagement Model

#cols(lazy-layout: true)[
  #executive-card([Relationship Principles])[
    Our engagement philosophy rests on three pillars that have defined the firm
    since its founding:

    + *Intellectual honesty* — We tell clients what they need to hear
    + *Long-term alignment* — Fee structures tied to outcomes
    + *Institutional memory* — Dedicated teams across deal cycles
  ]
][
  #concept-card([Service Tiers])[
    #mahogany-tag[Platinum] #mahogany-tag(color: palette.brass)[Gold] #mahogany-tag(color: palette.tan)[Silver]

    #v(0.3em)
    - *Platinum*: Dedicated MD coverage, 24/7 availability, board advisory
    - *Gold*: Senior coverage, quarterly strategy sessions
    - *Silver*: Project-based engagement, sector research access
  ]
]

= Operations & Culture

== Talent Strategy

#grid(
    columns: (9fr, 11fr),
    column-gutter: 1em,
    row-gutter: 0.5em,
    panel-box([Our People])[
        The quality of our advisory work is inseparable from the caliber of our
        people. We recruit from the top 5% of business school graduates and
        maintain an 89% retention rate among senior professionals.
    ],
    insight-box([Diversity Commitment])[
      - 44% women in senior leadership (vs. 28% industry avg)
      - 31% ethnically diverse workforce
      - Pay equity audit completed annually — 0.3% gap (within threshold)
      - Returnship program for career-break professionals
    ],
    callout-box([Recognition], accent: palette.burgundy)[
        Named "Best Workplace in Financial Services" for the third consecutive
        year by the Financial Times. Employee NPS of 78 — top decile in industry.
    ],
    concept-card([Development Investment])[
        - \$8,500 per employee annual L&D budget
        - Executive coaching for all Directors
        - Secondment program with 3 global partner firms
        - Sabbatical policy after 7 years of service
    ],
  )

== Operational Excellence

#cols(lazy-layout: true)[
  #executive-card([Technology Infrastructure])[
    - Cloud-first architecture (AWS + Azure)
    - Zero-trust security model
    - 99.97% system uptime
    - SOC 2 Type II certified
    - GDPR & SEC compliant data handling
  ]
][
  #executive-card([Process Innovation])[
    - Automated compliance workflows
    - AI-powered document review (40% faster)
    - Real-time deal pipeline analytics
    - Digital client portal with secure data rooms
    - Integrated CRM with relationship intelligence
  ]
]

#focus-slide[
  _"Excellence is not a destination but a continuous journey of deliberate improvement."_

  — Firm Founding Charter, 1987
]

#ending-slide[Thank You]
