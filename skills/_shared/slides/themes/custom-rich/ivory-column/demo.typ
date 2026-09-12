// Ivory Column Theme Demo — Architectural Heritage Foundation Annual Review
// Classical Greek/Roman column architecture aesthetic
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: ivory-column-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Meridian Group -- Strategic Review 2026],
  config-info(
    title: [Foundations of Excellence],
    subtitle: [Annual Strategic Review and Forward Outlook],
    author: [Helena Whitmore, Managing Director],
    institution: [The Meridian Group],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))
#show raw: set text(font: ("Menlo", "Noto Sans SC"))

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Performance
// ══════════════════════════════════════
= Performance

== Key Metrics Overview

#stack(
  spacing: 0.8em,
  block(width: 100%, height: 76pt)[
    #cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      order-stat([Revenue], [\$142M], color: palette.primary),
      order-stat([Year-over-Year Growth], [28.4%], color: palette.accent),
      order-stat([Clients], [1,240], color: palette.primary-dark),
      order-stat([Client Retention], [94.7%], color: palette.secondary),
    )
  ],
  cols(columns: (1fr, 1fr), gutter: 1.2em,
    pillar-card([Operational Highlights], [
      Our disciplined approach delivered results across all verticals. *Asset management* grew 34% YoY, while *advisory services* expanded into three new markets.
    ], accent: palette.primary),
    pillar-card([Market Position], [
      Ranked *\#3 in mid-market advisory* by deal volume. Client satisfaction scores reached an all-time high of 4.8/5.0 across engagement types.
    ], accent: palette.secondary),
  ),
)

== Financial Performance Detail

#cols(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  stack(
    spacing: 0.8em,
    capital-box([Revenue Composition], [
      *Advisory* (48%): \$68.2M -- Transaction advisory and restructuring grew significantly.

      *Asset Management* (35%): \$49.7M -- AUM reached \$4.2B with strong fund performance.

      *Principal Investments* (17%): \$24.1M -- Exits exceeded projections by 40%.
    ]),
    stack(dir: ltr, spacing: 0.5em,
      frieze-tag([Advisory], color: palette.primary),
      frieze-tag([Asset Mgmt], color: palette.accent),
      frieze-tag([Principal], color: palette.secondary),
    ),
  ),
  stack(
    spacing: 0.8em,
    block(width: 100%, height: 70pt)[
      #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
        order-stat([AUM], [\$4.2B], color: palette.primary),
        order-stat([Deals Closed], [47], color: palette.accent),
      )
    ],
    block(width: 100%, height: 70pt)[
      #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
        order-stat([Average Deal Size], [\$38M], color: palette.secondary),
        order-stat([IRR (Fund III)], [2.4x], color: palette.primary-dark),
      )
    ],
    inscription-note([Analyst Perspective], [
      Consistent outperformance reflects rigorous discipline and deep sector expertise few mid-market firms replicate.
    ]),
  ),
)

// ══════════════════════════════════════
// Section 2: Strategy
// ══════════════════════════════════════
= Strategy

== Strategic Pillars

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
    colonnade-card([I], [Deepen Expertise], [
      Sector-specific knowledge and proprietary research capabilities.
    ], accent: palette.primary),
    colonnade-card([II], [Expand Reach], [
      APAC via Singapore hub. \$800M new AUM target within 24 months.
    ], accent: palette.accent),
    colonnade-card([III], [Accelerate Digital], [
      AI-powered deal sourcing. 60% faster analytical cycles.
    ], accent: palette.secondary),
  ),
  meander-divider(width: 50%, color: palette.secondary),
  inscription-note([Strategic Thesis], [
    Generational ownership transitions and technology transformation create a rare opportunity.
  ]),
)

== Competitive Landscape

#cols(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  stack(
    spacing: 0.8em,
    forum-grid(
      [Traditional Incumbents], [
        - Large balance sheets but bureaucratic
        - Slow decision-making cycles
        - Generalist approach to sectors
      ],
      [Meridian Differentiation], [
        - Agile, partner-led engagement model
        - Deep mid-market specialization
        - Proprietary operational playbooks
      ],
    ),
    pediment-card([Sustainable Advantage], [
      Our *14-year track record* combined with 92% team retention creates compounding advantages. Relationships built over decades drive 67% of deal flow.
    ], accent: palette.accent),
  ),
  stack(
    spacing: 0.8em,
    pillar-card([Market Dynamics], [
      The mid-market advisory space is consolidating. *Specialist firms with proven track records* continue to command premium valuations.

      Key trends:
      - Private equity dry powder at \$2.4T globally
      - Cross-border M&A recovering post-2024 dip
      - AI/tech sector deal activity accelerating
    ], accent: palette.primary),
    stack(dir: ltr, spacing: 0.5em,
      frieze-tag([Mid-Market], color: palette.primary),
      frieze-tag([M&A], color: palette.accent),
      frieze-tag([PE], color: palette.secondary),
    ),
  ),
)

