#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist
#import "@preview/lilaq:0.6.0" as lq

#show: checklist.with(stroke: palette.gold, radius: 0.2em)

#set text(font: ("IBM Plex Sans", "Noto Sans SC", "Arial"), size: 18pt)

#show: exhibit-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Global Market Entry Strategy],
    subtitle: [Board Review -- Q4 2024 | Confidential],
    author: [Strategy & Corporate Development],
    date: datetime.today(),
    institution: [Meridian Capital Partners],
  ),
)

// ═══ Cover ═══

#title-slide()

// ═══ Section 1: Executive Summary ═══

= Executive Summary

== Strategic Recommendation

#takeaway-bar[Management recommends phased entry into Southeast Asian markets, targeting \$2.4B revenue by 2028]

#v(0.1em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #kpi-card(
    [Total Addressable Market],
    [\$18.7B],
    trend: [CAGR 14.2%],
    trend-color: palette.success,
    accent: palette.gold,
  )
][
  #kpi-card(
    [Target Revenue (2028)],
    [\$2.4B],
    trend: [12.8% share],
    trend-color: palette.indigo,
    accent: palette.indigo,
  )
][
  #kpi-card(
    [Required Investment],
    [\$340M],
    trend: [over 36 months],
    trend-color: palette.text-gray,
    accent: palette.blue,
  )
][
  #kpi-card(
    [Projected IRR],
    [28.4%],
    trend: [#sym.arrow.t vs. 22% hurdle],
    trend-color: palette.success,
    accent: palette.success,
  )
]

#v(0.1em)

#insight-box([Board Decision Required])[\
  Approve \$340M for phased Southeast Asia entry across Vietnam, Indonesia, and Thailand. Phase 1 (Vietnam) requires \$85M commitment with go/no-go gate at Month 12.
]

== Investment Thesis Overview

#takeaway-bar[Three converging tailwinds create a time-limited window for market entry at favorable valuations]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #exhibit-card(1, [Demographic Dividend], [
    ASEAN working-age population grows by 11M annually through 2030. Middle class expanding at 18% CAGR.
  ], accent: palette.gold)
][
  #exhibit-card(2, [Digital Leapfrogging], [
    Mobile penetration at 78% with 5G accelerating. Digital payments grew 240% since 2021.
  ], accent: palette.indigo)
][
  #exhibit-card(3, [Regulatory Tailwinds], [
    RCEP reduces tariffs 30--65%. Vietnam's FDI framework offers 5-year tax holidays.
  ], accent: palette.blue)
]

// ═══ Section 2: Market Analysis ═══

= Market Analysis

== Market Size & Growth Trajectory

#takeaway-bar[Southeast Asian addressable market growing 2.3x faster than global average]

#v(0.1em)

#cols(columns: (3fr, 2fr))[
  #data-table(
    ([Market], [TAM 2024], [TAM 2028], [CAGR]),
    (
      ([Vietnam], [\$4.2B], [\$7.8B], [16.7%]),
      ([Indonesia], [\$6.1B], [\$10.4B], [14.3%]),
      ([Thailand], [\$3.8B], [\$5.9B], [11.6%]),
      ([Philippines], [\$2.4B], [\$4.1B], [14.4%]),
    ),
  )
][
  #kpi-card([Combined TAM], [\$18.7B], trend: [2024 baseline], accent: palette.gold)

  #v(0.1em)

  #success-box([Market Timing])[\
    - Competitor density 40% lower than mature markets
    - Acquisition costs 55% below Western benchmarks
  ]
]

== Competitive Landscape

#takeaway-bar[No dominant incumbent -- fragmented market presents consolidation opportunity]

#v(0.2em)

#cols(columns: (3fr, 2fr))[
  #data-table(
    ([Competitor], [Share], [Segment], [Vulnerability]),
    (
      ([Regional Corp A], [12%], [Enterprise], [Limited tech]),
      ([Local Player B], [9%], [Mid-market], [Undercapitalized]),
      ([Global Firm C], [7%], [Enterprise], [Slow localization]),
      ([Others (frag.)], [72%], [Mixed], [No clear leader]),
    ),
  )
][
  #risk-box([Competitive Risks])[\
    - Global Firm C may accelerate ASEAN push in H2 2025
    - Local digital-native startups gaining SMB share
    - Regulatory changes could favor domestic operators
  ]
]

