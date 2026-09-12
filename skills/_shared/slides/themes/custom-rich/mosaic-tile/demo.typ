// Mosaic Tile Theme Demo — Strategic Growth Framework
// Business presentation showcasing geometric tilework design
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: mosaic-tile-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Apex Ventures -- Strategic Growth Framework 2026],
  config-info(
    title: [Strategic Growth Framework],
    subtitle: [Building Sustainable Competitive Advantage],
    author: [Maya Richardson, Chief Strategy Officer],
    institution: [Apex Ventures Global],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Avenir Next", "Arial", "PingFang SC"))

// ============================
// Title Slide
// ============================
#title-slide()

// ============================
// Section 1: Market Overview
// ============================
= Market Overview

== Current Landscape

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  tile-card([Market Position], [
    Our portfolio spans *three key verticals*:
    - Enterprise SaaS (42% revenue)
    - Digital Infrastructure (31% revenue)
    - Emerging Markets Fintech (27% revenue)
  ], accent: palette.primary),
  tile-card([Competitive Dynamics], [
    The landscape has shifted:
    - *Consolidation wave* in mid-market SaaS
    - AI-native entrants in greenfield segments
    - Regulatory tailwinds in digital identity
  ], accent: palette.secondary),
)

#v(0.3em)

#zellige-box([Key Insight], [
  Markets with regulatory complexity represent our strongest moat. Our 8-year track record gives us a 2-3 year structural advantage over new entrants.
])

== Key Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  facet-stat([Annual Revenue], [\$1.2B], color: palette.primary),
  facet-stat([YoY Growth], [34%], color: palette.highlight),
  facet-stat([Net Retention], [142%], color: palette.secondary),
  facet-stat([Active Markets], [28], color: palette.tile-gold),
)

#v(0.5em)

#arabesque-note([
  Revenue acceleration driven primarily by expansion within existing enterprise accounts. Net retention above 140% for the third consecutive quarter indicates strong product-market fit and successful land-and-expand motions.
])

// ============================
// Section 2: Strategic Pillars
// ============================
= Strategic Pillars

== Growth Framework

#cols[
  #pattern-card([1], [Platform Consolidation], [
    Unify product lines. Time-to-value under 30 days.
  ], accent: palette.primary)

  #pattern-card([2], [Geographic Expansion], [
    MENA and SE Asian markets. 5 new launches by Q4.
  ], accent: palette.secondary)

  #pattern-card([3], [AI Integration], [
    ML across risk and analytics. 40% efficiency gain.
  ], accent: palette.highlight)
][
  #rosette-card([Priority Matrix], [
    *High Impact + Feasible:*
    - Platform API unification
    - Automated compliance engine
    - Self-serve onboarding

    *High Impact + Medium:*
    - Cross-border settlements
    - Predictive churn modeling
  ], accent: palette.primary)

  #v(0.2em)

  #stack(dir: ltr, spacing: 0.5em,
    tessera-tag([Platform], color: palette.primary),
    tessera-tag([AI/ML], color: palette.highlight),
    tessera-tag([Global], color: palette.secondary),
  )
]

== Investment Allocation

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  tile-card([R&D Investment], [
    *\$180M allocated for FY2026:*
    - Core platform engineering: 45%
    - AI/ML capabilities: 25%
    - Security and compliance: 18%
    - Developer experience: 12%

    Engineering headcount growing from 420 to 580.
  ], accent: palette.primary),
  tile-card([Go-to-Market], [
    *\$95M in GTM expansion:*
    - Enterprise sales team expansion: 35%
    - Partner ecosystem development: 28%
    - Brand and demand generation: 22%
    - Customer success scaling: 15%

    Targeting 200+ new enterprise logos.
  ], accent: palette.tile-gold),
)

#v(0.4em)

#interlace-divider(width: 60%)

// ============================
// Section 3: Technology
// ============================
= Technology

== Architecture Evolution

