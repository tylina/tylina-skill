// Amber Ink Theme — Demo Presentation
// Topic: Publishing & Media Industry — 2026 Market Intelligence Report

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: amber-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Amber Ink | Market Intelligence],
  config-info(
    title: [Publishing & Media Intelligence],
    subtitle: [2026 Annual Market Report -- Executive Briefing],
    author: [Marcus Aldworth, Chief Strategy Officer],
    date: datetime.today(),
    institution: [Aldworth & Cavendish Partners LLP],
  ),
  config-common(breakable: false),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#title-slide()

#outline-slide()

// ================================================================
= Executive Summary

== Market Overview

#cols[
  #stack(
    spacing: .8em,
    insight-box[Industry at a Glance][
      The global publishing and media sector reached *\$624B* in 2025, with digital channels now comprising 58% of total revenue. Growth is accelerating in subscription models and AI-assisted content production.
    ],
    grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 8pt,
      kpi-card[\$624B][Global Market / 全球市场],
      kpi-card[+8.3%][Year-over-year Revenue Growth],
      kpi-card[58%][Digital Share],
    ),
  )
][
  #stack(
    spacing: .8em,
    press-card[Key Findings][
      - Digital subscription revenue surpassed advertising for the first time
      - AI content tools adopted by 72% of major publishers
      - M&A activity up 34% driven by platform consolidation
      - Emerging markets contributing 22% of new growth
    ],
    [#type-tag[Q4 2025] #type-tag(color: palette.tertiary)[Verified] #type-tag[Confidential]],
  )
]
#speaker-note[Open with the headline numbers. The 624 billion figure includes books, periodicals, digital media, and streaming content. Emphasize the digital crossover point as a landmark moment.]

== Investment Thesis

#cols[
  #stack(
    spacing: .8em,
    editorial-card[Bull Case][
    Recurring revenue models improve visibility. Publishers with strong IP portfolios are well-positioned for AI-era licensing deals.
    ],
    ornament-divider(color: palette.tertiary),
    editorial-card[Bear Case][
    AI training-data rules could disrupt licensing. Print decline may outpace digital offsets in legacy segments.
    ],
  )
][
  #stack(
    spacing: .8em,
    edition-box[Our Position][
      We maintain an *Overweight* rating on the publishing sector with selective exposure to:
      - Digital-native platforms (subscription-first)
      - IP-rich catalogs with licensing optionality
      - Emerging market local-language players
    ],
    quote-press[
      The companies that will thrive are those treating content as infrastructure, not inventory.
    ][Aldworth & Cavendish, Strategy Note],
  )
]
#speaker-note[Frame the investment thesis in balanced bull/bear terms. The quote is from our own Q3 strategy note and should be attributed accordingly. The overweight rating was established in September.]

// ================================================================
= Sector Analysis

== Digital Publishing Metrics

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr))[
    #press-card[Subscription Economics][
      - Average Revenue Per User (ARPU): *\$14.60/mo*
      - Churn rate (monthly): *3.2%* (down from 4.8%)
      - Customer Acquisition Cost: *\$42*
      - Lifetime Value: *\$456*
      - LTV/CAC Ratio: *10.9x*
    ]
  ][
    #press-card[Advertising Performance][
      - CPM (display): *\$8.40* (+12% YoY)
      - CPM (native/sponsored): *\$22.50* (+18% YoY)
      - Fill rate: *78%* (premium inventory)
      - Programmatic share: *64%*
      - Direct deals premium: *+35%* vs. programmatic
    ]
  ],
  footnote-block[Source: Aldworth & Cavendish proprietary data, N=847 publishers surveyed. Figures represent median values across Tier 1 markets (US, UK, DE, JP). Data as of Q4 2025.],
)
#speaker-note[Walk through the unit economics. The LTV/CAC ratio of 10.9x indicates very healthy subscription economics. Note that churn improvement from 4.8 to 3.2 percent is the key driver of LTV expansion.]

== Competitive Landscape

