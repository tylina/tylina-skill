// McKinsey Theme Demo — Customer Loyalty Transformation Strategic Roadmap
// Demonstrates all McKinsey theme components in a realistic consulting context

#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/cheq:0.4.0": checklist

#show: checklist.with(stroke: palette.blue, radius: 0.2em)

#show: mckinsey-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [McKinsey & Company | Confidential],
  config-info(
    title: [Customer Loyalty Transformation],
    subtitle: [Strategic Roadmap for RetailCo — FY2025--2027],
    author: [Strategy & Operations Practice],
    institution: [McKinsey & Company],
    date: datetime(year: 2025, month: 1, day: 15),
  ),
)

#set text(font: ("Arial", "Helvetica"))

// ══════════════════════════════════════
// Slide 1: Title Slide
// ══════════════════════════════════════

#title-slide()

// ══════════════════════════════════════
// Section 1: Diagnostic
// ══════════════════════════════════════

= Diagnostic

== RetailCo's loyalty program is underperforming peers by 15--20pp on key engagement metrics

#let metrics = ("Redemption\nRate", "NPS\nScore", "Member\nEngagement", "Personalization\nRate")
#let retailco-vals = (23, 31, 38, 5)
#let peer-avg-vals = (41, 52, 61, 34)
#let x-pos = (1, 2, 3, 4)
#let x-pos-b = (1.35, 2.35, 3.35, 4.35)

#cols(columns: (3fr, 2fr))[
  #takeaway-box[Customer lifetime value has declined 18% over 3 years despite \$45M annual program spend]
  #figure[
    #set text(0.72em)
    #lq.diagram(
      width: 300pt, height: 160pt,
      ylim: (0, 70),
      xaxis: (ticks: range(4).map(i => (i + 1.175, metrics.at(i))), subticks: none),
      yaxis: (ticks: ((0, "0"), (20, "20"), (40, "40"), (60, "60%")), subticks: none),
      lq.bar(x-pos, retailco-vals, fill: palette.danger, width: 30%),
      lq.bar(x-pos-b, peer-avg-vals, fill: palette.blue, width: 30%),
    )

    #align(right)[
      #stack(dir: ltr, spacing: 16pt,
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.danger, radius: 1pt),
          text(size: 0.75em)[RetailCo],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.blue, radius: 1pt),
          text(size: 0.75em)[Peer Average],
        ),
      )
    ]
  ]
][
  #stack(
    spacing: .8em,
    kpi-card([Active Members], [12.4M], trend: [▼ 8% YoY], accent: palette.danger),
    kpi-card([Redemption Rate], [23%], trend: [vs. 41% peer avg], accent: palette.amber),
    kpi-card([NPS Score], [+31], trend: [vs. +52 top quartile], accent: palette.amber),
    kpi-card([CLV Index], [0.82], trend: [▼ from 1.00 baseline], accent: palette.danger),
  )
]

== Root cause analysis reveals three structural gaps in the current program architecture

#takeaway-box[The program suffers from misaligned incentives, fragmented data, and poor personalization]

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  framework-box([MECE Problem Decomposition], [
    *1. Value Proposition Gap* — Rewards perceived as low-value; 68% of members report "not worth the effort"\
    *2. Data & Analytics Gap* — Customer data siloed across 7 systems; no unified customer view\
    *3. Experience Gap* — Generic communications; fewer than 5% of offers are personalized
  ]),
  insight-box([Competitive Benchmark], [
    Top-quartile retailers achieve *2.3x higher* redemption rates through personalized, tiered loyalty programs with real-time offer engines. RetailCo's program has not been materially updated since 2019.
  ]),
)

== Customer segmentation reveals high-value cohorts are disengaging fastest


#let segments = ("Lapsed\nMembers", "New\nCustomers", "Occasional\nShoppers", "Core\nRegulars", "Premium\nLoyalists")
#let rev-share = (6, 10, 24, 28, 32)
#let clv-decline = (45, 0, -3, 8, 22)
#let seg-colors = (palette.danger, palette.amber, palette.success, palette.amber, palette.danger)
#let y-pos = (1, 2, 3, 4, 5)

