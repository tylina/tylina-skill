// HoloVerse — Augmented Reality Platform Keynote
// Demo presentation using the Hologram theme
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: hologram-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [HoloVerse | Innovation Summit 2026],
  config-info(
    title: [HoloVerse Platform],
    subtitle: [Spatial Computing for the Next Billion Users],
    author: [Dr. Aria Nakamura, Chief Vision Officer],
    institution: [HoloVerse Technologies],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ═══ Slide 1: Title Slide ═══
#title-slide()

// ═══ Slide 2: Section — Vision ═══
= Vision & Mission

// ═══ Slide 3: The Spatial Computing Revolution ═══
== The Spatial Computing Revolution

#cols(columns: (1fr, 1fr), gutter: 1.5em,
  insight-box([The Paradigm Shift], [
    We are witnessing the third major computing platform transition. From desktop to mobile, and now from mobile to spatial. The physical and digital worlds are converging into a single, interactive layer.
  ]),
  projection-box([Market Trajectory], [
    Spatial computing will reach \$400B by 2030, growing at 38% CAGR. Enterprise adoption is accelerating with 72% of Fortune 100 actively piloting mixed reality solutions.
  ]),
)

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
  stat-card([Active Devices], [2.8B], unit: [by 2028], color: palette.violet),
  stat-card([Enterprise Users], [340M], unit: [projected], color: palette.teal),
  stat-card([Content Creators], [48M], unit: [spatial designers], color: palette.emerald),
  stat-card([Avg. Session], [4.2h], unit: [daily], color: palette.gold),
)

// ═══ Slide 4: Our Mission ═══
== Our Mission

#cols(columns: (1fr, 1fr))[
  #quote-card(
    [The best interface is no interface. When computing disappears into the world around you, technology finally becomes invisible — and infinitely more powerful.],
    attribution: [Dr. Aria Nakamura, HoloVerse Manifesto],
  )

  #v(0.8em)

  #callout-box([Core Belief], [
    Every surface is a screen. Every gesture is a command. Every space is a workspace. We are building the platform that makes this vision accessible to everyone, everywhere.
  ], variant: "default")
][
  #holo-card([Mission Statement], [
    Democratize spatial computing by building the most intuitive, performant, and open platform for creating, sharing, and experiencing holographic content.
  ], index: 0)

  #v(0.8em)

  #holo-card([Guiding Principles], [
    - *Presence* — Depth and embodiment first
    - *Open* — Interoperable standards
    - *Accessible* — Works on any device
    - *Collaborative* — Multi-user by default
  ], index: 2)
]

// ═══ Slide 5: Section — Technology ═══
= Core Technology

// ═══ Slide 6: Platform Architecture ═══
== Platform Architecture

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  interface-card([Perception Engine], [
    SLAM, hand and eye tracking, and environment meshing at 120Hz. Neural prediction keeps motion-to-photon latency below 5ms.
  ], status: "active"),
  interface-card([Rendering Pipeline], [
    Foveated neural rendering with dynamic LOD for photorealistic or stylized output. 8K per eye at 120fps with AI upscaling.
  ], status: "active"),
  interface-card([Spatial Graph], [
    World-scale anchors, shared maps, and semantic scene understanding, cloud-synced with edge caching.
  ], status: "active"),
)

#v(0.8em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  interface-card([Interaction Layer], [
    Hands, eyes, voice, controllers, and BCI with context-aware intent prediction.
  ], status: "active"),
  interface-card([Collaboration Mesh], [
    Volumetric avatars, spatial audio, and shared physics for up to 100 co-present users.
  ], status: "pending"),
  interface-card([Content Runtime], [
    glTF, USD, MPEG-I, and HoloFormat with hot reload, live scripting, and physics.
  ], status: "active"),
)

// ═══ Slide 7: Technical Benchmarks ═══
== Technical Benchmarks

#holo-table(
  ([Metric], [HoloVerse], [Competitor A], [Competitor B], [Industry Avg]),
  (
    ([Motion-to-Photon], [4.2ms], [11ms], [18ms], [15ms]),
    ([Hand Tracking Accuracy], [0.3mm], [1.2mm], [2.5mm], [2.0mm]),
    ([Spatial Anchor Drift], [\<0.5cm/hr], [2cm/hr], [5cm/hr], [4cm/hr]),
    ([Max Concurrent Users], [100], [12], [8], [10]),
    ([Rendering Resolution], [8K/eye], [4K/eye], [2K/eye], [3K/eye]),
    ([Battery Life (mobile)], [6.5h], [3h], [2.5h], [3.5h]),
  ),
)

