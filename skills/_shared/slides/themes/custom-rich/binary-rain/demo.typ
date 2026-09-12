// Binary Rain Theme Demo — Data Processing Pipeline Overview
// Digital cascading data streams, modern light presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#show: binary-rain-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [StreamCore -- Architecture Review 2026],
  config-info(
    title: [StreamCore: Real-Time Data Pipeline],
    subtitle: [Building Resilient Event Processing at Scale],
    author: [Marcus Webb, Principal Engineer],
    institution: [StreamCore Systems],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Avenir Next", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Problem Space
// ══════════════════════════════════════
= Problem Space

== Current Challenges

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    stream-card([Throughput Limitations], [
      Legacy batch systems process data in 15-minute windows. Real-time requirements demand sub-second latency. Current architecture cannot scale beyond *2M events/sec* without significant degradation.

      Backpressure handling is manual and error-prone.
    ], accent: palette.primary),
    stream-card([Data Consistency], [
      Distributed state management across 12 regions introduces eventual consistency windows of up to 30 seconds. Financial transactions require *exactly-once* semantics that current infrastructure cannot guarantee.

      Schema evolution breaks downstream consumers silently.
    ], accent: palette.secondary),
  ),
  cascade-box([Key Insight], [
    The fundamental bottleneck is not compute capacity but *coordination overhead*. Each event requires 4.7 network round-trips on average due to legacy two-phase commit protocols.
  ]),
)

== Market Context

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  stack(spacing: 0.8em,
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      byte-stat([Events/Day], [8.4B], color: palette.primary),
      byte-stat([P99 Latency / 延迟], [340ms], color: palette.secondary),
    ),
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      byte-stat([Error Rate], [0.03%], color: palette.primary-dark),
      byte-stat([Regions], [12], color: palette.secondary),
    ),
    buffer-card([Pipeline Bottlenecks], [
      - Serialization accounts for 23% of processing time
      - 4.7 average network hops per event
      - State lookups average 89ms (12% cache misses)
    ], accent: palette.secondary),
  ),
  stack(spacing: 0.8em,
    stream-card([Competitive Pressure], [
      *Industry leaders* (Kafka, Flink, Spark Streaming): powerful but operationally complex.

      *New entrants* (Redpanda, RisingWave, Materialize): simpler but limited feature set.

      *Our differentiation*: Zero-coordination processing with deterministic replay.
    ], accent: palette.primary),
    debug-note([Architecture Decision Record], [
      After evaluating 6 approaches over 3 months, the team selected *log-structured merge with virtual partitioning* as the foundation for the next-generation pipeline.
    ], accent: palette.highlight),
  ),
)

// ══════════════════════════════════════
// Section 2: Architecture
// ══════════════════════════════════════
= Architecture

== System Design

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    stream-card([Ingestion Layer], [
      Zero-copy event capture with kernel-bypass networking. Handles schema validation, deduplication, and partitioning at line rate.

      - *Throughput*: 12M events/sec per node
      - *Latency*: < 50us ingestion-to-ack
    ], accent: palette.primary),
    stream-card([Processing Layer], [
      Deterministic dataflow engine with checkpoint-based fault tolerance. Supports both streaming SQL and custom operators.

      - *Parallelism*: 2048 virtual threads
      - *State*: Embedded RocksDB with tiered storage
    ], accent: palette.secondary),
    stream-card([Delivery Layer], [
      Exactly-once sink connectors with transactional writes. Supports 40+ destination systems with automatic backpressure.

      - *Guarantees*: Exactly-once semantics
      - *Connectors*: 40+ certified integrations
    ], accent: palette.primary),
  ),
  cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
    byte-stat([Processing], [< 5ms], color: palette.primary),
    byte-stat([Recovery], [< 2s], color: palette.secondary),
  ),
)

== Implementation Details

