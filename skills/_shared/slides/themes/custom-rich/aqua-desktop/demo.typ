// Aqua Desktop Theme Demo — Developer Tools / SaaS Product Launch
// Presenting "Veloce" — a next-gen API gateway platform
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Helvetica Neue", "Arial", "Arial Unicode MS"), size: 20pt)

#show: aqua-desktop-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Veloce Platform -- Developer Conference 2026],
  config-info(
    title: [Veloce API Gateway],
    subtitle: [Ship Faster. Scale Infinitely. Zero Downtime.],
    author: [Marcus Chen, VP of Engineering],
    institution: [Veloce Cloud Infrastructure],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// Public outline API
#outline-slide()

// ══════════════════════════════════════
// Section 1: Platform Overview
// ══════════════════════════════════════
= Platform Overview

== Why Veloce?

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  window-card([Problem Space], [
    Modern APIs face unprecedented challenges:

    - *Latency budgets* shrinking to < 50ms P99
    - *Traffic spikes* of 100x during events
    - *Multi-cloud* routing complexity
    - *Security threats* evolving daily

    Legacy gateways cannot keep up with the demands of modern distributed systems.
  ]),
  window-card([Our Solution], [
    Veloce is a next-generation API gateway built on:

    - *Rust-native* data plane (zero-copy)
    - *eBPF-accelerated* traffic inspection
    - *WASM plugins* for custom logic
    - *Global edge* mesh with 200+ PoPs

    Sub-millisecond overhead on every request.
  ], accent: palette.purple),
)

== Key Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  metric-panel([0.3ms], [p99 latency], accent: palette.active-blue),
  metric-panel([2.1M], [rps per node], accent: palette.purple),
  metric-panel([99.999%], [uptime sla], accent: palette.traffic-green),
  metric-panel([< 5min], [deploy time], accent: palette.active-blue),
)

#v(0.6em)

#notification-card([Performance Alert], [
  Veloce consistently outperforms competitors by 3-8x on standardized gateway benchmarks. Our Rust-native architecture eliminates garbage collection pauses entirely.
], accent: palette.active-blue)

// ══════════════════════════════════════
// Section 2: Architecture
// ══════════════════════════════════════
= Architecture

== System Design

#stack(
  spacing: 0.8em,
  toolbar-box([Control Plane], [
    The control plane manages configuration, routing rules, and cluster state:

    - *etcd-backed* distributed config store
    - *Raft consensus* for leader election
    - *GitOps-native* — all config as code
    - *Real-time propagation* (< 100ms to all edges)
  ], accent: palette.active-blue),
  toolbar-box([Data Plane], [
    The data plane handles all traffic processing with near-zero overhead:

    - *io_uring* for async I/O (Linux 5.19+)
    - *Connection pooling* with adaptive sizing
    - *Protocol detection* (HTTP/1.1, HTTP/2, gRPC, WebSocket)
    - *TLS 1.3* hardware-accelerated termination
  ], accent: palette.purple),
)

== API Configuration

#cols[
  #code-window([veloce.config.yaml], [
    ```yaml
    gateway:
      name: production-us-west
      listeners:
        - port: 443
          protocol: https
          tls:
            cert: /certs/wildcard.pem
            key: /certs/wildcard.key
      routes:
        - match:
            path: /api/v2/*
          backends:
            - url: http://api-service:8080
              weight: 90
            - url: http://api-canary:8080
              weight: 10
          plugins:
            - rate-limit:
                requests: 1000
                window: 60s
    ```
  ])
][
  #sidebar-item([Route Matching], [
    Path-based, header-based, and method-based routing with regex support and priority ordering.
  ], accent: palette.active-blue)

  #sidebar-item([Load Balancing], [
    Weighted round-robin, least-connections, and consistent hashing algorithms with health checking.
  ], accent: palette.purple)

  #sidebar-item([Plugin System], [
    WASM-based plugin runtime allows custom logic at any point in the request lifecycle.
  ], accent: palette.traffic-green)
]

// ══════════════════════════════════════
// Section 3: Developer Experience
// ══════════════════════════════════════
= Developer Experience

