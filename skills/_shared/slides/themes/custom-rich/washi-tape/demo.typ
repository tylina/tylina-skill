#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: washi-tape-theme.with(
  aspect-ratio: "16-9",
  footer: [Washi Tape],
  config-info(
    title: [Creative Strategy Workshop],
    subtitle: [Building Brands with Heart and Craft],
    author: [Studio Sakura Creative],
    date: datetime.today(),
    institution: [Design & Marketing Collective],
  ),
  config-common(breakable: false),
)

#set text(font: ("Avenir Next", "Heiti SC"))

#title-slide()

= Brand Foundations

== The Craft of Brand Building

#cols[
  Every memorable brand starts with intentionality -- a careful layering of story, visual language, and emotional truth. Like assembling a collage, the pieces must feel both curated and natural.

  #journal-box([Core Insight], [
    The best brands feel handmade even at scale. Authenticity is not about being small -- it is about being intentional with every touchpoint.
  ])
][
  #tape-card([Three Pillars of Craft Branding], [
    - *Story*: the narrative thread connecting all touchpoints
    - *Texture*: the visual and sensory qualities that invite touch
    - *Ritual*: the repeatable moments that build loyalty
  ])
]

== Key Metrics

#stack(
  spacing: .8em,
  cols(
    columns: (1fr, 1fr, 1fr),
    gutter: 16pt,
    sticker-stat([Brand Recall], [87%]),
    sticker-stat([Year-over-Year Engagement Growth], [3.2x], accent: palette.secondary),
    sticker-stat([Annual Attributed Revenue], [\$12.4M], accent: palette.accent),
  ),
  strip-divider(),
  memo-quote(
    [Design is not just what it looks like and feels like. Design is how it works.],
    author: [Steve Jobs],
  ),
)

== Market Positioning

#cols(lazy-layout: true)[
  #collage-card([Premium Craft Segment], [
    Consumers in this segment value:
    - Handmade or artisanal aesthetic
    - Sustainable sourcing stories
    - Limited-edition collections
    - Behind-the-scenes transparency
  ])
][
  #collage-card([Mass-Market Creative], [
    Key differentiators for scale:
    - Accessible price with premium feel
    - Consistent visual language
    - Social media shareability
    - Community-driven co-creation
  ], accent: palette.lavender)
]

= Strategy

== Campaign Framework

#cols(columns: (2fr, 3fr))[
  #stack(
    spacing: .8em,
    sticker-stat([Campaign Phases], [4], accent: palette.lavender),
    memo-quote(
      [A brand is a promise. A good brand is a promise kept.],
    ),
  )
][
  #stack(
    spacing: .8em,
    pinboard-box([Phase 1: Discovery], [
      Audit existing brand touchpoints. Interview 20+ customers about emotional associations. Map the current brand collage -- what sticks, what peels away.
    ]),
    pinboard-box([Phase 2: Assembly], [
      Create mood boards with real materials. Test texture combinations. Layer story elements. Let the brand collage emerge organically from the research.
    ]),
  )
]

== Channel Strategy

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  tape-card([Digital Channels], [
    - Instagram stories with craft process videos
    - Pinterest boards for mood and texture
    - Newsletter with behind-the-scenes content
    - TikTok for quick craft tutorials
  ], accent: palette.secondary),
  tape-card([Physical Channels], [
    - Pop-up craft workshops in retail
    - Branded packaging with washi tape details
    - Handwritten thank-you notes
    - Seasonal sticker collections for loyalty program
  ], accent: palette.accent),
)

#v(.8em)
#stack(dir: ltr, spacing: 4pt,
  flag-tag([Social Media]),
  flag-tag([Events], color: palette.secondary),
  flag-tag([Packaging], color: palette.accent),
  flag-tag([Community], color: palette.lavender),
)

== Creative Toolkit

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  stamp-card([Visual Identity], [
    Color palette, typography, photography style, illustration guidelines, and pattern library.
  ]),
  stamp-card([Tone of Voice], [
    Warm, approachable, slightly playful. Never corporate. Always human. Like a handwritten note.
  ], accent: palette.secondary),
  stamp-card([Brand Rituals], [
    Unboxing experience, seasonal collections, community challenges, and craft-along events.
  ], accent: palette.primary),
)

= Execution

== Content Calendar

#figure[
  #table(
    columns: (auto, 1fr, 1fr, auto),
    inset: 10pt,
    stroke: 0.5pt + palette.border,
    fill: (x, y) => if y == 0 { palette.card } else { none },
    [*Month*], [*Theme*], [*Primary Channel*], [*KPI*],
    [January], [New Beginnings], [Instagram], [+15% reach],
    [February], [Love Letters], [Newsletter], [25% open rate],
    [March], [Spring Craft], [Workshop], [50 attendees],
    [April], [Earth Month], [TikTok], [100K views],
  )
]

== Team Structure

#cols[
  #stack(
    spacing: .8em,
    journal-box([Creative Team], [
      - Lead Designer (visual direction)
      - Content Strategist (storytelling)
      - Community Manager (engagement)
      - Craft Coordinator (physical touchpoints)
    ]),
    stack(dir: ltr, spacing: 4pt,
      flag-tag([Hiring Q2]),
      flag-tag([Remote-first], color: palette.secondary),
    ),
  )
][
  #stack(
    spacing: .8em,
    tape-card([Budget Allocation], [
      - *40%* Content production (photo, video, copy)
      - *25%* Paid social amplification
      - *20%* Events and workshops
      - *15%* Materials and craft supplies
    ], accent: palette.lavender),
    collage-card([ROI Expectations], [
      Target 3.5x return on creative spend by Q4. Measured via attributed revenue, brand lift surveys, and community growth metrics.
    ], accent: palette.accent),
  )
]

== Success Metrics

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  pinboard-box([Leading Indicators], [
    - Social engagement rate (target: 4.5%)
    - Email list growth (target: 2K/month)
    - Workshop waitlist length
    - User-generated content volume
    - Community sentiment score
  ]),
  pinboard-box([Lagging Indicators], [
    - Revenue per customer (target: +20%)
    - Customer lifetime value
    - Net Promoter Score (target: 72)
    - Brand awareness (unaided recall)
    - Repeat purchase rate
  ]),
)

#focus-slide[
  Great brands are not built in boardrooms. \
  They are built in the moments \
  where craft meets care.
]

#ending-slide[Thank You]