== Customer Segmentation

#takeaway-bar[Enterprise segment offers highest margins; mid-market delivers fastest volume growth]

#v(0.2em)

#stat-row(
  (value: [42%], label: [Enterprise Margin]),
  (value: [28%], label: [Mid-Mkt Margin]),
  (value: [3,200], label: [Target Accounts]),
  (value: [18mo], label: [Avg. Sales Cycle]),
)

#v(0.1em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #insight-box([Primary: Enterprise])[\
    - Fortune 500 ASEAN subsidiaries (480+ accounts)
    - Gov.-linked corporations (120+ entities)
    - Avg. deal size: \$1.2M ARR
  ]
][
  #insight-box([Secondary: Mid-Market])[\
    - Fast-growing domestic cos. (\$50M--\$500M rev.)
    - Digital-first businesses scaling cross-border
    - Avg. deal size: \$280K ARR
  ]
]

// ═══ Section 3: Financial Projections ═══

= Financial Projections

== Investment Phasing & Returns

#takeaway-bar[Phased investment approach limits downside with clear go/no-go gates at each stage]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #phase-card([Phase 1 — Mo. 1--12], [Vietnam Entry], [
    - Investment: \$85M
    - Hire 120 FTEs locally
    - Hanoi & HCMC offices
    - Target: 45 accounts
  ], accent: palette.gold)
][
  #phase-card([Phase 2 — Mo. 13--24], [Indonesia Expansion], [
    - Investment: \$140M
    - Scale to 350 FTEs
    - Jakarta & Surabaya
    - Target: 110 accounts
  ], accent: palette.indigo)
][
  #phase-card([Phase 3 — Mo. 25--36], [Thailand & Scale], [
    - Investment: \$115M
    - Scale to 550 FTEs
    - Bangkok hub launch
    - Target: 200+ accounts
  ], accent: palette.blue)
]

== Five-Year Financial Model

#takeaway-bar[Path to profitability in Year 3 with \$2.4B revenue and 22% EBITDA margin by Year 5]

#cols(columns: (3fr, 2fr))[
  #stack(
    spacing: 0.8em,
    data-table(
      inset: (x: 0.42em, y: 0.3em),
      ([Metric], [Year 1], [Year 3], [Year 5]),
      (
        ([Revenue], [\$42M], [\$520M], [\$2,400M]),
        ([Gross Margin], [38%], [56%], [64%]),
        ([EBITDA], [(\$62M)], [\$31M], [\$528M]),
        ([EBITDA Margin], [neg.], [6%], [22%]),
        ([Headcount], [120], [550], [1,800]),
      ),
    ),
    lq.diagram(
      width: 100%,
      height: 72pt,
      xaxis: (label: [Year], ticks: ((1, [Y1]), (2, [Y2]), (3, [Y3]), (4, [Y4]), (5, [Y5]))),
      yaxis: (label: [Revenue (\$M)], exponent: 0),
      lq.plot(
        (1, 2, 3, 4, 5),
        (42, 200, 520, 1100, 2400),
        stroke: palette.gold + 2pt,
        mark: "o",
        mark-size: 4pt,
      ),
    ),
  )
][
  #stack(
    spacing: 0.8em,
    kpi-card([Payback Period], [3.8 yrs], trend: [below 5yr target], trend-color: palette.success, accent: palette.gold),
    kpi-card([NPV (10% WACC)], [\$1.2B], trend: [3.5x MOIC], trend-color: palette.success, accent: palette.indigo),
    kpi-card([IRR], [28.4%], trend: [vs. 22% hurdle], trend-color: palette.success, accent: palette.success),
  )
]

== Scenario Analysis

#takeaway-bar[Even the bear case delivers returns above cost of capital with downside protection built in]

#v(0.2em)

