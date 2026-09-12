#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/cheq:0.4.0": checklist
#import "@preview/merman:0.1.0": show-mermaid-blocks

#show: checklist.with(stroke: palette.accent, radius: 0.2em)
#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 100%)

#show: corporate-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Q4 2024 Strategic Review],
    subtitle: [Annual Performance & Growth Outlook],
    author: [Sarah Chen, Chief Strategy Officer],
    date: datetime(year: 2024, month: 12, day: 31),
    institution: [Apex Global Consulting],
  ),
)

#set text(font: ("Arial", "Noto Sans SC"))

#title-slide()
#speaker-note[Open with the Q4 review mandate: confirm the year-end results, then align the leadership team on the FY2025 growth plan.]

= Executive Summary
#speaker-note[Frame this section as the decision-oriented summary: performance first, then the evidence behind the headline results.]

== Key Performance Indicators

#stack(
  spacing: 0.8em,
  [
    #cols(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 0.8em,
      lazy-layout: true,
    )[
      #kpi-card(
        [Revenue],
        [\$142.0 million],
        trend: [#sym.arrow.t 12%],
        trend-color: palette.success,
      )
    ][
      #kpi-card(
        [EBITDA Margin],
        [28.4%],
        trend: [#sym.arrow.t 3.1pp],
        trend-color: palette.success,
      )
    ][
      #kpi-card(
        [客户净推荐值 / Customer NPS],
        [72],
      )
    ][
      #kpi-card(
        [Churn Rate],
        [4.2%],
        trend: [#sym.arrow.b 1.8pp],
        trend-color: palette.danger,
      )
    ]
  ],
  insight-box([Executive Takeaway], [
    Strong revenue growth driven by enterprise segment expansion (+18% YoY).
    Margin improvement reflects operational efficiency gains from the cost transformation
    initiative launched in Q2. Customer satisfaction at all-time high.
  ]),
)
#speaker-note[Lead with revenue and margin momentum. The long revenue value and bilingual NPS label also demonstrate that KPI alignment remains stable across varied Latin and CJK content lengths.]

== Financial Overview

#cols(columns: (3fr, 2fr))[
  #figure[
    #data-table(
      ([Metric], [Q3 2024], [Q4 2024], [YoY]),
      (
        ([Revenue], [\$128M], [\$142M], [+12%]),
        ([Gross Profit], [\$82M], [\$94M], [+15%]),
        ([EBITDA], [\$34M], [\$40M], [+18%]),
        ([Free Cash Flow], [\$22M], [\$28M], [+27%]),
      ),
    )
  ]
][
  #insight-box([Highlights])[
    - Revenue exceeded forecast by 4%
    - Gross margin expanded 200bps
    - FCF conversion improved to 70%
    - Operating leverage driving profitability
  ]
]
#speaker-note[Walk from revenue to free cash flow. Emphasize that every profitability line grew faster than revenue, indicating operating leverage.]

== Revenue Trend

#let quarters = ("Q1'23", "Q2'23", "Q3'23", "Q4'23", "Q1'24", "Q2'24", "Q3'24", "Q4'24")
#let revenue-data = (98, 105, 112, 118, 122, 128, 135, 142)
#let profit-data = (24, 28, 31, 33, 35, 38, 42, 48)
#let x-vals = range(8).map(i => i + 1)

#figure[
  #lq.diagram(
    width: 520pt, height: 220pt,
    xaxis: (ticks: range(8).map(i => (i + 1, quarters.at(i))), subticks: none),
    yaxis: (ticks: ((0, "0"), (50, "$50M"), (100, "$100M"), (150, "$150M")), subticks: none),
    lq.plot(x-vals, revenue-data, stroke: 2.5pt + palette.primary, label: none),
    lq.plot(x-vals, profit-data, stroke: 2.5pt + palette.success, label: none),
  )

  #align(right)[
    #stack(dir: ltr, spacing: 20pt,
      series-key([Revenue]),
      series-key([EBITDA], color: palette.success),
    )
  ]
]
#speaker-note[Use the widening gap between the revenue and EBITDA series to reinforce the margin-expansion story across the eight quarters.]

== Segment Performance

#let segments = ("Enterprise", "Mid-Market", "SMB", "Channel")
#let seg-values = (68, 42, 22, 10)
#let seg-colors = (palette.primary, palette.secondary, palette.accent, palette.gray-medium)

#cols(columns: (3fr, 2fr))[
  #figure[
    #set text(.7em)
    #lq.diagram(
      width: 300pt, height: 200pt,
      xaxis: (ticks: range(4).map(i => (i + 1, segments.at(i))), subticks: none),
      yaxis: (ticks: ((0, "0"), (20, "$20M"), (40, "$40M"), (60, "$60M"), (80, "$80M")), subticks: none),
      lq.bar(
        range(4).map(i => i + 1),
        seg-values,
        fill: seg-colors,
        width: 65%,
      ),
    )
  ]
][
  #insight-box([Segment Analysis])[
    - *Enterprise* (48%): Largest and fastest-growing segment, driven by multi-year contracts
    - *Mid-Market* (30%): Strong pipeline with 15% QoQ growth
    - *SMB* (15%): Stable, self-serve model keeps CAC low
    - *Channel* (7%): New partner program showing early traction
  ]
]
#speaker-note[Enterprise remains the growth engine, while the partner channel is the smallest segment but an important source of future leverage.]

