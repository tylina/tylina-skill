#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Georgia", "PingFang SC"))
#show raw: set text(font: "Menlo")

#show: ivory-tower-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Meridian Capital Group\ Annual Strategic Review],
    subtitle: [Fiscal Year 2024 Performance & 2025 Outlook],
    author: [Jonathan R. Ashworth, Managing Partner],
    date: datetime.today(),
    institution: [Meridian Capital Group],
  ),
)

// === Cover Page ===

#title-slide()

// === Chapter 1: Executive Summary ===

= Executive Summary

== Fiscal Year Highlights

#grid(
  columns: 4,
  gutter: 0.8em,
  capital-stat([Revenue], [\$4.2B], color: palette.accent-gold),
  capital-stat([EBITDA Margin], [34.7%], color: palette.accent-gold),
  capital-stat([AUM Growth], [+18.3%], color: palette.accent-gold),
  capital-stat([Client Retention], [97.2%], color: palette.primary),
)

#v(0.3em)

#treasury-highlight([Record Performance])[
  Fiscal Year 2024 marks our strongest performance in the firm's 28-year history. Assets under management surpassed *\$42 billion*, driven by our diversified portfolio strategy and disciplined risk management framework.
]

== Strategic Priorities

#cols(columns: (1fr, 1fr))[
  #gilt-card([Capital Deployment])[
    Deployed *\$6.8B* across 47 transactions in Q1--Q4, maintaining our commitment to value-oriented investments in resilient sectors.

    #signet-tag([Infrastructure]) #signet-tag([Healthcare]) #signet-tag([Technology])
  ]
][
  #gilt-card([Risk Management])[
    Maintained portfolio volatility at *12.4%* annualized, well within our mandate of 15%. Zero defaults across the credit portfolio for the third consecutive year.

    #signet-tag([AAA Rated]) #signet-tag([ESG Compliant])
  ]
]

= Portfolio Performance

== Asset Allocation Overview

#cols(columns: (3fr, 2fr))[
  #charter-box([Allocation Strategy])[
    Our multi-asset approach balances growth and stability:

    - *Private Equity*: 35% allocation, 22.4% IRR
    - *Fixed Income*: 25% allocation, 6.8% yield
    - *Real Assets*: 20% allocation, infrastructure focus
    - *Public Equities*: 15% allocation, alpha-driven
    - *Alternatives*: 5% allocation, hedge strategies
  ]
][
  #treasury-highlight([Key Metric])[
    Weighted average portfolio return of *16.8%* net of fees, exceeding our benchmark by *420 basis points*.
  ]

  #v(0.3em)

  #gilt-card([Vintage Performance])[
    2021 vintage: 2.1x MOIC \
    2022 vintage: 1.7x MOIC \
    2023 vintage: 1.3x MOIC (on track)
  ]
]

== Sector Performance

#grid(
  columns: 3,
  gutter: 0.8em,
  gilt-card([Healthcare])[
    Portfolio value: *\$8.4B* \
    YoY growth: *+24.1%* \
    Key holding: MedTech Partners \
    Exit multiple: 3.2x
  ],
  gilt-card([Technology])[
    Portfolio value: *\$12.1B* \
    YoY growth: *+31.7%* \
    Key holding: CloudScale Inc. \
    Exit multiple: 4.8x
  ],
  gilt-card([Infrastructure])[
    Portfolio value: *\$6.2B* \
    YoY growth: *+12.3%* \
    Key holding: Pacific Grid \
    Yield: 8.4% p.a.
  ],
)

= Strategic Initiatives

== 2025 Growth Roadmap

#cols(columns: (1fr, 1fr))[
  #gilt-card([2025 Priorities])[
    + Expand Asian market presence with \$2B dedicated fund
    + Launch ESG-integrated credit strategy targeting \$1.5B
    + Establish digital infrastructure vertical
    + Open Zurich office for European LP relationships
    + Deploy AI-powered deal sourcing platform
  ]
][
  #charter-box([Capital Raising Target])[
    We are targeting *\$8.5B* in new commitments across three flagship vehicles:

    - Fund IX (Buyout): \$5.0B
    - Credit Opportunities III: \$2.0B
    - Asia Growth Fund I: \$1.5B
  ]

  #v(0.3em)

  #signet-tag([On Track]) #signet-tag([Q2 Close]) #signet-tag([Strong Pipeline])
]

== Governance & Compliance

#cols(columns: (1fr, 1fr))[
  #charter-box([ESG Integration])[
    Achieved *A+* rating from UN PRI for the fifth consecutive year. 100% of new investments undergo comprehensive ESG due diligence with third-party verification.
  ]
][
  #charter-box([Regulatory Standing])[
    Full compliance across all jurisdictions. Successfully completed SEC examination with zero findings. Enhanced cybersecurity framework exceeds SOC 2 Type II requirements.
  ]
]

#v(0.3em)

#treasury-highlight([Commitment to Excellence])[
  Our fiduciary duty remains paramount. Every decision is guided by our core principles: *integrity*, *discipline*, *transparency*, and *long-term value creation* for our limited partners.
]

= Investor Relations

== LP Base & Distribution

#grid(
  columns: 3,
  gutter: 0.8em,
  capital-stat([Total LPs], [287], color: palette.primary),
  capital-stat([Distributions FY24], [\$3.1B], color: palette.accent-gold),
  capital-stat([DPI (Fund VII)], [1.8x], color: palette.accent-gold),
)

#v(0.3em)

#gilt-card([Distribution Highlights])[
  Record distributions of *\$3.1 billion* returned to limited partners in FY2024, representing a 42% increase year-over-year. Fund VII achieved DPI of 1.8x with residual value of 0.6x, projecting a 2.4x total value multiple at maturity.
]

// === Focus Slide ===

#focus-slide[
  _"Capital is not merely an instrument of return --\
  it is a covenant of trust between\
  those who steward it and those who entrust it."_

  #v(0.4em)
  #set text(size: 0.5em, weight: "regular")
  -- Jonathan R. Ashworth, Meridian Capital Group
]

// === Ending Slide ===

#ending-slide[Thank You]