#figure(
  data-table(
    ([Scenario], [Probability], [Revenue Y5], [EBITDA Y5], [IRR], [NPV]),
    (
      ([Bull Case], [25%], [\$3.1B], [\$744M], [35.2%], [\$1.9B]),
      ([Base Case], [50%], [\$2.4B], [\$528M], [28.4%], [\$1.2B]),
      ([Bear Case], [20%], [\$1.6B], [\$288M], [19.1%], [\$480M]),
      ([Stress Case], [5%], [\$800M], [\$72M], [8.2%], [\$45M]),
    ),
  )
)

#v(0.2em)

#insight-box([Probability-Weighted Return])[\
  Probability-weighted IRR of *26.8%* exceeds the 22% hurdle rate. Bear case still delivers 19.1% IRR. Phase-gate structure allows capital redeployment if stress case materializes.
]

// ═══ Section 4: Strategic Recommendations ═══

= Strategic Recommendations

== Execution Roadmap

#takeaway-bar[12-month sprint to Vietnam proof-of-concept followed by rapid ASEAN scale]

#v(0.2em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #phase-card([Q1 2025], [Foundation], [
    - Legal entity setup
    - Leadership hiring
    - Hanoi office build-out
  ], accent: palette.gold)
][
  #phase-card([Q2 2025], [Launch], [
    - Product localization
    - First 10 enterprise pilots
    - Banking partnerships
  ], accent: palette.indigo)
][
  #phase-card([Q3--Q4 2025], [Prove], [
    - Scale to 45 accounts
    - Achieve \$18M ARR gate
    - Indonesia pre-work
  ], accent: palette.blue)
][
  #phase-card([2026+], [Scale], [
    - Indonesia full launch
    - Thailand market entry
    - Regional hub build
  ], accent: palette.purple)
]

== Risk Mitigation Framework

#takeaway-bar[Structured risk management with pre-defined triggers for disciplined deployment]

#v(0.1em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #exhibit-card(1, [Regulatory Risk], [
    Gov. affairs team, local counsel, compliance framework. \$8M contingency.
  ], accent: palette.danger)
][
  #exhibit-card(2, [Talent Risk], [
    University partnerships, top-quartile comp, 18-mo leadership pipeline.
  ], accent: palette.warning)
]

#v(0.15em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #exhibit-card(3, [Currency Risk], [
    Natural hedging via local revenue, FX forwards, USD enterprise pricing.
  ], accent: palette.indigo)
][
  #exhibit-card(4, [Execution Risk], [
    Phase-gate with kill criteria, advisory board, quarterly reviews.
  ], accent: palette.blue)
]

== Governance & Decision Points

#takeaway-bar[Clear governance with quarterly board reviews and pre-defined escalation triggers]

#v(0.2em)

#cols(columns: (1fr, 1fr))[
  #data-table(
    ([Gate], [Timeline], [Criteria]),
    (
      ([Gate 1], [Month 6], [15 LOIs]),
      ([Gate 2], [Month 12], [\$18M ARR]),
      ([Gate 3], [Month 18], [\$45M ARR]),
      ([Gate 4], [Month 24], [\$65M ARR]),
    ),
  )
][
  #insight-box([Escalation Triggers])[\
    - *Red:* ARR below 60% of gate -- board review
    - *Amber:* 60--80% -- management action
    - *Green:* Above 80% -- proceed as planned
  ]
]

== Board Approval Action Items

#takeaway-bar[Five decisions required today to activate the Vietnam entry programme]

#v(0.3em)

#insight-box([Board Decision Checklist])[\
  - [x] Investment thesis reviewed and financial model stress-tested
  - [x] Legal entity structuring options assessed by external counsel
  - [/] Phase 1 leadership candidates shortlisted — interviews in progress
  - [ ] \$85M Phase 1 capital commitment formally approved
  - [ ] Go/no-go gate criteria and reporting cadence ratified
]

// ═══ Focus Slide ═══

#focus-slide[
  #stack(
    spacing: 0.8em,
    text(style: "italic")[“The question is not whether to enter Southeast Asia, but whether we can afford not to.”],
    text(size: 0.5em, fill: palette.gold, weight: "regular")[-- Strategy & Corporate Development Team],
  )
]

// ═══ Ending ═══

#ending-slide[Thank You]