// ═══ Slide 8: Differentiators ═══
== What Sets Us Apart

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Neural Scene Reconstruction], [
    Our proprietary NeRF-based pipeline reconstructs photorealistic 3D environments from smartphone video in under 60 seconds, enabling instant spatial content creation.
  ], index: 0),
  concept-card([Universal Spatial Web], [
    First platform to implement the Open Spatial Web Protocol (OSWP), enabling holographic content to be discovered, linked, and traversed like web pages.
  ], index: 2),
)

#v(0.4em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Embodied AI Agents], [
    Spatially-aware AI assistants that understand physical context. They can point to real objects, navigate real spaces, and collaborate with multiple users simultaneously.
  ], index: 4),
  concept-card([Zero-Latency Collaboration], [
    Predictive networking with edge-compute nodes ensures multi-user experiences feel local even across continents. Patent-pending temporal synchronization.
  ], index: 5),
)

// ═══ Slide 9: Focus — Vision Quote ═══
#focus-slide()[
  _"We don't build displays.\
  We dissolve the boundary\
  between imagination and reality."_\
  #v(0.3em)
  #text(size: 0.5em, weight: "regular")[— HoloVerse Engineering Creed]
]

// ═══ Slide 10: Section — Products ═══
= Product Suite

// ═══ Slide 11: Products Overview ═══
== Product Suite Overview

#cols(columns: (1fr, 1fr))[
  #holo-card([HoloVerse Studio], [
    Professional spatial content creation tool. Node-based visual scripting, real-time physics, AI-assisted 3D modeling, and one-click deployment to any XR device.
  ], index: 0)

  #v(0.3em)

  #holo-card([HoloVerse Cloud], [
    Spatial computing infrastructure. CDN-optimized 3D asset delivery, persistent world hosting, real-time collaboration servers, and analytics dashboard.
  ], index: 2)
][
  #holo-card([HoloVerse SDK], [
    Cross-platform development kit supporting Unity, Unreal, native, and web. OpenXR-compatible with extensions for spatial anchors, hand tracking, and shared experiences.
  ], index: 3)

  #v(0.3em)

  #holo-card([HoloVerse Lens], [
    Consumer AR app for everyday spatial experiences. Navigation, shopping, social, gaming, and education — all through your phone or glasses.
  ], index: 5)
]

// ═══ Slide 12: Enterprise Solutions ═══
== Enterprise Solutions

#block(height: 68pt)[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
    stat-card([Training ROI], [340%], unit: [avg. improvement], color: palette.violet),
    stat-card([Design Cycles], [-68%], unit: [time reduction], color: palette.teal),
    stat-card([Remote Collab], [4.7x], unit: [productivity gain], color: palette.gold),
  )
]

#v(0.8em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  projection-box([Manufacturing], [
    Digital twins reduce assembly errors 94% with AI inspection.
  ]),
  projection-box([Healthcare], [
    Patient-specific holograms streamline surgical planning and theatre imaging.
  ]),
)

#v(0.8em)

#callout-box([Enterprise Readiness], [
  SOC2 Type II · HIPAA · on-prem deployment · 99.99% SLA · 4-hour support.
], variant: "success")

// ═══ Slide 13: Section — Traction ═══
= Traction & Growth

// ═══ Slide 14: Key Metrics ═══
== Growth Metrics

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
  stat-card([Annual Revenue], [\$127M], unit: [ARR], color: palette.violet),
  stat-card([Revenue Growth], [+215%], unit: [YoY], color: palette.teal),
  stat-card([Enterprise Clients], [420+], unit: [signed contracts], color: palette.emerald),
)

#v(0.8em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
  stat-card([Developer Community], [2.1M], unit: [registered], color: palette.gold),
  stat-card([Spatial Experiences], [18M+], unit: [published], color: palette.indigo),
  stat-card([Monthly Sessions], [890M], unit: [across platforms], color: palette.rose),
)

#v(0.8em)

#block(
  width: 100%,
  fill: palette.violet.lighten(96%),
  stroke: (left: 4pt + palette.violet),
  inset: (x: 1em, y: 0.55em),
  radius: (right: 10pt),
)[
  #stack(
    spacing: 0.8em,
    stack(dir: ltr, spacing: 8pt,
      text(size: 1.1em)[💡],
      text(weight: "bold", fill: palette.violet, size: 0.9em)[Momentum],
    ),
    text(fill: palette.text-body, size: 0.78em)[
      Net retention of 156% and enterprise ACV growth from \$180K to \$420K in 12 months show strong expansion.
    ],
  )
]

