// Pearl Shell Theme Demo — Creative Beauty & Brand Strategy
// Showcasing all slide types and components for luxury business presentations
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Avenir", "Arial", "PingFang SC"), size: 18pt)
#show raw: set text(font: "Menlo")

#show: pearl-shell-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Luminara Beauty -- Brand Strategy 2026],
  config-info(
    title: [Luminara Beauty],
    subtitle: [Global Brand Launch & Creative Strategy],
    author: [Celeste Ashford, Chief Brand Officer],
    institution: [Luminara Beauty Group -- Paris | Tokyo | New York],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ======================================
// Title Slide
// ======================================
#title-slide()

#speaker-note[Welcome everyone. Today we unveil Luminara Beauty's global brand strategy — a vision built on iridescence, inner radiance, and modern luxury.]

// ======================================
// Outline
// ======================================
#outline-slide(title: [Agenda])

#speaker-note[Here is our roadmap for today's presentation — we will cover brand vision, market analysis, creative strategy, and our campaign framework.]

// ======================================
// Section 1: Brand Vision
// ======================================
= Brand Vision

== The Luminara Philosophy

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  nacre-card([Our Core Belief], [
    Beauty is not concealment — it is *revelation*. Like mother-of-pearl forming layer by luminous layer inside a shell, true beauty emerges from within.

    - Radiance over coverage
    - Wellness-first formulation
    - Sustainable luxury ingredients
    - Inclusive shade ranges (72 foundations)
  ]),
  nacre-card([Brand Pillars], [
    *Iridescence* — Products that shift and glow with natural light

    *Integrity* — Clean beauty with full ingredient transparency

    *Innovation* — Bio-mimetic technology inspired by nacre formation

    *Inclusivity* — Every skin tone, every age, every expression
  ], accent: palette.secondary),
)

#v(0.4em)

#wave-note[Luminara's positioning bridges the gap between clinical skincare and prestige color cosmetics — a white space worth \$4.2B globally.]

#speaker-note[Our philosophy centers on the pearl metaphor — beauty that forms organically, layer by luminous layer. This is not about masking; it's about revealing.]

== Market Opportunity

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  luster-card([+23%], [Clean Beauty Growth], color: palette.primary),
  luster-card([\$890M], [Target Market Size], color: palette.secondary),
  luster-card([4.2x], [ROI on Influencer], color: palette.tertiary),
  luster-card([Gen Z], [Primary Audience], color: palette.primary),
)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  insight-box([White Space Analysis], [
    The prestige beauty market lacks a brand that authentically combines:
    - *Clinical efficacy* (dermatologist-tested)
    - *Sensorial luxury* (textures, scents, packaging)
    - *Clean transparency* (EWG Verified, Leaping Bunny)
    - *Digital-native experience* (AR shade matching)

    Luminara fills this precise intersection.
  ], accent: palette.primary),
  spotlight-card([Competitive Advantage], [
    Our proprietary *NacreTech* formulation technology mimics the optical properties of natural mother-of-pearl:

    - Micro-layered pigments refract light at multiple angles
    - Creates a "lit from within" effect without shimmer particles
    - Patented bio-compatible nacre extract (6 pending)
  ], accent: palette.primary),
)

#speaker-note[The market data is compelling. Clean beauty is growing at 23% CAGR while the luxury segment stagnates. Our NacreTech gives us a defensible moat.]

// ======================================
// Section 2: Creative Strategy
// ======================================
= Creative Strategy

== Campaign Architecture

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  campaign-card([Phase 1: Whisper Launch], [
    *Timeline:* September 2026

    - Exclusive pre-launch to 500 beauty editors
    - Luxury unboxing experience (shell-inspired packaging)
    - Teaser campaign: "What lives inside a shell?"
    - Seeding to 200 micro-influencers (10K-100K)
    - Limited capsule: 3 hero products only
  ]),
  campaign-card([Phase 2: Full Radiance], [
    *Timeline:* November 2026

    - Global e-commerce launch (DTC + Sephora)
    - Full product line reveal (42 SKUs)
    - Hero campaign film: "Born Luminous"
    - Pop-up immersive experiences (3 cities)
    - Paid media across Meta, TikTok, Pinterest
  ], accent: palette.secondary),
)