== SDK & CLI Tools

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  code-window([Terminal — veloce-cli], [
    ```
    $ veloce deploy --env production
    ✓ Config validated (0.2s)
    ✓ Building WASM plugins (1.4s)
    ✓ Pushing to edge nodes (2.1s)
    ✓ Health checks passing (0.8s)

    Deploy complete! 4.5s total
    200 edge nodes updated
    0 errors, 0 warnings

    $ veloce status
    ┌─────────────────────────────┐
    │ Cluster: us-west-prod       │
    │ Nodes: 200/200 healthy      │
    │ RPS: 1.2M (avg)             │
    │ P99: 0.28ms                 │
    └─────────────────────────────┘
    ```
  ]),
  {
    stack(
      spacing: 0.8em,
      dropdown-card([TypeScript SDK], [
        Full-featured SDK with type-safe route definitions, middleware composition, and hot-reload support during development.

        - `veloce.route()` — Define routes
        - `veloce.plugin()` — Register plugins
        - `veloce.test()` — Integration testing
      ], accent: palette.active-blue),
      dropdown-card([Python SDK], [
        Async-first Python SDK built on `asyncio` with support for FastAPI and Django integration.

        - `VeloceClient` — Gateway admin
        - `@veloce.middleware` — Decorators
        - `veloce.mock()` — Local testing
      ], accent: palette.purple),
    )
  },
)

== Feature Tags & Status

#stack(
  spacing: 0.8em,
  stack(dir: ltr, spacing: 4pt,
    tag-pill([GA], color: palette.traffic-green),
    tag-pill([Beta], color: palette.active-blue),
    tag-pill([Preview], color: palette.purple),
    tag-pill([Planned], color: palette.traffic-yellow),
  ),
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    window-card([Traffic Management], [
      #tag-pill([GA], color: palette.traffic-green)
      #v(4pt)
      - Weighted routing
      - Canary deployments
      - A/B testing
      - Blue-green deploys
      - Circuit breaking
    ]),
    window-card([Security], [
      #tag-pill([GA], color: palette.traffic-green)
      #v(4pt)
      - mTLS everywhere
      - OAuth 2.0 / OIDC
      - API key management
      - WAF rules engine
      - DDoS protection
    ], accent: palette.purple),
    window-card([Observability], [
      #tag-pill([Beta], color: palette.active-blue)
      #v(4pt)
      - OpenTelemetry native
      - Real-time dashboards
      - Anomaly detection
      - Cost attribution
      - SLO tracking
    ], accent: palette.traffic-green),
  ),
)

// ══════════════════════════════════════
// Section 4: Performance
// ══════════════════════════════════════
= Performance

== Benchmark Results

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  {
    stack(
      spacing: 0.8em,
      metric-panel([2.1M], [requests per second], accent: palette.active-blue),
      metric-panel([0.3ms], [p99 latency], accent: palette.purple),
    )
  },
  {
    stack(
      spacing: 0.8em,
      progress-bar([94%], [CPU Efficiency], accent: palette.traffic-green, progress: 94%),
      progress-bar([87%], [Memory Utilization], accent: palette.active-blue, progress: 87%),
      progress-bar([99.999%], [Availability], accent: palette.purple, progress: 99.999%),
      progress-bar([78%], [Cache Hit Rate], accent: palette.traffic-green, progress: 78%),
    )
  },
)

== Scaling Comparison

#stack(
  spacing: 0.8em,
  notification-card([Auto-Scaling Intelligence], [
    Veloce uses predictive scaling based on historical traffic patterns, time-of-day analysis, and real-time request queue depth. Scale-up latency is under 30 seconds for pre-warmed instances.
  ], accent: palette.active-blue),
  cols(columns: (1fr, 1fr), gutter: 1em,
    toolbar-box([Horizontal Scaling], [
      - *Zero-downtime* node additions
      - *Automatic rebalancing* of connections
      - *Session affinity* preservation
      - Scale to 1000+ nodes per cluster
    ], accent: palette.active-blue),
    toolbar-box([Vertical Scaling], [
      - *NUMA-aware* thread pinning
      - *CPU isolation* per worker
      - *Memory-mapped* config files
      - Optimized for 64-core+ machines
    ], accent: palette.purple),
  ),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  "The best API gateway is the one you never have to think about."

  #text(size: 0.6em, weight: "regular")[-- Engineering Philosophy at Veloce]
]

// ══════════════════════════════════════
// Section 5: Roadmap
// ══════════════════════════════════════
= Roadmap

== What's Next

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em,
    sidebar-item([Q3 2026 — AI Gateway], [
      Native LLM routing with token-aware load balancing, prompt caching, and cost optimization across providers.
    ], accent: palette.active-blue),
    sidebar-item([Q1 2027 — GraphQL Native], [
      Deep GraphQL understanding with query complexity analysis, automatic persisted queries, and schema-aware caching.
    ], accent: palette.traffic-green),
  ),
  dock-divider(width: 60%),
  notification-card([Open Source Commitment], [
    The Veloce data plane will be open-sourced under Apache 2.0 in Q3 2026. Community plugins and contributions welcome from day one.
  ], accent: palette.traffic-green),
)

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════
#ending-slide[Thank You]
