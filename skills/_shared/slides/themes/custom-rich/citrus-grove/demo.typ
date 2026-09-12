#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "IBM Plex Sans")
#show raw: set text(font: "IBM Plex Mono")

#show: citrus-grove-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Fresh Harvest Strategy 2026],
    subtitle: [Growing Our Brand Through Innovation & Sustainability],
    author: [Luna Ortega],
    date: datetime.today(),
    institution: [Citrus Valley Co.],
  ),
)

// ═══ Title ═══

#title-slide()

= Market Overview

== Key Growth Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #stat-card(
    [Revenue Growth],
    [+34%],
    trend: [#sym.arrow.t YoY],
    accent: palette.orange,
  )
][
  #stat-card(
    [New Markets],
    [12],
    trend: [+4 this Q],
    accent: palette.lemon,
  )
][
  #stat-card(
    [Customer NPS],
    [82],
    trend: [#sym.arrow.t 8pts],
    accent: palette.lime,
  )
][
  #stat-card(
    [Organic Reach],
    [2.4M],
    trend: [+120%],
    accent: palette.orange,
  )
]

#v(0.5em)

#insight-box([Key Insight])[
  Our direct-to-consumer channel grew 3x faster than wholesale, driven by subscription box launches and seasonal flavor campaigns. Social media virality contributed 40% of new customer acquisition.
]

== Financial Performance

#cols(columns: (3fr, 2fr))[
  #citrus-table(
    ([Quarter], [Revenue], [Margin], [Growth]),
    (
      ([Q1 2026], [\$4.2M], [42%], [+28%]),
      ([Q2 2026], [\$5.1M], [45%], [+34%]),
      ([Q3 2026], [\$6.8M], [48%], [+41%]),
      ([Q4 2026 (proj)], [\$7.5M], [50%], [+38%]),
    ),
  )
][
  #concept-card([Profitability Driver])[
    - Premium positioning +18% ASP
    - Supply chain optimization saved \$1.2M
    - DTC mix shift: 35% → 52%
    - Subscription revenue: 28% of total
  ]
]

= Product Innovation

== New Product Lines

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #harvest-card(1, [Blood Orange Sparkling], [
    - Cold-pressed, lightly carbonated
    - Zero added sugar
    - Launch: March 2026
    - Pre-orders: 45K units
  ])
][
  #harvest-card(2, [Meyer Lemon Concentrate], [
    - Chef-grade concentrate
    - B2B restaurant channel
    - Launch: May 2026
    - 200 restaurant partners signed
  ])
][
  #harvest-card(3, [Lime & Herb Wellness], [
    - Functional beverage line
    - Adaptogenic blends
    - Launch: July 2026
    - Clinical trials complete
  ])
]

#v(0.4em)

== Grove-to-Glass Promise

#grove-box([Grove-to-Glass Promise])[
  Every product in our 2026 lineup is traceable from grove to glass. QR codes link each package to its harvest date, grove, and farmer profile.
]

== Innovation Pipeline

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #zest-card([R&D Breakthroughs], [
    - Enzyme-assisted extraction: +30% juice yield
    - Freeze-dried citrus powder for snack bars
    - Upcycled peel fiber for packaging
    - Cold-plasma pasteurization pilot
  ], accent: palette.lemon)
][
  #zest-card([Consumer Insights], [
    - 78% want "clean label" ingredients
    - Subscription fatigue is a myth — 92% retain 6+ months
    - Flavor innovation drives 3x more social shares
    - Sustainability claims increase purchase intent by 45%
  ], accent: palette.orange)
]

== Investment Decision

#callout-box([Action Required], [
  Board approval needed for \$2.5M investment in cold-plasma pasteurization equipment. Expected ROI: 18 months. Pilot results show 60% energy reduction vs. traditional methods.
], accent: palette.orange, icon: sym.excl)

= Sustainability

== Environmental Impact

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #stat-card([Water Saved], [42%], accent: palette.lime)
][
  #stat-card([Carbon Offset], [1,200t], accent: palette.lime)
][
  #stat-card([Waste Diverted], [98%], accent: palette.lemon)
][
  #stat-card([Solar Powered], [85%], accent: palette.orange)
]

#v(0.5em)