#v(0.4em)

#collection-grid(
  [*Awareness*\ 500M impressions],
  [*Consideration*\ 12% unaided recall],
  [*Conversion*\ 8.5% site CVR],
)

#speaker-note[Our two-phase approach builds mystique before revealing the full brand. The whisper launch creates scarcity and editorial buzz that fuels phase two.]

== Creative Direction

#cols[
  #pearl-box([Visual Identity], [
    The Luminara visual system draws from oceanic iridescence:

    - *Color palette:* Shifting lavender, rose quartz, opal aqua
    - *Typography:* Custom serif "Luminara Display" + clean sans body
    - *Photography:* Soft-focus macro of skin, water, nacre textures
    - *Motion:* Slow, fluid transitions mimicking light on water
    - *Packaging:* Recyclable pearlescent glass
  ])

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    pearl-tag([Luxury], color: palette.primary),
    pearl-tag([Clean Beauty], color: palette.secondary),
    pearl-tag([Sensorial], color: palette.tertiary),
    pearl-tag([Digital-First], color: palette.primary),
  )
][
  #nacre-card([Tone of Voice], [
    *Luminara speaks like:*

    A knowledgeable friend who happens to be a cosmetic chemist — warm, confident, never condescending. We educate through wonder.

    *We say:* "Your skin already knows how to glow. We just remind it."

    *We never say:* "Fix", "flaws", "anti-aging", "perfection"
  ], accent: palette.secondary)

]

#speaker-note[Our creative direction is rooted in the sensory experience of discovering a pearl. Every brand touchpoint should evoke that moment of quiet wonder.]

== Channel Strategy

#figure[
  #comparison-table(
    ([Channel], [Investment], [KPI Target], [Timeline]),
    [TikTok], [35%], [2B views], [Sep-Dec 2026],
    [Instagram], [25%], [800K followers], [Sep-Mar 2027],
    [YouTube], [15%], [50M impressions], [Nov 2026],
    [Pinterest], [10%], [120M pins], [Oct-Feb 2027],
    [Podcast], [8%], [5M listens], [Nov 2026],
    [OOH/Print], [7%], [200M reach], [Nov 2026],
  )
]


#insight-box([Platform-Native Content], [
  Each platform receives bespoke creative, not repurposed assets:
  - *TikTok:* GRWM with NacreTech "glow reveal" moments (15-30s)
  - *Instagram:* Editorial macro photography + Reels tutorials
  - *Pinterest:* Aspirational beauty boards + shoppable pins
], accent: palette.tertiary)

#speaker-note[We are platform-native, not platform-present. Each channel gets purpose-built creative that respects how audiences actually consume content there.]

// ======================================
// Section 3: Product Portfolio
// ======================================
= Product Portfolio

== Hero Products

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  spotlight-card([Nacre Glow Serum], [
    *Flagship product*

    Bio-mimetic serum that creates a luminous base layer beneath makeup or worn alone.

    - NacreTech micro-pigments
    - Hyaluronic acid complex
    - 92% natural origin
    - *Price:* \$68 / 30mL
  ], accent: palette.primary),
  spotlight-card([Pearl Veil Foundation], [
    *72 shades*

    Medium-buildable coverage with light-refracting pearl finish.

    - Skin-like breathable formula
    - SPF 30 broad spectrum
    - Clean, fragrance-free
    - *Price:* \$52 / 30mL
  ], accent: palette.secondary),
  spotlight-card([Iridescent Lip Oil], [
    *24 shades*

    Nourishing lip treatment with opalescent color shift.

    - Jojoba + rosehip oils
    - Color-shifting pearl pigments
    - Non-sticky, plumping effect
    - *Price:* \$34 / 6mL
  ], accent: palette.tertiary),
)

#speaker-note[Our three hero products represent the full NacreTech story — base, complexion, and color. Each demonstrates the "lit from within" positioning.]