#grid(columns: (1fr, 1fr), gutter: 0.35em,
  terminal-box([1. Event Schema], [
    ```
    message Event {
      string id = 1;
      int64 timestamp = 2;
      bytes payload = 3;
      map<string, string> headers = 4;
      uint32 partition_key = 5;
    }
    ```
    Protobuf-based schema with automatic evolution support.
  ], accent: palette.secondary),
  terminal-box([3. Monitoring Output], [
    ```
    ┌─ Pipeline Health ──────────────┐
    │ Throughput:   8.4M events/sec  │
    │ Latency p99:  4.2ms           │
    │ Backpressure: 0.00%           │
    │ Checkpoints:  every 30s       │
    │ State size:   2.3 TB          │
    └────────────────────────────────┘
    ```
  ], accent: palette.secondary),
  terminal-box([2. Processing Pipeline], [
    ```
    $ streamcore deploy --topology production
    > Schema registry validated
    > Virtual partitions: 2048
    > Pipeline active: 12 nodes
    ```
  ], accent: palette.primary),
  cascade-box([Deterministic Replay], [
    Every event is assigned a *logical timestamp* at ingestion. Processing is fully deterministic given the same input ordering. This enables time-travel debugging and exact replay for disaster recovery.
  ]),
)

// ══════════════════════════════════════
// Section 3: Performance
// ══════════════════════════════════════
= Performance

== Benchmark Results

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    packet-card([Throughput / 吞吐量], [12M/s], [Events per second per node], color: palette.primary),
    packet-card([Latency], [4.2ms], [P99 end-to-end latency], color: palette.secondary),
    packet-card([Recovery], [1.8s], [Time to recover from failure], color: palette.primary-dark),
    packet-card([Efficiency], [94%], [CPU utilization at peak load], color: palette.secondary),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    stream-card([vs. Apache Kafka + Flink], [
      - *Throughput*: 3.2x higher per node
      - *Latency*: 8x lower p99
      - *Operational complexity*: 60% fewer components
      - *Cost*: 45% reduction in cloud spend
      - *Recovery*: 12x faster failover
    ], accent: palette.primary),
    stream-card([vs. Cloud-Native Solutions], [
      - *Throughput*: 2.1x higher than Kinesis
      - *Latency*: 5x lower than Pub/Sub
      - *Portability*: Runs on any infrastructure
      - *Cost*: No per-message pricing model
      - *Control*: Full data sovereignty
    ], accent: palette.secondary),
  ),
)

== Scaling Characteristics

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  stack(spacing: 0.8em,
    stream-card([Linear Scalability], [
      *Horizontal scaling* is achieved through virtual partitioning. Adding nodes automatically rebalances partitions without downtime or data loss.

      - 1 node: 12M events/sec
      - 4 nodes: 47M events/sec (98% efficiency)
      - 16 nodes: 185M events/sec (96% efficiency)
      - 64 nodes: 720M events/sec (94% efficiency)
    ], accent: palette.primary),
    stack(dir: ltr, spacing: 0.5em,
      bit-tag([Linear], color: palette.primary),
      bit-tag([Zero-Downtime], color: palette.secondary),
      bit-tag([Auto-Rebalance], color: palette.primary-dark),
    ),
  ),
  stack(spacing: 0.8em,
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      byte-stat([Nodes Max], [256], color: palette.primary),
      byte-stat([Partitions], [65K], color: palette.secondary),
    ),
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      byte-stat([Rebalance], [< 5s], color: palette.primary-dark),
      byte-stat([Data Loss], [Zero], color: palette.primary),
    ),
    debug-note([Capacity Planning], [
      At 23% MoM growth, scale from 16 to 32 nodes by Q3 2026; virtual partitioning needs no application changes.
    ], accent: palette.highlight),
  ),
)

// ══════════════════════════════════════
// Section 4: Reliability
// ══════════════════════════════════════
= Reliability

