// SpectraViz Analytics Platform — Product & Data Presentation
// Demo presentation using the Prism theme
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: prism-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [SpectraViz Analytics | Series B],
  config-info(
    title: [SpectraViz Analytics],
    subtitle: [Real-Time Data Intelligence for the Modern Enterprise],
    author: [Dr. Maya Chen, CTO],
    institution: [SpectraViz Technologies Inc.],
    date: datetime(year: 2025, month: 9, day: 12),
  ),
)

// ═══ Slide 1: Title Slide ═══
#title-slide()

// ═══ Slide 2: Platform Overview — Section Divider ═══
= Platform Overview

// ═══ Slide 3: What is SpectraViz? ═══
== What is SpectraViz?

#cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true,
  refraction-box([Mission], [
    Transform raw data streams into actionable intelligence through real-time spectral analysis, enabling enterprises to detect patterns invisible to traditional analytics.
  ]),
  refraction-box([Differentiation], [
    Our patented Prismatic Processing Engine decomposes complex signals into constituent wavelengths, revealing hidden correlations across 50+ data dimensions simultaneously.
  ]),
)

#v(0.6em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  wavelength-stat([Data Throughput], [2.4M], unit: [events/sec], color: palette.violet),
  wavelength-stat([Latency], [\<12ms], unit: [p99], color: palette.blue),
  wavelength-stat([Accuracy], [99.7%], unit: [anomaly detection], color: palette.cyan),
  wavelength-stat([Uptime], [99.99%], unit: [SLA], color: palette.green),
)

// ═══ Slide 4: Market Opportunity ═══
== Market Opportunity

#cols[
  #text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Industry Landscape]

  #set text(size: 0.82em)
  - *Real-time analytics* market reaching \$48.2B by 2027 (CAGR 28%)
  - *82%* of Fortune 500 investing in streaming data infrastructure
  - *Edge computing* adoption driving demand for distributed analysis
  - Legacy batch-processing tools failing at sub-second requirements

  #refraction-box([Key Insight], [
    Enterprises processing >1M events/sec report 3.4x faster decision cycles and 47% reduction in operational incidents when using real-time spectral decomposition.
  ])
][
  #diffraction-grid(
    ([Segment], [TAM], [Growth], [Our Share]),
    (
      ([Financial Services], [\$12.4B], [+34%], [8.2%]),
      ([Telecommunications], [\$8.7B], [+26%], [5.1%]),
      ([Healthcare/Genomics], [\$6.2B], [+42%], [3.8%]),
      ([IoT / Industrial], [\$9.8B], [+31%], [6.4%]),
      ([Cybersecurity], [\$11.1B], [+38%], [7.2%]),
    ),
    columns: (1.5fr, 0.75fr, 0.75fr, 0.8fr),
  )
]

// ═══ Slide 5: Core Technology — Section Divider ═══
= Core Technology

// ═══ Slide 6: Architecture ═══
== Prismatic Processing Engine

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  prism-card(1, [Signal Decomposition], [
    Breaks incoming data streams into spectral components using FFT-inspired algorithms optimized for categorical and numerical mixed signals.
  ]),
  prism-card(2, [Pattern Recognition], [
    Neural wavelength matching identifies recurring patterns across decomposed channels with sub-millisecond classification latency.
  ]),
)

#v(0pt)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  prism-card(3, [Anomaly Detection], [
    Spectral variance analysis detects deviations from baseline patterns across all channels simultaneously. Zero false-positive tuning.
  ]),
  prism-card(4, [Predictive Synthesis], [
    Recombines spectral insights to project future states with confidence intervals. 15-minute to 72-hour forecast windows.
  ]),
)

// ═══ Slide 7: Technology Stack ═══
== Technology Stack

#diffraction-grid(
  ([Layer], [Technology], [Purpose], [Performance]),
  (
    ([Ingestion], [Apache Kafka + Custom Connectors], [Stream capture], [2.4M msg/s per node]),
    ([Processing], [Rust + SIMD + GPU (CUDA)], [Spectral decomposition], [12ms p99 latency]),
    ([Storage], [Apache Druid + ClickHouse], [Time-series OLAP], [Sub-second queries on 10TB+]),
    ([ML Pipeline], [PyTorch + ONNX Runtime], [Model inference], [50K predictions/s]),
    ([API Layer], [Go + gRPC + GraphQL], [Client integration], [100K concurrent connections]),
    ([Visualization], [WebGL + D3.js + Rust/WASM], [Real-time dashboards], [60fps at 10K points]),
  ),
  text-size: 0.72em,
)

// ═══ Slide 8: Product Features ═══
== Product Features

#cols[
  #lens-highlight([Spectral Dashboard], [
    Real-time visualization of decomposed data streams with customizable wavelength filters, drill-down capabilities, and collaborative annotations.
  ])
  #v(-0.3em)
  #lens-highlight([Anomaly Radar], [
    Continuous monitoring with multi-dimensional alerting. Smart alert routing based on spectral signature classification and severity scoring.
  ])
][
  #text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Capabilities]
  #band-divider(width: 35%)
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    wavelength-stat([Channels], [512], color: palette.violet),
    wavelength-stat([Alert Latency], [\<3s], color: palette.secondary),
  )
  #v(0.3em)
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    wavelength-stat([Integrations], [200+], color: palette.highlight),
    wavelength-stat([Custom Models], [50+], color: palette.accent),
  )
]