#cols[
  #glazed-box([Current Stack], [
    ```
    Frontend:  React + Next.js (SSR)
    Backend:   Go microservices (K8s)
    Data:      Snowflake + dbt
    ML:        Python (PyTorch/MLflow)
    Infra:     Multi-cloud (AWS + GCP)
    ```
  ])

  #v(0.5em)

  #glazed-box([Target Architecture], [
    ```
    Edge:      Cloudflare Workers (global)
    Core:      Rust services (latency)
    Events:    Apache Kafka (streaming)
    AI:        Custom models + RAG pipeline
    Security:  Zero-trust mesh network
    ```
  ])
][
  #tile-card([Migration Roadmap], [
    *Phase 1 (Q1-Q2):* Edge layer deployment, API gateway consolidation

    *Phase 2 (Q3):* Core service rewrite for latency-critical paths

    *Phase 3 (Q4):* Full event-driven architecture, real-time analytics

    Expected outcomes:
    - 60% latency reduction (p99)
    - 3x throughput improvement
    - 40% infrastructure cost savings
  ], accent: palette.highlight)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    tessera-tag([Rust], color: palette.primary),
    tessera-tag([Edge], color: palette.highlight),
    tessera-tag([Event-Driven], color: palette.secondary),
  )
]

== Data and AI Strategy

#muqarnas-grid(
  columns: 3,
  (
    (title: "Predictive Analytics", body: [Customer lifetime value modeling with 92% accuracy. Churn prediction 60 days in advance.]),
    (title: "Risk Assessment", body: [Real-time fraud detection processing 10K+ transactions per second.]),
    (title: "NLP Pipeline", body: [Document processing for KYC/AML compliance. 85% automation rate.]),
    (title: "Recommendation Engine", body: [Cross-sell propensity scoring driving 23% uplift in expansion revenue.]),
    (title: "Anomaly Detection", body: [Infrastructure health monitoring with 99.7% true positive rate.]),
    (title: "Forecasting", body: [Revenue and capacity planning models with confidence intervals.]),
  ),
)

// ============================
// Section 4: Execution
// ============================
= Execution Plan

== Timeline and Milestones

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  tile-card([H1 2026 Priorities], [
    - *January*: Platform API v3 launch
    - *February*: MENA regulatory approval
    - *March*: AI risk engine GA
    - *April*: Partner marketplace beta
    - *May*: Series F close (\$300M)
    - *June*: Southeast Asia pilot
  ], accent: palette.primary),
  tile-card([H2 2026 Targets], [
    - *July*: Self-serve enterprise tier
    - *August*: Real-time settlements live
    - *September*: 1000th enterprise customer
    - *October*: Rust core services v1
    - *November*: Annual conference
    - *December*: IPO readiness review
  ], accent: palette.secondary),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  facet-stat([Target ARR], [\$1.8B], color: palette.primary),
  facet-stat([Headcount], [2,400], color: palette.highlight),
  facet-stat([Markets], [35+], color: palette.secondary),
)

== Risk Mitigation

#cols[
  #rosette-card([Critical Risks], [
    *1. Regulatory Uncertainty*
    - Multi-jurisdiction compliance framework
    - Dedicated legal teams per region
    - Proactive regulator engagement

    *2. Talent Competition*
    - Equity refresh programs
    - Remote-first engineering culture
    - University partnership pipeline
  ], accent: palette.secondary)

  #v(0.4em)

  #arabesque-note([
    Risk appetite calibrated quarterly through board-level review. Each initiative has defined kill criteria and pivot thresholds.
  ])
][
  #tile-card([Contingency Framework], [
    *Scenario Planning:*

    _Bull case:_ Accelerate geographic expansion, increase M&A activity, fast-track IPO timeline to Q2 2027.

    _Base case:_ Execute current roadmap on schedule, maintain 30%+ growth, IPO readiness by Q4 2027.

    _Bear case:_ Consolidate to profitable core, reduce burn, extend runway to 36+ months, defer expansion.
  ], accent: palette.tile-gold)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    tessera-tag([Governance], color: palette.primary),
    tessera-tag([Scenario Planning], color: palette.secondary),
  )
]

// ============================
// Focus Slide
// ============================

#focus-slide[
  _"Geometric precision in strategy creates compounding returns. Each tile placed with intention strengthens the entire mosaic."_

  #text(size: 0.6em, weight: "regular", fill: palette.bg.darken(20%))[-- Internal Strategy Principle]
]

// ============================
// Ending Slide
// ============================

#ending-slide[Thank You]