== Fault Tolerance

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    stream-card([Checkpoint Mechanism], [
      Asynchronous barrier-based checkpointing with incremental state snapshots. Checkpoints complete in < 500ms even with terabytes of state.

      - *Frequency*: Every 30 seconds
      - *Overhead*: < 2% throughput impact
      - *Storage*: Tiered (local SSD + object storage)
      - *Retention*: 7 days with configurable policy
    ], accent: palette.primary),
    stream-card([Failure Recovery], [
      Deterministic replay from last checkpoint with parallel state reconstruction. Multi-region failover with automatic leader election.

      - *Single node failure*: < 2 seconds recovery
      - *Region failure*: < 30 seconds failover
      - *Data loss*: Zero (exactly-once guarantees)
      - *Split-brain*: Raft consensus prevents divergence
    ], accent: palette.secondary),
  ),
  matrix-grid(columns: 2, (
    [*SLA Target*: 99.999% uptime (5.26 min/year)],
    [*Achieved*: 99.9997% over last 12 months],
    [*MTTR*: 1.8 seconds average],
    [*MTBF*: 847 hours between incidents],
  )),
)

== Observability Stack

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  stack(spacing: 0.8em,
    buffer-card([Metrics Pipeline], [
      - 2,400 metrics per node exported every 10s
      - Custom histogram aggregation for latency percentiles
      - Automatic anomaly detection with ML-based baselines
      - Alert routing with PagerDuty, Slack, and OpsGenie
    ], accent: palette.secondary),
    buffer-card([Distributed Tracing], [
      - End-to-end event lineage tracking
      - Causal ordering visualization across nodes
      - Automatic bottleneck identification
      - Integration with OpenTelemetry and Jaeger
    ], accent: palette.primary),
  ),
  stack(spacing: 0.8em,
    terminal-box([Alert Configuration], [
      ```yaml
      alerts:
        - name: high_latency
          condition: p99_latency > 10ms
          duration: 60s
          severity: warning
        - name: data_loss_risk
          condition: checkpoint_lag > 120s
          duration: 30s
          severity: critical
      ```
    ], accent: palette.secondary),
    cascade-box([Chaos Engineering], [
      Weekly automated failure injection tests cover node crashes, network partitions, disk failures, and clock skew. Every scenario must recover within SLA.
    ]),
  ),
)

// ══════════════════════════════════════
// Section 5: Roadmap
// ══════════════════════════════════════
= Roadmap

== Next Quarter Priorities

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    packet-card([Q3 2026], [WASM], [User-defined functions in WebAssembly], color: palette.primary),
    packet-card([Q4 2026], [ML Ops], [Native model serving in pipeline], color: palette.secondary),
    packet-card([Q1 2027], [Edge], [Edge computing deployment mode], color: palette.primary-dark),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    stream-card([Engineering Investment], [
      Hiring 8 additional engineers focused on:
      - WASM runtime integration (3 engineers)
      - ML inference optimization (3 engineers)
      - Edge deployment orchestration (2 engineers)

      Total team size growing from 24 to 32.
    ], accent: palette.primary),
    stream-card([Open Source Strategy], [
      Core engine will be open-sourced in Q4 2026 under Apache 2.0 license. Commercial features include:
      - Multi-region replication
      - Enterprise security (RBAC, encryption)
      - Managed cloud service
      - 24/7 support and SLA guarantees
    ], accent: palette.secondary),
  ),
)

== Resource Requirements

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    byte-stat([Engineers], [+8], color: palette.primary),
    byte-stat([Budget], [\$4.2M], color: palette.secondary),
    byte-stat([Timeline], [9 mo], color: palette.primary-dark),
  ),
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    buffer-card([Compute (40%)], [
      Scale test cluster from 16 to 64 nodes. Add GPU nodes for ML inference benchmarking.
    ], accent: palette.primary),
    buffer-card([People (45%)], [
      8 senior engineers, 2 SREs, 1 technical writer. Competitive compensation with equity.
    ], accent: palette.secondary),
    buffer-card([Tools (15%)], [
      Observability platform upgrade, CI/CD expansion, security tooling licenses.
    ], accent: palette.primary),
  ),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  #stack(spacing: 0.8em,
    [_"The fastest message is the one that never crosses a network boundary."_],
    text(size: 0.6em, weight: "regular", fill: rgb("#A5D6A7"))[-- StreamCore Engineering Principles],
  )
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