// ══════════════════════════════════════
// Section 3: Operations
// ══════════════════════════════════════
= Operations

== Technology Transformation

#stack(
  spacing: 0.8em,
  block(width: 100%, height: 160pt)[
    #cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
      portico-box([Deal Analytics Platform], [
        ```
        Pipeline:     284 active opportunities
        Conversion:   18.3% (vs 12% industry)
        Avg velocity: 47 days to close
        AI scoring:   94% accuracy
        ```
        ML models trained on 14 years of proprietary deal data predict close probability accurately.
      ], accent: palette.primary),
      portico-box([Portfolio Monitoring], [
        ```
        Companies:    32 active investments
        Data points:  1.2M daily signals
        Alerts:       Real-time anomaly detect
        Reports:      Automated monthly LP
        ```
        Continuous monitoring replaces quarterly cycles for faster intervention.
      ], accent: palette.secondary),
    )
  ],
  capital-box([Digital Maturity Assessment], [
    Technology investment over 36 months moved us from *Level 2 (Developing)* to *Level 4 (Advanced)* on the Digital Advisory Maturity Scale.
  ]),
)

#slide(align: top, title: [Team and Culture])[
  #cols(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  stack(
    spacing: 0.8em,
    block(width: 100%, height: 92pt)[
      #cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
        order-stat([Team Size], [186], color: palette.primary),
        order-stat([New Hires], [34], color: palette.accent),
        order-stat([Retention], [92%], color: palette.secondary),
        order-stat([Satisfaction], [4.6/5], color: palette.primary-dark),
      )
    ],
    forum-grid(
      [Talent Investments], [
        - MBA sponsorship: 8 candidates
        - Leadership dev: 42 participants
        - Upskilling: 120+ certifications
      ],
      [Culture Initiatives], [
        - Flexible work: 3 days in-office
        - Diversity: 44% senior leadership
        - Wellness budget: \$5K/employee
      ],
    ),
  ),
  stack(
    spacing: 0.8em,
    pillar-card([Organizational Design], [
      Restructured into *six specialized practice groups* with dedicated sector expertise and shared analytical resources.

      Groups: Industrial, Technology, Healthcare, Financial Services, Consumer, Energy.
    ], accent: palette.primary),
    colonnade-card([IV], [People Strategy 2027], [
      Target: 220 professionals across 5 offices. Expand Singapore to 25, establish Munich, build data science function of 12 analysts.
    ], accent: palette.accent),
  ),
  )
]

// ══════════════════════════════════════
// Section 4: Outlook
// ══════════════════════════════════════
= Outlook

== Three-Year Roadmap

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
    pediment-card([2026 -- Foundation], [
      - Launch Singapore office
      - Fund IV first close (\$600M)
      - Deploy AI deal sourcing
      - Achieve \$5B AUM milestone
    ], accent: palette.primary),
    pediment-card([2027 -- Expansion], [
      - Open Munich advisory office
      - Fund IV final close (\$900M)
      - Launch credit strategy
      - Revenue target: \$195M
    ], accent: palette.accent),
    pediment-card([2028 -- Scale], [
      - Evaluate strategic options
      - \$8B AUM target
      - Revenue target: \$260M
      - Full international platform
    ], accent: palette.secondary),
  ),
  inscription-note([Guiding Principle], [
    We build enduring value through patience, discipline, and deep expertise. Long-term compounding over short-term gains.
  ]),
)

== Risk Management

#cols(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  stack(
    spacing: 0.8em,
    pillar-card([Key Risk Factors], [
      *Market Risk*: Economic slowdown could reduce deal activity 20-30%. Mitigation: diversified revenue streams.

      *Talent Risk*: Competition for top professionals. Mitigation: best-in-class compensation and culture.

      *Concentration*: Top 10 clients = 28% revenue. Active diversification underway.
    ], accent: palette.primary),
    stack(dir: ltr, spacing: 0.5em,
      frieze-tag([Market], color: palette.primary),
      frieze-tag([Talent], color: palette.accent),
      frieze-tag([Regulatory], color: palette.secondary),
    ),
  ),
  stack(
    spacing: 0.8em,
    block(width: 100%, height: 74pt)[
      #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
        order-stat([Compliance Budget], [\$4.2M], color: palette.primary),
        order-stat([External Audit Score], [98.5%], color: palette.accent),
      )
    ],
    capital-box([Regulatory Environment], [
      Increasing scrutiny of private markets requires proactive compliance. Our team of 8 monitors developments across all jurisdictions.

      Focus areas: ESG disclosure, cross-border reporting, AI governance, data protection.
    ]),
  ),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  #stack(
  spacing: 0.8em,
    [_"Excellence is not a singular act, but a habit. We are what we repeatedly do."_],
    text(size: 0.6em, weight: "regular", fill: palette.text-muted)[-- Aristotle, adapted],
  )
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
