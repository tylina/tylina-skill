// Editorial Grid Theme -- Demo
// "The State of Global Media in 2025" -- Bloomberg/Economist style data journalism

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("IBM Plex Sans", "Noto Sans SC", "Arial"), size: 18pt)

#show: editorial-grid-theme.with(
  aspect-ratio: "16-9",
  footer: [EDITORIAL GRID],
  config-common(breakable: false),
  config-info(
    title: [The State of Global Media in 2025],
    subtitle: [Revenue Models, Audience Shifts, and the AI Disruption],
    author: [The Editorial Grid Research Unit],
    date: datetime.today(),
    institution: [Global Media Observatory],
  ),
)

#title-slide()

#outline-slide()

= Revenue Landscape

== Digital Advertising Surpasses Print

#cols(columns: (5fr, 2fr))[
  The structural shift from print to digital advertising has reached its
  terminal phase. In Q1 2025, digital advertising constituted 78% of
  total media revenue globally, up from 54% just five years prior.

  #v(0.6em)
  #red-callout[
    Print advertising declined 23% year-over-year in established markets,
    with newspapers in Western Europe losing nearly a third of their
    remaining ad base.
  ]

  #v(0.4em)

  #lq.diagram(
    width: 90%,
    height: 110pt,
    lq.bar(
      (2020, 2021, 2022, 2023, 2024, 2025),
      (54, 60, 66, 71, 75, 78),
      width: 0.6,
      fill: palette.accent,
    ),
    lq.xaxis(label: [Year], ticks: ((2020, [2020]), (2021, [2021]), (2022, [2022]), (2023, [2023]), (2024, [2024]), (2025, [2025]))),
    lq.yaxis(label: [Digital Ad Share (%)]),
  )
][
  #metric-block([78%], [digital ad share])
  #v(0.8em)
  #metric-block([\-23%], [print ad decline], accent: palette.accent)
]

== Subscription Economy

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #data-card([TOTAL SUBSCRIBERS], [412M], description: [Global paid news subscriptions across all platforms])
][
  #data-card([AVG. REVENUE], [\$14.20], description: [Monthly ARPU for premium news products, up 18% YoY])
][
  #data-card([CHURN RATE], [6.8%], description: [Monthly subscriber loss rate, industry median])
]

== Revenue Diversification Models

#cols(columns: (1fr, 1fr))[
  === Tier 1: Bundled Platforms

  - News + podcasts + newsletters
  - Cross-subsidy from entertainment
  - Average bundle price: \$18/month
  - Retention rate: 89% at 12 months

  #v(0.4em)
  #byline[Source: Reuters Digital News Report 2025]
][
  === Tier 2: Specialist Verticals

  - Finance: Bloomberg, FT
  - Technology: The Information, Stratechery
  - Policy: Politico Pro, Semafor
  - Average price: \$30-50/month

  #v(0.4em)
  #byline[Source: Press Gazette Analysis]
]

= Audience Behavior

== The Attention Deficit

#pull-quote([
  The average time spent with a single news article has dropped to
  47 seconds. We are not competing with other publishers. We are
  competing with the infinite scroll.
], cite: [Emma Tucker, Editor, The Sunday Times])

#v(0.6em)
#hairline()
#v(0.2em)
#byline[Measured across 2.4 billion pageviews, Jan--Mar 2025]

== Platform Distribution Shifts

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #data-card([DIRECT TRAFFIC], [31%], description: [Down from 42% in 2022. Audiences arrive via algorithms, not habit.])
][
  #data-card([AI SUMMARY CLICKS], [14%], description: [Share of referrals from AI-generated search summaries. New category.])
]

#v(0.6em)
#red-callout[
  Google's AI Overviews now intercept an estimated 40% of news-related
  queries, delivering summarized answers without click-through.
]

== Demographic Fracture

#cols(columns: (1fr, 1fr))[
  === Under 30

  - 67% consume news via short video
  - 12% pay for any news subscription
  - Trust in institutions: 28%
  - Primary platform: TikTok, Instagram

  #v(0.2em)
  #metric-block([12%], [paying for news])
][
  === Over 50

  - 54% still read print newspapers
  - 41% pay for digital subscriptions
  - Trust in institutions: 52%
  - Primary platform: Direct + email

  #v(0.2em)
  #metric-block([41%], [paying for news])
]

= AI Disruption

#focus-slide[
  If AI can summarize every article in 3 seconds,
  what is the value of the article itself?
]

== AI Impact on Newsrooms

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #data-card([JOBS DISPLACED], [18,200], description: [Editorial positions eliminated citing AI automation, 2024--2025])
][
  #data-card([AI-GENERATED], [34%], description: [Share of commodity news (earnings, weather, sports scores) now AI-written])
][
  #data-card([LICENSING DEALS], [\$840M], description: [Total value of publisher-AI licensing agreements signed in 2024])
]

== The Licensing Landscape

#cols(columns: (1fr, 1fr))[
  === Deals Signed

  - OpenAI + News Corp: \$250M/5yr
  - Google + Associated Press: undisclosed
  - Anthropic + Financial Times: \$50M/3yr
  - Meta + Reuters: \$100M/3yr

  #v(0.4em)
  #byline[Source: Columbia Journalism Review]
][
  === Holdouts

  - The New York Times (lawsuit pending)
  - The Guardian (ethical objection)
  - Le Monde (EU regulatory strategy)
  - Axel Springer (competitive AI product)

  #v(0.4em)
  #red-callout[
    The NYT lawsuit against OpenAI seeks \$1B+ in damages for
    unauthorized training on copyrighted journalism.
  ]
]

= Outlook

== Five Predictions for 2026

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #data-card([01], [Consolidation], description: [50+ regional papers merge into 3--5 national platforms])
][
  #data-card([02], [AI Editors], description: [First newsroom deploys AI for editorial judgment])
]

#v(0.4em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #data-card([03], [Regulation], description: [EU mandates revenue sharing from AI platforms])
][
  #data-card([04], [Audio Pivot], description: [Podcast revenue exceeds display ads for premium publishers])
]

== The Path Forward

#pull-quote([
  The publications that survive will be those that offer
  something an algorithm cannot replicate: judgment, voice,
  and the courage to be unpopular.
], cite: [Alan Rusbridger, Former Editor, The Guardian])

#v(0.8em)
#hairline()
#v(0.4em)
#red-callout[
  Differentiation, not volume. Trust, not speed. Community, not
  scale. The editorial model of 2030 will resemble a members'
  club more than a printing press.
]

#ending-slide[Thank you for reading.]