#cols(columns: (3fr, 2fr))[
  #takeaway-box[Premium Loyalists generate 32% of revenue but show the steepest CLV decline — a \$120M revenue protection opportunity]

  #figure[
    #set text(0.72em)
    #lq.diagram(
      width: 290pt, height: 175pt,
      xlim: (0, 50),
      ylim: (0.3, 5.7),
      xaxis: (ticks: ((0, "0%"), (10, "10%"), (20, "20%"), (30, "30%"), (40, "40%")), subticks: none, label: [Revenue Share]),
      yaxis: (ticks: range(5).map(i => (i + 1, segments.at(i))), subticks: none),
      lq.hbar(rev-share, y-pos, fill: seg-colors, width: 55%),
    )

    #align(right)[
      #stack(dir: ltr, spacing: 16pt,
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.danger, radius: 1pt),
          text(size: 0.75em)[High Churn Risk],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.amber, radius: 1pt),
          text(size: 0.75em)[Medium Risk],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.success, radius: 1pt),
          text(size: 0.75em)[Low Risk],
        ),
      )
    ]
  ]
][
  #stack(
    spacing: .8em,
    insight-box([Key Finding], [
      *Premium Loyalists* (32% revenue) show a *▼ 22% CLV decline* and HIGH churn risk despite the highest engagement investment. Immediate intervention is critical.
    ]),
    kpi-card([Revenue at Risk], [\$120M], trend: [from top-2 cohorts], accent: palette.danger),
    kpi-card([Lapsed Members], [6% rev], trend: [▼ 45% CLV · CRITICAL], accent: palette.danger),
  )
]

// ══════════════════════════════════════
// Section 2: Strategic Options
// ══════════════════════════════════════

= Strategic Options

== Three strategic options were evaluated; Option B delivers the highest risk-adjusted ROI

#takeaway-box[We recommend Option B: "Personalized Loyalty 2.0" — a phased transformation with 3.2x projected ROI]

#v(0.3em)

#figure[
  #data-table(
    ([Criteria], [A: Incremental Fix], [B: Loyalty 2.0], [C: Full Rebuild]),
    (
      ([Investment Required], [\$15M], [*\$35M*], [\$80M]),
      ([Projected 3-Year ROI], [1.4x], [*3.2x*], [2.8x]),
      ([Time to Impact], [6 months], [*12 months*], [24 months]),
      ([Execution Risk], [Low], [*Medium*], [High]),
      ([Competitive Moat], [Weak], [*Strong*], [Very Strong]),
    ),
  )
]

== Four interconnected pillars reinforce the strategy

#takeaway-box[Each pillar addresses a specific root cause identified in the diagnostic — together they form a mutually reinforcing system]

#v(0.2em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pillar-card(1, [Tiered Value Architecture], [Redesign reward tiers with aspirational benefits; introduce experiential rewards beyond discounts]),
  pillar-card(2, [Unified Data Platform], [Consolidate 7 data silos into a real-time CDP; enable 360-degree customer view]),
  pillar-card(3, [AI Personalization Engine], [Deploy ML-driven offer optimization; target 40%+ personalization rate within 18 months]),
  pillar-card(4, [Omnichannel Integration], [Seamless earn/burn across all touchpoints; mobile-first experience redesign]),
)

== Pillar 1: Tiered value architecture creates aspiration and increases engagement

#takeaway-box[A well-designed tier structure increases average member spend by 25--35% based on peer benchmarks]

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  framework-box([New Tier Structure], [
    *Silver* (0--500 pts) — Base rewards, birthday bonus\
    *Gold* (500--2000 pts) — 1.5x earn rate, free shipping, early access\
    *Platinum* (2000+ pts) — 2x earn rate, personal stylist, exclusive events\
    *Diamond* (invite-only) — Concierge service, custom experiences
  ]),
  stack(
    spacing: .8em,
    insight-box([Behavioral Economics], [
      Tier progression creates a *goal-gradient effect*: members accelerate spending as they approach the next tier. Gold-to-Platinum transitions show the highest incremental revenue impact.
    ]),
    kpi-card([Projected Uplift], [+28%], trend: [avg spend per member], accent: palette.success),
  ),
)