#cols(columns: (1fr, 1fr))[
  === Regenerative Practices

  - Cover cropping between grove rows
  - Integrated pest management (zero synthetic pesticides)
  - Composting 100% of processing waste
  - Pollinator corridors planted across 40 acres
  - Soil carbon sequestration monitoring
][
  #quote-card([
    We don't just grow citrus — we grow ecosystems. Every grove is a habitat, every harvest a collaboration with nature.
  ], author: [Luna Ortega, CEO])
]

== Sustainability Scorecard

#juice-meter([Renewable Energy], 85, color: palette.lime)
#juice-meter([Water Efficiency], 72, color: palette.lime)
#juice-meter([Packaging Recyclability], 94, color: palette.orange)
#juice-meter([Supply Chain Transparency], 88, color: palette.lemon)
#juice-meter([Biodiversity Index], 67, color: palette.lime)

#v(0.4em)

#insight-box([2027 Target])[
  Achieve net-zero across all operations by end of 2027. Current trajectory projects 94% reduction by Q3, with remaining 6% offset through verified reforestation credits in partnership with Mediterranean grove restoration projects.
]

= Brand & Marketing

== Campaign Performance

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #concept-card([Summer Squeeze Campaign], [
    - 12M impressions across platforms
    - 340K user-generated posts
    - 2.8x return on ad spend
    - Brand awareness +22pts
  ], accent: palette.orange)
][
  #concept-card([Harvest Festival Tour], [
    - 8 cities, 45K attendees
    - 98% satisfaction rating
    - 15K new subscriptions from events
    - Press coverage in 120+ outlets
  ], accent: palette.lemon)
][
  #concept-card([Wellness Partnership], [
    - Collab with 50 fitness influencers
    - Reached 8M health-focused consumers
    - Conversion rate: 4.2%
    - LTV of wellness segment: 2.1x avg
  ], accent: palette.lime)
]

== Channel Strategy

#cols(columns: (2fr, 1fr))[
  #citrus-table(
    ([Channel], [Revenue Share], [Growth], [Strategy]),
    (
      ([DTC Website], [35%], [+52%], [Personalization]),
      ([Subscription], [28%], [+68%], [Retention focus]),
      ([Retail Partners], [22%], [+12%], [Premium shelf]),
      ([B2B/Restaurant], [10%], [+85%], [Chef partnerships]),
      ([International], [5%], [+140%], [Market entry]),
    ),
  )
][
  #callout-box([Priority], [
    International expansion is our highest-growth channel. Focus Q3/Q4 resources on UK, Japan, and UAE market entry.
  ], accent: palette.lime, icon: sym.arrow.t)
]

#focus-slide[
  _"In a world of artificial everything, real ingredients win. Our citrus groves are not just farms — they're the foundation of a movement."_

  -- Brand Manifesto 2026
]

= Growth Roadmap

== Strategic Phases

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #harvest-card(1, [Q1: Foundation], [
    - Blood Orange launch
    - DTC platform v2
    - UK market research
  ], accent: palette.orange)
][
  #harvest-card(2, [Q2: Expansion], [
    - Lemon Concentrate launch
    - Japan pilot program
    - 500 retail doors added
  ], accent: palette.lemon)
][
  #harvest-card(3, [Q3: Innovation], [
    - Wellness line launch
    - Cold-plasma facility live
    - UAE distribution deal
  ], accent: palette.lime)
][
  #harvest-card(4, [Q4: Scale], [
    - Full international ops
    - Series B fundraise
    - 1M subscribers target
  ], accent: palette.orange)
]

== Long-Term Vision

#grove-box([Long-Term Vision])[
  By 2030, Citrus Valley Co. aims to be the world's most trusted premium citrus brand — operating 5,000+ regenerative grove acres, serving 10M+ subscribers globally, and proving that taste, health, and sustainability are not trade-offs but multipliers.
]

== Team & Investment

#cols(columns: (1fr, 1fr))[
  === Hiring Plan 2026

  - VP International Markets (Q1)
  - Head of R&D (Q1)
  - 15 grove agronomists (Q2)
  - 8 brand marketing specialists (Q2)
  - Director of Sustainability (Q3)
  - 20 fulfillment ops staff (Q3-Q4)
][
  #stat-card([Series A Raised], [\$18M], accent: palette.orange)
  #v(0.3em)
  #stat-card([Runway], [24 months], accent: palette.lime)
  #v(0.3em)
  #stat-card([Target Valuation], [\$120M], trend: [Series B], accent: palette.lemon)
]

#ending-slide[Thank You]