// ═══ Slide 15: Customer Showcases ═══
== Customer Success Stories

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Airbus — Digital Assembly], [
    Deployed HoloVerse across 4 manufacturing plants. Technicians use holographic work instructions overlaid on aircraft components. Assembly time reduced by 32%, errors eliminated.
  ], index: 0),
  concept-card([Stanford Medicine — Surgical Planning], [
    Neurosurgeons plan complex procedures using patient-specific holographic brain models. 23% improvement in surgical outcomes, 40% reduction in operating time.
  ], index: 2),
)

#v(0.4em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Nike — Spatial Retail], [
    Flagship stores feature holographic product customization. Customers design shoes in 3D, see them on their feet in real-time. Conversion rate increased 4.8x.
  ], index: 4),
  concept-card([CERN — Physics Visualization], [
    Researchers explore particle collision data in 3D holographic space. Complex 27-dimensional datasets become intuitively navigable, accelerating discovery.
  ], index: 5),
)

// ═══ Slide 16: Section — Roadmap ═══
= Roadmap & Future

// ═══ Slide 17: Product Roadmap ═══
== Product Roadmap 2026–2028

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  [
    #block(
      width: 100%, fill: palette.card-bg,
      stroke: (top: 3pt + palette.violet, rest: 1pt + palette.border),
      inset: (x: 0.8em, y: 0.6em), radius: (bottom: 10pt),
    )[
      #stack(spacing: 0.8em,
        text(size: 0.7em, weight: "bold", fill: palette.violet)[H2 2026],
        text(size: 0.9em, weight: "bold", fill: palette.text-dark)[Foundation],
        text(size: 0.72em, fill: palette.text-body)[• Full-body avatar system\ • Spatial audio v3.0\ • BCI alpha integration\ • 50 new enterprise APIs],
      )
    ]
  ],
  [
    #block(
      width: 100%, fill: palette.card-bg,
      stroke: (top: 3pt + palette.teal, rest: 1pt + palette.border),
      inset: (x: 0.8em, y: 0.6em), radius: (bottom: 10pt),
    )[
      #stack(spacing: 0.8em,
        text(size: 0.7em, weight: "bold", fill: palette.teal)[H1 2027],
        text(size: 0.9em, weight: "bold", fill: palette.text-dark)[Expansion],
        text(size: 0.72em, fill: palette.text-body)[• Spatial Web browser\ • AI scene generation\ • 1000-user experiences\ • Glasses OS partnership],
      )
    ]
  ],
  [
    #block(
      width: 100%, fill: palette.card-bg,
      stroke: (top: 3pt + palette.gold, rest: 1pt + palette.border),
      inset: (x: 0.8em, y: 0.6em), radius: (bottom: 10pt),
    )[
      #stack(spacing: 0.8em,
        text(size: 0.7em, weight: "bold", fill: palette.gold)[H2 2027+],
        text(size: 0.9em, weight: "bold", fill: palette.text-dark)[Intelligence],
        text(size: 0.72em, fill: palette.text-body)[• Autonomous spatial AI\ • Neural interface v1.0\ • Global spatial mesh\ • 10B spatial anchors],
      )
    ]
  ],
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em,
  {holo-tag([Spatial Web], color: palette.violet)},
  {holo-tag([Neural BCI], color: palette.teal)},
  {holo-tag([AI Agents], color: palette.emerald)},
  {holo-tag([Open Standards], color: palette.gold)},
)

// ═══ Slide 18: Investment ═══
== Investment & Allocation

#cols(columns: (1fr, 1fr))[
  #text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Series C: \$350M]
  #v(0.3em)
  #holo-table(
    ([Category], [Amount], [Purpose]),
    (
      ([R&D], [\$160M], [Core platform + AI research]),
      ([Go-to-Market], [\$90M], [Enterprise sales + partnerships]),
      ([Infrastructure], [\$60M], [Edge network + spatial cloud]),
      ([Operations], [\$40M], [Team growth + facilities]),
    ),
  )
][
  #text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Target Outcomes]
  #v(0.3em)
  #cols(columns: (1fr, 1fr), gutter: 0.8em,
    stat-card([ARR Target], [\$500M], unit: [by 2028], color: palette.violet),
    stat-card([Gross Margin], [78%], color: palette.teal),
  )
  #v(0.3em)
  #cols(columns: (1fr, 1fr), gutter: 0.8em,
    stat-card([Market Share], [24%], unit: [spatial computing], color: palette.emerald),
    stat-card([IPO Timeline], [2028], color: palette.gold),
  )
]

// ═══ Slide 19: Ending ═══
#ending-slide()[Thank You]
