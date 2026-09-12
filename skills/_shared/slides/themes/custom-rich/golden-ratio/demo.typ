// Golden Ratio Theme Demo — Strategic Growth Presentation
// Mathematical proportion meets clear business communication
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist

#show: checklist.with(stroke: palette.primary, radius: 0.2em)

#show: golden-ratio-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Meridian Partners -- Strategic Review 2026],
  config-info(
    title: [Navigating Proportional Growth],
    subtitle: [A Framework for Balanced Strategic Expansion],
    author: [James Thornton, Managing Director],
    institution: [Meridian Strategic Partners],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// Demo-level installed font stack; the reusable theme remains font-agnostic.
#set text(font: ("Charter", "Arial Unicode MS"), size: 17pt)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundation
// ══════════════════════════════════════
= Foundation

== Strategic Pillars

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    proportion-card([Market Intelligence], [
      Deep analysis of market dynamics reveals three converging forces: demographic shifts in key sectors, technology adoption curves reaching inflection points, and regulatory tailwinds creating new market access.

      Our proprietary models identify *optimal entry windows* with 78% historical accuracy.
    ], accent: palette.primary),
    proportion-card([Operational Excellence], [
      Systematic process improvement across the value chain drives margin expansion. Key investments in automation reduce operational overhead by 34% while improving throughput.

      Lean methodology applied to knowledge work yields *2.4x productivity gains* within 18 months.
    ], accent: palette.secondary),
  ),
  spiral-box([Core Principle], [
    Sustainable growth follows natural proportions. Like the golden ratio in nature, business expansion must maintain *harmonic balance* between ambition and capacity. Over-extension breaks the spiral; under-investment stalls momentum.
  ]),
)

== Market Landscape

#cols[
  #stack(spacing: .8em,
    grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, align: top,
      fibonacci-stat([Total Market], [\$24.8B], color: palette.primary),
      fibonacci-stat([Growth Rate], [18.2%], color: palette.secondary),
      fibonacci-stat([Our Share], [4.3%], color: palette.primary),
      fibonacci-stat([Target], [7.8%], color: palette.highlight),
    ),
    harmonic-card(
      [Current Position], [
        - Revenue: \$1.07B annually
        - 340 enterprise clients
        - 4 geographic regions
        - 12 product verticals
      ],
      [Growth Target (2028)], [
        - Revenue: \$2.4B annually
        - 580 enterprise clients
        - 7 geographic regions
        - 18 product verticals
      ],
    ),
  )
][
  #stack(spacing: .8em,
    proportion-card([Competitive Dynamics], [
      *Tier 1 Competitors*: Strong brand but slow to innovate. Legacy architectures limit their agility.

      *Emerging Challengers*: Fast but lack enterprise credibility and scale economics.

      *Our Advantage*: Balanced combination of innovation velocity and enterprise trust. The golden mean between agility and stability.
    ], accent: palette.primary),
    theorem-box([Strategic Theorem], [
      Organizations that grow at their natural rate consistently outperform those that expand too fast or too slowly. The optimal pace follows capacity.
    ], accent: palette.highlight),
  )
]

// ══════════════════════════════════════
// Section 2: Analysis
// ══════════════════════════════════════
= Analysis

== Performance Metrics

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, align: top,
    sequence-card([Revenue], [\$1.07B], [22% YoY growth rate], color: palette.primary),
    sequence-card([Clients], [340+], [Enterprise and mid-market mix], color: palette.secondary),
    sequence-card([Retention], [94%], [Top quartile performance], color: palette.primary),
    sequence-card([NPS], [67], [Above industry benchmark], color: palette.highlight),
  ),
  grid(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    proportion-card([Revenue Composition], [
      - *Recurring Services*: 62% (target: 70%)
      - *Project-Based*: 24% (declining as planned)
      - *Product Licensing*: 14% (fastest growth segment)

      Shift toward recurring revenue improves predictability and valuation multiples by 1.8x.
    ], accent: palette.primary),
    proportion-card([Client Segmentation], [
      - *Enterprise (>500 employees)*: 45% of revenue
      - *Mid-Market (100-500)*: 35% of revenue
      - *Growth Stage (50-100)*: 20% of revenue

      Mid-market segment shows highest growth velocity and best unit economics.
    ], accent: palette.secondary),
  ),
)

== Operational Deep Dive

