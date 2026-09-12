// Neon Mint Theme Demo — Startup Product Launch
// Fresh, modern, tech-forward presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#show: neon-mint-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [MintOS -- Product Launch 2026],
  config-info(
    title: [MintOS: The Future of Cloud Infrastructure],
    subtitle: [Reimagining Developer Experience for the AI Era],
    author: [Sarah Chen, CTO & Co-Founder],
    institution: [MintOS Technologies Inc.],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Avenir Next", "Arial", "PingFang SC"))
#set heading(numbering: "1.1")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: The Problem
// ══════════════════════════════════════
= The Problem

== Developer Pain Points

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    concept-card([Infrastructure Complexity], [
      Modern cloud deployments require managing 40+ services across multiple providers. Teams spend *68% of engineering time* on operational overhead rather than building features.

      Config drift, secret sprawl, and environment inconsistency plague every team.
    ], accent: palette.primary),
    concept-card([Scaling Bottlenecks], [
      Auto-scaling decisions rely on lagging metrics. Cold starts add 2-8 seconds of latency. Resource allocation is either over-provisioned (costly) or under-provisioned (unreliable).

      The gap between dev and prod environments grows with every deployment.
    ], accent: palette.secondary),
  ),
  insight-box([Key Insight], [
    The infrastructure layer has become the #text(weight: "bold")[single largest drag on developer velocity]. Teams that solve this unlock 3-5x faster iteration cycles and significantly reduce burnout.
  ]),
)

== Market Opportunity

#cols[
  #stack(
    spacing: .8em,
    cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      stat-card([TAM (2026)], [\$182B], color: palette.primary),
      stat-card([CAGR], [24.3%], color: palette.secondary),
      stat-card([Dev Tools], [\$47B], color: palette.primary-dark),
      stat-card([AI Infra], [\$68B], color: palette.secondary),
    ),
    comparison-box(
      [Legacy Approach], [
        - Manual YAML
        - Siloed monitoring
        - Reactive scaling policies
      ],
      [MintOS Approach], [
        - Intent declarations
        - Unified observability
        - Predictive scaling and deployment
      ],
    ),
  )
][
  #stack(
    spacing: .8em,
    concept-card([Competitive Landscape], [
      *Incumbents* (AWS, GCP, Azure): powerful but complex, vendor lock-in.

      *Point Solutions* (Vercel, Railway, Render): simple but limited scope.

      *MintOS Differentiation*: Full-stack simplicity without sacrificing power. AI-native from day one.
    ], accent: palette.primary),
    callout-box([Why Now?], [
      Three trends create the opening:
      + LLM code generation needs faster deployment loops
      + Multi-cloud is standard (87% of enterprises)
    ], accent: palette.secondary),
  )
]

// ══════════════════════════════════════
// Section 2: The Solution
// ══════════════════════════════════════
= The Solution

== MintOS Architecture

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    feature-card([\u{2699}], [Intent Layer], [
      Declare *what* you want, not *how*. Natural language + structured configs. MintOS figures out the optimal deployment strategy.
    ], accent: palette.primary),
    feature-card([\u{1F50C}], [Connect Layer], [
      Universal service mesh with zero-config mTLS. Auto-discovery, intelligent routing, circuit breaking -- all without YAML.
    ], accent: palette.secondary),
    feature-card([\u{26A1}], [Compute Layer], [
      Predictive scaling with sub-100ms cold starts. Hibernate idle resources, resurrect on demand. Pay only for actual compute.
    ], accent: palette.primary),
  ),
  trace-divider(width: 60%),
  cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
    stat-card([Cold Start], [#sym.lt 80ms], color: palette.primary),
    stat-card([Deploy Time], [42s avg], color: palette.secondary),
  ),
)

== Developer Workflow