== Pillar 2: Unified data creates one customer truth

#v(0.3em)

#cols[
  #stack(
    spacing: .8em,
    framework-box([Current State: 7 Siloed Systems], [
      POS System · E-commerce Platform · CRM · Email Marketing · Mobile App · Call Center · Social Media — each with partial, inconsistent customer records
    ]),
    framework-box([Target State: Unified CDP], [
      Single customer identity graph with real-time event streaming, enabling sub-second personalization decisions across all channels
    ]),
  )
][
  #stack(
    spacing: .8em,
    kpi-card([Data Unification], [95%], trend: [match rate target], accent: palette.teal),
    kpi-card([Latency Target], [#sym.lt 200ms], trend: [real-time decisioning], accent: palette.blue),
    kpi-card([Investment], [\$8.5M], trend: [platform build-out], accent: palette.amber),
  )
]

// ══════════════════════════════════════
// Section 3: Implementation Roadmap
// ══════════════════════════════════════

= Implementation Roadmap

== The transformation follows a three-wave approach over 24 months

#takeaway-box[Quick wins in Wave 1 fund the transformation; each wave builds on the capabilities of the prior phase]

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pillar-card(1, [Wave 1: Foundation (M1--M8)], [
    - CDP vendor selection & build\
    - Tier structure redesign\
    - Quick-win personalization\
    - \$12M investment
  ]),
  pillar-card(2, [Wave 2: Scale (M9--M18)], [
    - AI engine deployment\
    - Omnichannel integration\
    - Partner ecosystem launch\
    - \$15M investment
  ]),
  pillar-card(3, [Wave 3: Optimize (M19--M24)], [
    - Advanced analytics\
    - Predictive churn models\
    - Experience innovation\
    - \$8M investment
  ]),
)

== Governance structure ensures cross-functional alignment and rapid decision-making

#v(0.3em)

#insight-box([Risk Mitigation], [
  Key risks include vendor lock-in (mitigated by modular architecture), change management resistance (addressed through dedicated change lead), and data privacy compliance (GDPR/CCPA audit in Wave 1).
])

#v(0.25em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  framework-box[Steering Committee][
    *Cadence:* Bi-weekly\
    *Chair:* Chief Customer Officer\
    *Members:* CTO, CMO, CFO, Head of Retail Ops\
    *Mandate:* Strategic decisions, budget approvals, escalation resolution
  ],
  framework-box[Delivery Squads][
    *Squad 1:* Data & Platform (8 FTEs)\
    *Squad 2:* Personalization & AI (6 FTEs)\
    *Squad 3:* Experience & Design (5 FTEs)\
    *Squad 4:* Commercial & Partnerships (4 FTEs)
  ],
)

== Key milestones and decision gates track progress against value realization

#v(0.3em)