#cols[
  #stack(spacing: .8em,
    proportion-card([Efficiency Gains], [
      *Process Automation*: 34% reduction in manual workflows. AI-assisted analysis cuts research time from 3 weeks to 4 days.

      *Talent Leverage*: Senior partners now handle 1.6x more engagements through structured delegation frameworks.

      *Technology Stack*: Unified platform reduces tool sprawl from 28 systems to 9, saving \$4.2M annually.
    ], accent: palette.primary),
    stack(dir: ltr, spacing: 0.5em,
      phi-tag([Automation], color: palette.primary),
      phi-tag([AI-Assisted], color: palette.secondary),
      phi-tag([Unified], color: palette.highlight),
    ),
  )
][
  #stack(spacing: .8em,
    grid(
      columns: (1fr, 1fr),
      column-gutter: 0.8em,
      row-gutter: 0.5em,
      align: top,
      fibonacci-stat([Utilization], [82%], color: palette.primary),
      fibonacci-stat([Average Margin], [28.4%], color: palette.secondary),
      fibonacci-stat([Win Rate], [64%], color: palette.primary),
      fibonacci-stat([Cycle Time Reduction], [-18%], color: palette.highlight),
    ),
    annotation-note([Key Insight], [
      Margin improvement is driven primarily by *leverage ratios* rather than pricing. Each senior professional now supports 3.2 junior team members (up from 2.1), enabling premium pricing with lower cost delivery.
    ]),
  )
]

// ══════════════════════════════════════
// Section 3: Strategy
// ══════════════════════════════════════
= Strategy

== Growth Framework

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em, align: top,
    proportion-card([Expand], [
      Deepen relationships with existing clients through adjacent service offerings. Cross-sell rate target: 2.8 services per client (current: 1.9).
    ], accent: palette.primary),
    proportion-card([Enter], [
      Targeted entry into 3 new geographic markets with proven demand signals. Partnership-first approach reduces market entry cost by 60%.
    ], accent: palette.secondary),
    proportion-card([Elevate], [
      Move up the value chain with proprietary methodologies and technology-enabled services commanding 40% premium pricing.
    ], accent: palette.highlight),
  ),
  ratio-divider(width: 60%),
  grid(columns: (1fr, 1fr), gutter: 1em, align: top,
    fibonacci-stat([Investment], [\$180M], color: palette.primary),
    fibonacci-stat([Expected ROI], [3.4x], color: palette.secondary),
  ),
)

== Implementation Roadmap

#stack(spacing: .8em,
  nautilus-grid((
    [
      *Phase 1: Foundation (Q3-Q4 2026)*

      Launch the unified platform, hire key leaders, and secure market-entry partners.

      *Gate:* Platform live and \$45M deployed.
    ],
    [
      *Phase 2: Acceleration (2027)*

      Enter two markets and scale sales capacity by 60%.
    ],
    [
      *Phase 3: Optimization (2028)*

      Reach profitability and prepare the next growth horizon.
    ],
  )),
  grid(columns: (1fr, 1fr), gutter: 1em, align: top,
    proportion-card([Risk Controls], [
      - *Market:* exit criteria at each gate
      - *Execution:* priority hires already in pipeline
      - *Financial:* 30% downside buffer
    ], accent: palette.secondary),
    spiral-box([Proportional Principle], [
      Release each phase's capital only after the prior phase's metrics validate the thesis.
    ]),
  ),
)

// ══════════════════════════════════════
// Section 4: Capabilities
// ══════════════════════════════════════
= Capabilities

== Technology Platform

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    proportion-card([Meridian Intelligence Engine], [
      AI platform trained on 15 years of engagement data, with demonstrated 78% prediction accuracy.

      - *Pattern Recognition*: Spots market shifts 6 months ahead
      - *Resource Optimization*: Recommends team composition
      - *Risk Scoring*: Monitors engagement health
    ], accent: palette.primary),
    proportion-card([Client Success Platform], [
      Predictive client management that identifies expansion opportunities and churn risks early.

      - *Expansion Signals*: 3.2x improvement in cross-sell timing
      - *Health Scores*: 89% accuracy for at-risk accounts
      - *Automation*: 45% less administrative overhead
    ], accent: palette.secondary),
  ),
  grid(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    theorem-box([Data Advantage], [
      4,200+ completed engagements across 18 industries create a compounding moat. Each engagement improves the model and widens the scale advantage.
    ], accent: palette.highlight),
    annotation-note([Investment Required], [
      \$28M over 24 months funds full deployment. The plan targets \$95M in additional revenue by 2028 through higher win rates and expansion.
    ]),
  ),
)