#cols[
  #stack(
    spacing: .8em,
    code-card([1. Define Intent], [
      ```yaml
      service: api-gateway
      replicas: auto(min: 2, max: 50)
      scaling: predictive
      budget: $1200/month
      ```
    ], accent: palette.secondary),
    code-card([2. Deploy], [
      ```bash
      $ mint deploy --env production
      ✓ Analyzing intent... (0.3s)
      ✓ Optimizing topology... (1.2s)
      ✓ Rolling out (canary 5%)... (38s)
      ✓ Healthy! Promoting to 100%
      ```
    ], accent: palette.primary),
  )
][
  #stack(
    spacing: .8em,
    code-card([3. Observe], [
      ```
      ┌─ Health ─────────────────────┐
      │ Latency p99:  12ms  ✓       │
      │ Error rate:   0.01% ✓       │
      │ Throughput:   84k rps       │
      │ Cost/req:     $0.000003     │
      └─────────────────────────────┘
      ```
    ], accent: palette.secondary),
    insight-box([AI Co-Pilot], [
      MintOS analyzes traffic patterns and proactively suggests optimizations. AI recommendations saved customers an average of *34% on cloud spend*.
    ]),
  )
]

// ══════════════════════════════════════
// Section 3: Traction
// ══════════════════════════════════════
= Traction

== Growth Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  metric-card([ARR], [\$8.2M], [142% YoY growth], color: palette.primary),
  metric-card([Customers], [340+], [Enterprise & startup mix], color: palette.secondary),
  metric-card([NPS], [72], [Top 5% in dev tools], color: palette.primary-dark),
  metric-card([Retention], [96%], [Logo retention (net 138%)], color: palette.secondary),
)

#v(0.6em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Enterprise Wins (Q1 2026)], [
    - *Fortune 500 Bank*: Migrated 200+ microservices, 40% cost reduction
    - *Healthcare Platform*: HIPAA-compliant deployment in 3 days (vs. 6 months)
    - *AI Startup*: Scaled GPU inference from 0 to 500 nodes in 4 minutes
  ], accent: palette.primary),
  concept-card([Developer Love], [
    - GitHub Stars: 12.4k (top 0.1% growth rate)
    - Community Discord: 8,200 active developers
    - Conference talks: 14 accepted at KubeCon

    _"MintOS is what Heroku should have become."_ -- HN
  ], accent: palette.secondary),
)

== Customer Case Study

#cols[
  #concept-card([NovaPay -- Fintech Platform], [
    *Challenge*: PCI-DSS compliant infrastructure with 99.999% uptime SLA. Previous setup required 8 DevOps engineers managing 140 Kubernetes manifests.

    *Solution*: MintOS intent-based deployment with compliance guardrails. Reduced team to 2 platform engineers.

    *Results*: 99.9997% uptime over 11 months, \$2.1M annual savings, 3x faster feature velocity.
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    neon-tag([Fintech], color: palette.primary),
    neon-tag([PCI-DSS], color: palette.secondary),
    neon-tag([Kubernetes], color: palette.primary-dark),
  )
][
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    stat-card([Uptime], [99.9997%], color: palette.primary),
    stat-card([Cost Saved], [\$2.1M/yr], color: palette.secondary),
  )

  #v(0.5em)

  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    stat-card([Deploy Freq], [47x/day], color: palette.primary-dark),
    stat-card([Incidents], [2 (P3)], color: palette.primary),
  )

  #v(0.5em)

  #callout-box([NovaPay CTO Quote], [
    _"We deploy 47 times a day with complete confidence."_
  ], accent: palette.secondary)
]

// ══════════════════════════════════════
// Section 4: Technology
// ══════════════════════════════════════
= Technology

== AI-Native Infrastructure

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  feature-card([\u{1F9E0}], [Predictive Scaling Engine], [
    Trained on 2B+ scaling events across our customer base. Predicts traffic spikes 15 minutes before they happen. Pre-warms resources with 94% accuracy.
  ], accent: palette.primary),
  feature-card([\u{1F6E1}], [Anomaly Detection], [
    Real-time analysis of 400+ signals per service. Identifies degradation patterns before they become incidents. Auto-remediates 73% of issues without human intervention.
  ], accent: palette.secondary),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  feature-card([\u{1F4CA}], [Cost Intelligence], [
    Continuous FinOps optimization. Identifies waste, suggests right-sizing, negotiates reserved capacity. Average customer saves 34% within first month.
  ], accent: palette.secondary),
  feature-card([\u{1F512}], [Security Fabric], [
    Zero-trust by default. Automatic CVE patching, runtime threat detection, compliance-as-code. SOC2, HIPAA, PCI-DSS, ISO27001 out of the box.
  ], accent: palette.primary),
)