#figure(
  data-table(
    ([Milestone], [Timeline], [Owner], [Success Metric], [Status]),
    (
      ([CDP Go-Live], [M6], [CTO], [95% data match rate], [#status-badge([On Track])]),
      ([Tier Redesign Launch], [M8], [CMO], [+15% enrollment rate], [#status-badge([On Track])]),
      ([AI Engine v1.0], [M12], [Data Lead], [30% personalization rate], [#status-badge([Planning], color: palette.amber)]),
      ([Omnichannel Integration], [M15], [CTO], [4+ channels connected], [#status-badge([Planning], color: palette.amber)]),
      ([Full Platform Maturity], [M24], [CCO], [3.2x ROI achieved], [#status-badge([Future], color: palette.text-light)]),
    ),
  )
)

== Wave 1 Readiness Checklist

#takeaway-box[Wave 1 gate criteria must be met before \$12M commitment releases — current status below]

#v(0.5em)

#insight-box([Wave 1 Execution Progress], [
  #stack(
    spacing: .8em,
    [
      - [x] CDP vendor selected and contracts signed
      - [x] Cross-functional delivery squads staffed and onboarded
      - [/] Tier structure redesign in customer validation testing
      - [/] Quick-win personalization pilots live across 3 regions
      - [ ] AI engine vendor RFP and selection completed
      - [ ] Wave 2 budget allocation approved by Steering Committee
    ],
    stack(
      spacing: .8em,
      text(size: .75em, weight: "bold", fill: palette.blue)[Overall gate readiness · 50%],
      progress-bar(50, color: palette.amber),
    ),
  )
])

// ══════════════════════════════════════
// Section 4: Financial Impact
// ══════════════════════════════════════

= Financial Impact

== The transformation is projected to deliver \$112M in incremental value over 3 years

#takeaway-box[Conservative base case shows 3.2x ROI; upside scenario reaches 4.1x with accelerated AI adoption]

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  kpi-card([Total Investment], [\$35M], trend: [over 24 months], accent: palette.blue),
  kpi-card([3-Year Revenue Uplift], [\$112M], trend: [incremental], accent: palette.success),
  kpi-card([ROI (Base Case)], [3.2x], trend: [risk-adjusted], accent: palette.success),
  kpi-card([Payback Period], [14 months], trend: [from program launch], accent: palette.amber),
)

== Revenue impact builds progressively, reaching \$57M in Year 3 across three value levers

#takeaway-box[Churn reduction delivers the largest share (\$50M) — its compounding effect accelerates in Years 2--3]

#cols(columns: (3fr, 2fr))[
  #figure[

    #let years = (1, 2, 3)
    #let churn-cum = (8, 26, 50)
    #let spend-cum = (13, 27, 65)
    #let total-cum = (15, 55, 112)

    #set text(0.75em)
    #lq.diagram(
      width: 300pt, height: 160pt,
      ylim: (0, 130),
      xaxis: (ticks: ((1, "Year 1"), (2, "Year 2"), (3, "Year 3")), subticks: none),
      yaxis: (ticks: ((0, "\$0M"), (30, "\$30M"), (60, "\$60M"), (90, "\$90M"), (120, "\$120M")), subticks: none),
      lq.plot(years, churn-cum, stroke: 2.5pt + palette.teal, label: [Reduced Churn]),
      lq.plot(years, spend-cum, stroke: 2.5pt + palette.amber, label: [Increased Spend + Acquisition]),
      lq.plot(years, total-cum, stroke: 3pt + palette.blue, label: [Total Cumulative]),
    )

    #align(right)[
      #stack(dir: ltr, spacing: 12pt,
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.blue, radius: 1pt),
          text(size: 0.72em)[Total],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.teal, radius: 1pt),
          text(size: 0.72em)[Reduced Churn],
        ),
        stack(dir: ltr, spacing: 4pt,
          rect(width: 14pt, height: 10pt, fill: palette.amber, radius: 1pt),
          text(size: 0.72em)[Spend + Acquisition],
        ),
      )
    ]
  ]
][
  #stack(
    spacing: .8em,
    kpi-card([3-Year Total], [\$112M], trend: [incremental revenue], accent: palette.success),
    insight-box([Sensitivity Analysis], [
      *Bear case* (70% of targets): 2.1x ROI\
      *Base case* (100%): 3.2x ROI\
      *Bull case* (130%): 4.1x ROI\
      \
      NPV-positive in all scenarios at 10% WACC.
    ]),
  )
]

== Investment phasing aligns with value realization to minimize cash flow risk

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  framework-box([Investment Breakdown], [
      *Technology Platform:* \$14M (40%)\
      *Data & Analytics:* \$8M (23%)\
      *People & Change:* \$6M (17%)\
      *Marketing & Launch:* \$4M (11%)\
      *Contingency:* \$3M (9%)
  ]),
  stack(
    spacing: .8em,
    framework-box([Funding Model], [
      *Wave 1 Quick Wins* generate \$5M in savings that partially fund Wave 2. External investment peaks in M6--M12, then declines as the program becomes self-funding by M18.
    ]),
    kpi-card([Self-Funding By], [Month 18], trend: [of program], accent: palette.success),
  ),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  Recommendation: Proceed with "Personalized Loyalty 2.0"\
  \
  \$35M investment · 3.2x ROI · \$112M value creation\
  \
  #text(size: 0.6em, weight: "regular")[Approval requested for Wave 1 funding (\$12M) to begin immediately]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