== Team and Leadership

#cols[
  #proportion-card([Executive Team], [
    *James Thornton* -- Managing Director; 22 years in consulting and former leader of an \$800M practice.

    *Dr. Sarah Kim* -- Chief Strategy Officer; former partner with a Stanford PhD.

    *Marcus Webb* -- Chief Technology Officer; built two AI platforms and holds 15 patents.

    *Elena Vasquez* -- Chief Revenue Officer; scaled three companies past \$1B.
  ], accent: palette.primary)
][
  #stack(spacing: .8em,
    grid(
      columns: (1fr, 1fr),
      column-gutter: 0.8em,
      row-gutter: 0.5em,
      align: top,
      fibonacci-stat([Team Size], [420], color: palette.primary),
      fibonacci-stat([Average Tenure], [6.2 years], color: palette.secondary),
      fibonacci-stat([Partners], [28], color: palette.primary),
      fibonacci-stat([Senior Professional Staff], [94], color: palette.highlight),
    ),
    annotation-note([Culture Score], [
      Glassdoor rating: 4.6/5.0, satisfaction in the top 5%, and annual attrition of 8% versus an 18% industry average. Retention compounds expertise.
    ]),
  )
]

// ══════════════════════════════════════
// Section 5: Outcomes
// ══════════════════════════════════════
= Outcomes

== Financial Projections

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em, align: top,
    sequence-card([2026 Revenue], [\$1.07B], [Baseline year], color: palette.primary),
    sequence-card([2027 Revenue], [\$1.52B], [42% growth], color: palette.secondary),
    sequence-card([2028 Revenue], [\$2.38B], [57% growth], color: palette.primary),
  ),
  grid(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    proportion-card([Investment Allocation], [
      - *Technology and AI*: \$52M (29%)
      - *Geographic Expansion*: \$45M (25%)
      - *Talent Acquisition*: \$38M (21%)
      - *Product Development*: \$27M (15%)
      - *Marketing and Brand*: \$18M (10%)

      Total strategic investment: \$180M over 24 months.
    ], accent: palette.primary),
    proportion-card([Return Profile], [
      - *Year 1 ROIC*: 1.2x (investment phase)
      - *Year 2 ROIC*: 2.8x (acceleration phase)
      - *Year 3 ROIC*: 4.6x (optimization phase)
      - *Cumulative 3-Year*: 3.4x return on invested capital

      Break-even on incremental investment achieved in Month 18.
    ], accent: palette.secondary),
  ),
)

== The Path Forward

#stack(spacing: .8em,
  harmonic-card(
    [What We Are Asking], [
      - \$180M strategic investment commitment
      - 24-month execution window
      - Board alignment on geographic expansion
      - Approval for 3 key leadership hires
    ],
    [What We Deliver], [
      - 2.2x revenue growth (to \$2.38B)
      - 7.8% market share (from 4.3%)
      - 28%+ operating margins
      - Platform valued at \$400M+ standalone
    ],
  ),
  spiral-box([The Golden Ratio of Growth], [
    Nature's most efficient growth pattern scales each step by 1.618x the previous. Our plan follows this principle: each phase builds proportionally on validated success. *No forced acceleration. No wasted potential.* Just harmonious, compounding growth.
  ]),
)

== Strategic Initiative Tracker

#stack(spacing: .8em,
  nautilus-grid((
    [
      *Phase 1 Execution Checklist*

      Track the foundation milestones required before acceleration capital releases.
    ],
  )),
  [
    - [x] Technology platform vendor selected and contract terms finalised
    - [x] Board investment approval secured for \$180M three-year programme
    - [/] Key leadership hires — CTO and two practice leads — offers extended
    - [/] Partnership agreements with target market entry firms in negotiation
    - [ ] Unified platform migration complete and legacy systems decommissioned
    - [ ] Phase 1 revenue validation gate: \$50M incremental ARR confirmed
  ],
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  #stack(spacing: .8em,
    [_"Growth is never by mere chance; it is the result of forces working together in proportion."_],
    text(size: 0.6em, weight: "regular", fill: palette.border)[-- James Cash Penney, adapted],
  )
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