#stack(
  spacing: .8em,
  figure([
    #comparison-table(
      align: (left + horizon, center + horizon, center + horizon, left + horizon),
      ([Company], [Revenue], [Growth], [Segment]),
      ([Meridian Press], [\$18.4B], [+12.1%], [Digital-first]),
      ([Atlas Publishing], [\$14.2B], [+6.8%], [Diversified]),
      ([Calder & Stowe], [\$9.7B], [+15.3%], [Subscription]),
      ([Northgate Media], [\$8.1B], [-2.4%], [Legacy print]),
      ([Verdant Digital], [\$6.3B], [+22.7%], [AI-native]),
    )
  ]),
  insight-box[Analyst Note][
    Verdant Digital's 22.7% growth rate reflects aggressive AI integration. However, their margin profile remains below industry average due to infrastructure investment. Watch for profitability inflection in H2 2026.
  ],
)
#speaker-note[The competitive landscape table shows clear divergence between digital-first and legacy players. Northgate's negative growth illustrates the penalty for delayed transformation. Verdant is the disruptor to watch.]

// ================================================================
= Financial Deep Dive

== Revenue Composition

#cols[
  #stack(
    spacing: .8em,
    edition-box[Revenue Mix Shift (2020 vs 2025)][
      The industry has undergone fundamental revenue recomposition:

      *2020:* Print 52% | Advertising 28% | Subscriptions 15% | Licensing 5%

      *2025:* Print 24% | Advertising 22% | Subscriptions 38% | Licensing 16%

      Subscriptions overtook print as primary revenue source in Q2 2024.
    ],
    [#type-tag[Revenue] #type-tag[5yr CAGR: 6.8%] #type-tag[Structural]],
  )
][
  #stack(
    spacing: .8em,
    grid(
      columns: (1fr, 1fr),
      column-gutter: 8pt,
      kpi-card[38%][Subscription Share],
      kpi-card[16%][Licensing Share],
    ),
    editorial-card[Margin Impact][
      Subscription revenue carries *68% gross margin* vs. 22% for print. Every 1% shift from print to digital adds approximately 46bps to blended group margin.
    ],
  )
]
#speaker-note[The revenue mix chart tells the transformation story clearly. The margin impact calculation is important for valuation models. Note that licensing growth from 5 to 16 percent is driven almost entirely by AI training data deals since 2023.]

== Profitability Benchmarks

#stack(
  spacing: .8em,
  grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 8pt,
    kpi-card[34.2%][Gross Margin (Industry)],
    kpi-card[18.7%][EBITDA Margin],
    kpi-card[12.4%][Net Margin],
  ),
  figure([
    #comparison-table(
      align: (left + horizon, center + horizon, center + horizon, center + horizon),
      ([Metric], [Top Quartile], [Median], [Bottom Quartile]),
      ([Gross Margin], [42.8%], [34.2%], [21.6%]),
      ([EBITDA Margin], [24.1%], [18.7%], [9.3%]),
      ([FCF Conversion], [85%], [72%], [48%]),
      ([ROIC], [16.4%], [11.2%], [5.8%]),
    )
  ]),
)
#speaker-note[Profitability benchmarks allow clients to position their portfolio companies. Top quartile performers are almost exclusively digital-native or successfully transformed publishers. FCF conversion above 80 percent indicates capital-light models.]

// ================================================================
= Strategic Themes

== AI Integration Landscape

#cols[
  #stack(
    spacing: .8em,
    press-card[AI Adoption by Function][
      - *Content Generation*: 72% of publishers using AI assistants
      - *Personalization*: 65% deploying recommendation engines
      - *Ad Targeting*: 58% using AI-optimized placement
      - *Editorial QA*: 44% automated fact-checking deployed
      - *Translation*: 81% machine translation in workflow
    ],
    [#type-tag[AI] #type-tag[Automation] #type-tag[Efficiency]],
  )
][
  #stack(
    spacing: .8em,
    insight-box[Investment Required][
      Average AI infrastructure spend for mid-tier publishers: *\$4.2M annually*. Payback period: *14 months*. ROI at steady state: *3.4x* over three years.
    ],
    quote-press[
      AI will not replace editors. But editors who use AI will replace those who do not.
    ][Industry Panel, Frankfurt Book Fair 2025],
  )
]
#speaker-note[AI adoption data from our proprietary survey of 847 publishers. The 72 percent content generation figure includes any AI assistance, from headline suggestions to full draft generation. The quote from Frankfurt Book Fair resonated strongly with the audience.]