== Financial Projections

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  luster-card([\$12M], [Year 1 Revenue], color: palette.primary),
  luster-card([42%], [Gross Margin], color: palette.secondary),
  luster-card([340K], [Units Month 6], color: palette.tertiary),
  luster-card([18mo], [Breakeven Point], color: palette.primary),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  pearl-box([Revenue Breakdown], [
    *By Channel (Year 1):*
    - DTC e-commerce: 45% (\$5.4M)
    - Sephora exclusive: 30% (\$3.6M)
    - International wholesale: 15% (\$1.8M)
    - Subscription program: 10% (\$1.2M)

    *Growth trajectory:* 85% YoY to Year 3
  ]),
  pearl-box([Investment Allocation], [
    *\$8.5M Series A deployment:*
    - Product development: 30%
    - Marketing & launch: 35%
    - Team & operations: 20%
    - Inventory & fulfillment: 15%

    *Runway:* 24 months at current burn
  ], accent: palette.tertiary),
)

#speaker-note[Our financial model is conservative. Comparable clean beauty brands achieved these metrics 40% faster. We have built in buffer for market uncertainty.]

// ======================================
// Section 4: Wellness & Sustainability
// ======================================
= Sustainability & Impact

== Clean Beauty Commitment

#cols[
  #nacre-card([Formulation Standards], [
    *The Luminara Clean Standard exceeds industry norms:*

    - 2,400+ banned ingredients (vs. EU's 1,600)
    - EWG Verified across all SKUs
    - Leaping Bunny certified (no animal testing)
    - Dermatologist-tested on sensitive skin
    - Published ingredients and quarterly metal testing
  ])

][
  #campaign-card([Sustainability Roadmap], [
    *2026:* Launch with 80% recyclable packaging
    - Refillable compacts for all powder products
    - Carbon-neutral shipping (offset program)

    *2027:* Achieve B Corp certification
    - Transition to 100% PCR plastic components
    - Launch take-back recycling program

    *2028:* Net-zero operations
    - Solar-powered fulfillment centers
    - Biodegradable formula innovations
  ], accent: palette.tertiary)

]

#speaker-note[Our clean beauty standards are among the strictest in the industry. This is not greenwashing — it is core to our brand DNA and drives consumer trust.]

== Community & Wellness

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  insight-box([The Luminara Foundation], [
    1% of all revenue funds women's wellness initiatives:

    - *Dermatology access:* Free skin consultations in underserved communities
    - *STEM scholarships:* 20 annual grants for women in cosmetic chemistry
    - *Mental wellness:* Partnership with body positivity organizations
    - *Microloans:* Supporting women-owned beauty businesses globally

    Year 1 projected contribution: *\$120,000*
  ], accent: palette.secondary),
  campaign-card([Brand Community], [
    *"The Pearl Circle" loyalty program:*

    - Points for purchases, referrals, AND sustainable actions
    - Exclusive early access to new launches
    - Quarterly virtual masterclasses with formulators
    - Annual "Radiance Retreat" experience (top members)
    - UGC platform for community beauty stories

    *Target:* 50,000 members by end of Year 1
  ], accent: palette.primary),
)

#v(0.3em)

#stack(dir: ltr, spacing: 0.5em,
  pearl-tag([B Corp], color: palette.primary),
  pearl-tag([1% for Wellness], color: palette.secondary),
  pearl-tag([Women-Led], color: palette.tertiary),
  pearl-tag([Inclusive], color: palette.primary),
)

#speaker-note[Community is not an afterthought. The Pearl Circle creates emotional loyalty that transcends transactions, while our foundation work builds brand purpose.]

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  _"Beauty is the illumination of your soul."_

  #text(size: 0.6em, weight: "regular", fill: white.transparentize(30%))[-- John O'Donohue]
]

#speaker-note[This quote captures our brand ethos. Luminara exists to illuminate what is already beautiful — not to create beauty where it supposedly was lacking.]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Thank You]

#speaker-note[Thank you for your time and attention. We are excited to bring Luminara to the world. Let us discuss next steps for investment and partnership.]