== Technical Differentiators

#cols[
  #concept-card([MintVM -- Custom Runtime], [
    Purpose-built microVM with 23ms boot time (vs. 300ms+ for containers). Memory-safe Rust core with WASM plugin system. Snapshot/restore for instant scaling.

    - *Isolation*: Hardware-level security boundaries
    - *Density*: 4x more workloads per host vs. containers
    - *Portability*: Run anywhere -- bare metal, cloud, edge
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    neon-tag([Rust], color: palette.primary),
    neon-tag([WASM], color: palette.secondary),
    neon-tag([microVM], color: palette.primary-dark),
  )
][
  #concept-card([MintMesh -- Smart Network], [
    Kernel-bypass networking with eBPF-accelerated data plane. Automatic service discovery, intelligent load balancing, and built-in chaos engineering.

    - *Throughput*: 2.4M requests/sec per node
    - *Latency*: p99 < 500μs for service-to-service
    - *Resilience*: Self-healing topology with circuit breakers
  ], accent: palette.secondary)

  #v(0.4em)

  #insight-box([Patent Portfolio], [
    14 patents filed (7 granted) covering predictive scaling algorithms, intent-based infrastructure compilation, and AI-driven anomaly remediation.
  ])
]

// ══════════════════════════════════════
// Section 5: Business
// ══════════════════════════════════════
= Business

== Go-to-Market Strategy

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Bottom-Up Adoption], [
    Free tier for individual developers and small teams. Self-serve onboarding with 5-minute time-to-value.

    *Conversion funnel*:
    - Free → Pro: 12% (industry avg 3-5%)
    - Pro → Enterprise: 8% within 6 months
    - Average expansion: 3.4x within first year
  ], accent: palette.primary),
  concept-card([Enterprise Motion], [
    Dedicated sales team for Fortune 2000. Custom compliance frameworks, SLA guarantees, and white-glove migration support.

    *Sales metrics*:
    - Average deal size: \$340K ARR
    - Sales cycle: 45 days (vs. 90 day industry avg)
    - Win rate: 62% in competitive deals
  ], accent: palette.secondary),
)

#v(0.4em)

#comparison-box(
  [Current (2026)], [
    - 340 paying customers
    - \$8.2M ARR
    - 3 sales reps
    - US + EU markets
  ],
  [Target (2028)], [
    - 2,400 paying customers
    - \$85M ARR
    - 20 sales reps
    - Global (incl. APAC)
  ],
)

== The Ask

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  metric-card([Raising], [\$40M], [Series B], color: palette.primary),
  metric-card([Valuation], [\$400M], [Pre-money, 10% dilution], color: palette.secondary),
  metric-card([Use of Funds], [24 mo], [Runway to profitability], color: palette.primary-dark),
)

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  feature-card([\u{1F468}\u{200D}\u{1F4BB}], [Engineering (50%)], [
    Hire 40 engineers. Expand MintVM, build MintEdge for IoT/automotive, and accelerate AI capabilities.
  ], accent: palette.primary),
  feature-card([\u{1F4C8}], [GTM (30%)], [
    Scale sales team to 20 reps, launch APAC operations, expand partner ecosystem with SI integrations.
  ], accent: palette.secondary),
  feature-card([\u{1F3AF}], [R&D (20%)], [
    Next-gen predictive models, quantum-ready architecture research, and open-source community investment.
  ], accent: palette.primary),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"The best infrastructure is invisible. Developers should think about products, not plumbing."_

  #v(0.3em)
  #text(size: 0.6em, weight: "regular", fill: palette.warm-gray)[-- MintOS Engineering Manifesto]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