== M&A Activity

#stack(
  spacing: .8em,
  timeline-point[Q1 2025][
    *Meridian Press* acquires DataFlow Analytics for \$2.1B -- enters data journalism infrastructure.
  ],
  timeline-point[Q2 2025][
    *Atlas Publishing* merges with Lumen Studios -- creates integrated content-to-screen pipeline valued at \$28B.
  ],
  timeline-point[Q3 2025][
    *Calder & Stowe* takes minority stake in three AI startups totaling \$340M -- signaling build-vs-buy pivot.
  ],
  timeline-point[Q4 2025][
    *Verdant Digital* IPO at \$12B valuation -- 4.2x revenue, the highest multiple in sector since 2021.
  ],
  footnote-block[Deal values reflect enterprise value at announcement. Multiples calculated on trailing twelve months revenue. Source: Aldworth & Cavendish Deal Tracker.],
)
#speaker-note[Walk through the timeline chronologically. Each deal represents a different strategic archetype: horizontal expansion, vertical integration, venture-style optionality, and public market validation.]

// ================================================================
= Market Outlook

== 2026 Forecasts

#cols[
  #stack(
    spacing: .8em,
    edition-box[Base Case Scenario][
      Global publishing and media revenue reaches *\$672B* by end of 2026 (+7.7% YoY). Digital channels exceed 62% share. Three additional major IPOs expected in AI-native content space.
    ],
    edition-box[Upside Scenario (+2.3%)][
      Accelerated AI licensing deals push industry revenue to *\$688B*. Favorable regulatory outcomes in EU and US unlock content monetization at scale.
    ],
  )
][
  #stack(
    spacing: .8em,
    grid(
      columns: (1fr, 1fr),
      column-gutter: 8pt,
      kpi-card[\$672B][Base Case],
      kpi-card[+7.7%][Expected Growth],
    ),
    press-card[Conviction Calls][
      *Overweight:* Digital-native publishers, AI infrastructure\
      *Equal Weight:* Diversified conglomerates\
      *Underweight:* Pure-play legacy print, declining ad-dependent models
    ],
  )
]
#speaker-note[Present the three scenarios with their respective probabilities: base 60%, upside 25%, downside 15%. The conviction calls represent our formal sector recommendations as of January 2026.]

== Risk Assessment

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr))[
    #press-card[Regulatory Risks][
      - EU AI Act implications for content training
      - US copyright reform (pending legislation)
      - Data privacy regulations (GDPR evolution)
      - Platform antitrust actions
      - Cross-border content taxation
    ]
  ][
    #press-card[Market Risks][
      - Consumer subscription fatigue threshold
      - Advertising cyclicality in recession scenario
      - Technology obsolescence (platform shifts)
      - Talent competition with tech sector
      - Geopolitical content restrictions
    ]
  ],
  insight-box[Mitigation Framework][
    Our portfolio construction emphasizes diversified revenue streams (minimum 3 channels), geographic spread (minimum 4 markets), and AI optionality (active licensing program or proprietary models).
  ],
)
#speaker-note[Risk assessment should be presented as manageable within our framework. The mitigation strategy of requiring three revenue channels and four markets ensures resilience. Highlight that geopolitical risk is rising but concentrated in specific markets.]

// ================================================================

#focus-slide[
  In the age of algorithms, the publishers who endure will be those who understand that authority is earned through craft --- not volume.
]
#speaker-note[This is the strategic conclusion. The craft versus volume distinction echoes the letterpress metaphor of the theme itself. Pause for effect before moving to the closing slide.]

#ending-slide[Thank You]
#speaker-note[Close with appreciation. Offer to distribute the full 120-page report and schedule individual portfolio review sessions.]