= Strategic Priorities
#speaker-note[Transition from the performance diagnosis to the three strategic choices that will shape FY2025 execution.]

== Growth Pillars

#stack(
  spacing: 0.8em,
  [
    #cols(lazy-layout: true)[
      #pillar-card(1, [Market Expansion], [
        Enter 3 new geographic markets in APAC and LATAM.
        Target \$25M incremental ARR by FY2025.
      ])
    ][
      #pillar-card(2, [Product Innovation], [
        Launch AI-powered analytics platform.
        Increase R&D investment to 18% of revenue.
      ])
    ][
      #pillar-card(3, [Operational Excellence], [
        Automate 40% of support workflows.
        Reduce cost-to-serve by 15%.
      ])
    ]
  ],
  insight-box([Strategic Intent], [
    These three pillars form an integrated growth engine.
  ]),
)
#speaker-note[Explain that the pillars are mutually reinforcing: market expansion creates demand, product innovation differentiates the offer, and operational excellence funds both.]

== Competitive Landscape

#cols[
  #figure[
    #data-table(
      align: (left + horizon, center + horizon, center + horizon, center + horizon),
      ([Company], [Market Share], [Growth], [Threat]),
      (
        ([Apex], [24%], [+12%], [n/a]),
        ([Rival A], [18%], [+8%], [Medium]),
        ([Rival B], [15%], [+15%], [High]),
        ([Rival C], [9%], [+3%], [Low]),
        ([Others], [34%], [+5%], [Low]),
      ),
    )
  ]
][
  === Our Advantages

  - *Scale*: Largest customer base in segment
  - *Technology*: 2-year lead in AI/ML capabilities
  - *Brand*: Highest NPS among enterprise buyers
  - *Talent*: 92% retention of top performers

  #v(0.3em)

  === Key Risk

  Rival B's aggressive pricing strategy requires monitoring.
]
#speaker-note[Position Apex as the scale and technology leader, while flagging Rival B's faster growth and price aggression as the risk to watch.]

== Implementation Roadmap

#cols(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.6em,
  lazy-layout: true,
)[
  #pillar-card(
    [Q1], [Foundation], [Team hiring, market research, platform architecture design],
  )
][
  #pillar-card(
    [Q2], [Build], [MVP development, pilot market entry, partner onboarding],
  )
][
  #pillar-card(
    [Q3], [Launch], [Product GA, market expansion, campaign rollout],
  )
][
  #pillar-card(
    [Q4], [Scale], [Full deployment, optimization, performance review],
  )
]
#speaker-note[Walk the roadmap quarter by quarter: establish the foundation, build and pilot, launch broadly, then scale and optimize.]

== Initiative Progress Tracker

#insight-box([Implementation Gantt Chart])[
  ```mermaid
  gantt
    dateFormat YYYY-MM-DD
    axisFormat %b

    section Market Expansion
    APAC scouting              : a1, 2025-01-06, 60d
    LATAM partners             : a2, after a1, 45d
    Market launch              : milestone, m1, after a2, 0d

    section Product Innovation
    AI platform MVP            : b1, 2025-02-01, 90d
    Beta iteration             : b2, after b1, 60d
    GA release                 : milestone, m2, after b2, 0d

    section Operational Excellence
    Support automation         : c1, 2025-01-15, 120d
    Cost optimization          : c2, after c1, 90d
  ```
]
#speaker-note[Use the Gantt view to show that market, product, and efficiency workstreams run in parallel, with market launch and GA release as explicit decision gates.]

== Milestone Readiness

#insight-box([Q1--Q2 Milestone Checklist])[
  - [x] Market research and competitive analysis complete
  - [x] Executive alignment on three growth pillars secured
  - [/] APAC partner onboarding and pilot agreements in progress
  - [/] AI analytics platform MVP under active development
  - [ ] Board presentation for Phase 2 funding scheduled
  - [ ] Full deployment and performance review framework finalized
]
#speaker-note[Confirm the two completed alignment milestones, identify the two active workstreams, and assign owners for the remaining board and deployment readiness items.]

#focus-slide[
  _"Growth is never by mere chance; it is the result of forces working together."_

  --- James Cash Penney
]
#speaker-note[Use the quotation as a brief pause before closing: the strategy depends on coordinated execution rather than any single initiative.]

#ending-slide[Thank You]
#speaker-note[Close with the requested decisions and invite questions on assumptions, sequencing, or resource allocation.]
