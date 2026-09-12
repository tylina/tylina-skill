#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 20pt)

#show: river-stone-theme.with(
  aspect-ratio: "16-9",
  footer: [Cornerstone Strategy Group],
  config-common(breakable: false),
  config-info(
    title: [Building on Bedrock],
    subtitle: [Strategic Foundations for Sustainable Growth],
    author: [Marcus Ashford, Managing Director],
    date: datetime.today(),
    institution: [Cornerstone Strategy Group],
  ),
)

#title-slide()

#outline-slide()

= Strategic Foundations

== The Bedrock Principles

Every enduring enterprise rests on principles as solid as stone. Our strategic framework identifies the immovable foundations that withstand market turbulence and competitive pressure.

- *Resilience*: capacity to absorb disruption and emerge stronger
- *Alignment*: organizational coherence from boardroom to operations
- *Patience*: long-term value creation over quarterly performance
- *Sustainability*: building practices that endure for generations

#sediment-divider()

#pebble-tag[Strategy] #pebble-tag(color: palette.moss)[ESG] #pebble-tag(color: palette.clay)[Growth] #pebble-tag(color: palette.water)[Innovation]

== Core Pillars

#cols(columns: (1fr, 1fr))[
  #stone-card([Organizational Resilience], [
    Build redundancy into critical systems. Diversify revenue streams across geographies and sectors. Develop leadership bench strength three levels deep.
  ])
][
  #stone-card([Sustainable Operations], [
    Integrate environmental stewardship into every process. Measure total impact — not just financial returns. Design supply chains that regenerate rather than deplete.
  ], accent: palette.moss)
]

== Growth Metrics

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #mineral-stat([24%], [Revenue Growth\ YoY])
][
  #mineral-stat([89%], [Client Retention\ Rate], accent: palette.moss)
][
  #mineral-stat([3.2x], [Value Multiple\ Created], accent: palette.water)
]

= Market Landscape

== Industry Analysis

#ripple-box([Market Dynamics], [
  The sustainable infrastructure sector is experiencing a fundamental shift. Capital flows have reversed — ESG-aligned investments now outperform traditional extractive models by 340 basis points annually. Firms that fail to adapt risk irrelevance within a decade.
])

#v(0.5em)

#figure[
  #bedrock-table(
    ([Sector], [Growth Rate], [ESG Score], [5-Year Outlook]),
    (
      ([Sustainable Architecture], [+18%], [A+], [Strong expansion]),
      ([Green Infrastructure], [+22%], [A], [Rapid scaling]),
      ([Circular Economy], [+31%], [A+], [Breakthrough potential]),
      ([Traditional Construction], [+4%], [B-], [Stagnant]),
    ),
  )
]

== Competitive Positioning

#set text(size: 17pt)

#cols(columns: (3fr, 2fr))[
  Our positioning in the market leverages three decades of deep expertise and a network spanning 14 countries.

  - *Differentiation*: proprietary methodology validated across 200+ engagements
  - *Scale advantage*: largest independent advisory in sustainable strategy
  - *Talent moat*: average partner tenure of 12 years
  - *Knowledge base*: 50,000+ hours of sector research

  #cairn-card([Our Edge], [
    We combine strategic rigor with environmental conscience — a rare intersection that commands premium positioning.
  ])
][
  #moss-quote(
    [The firms that will define the next century are those building on bedrock — not sand. Sustainable strategy is not a constraint; it is the only viable foundation.],
    author: [Marcus Ashford],
  )

  #v(0.8em)

  #zen-card([Key Insight], [
    Market leaders in sustainability report 2.4x higher employee engagement and 67% lower executive turnover.
  ], accent: palette.moss)
]

= Implementation Roadmap

== Phased Approach

#stream-entry([Q1], [Foundation Assessment], [
  Comprehensive audit of organizational capabilities, resource allocation, and strategic alignment. Identify gaps between current state and bedrock principles.
], accent: palette.slate)

#stream-entry([Q2], [Architecture Design], [
  Develop the structural blueprint: governance frameworks, measurement systems, and accountability chains that support sustainable growth.
], accent: palette.moss)

#stream-entry([Q3], [Capability Building], [
  Invest in people, processes, and technology. Train leadership cohorts, deploy new operational systems, establish feedback loops.
], accent: palette.water)

#stream-entry([Q4], [Activation & Scale], [
  Launch transformation initiatives across all business units. Measure impact, iterate rapidly, and scale proven approaches.
], accent: palette.clay)

== Strategic Priorities Matrix

#set text(size: 18pt)

#cols(columns: (1fr, 1fr))[
  #zen-card([Near-Term (0--12 months)], [
    - ESG reporting framework deployment
    - Supply chain sustainability audit
    - Leadership alignment workshops
    - Stakeholder engagement strategy
  ])

  #v(0.5em)

  #zen-card([Medium-Term (1--3 years)], [
    - Circular economy integration
    - Carbon-neutral operations target
    - Community investment program
    - Innovation lab establishment
  ], accent: palette.moss)
][
  #ripple-box([Catalyst Opportunity], [
    The intersection of regulatory tailwinds (EU CSRD, SEC climate rules) and shifting consumer preferences creates a 24-month window for first-mover advantage.
  ], accent: palette.water)

  #v(0.5em)

  #stone-card([Investment Required], [
    Total transformation investment: \$4.2M over 36 months. Expected ROI: 380% by year five, with breakeven at month 18.
  ], accent: palette.clay)
]

= Case Studies

== Greenfield Architecture Partners

#cols(columns: (1fr, 1fr))[
  #cairn-card([The Challenge], [
    A 200-person architecture firm struggling with flat growth and talent attrition. Traditional commercial projects offered diminishing returns.
  ])

  #v(0.5em)

  #cairn-card([Our Approach], [
    Pivoted the firm toward sustainable design — LEED Platinum focus, biophilic principles, net-zero building specifications.
  ], accent: palette.moss)
][
  #cairn-card([The Result], [
    Revenue grew 42% in 18 months. Won three landmark commissions. Named "Firm of the Year" by Architectural Review.
  ], accent: palette.water)

  #v(0.5em)

  #mineral-stat([42%], [Revenue Growth\ in 18 Months], accent: palette.clay)
]

== Measured Impact

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #mineral-stat([200+], [Projects\ Delivered])
][
  #mineral-stat([14], [Countries\ Active], accent: palette.moss)
][
  #mineral-stat([96%], [Client\ Satisfaction], accent: palette.water)
][
  #mineral-stat([\$2.8B], [Value\ Created], accent: palette.clay)
]

#focus-slide[
  True strategy is not about choosing what to do. \
  It is about building the foundation that makes \
  the right choices inevitable.
]

#ending-slide[Thank You]