// ═══ Slide 9: Focus — Key Quote ═══
#focus-slide()[
  _"The best way to predict the future\
  is to decompose the present."_\
  #v(0.3em)
  #text(size: 0.5em, weight: "regular")[-- SpectraViz Engineering Philosophy]
]

// ═══ Slide 10: Customer Success — Section Divider ═══
= Customer Success

// ═══ Slide 11: Case Studies ═══
== Case Studies

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  spectrum-card([QuantumBank -- Fraud Detection], [
    Reduced fraud losses by 67% using spectral transaction analysis. Detection latency dropped from 45 minutes to 8 seconds. Processing 1.2M transactions/hour across 12 global markets.
  ], index: 0),
  spectrum-card([TelcoNet -- Network Optimization], [
    Identified 340+ recurring network degradation patterns. Proactive maintenance reduced outages by 52%. Saved \$14M annually in infrastructure costs through predictive capacity planning.
  ], index: 2),
)

#v(0.4em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  spectrum-card([GenomeX -- Genomic Research], [
    Accelerated variant calling pipeline by 8x through spectral decomposition of sequencing signals. Discovered 23 novel biomarkers using cross-wavelength correlation analysis.
  ], index: 4),
  spectrum-card([CyberShield -- Threat Intelligence], [
    Real-time spectral fingerprinting of network traffic detected 94% of zero-day attacks within 30 seconds. False positive rate reduced to 0.003%.
  ], index: 5),
)

// ═══ Slide 12: Metrics That Matter ═══
== Metrics That Matter

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  wavelength-stat([Net Revenue Retention], [142%], color: palette.violet),
  wavelength-stat([ARR Growth], [+186%], unit: [YoY], color: palette.blue),
  wavelength-stat([Customer Count], [340+], unit: [enterprise], color: palette.cyan),
)

#v(0.15em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  wavelength-stat([Avg Contract Value], [\$280K], unit: [annual], color: palette.green),
  wavelength-stat([Time to Value], [14 days], unit: [median], color: palette.orange),
  wavelength-stat([NPS Score], [78], unit: [industry avg: 42], color: palette.accent),
)

#v(0.15em)

#refraction-box([Growth Trajectory], [
  SpectraViz achieved \$42M ARR in 24 months post-launch, with 92% of revenue from expansion within existing accounts. Enterprise pipeline exceeds \$180M for the next 4 quarters.
])

// ═══ Slide 13: Roadmap — Section Divider ═══
= Roadmap

// ═══ Slide 14: Product Roadmap ═══
== Product Roadmap

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  roadmap-card([Q4 2025], [Foundation], [
    - Multi-cloud deployment
    - Edge spectral nodes
    - SDK v2.0 launch
    - SOC2 Type II cert
  ], color: palette.violet),
  roadmap-card([Q1-Q2 2026], [Expansion], [
    - AutoML spectral models
    - Natural language queries
    - 500+ integrations
    - APAC data centers
  ], color: palette.blue),
  roadmap-card([Q3-Q4 2026], [Intelligence], [
    - Autonomous remediation
    - Quantum-ready algorithms
    - Industry-specific models
    - 1000+ enterprise clients
  ], color: palette.cyan),
)

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  {photon-tag([Multi-Cloud], color: palette.violet)},
  {photon-tag([AutoML], color: palette.blue)},
  {photon-tag([Quantum-Ready], color: palette.cyan)},
)

// ═══ Slide 15: Investment Ask ═══
== Investment & Use of Funds

#set text(size: 0.9em)

#cols[
  #text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Series B: \$85M]
  #v(.8em)
  #diffraction-grid(
    ([Allocation], [Amount], [Purpose]),
    (
      ([R&D / Engineering], [\$38M], [Core platform + ML]),
      ([Go-to-Market], [\$25M], [Sales, marketing, partnerships]),
      ([Infrastructure], [\$12M], [Global data centers]),
      ([Operations], [\$10M], [Hiring + admin]),
    ),
    columns: (1.1fr, 0.75fr, 1.25fr),
  )
][
  #set text(size: 0.95em)
  #text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Projected Returns]
  #v(.8em)
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    wavelength-stat([ARR Target], [\$150M], unit: [by 2027], color: palette.violet),
    wavelength-stat([Gross Margin], [82%], color: palette.blue),
  )
  #v(.8em)
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    wavelength-stat([Rule of 40], [68], color: palette.cyan),
    wavelength-stat([Path to IPO], [2028], color: palette.green),
  )
  #v(.8em)
  #refraction-box([Valuation], [
    Pre-money: \$420M. Post-money: \$505M. Representing 12x forward ARR multiple, in line with high-growth data infrastructure peers.
  ])
]

// ═══ Slide 16: Ending Slide ═══
#set text(size: 20pt)
#ending-slide()[Thank You]
