// Lattice Theme Demo — Distributed Systems Architecture
// Technical engineering presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#show: lattice-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Engineering Summit 2026 -- Distributed Systems Track],
  config-info(
    title: [Building Resilient Distributed Systems],
    subtitle: [Patterns, Protocols, and Production Lessons],
    author: [Dr. Marcus Chen],
    institution: [Infrastructure Engineering, Nexus Technologies],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// Document fonts belong in the deck, not the reusable theme entry point.
#set text(font: ("Arial", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundations
// ══════════════════════════════════════
= Foundations

== The CAP Theorem

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  node-card([Consistency], [
    Every read receives the most recent write or an error. All nodes see the same data at the same time.

    *Strong consistency*: linearizable reads/writes across all replicas.
  ], accent: palette.primary),
  node-card([Availability], [
    Every request receives a non-error response, without guarantee of the most recent write.

    *High availability*: system remains operational during partial failures.
  ], accent: palette.accent),
)

#v(0.5em)

#crystal-box([Partition Tolerance], [
  The system continues to operate despite network partitions between nodes. In any distributed system, partitions *will* happen -- you must choose between C and A during a partition event.
], accent: palette.secondary)

== Consensus Protocols

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  node-card([Raft], [
    Leader-based consensus with strong leadership. Log replication ensures all nodes agree on state transitions.

    *Use case*: etcd, CockroachDB, TiKV.
  ], accent: palette.primary),
  node-card([Paxos], [
    Multi-decree protocol for reaching agreement in asynchronous systems. Complex but proven correct.

    *Use case*: Google Spanner, Chubby lock service.
  ], accent: palette.accent),
  node-card([PBFT], [
    Byzantine fault tolerant consensus for untrusted environments. Tolerates up to f = (n-1)/3 failures.

    *Use case*: Blockchain, financial settlement layers.
  ], accent: palette.secondary),
)

#v(0.4em)

#structure-highlight([Key Insight], [
  All consensus protocols trade latency for safety. The theoretical lower bound for consensus in an asynchronous system is two message delays (FLP impossibility constrains further).
])

// ══════════════════════════════════════
// Section 2: Architecture Patterns
// ══════════════════════════════════════
= Architecture Patterns

== Event-Driven Architecture

#cols[
  #node-card([Event Sourcing], [
    Store all state changes as an immutable sequence of events. Current state is derived by replaying the event log.

    - *Append-only*: never mutate past events
    - *Temporal queries*: reconstruct state at any point in time
    - *Audit/replay*: complete history and rebuildable projections
  ], accent: palette.primary)

  #v(0.8em)

  #stack(dir: ltr, spacing: 0.6em,
    atom-tag([CQRS], color: palette.primary),
    atom-tag([Kafka], color: palette.accent),
    atom-tag([Idempotent], color: palette.secondary),
  )
][
  #node-card([Saga Pattern], [
    Manage distributed transactions as a sequence of local transactions with compensating actions.

    *Choreography*: events trigger next steps; *orchestration*: a central coordinator manages flow.

    Failures run compensating actions for prior steps.
  ], accent: palette.accent)

  #v(0.8em)

  #crystal-box([Delivery Guarantees], [
    - *At-most-once*: fire and forget
    - *At-least-once*: retry until acknowledged
    - *Exactly-once*: idempotent consumers + deduplication
  ], accent: palette.secondary)
]

== Event Sourcing: Code Example

#cols[
  #set text(size: 0.72em)
  ```rust
  // Append an event to the immutable log
  async fn append(
      store: &EventStore,
      stream: &str,
      event: DomainEvent,
  ) -> Result<u64> {
      let payload = serde_json::to_vec(&event)?;
      store.append(stream, payload).await
  }

  // Rebuild aggregate by replaying events
  async fn rehydrate(
      store: &EventStore,
      stream: &str,
  ) -> Result<OrderAggregate> {
      let events = store.read(stream, 0..).await?;
      Ok(events.fold(
          OrderAggregate::default(),
          |agg, ev| agg.apply(ev),
      ))
  }
  ```
][
  #node-card([Why Replay?], [
    Rehydrating aggregates from raw events gives:

    - *Time-travel*: reconstruct state at any past timestamp
    - *Projections*: build new read models from existing events
    - *Auditability*: complete, tamper-evident history
    - *Testing*: replay production events in staging
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    atom-tag([Rust], color: palette.primary),
    atom-tag([Async], color: palette.accent),
    atom-tag([serde], color: palette.secondary),
  )
]

== Service Mesh Topology

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  node-card([Data Plane], [
    Sidecar proxies (Envoy) handle all service-to-service communication:

    - *Load balancing*: weighted round-robin, least connections
    - *Circuit breaking*: fail fast on unhealthy upstreams
    - *mTLS*: automatic encryption between services
    - *Observability*: distributed tracing spans
  ], accent: palette.primary),
  node-card([Control Plane], [
    Central configuration management:

    - *Service discovery*: DNS and endpoint registration
    - *Traffic policies*: retries, timeouts, rate limits
    - *Certificate rotation*: automatic mTLS cert management
    - *Canary routing*: progressive traffic shifting
  ], accent: palette.accent),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  bond-stat([p99 Latency], [2.3ms], color: palette.primary),
  bond-stat([Throughput], [1.2M rps], color: palette.accent),
  bond-stat([Availability], [99.99%], color: palette.secondary),
  bond-stat([Services], [340+], color: palette.primary),
)

// ══════════════════════════════════════
// Section 3: Data Infrastructure
// ══════════════════════════════════════
= Data Infrastructure

== Storage Engine Comparison

#cols[
  #facet-grid(
    ([Engine], [Write Pattern], [Read Pattern], [Use Case]),
    (
      ([LSM-Tree], [Sequential append], [Merge on read], [Write-heavy workloads]),
      ([B-Tree], [Random I/O], [Single seek], [Read-heavy, transactions]),
      ([Bitcask], [Append-only log], [In-memory index], [High-throughput KV]),
      ([Column Store], [Batch append], [Column scan], [Analytics, OLAP]),
    ),
  )
][
  #cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
    bond-stat([Write Amp (LSM)], [10-30x], color: palette.accent),
    bond-stat([Read Amp (B-Tree)], [1-2x], color: palette.primary),
  )

  #v(0.5em)

  #crystal-box([Compaction Strategies], [
    - *Size-tiered*: merge similarly-sized SSTables (write-optimized)
    - *Leveled*: maintain size ratio between levels (read-optimized)
    - *FIFO*: time-based expiration (TTL workloads)
    - *Universal*: hybrid approach balancing write and space amplification
  ], accent: palette.secondary)
]

== Replication Topologies

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  node-card([Single-Leader], [
    One primary accepts writes, replicates to followers.

    *Pros*: Simple, strong ordering guarantees
    *Cons*: Single point of failure for writes, replication lag

    *Failover*: promote follower, risk split-brain.
  ], accent: palette.primary),
  node-card([Multi-Leader], [
    Multiple nodes accept writes, resolve conflicts.

    *Pros*: Write availability during partitions, geo-distribution
    *Cons*: Conflict resolution complexity, convergence delay

    *CRDTs*: conflict-free replicated data types for automatic merge.
  ], accent: palette.accent),
)

#v(0.4em)

#lattice-divider(color: palette.border, width: 70%)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  bond-stat([Replication Lag], [< 50ms], color: palette.primary),
  bond-stat([RPO Target], [0 events], color: palette.accent),
  bond-stat([RTO Target], [< 30s], color: palette.secondary),
)

// ══════════════════════════════════════
// Section 4: Observability
// ══════════════════════════════════════
= Observability

== The Three Pillars

#cols[
  #node-card([Metrics], [
    Numerical time-series data aggregated over intervals. Cardinality-bounded, cheap to store.

    - *RED method*: Rate, Errors, Duration
    - *USE method*: Utilization, Saturation, Errors
    - *SLIs/SLOs*: service level indicators and objectives
  ], accent: palette.primary)

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    atom-tag([Prometheus], color: palette.primary),
    atom-tag([Grafana], color: palette.accent),
    atom-tag([PromQL], color: palette.secondary),
  )
][
  #node-card([Traces], [
    Request-scoped context propagated across service boundaries. Shows causal relationships.

    - *Span*: unit of work with timing
    - *Trace*: DAG of causally-related spans
    - *Sampling*: head-based vs tail-based strategies
  ], accent: palette.accent)

  #v(0.3em)

  #node-card([Logs], [
    Immutable, timestamped records of discrete events. High cardinality, expensive at scale.

    - *Structured logging*: JSON with correlation IDs
    - *Log levels*: DEBUG, INFO, WARN, ERROR
    - *Retention*: tiered storage (hot/warm/cold)
  ], accent: palette.secondary)
]

== Incident Response

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  crystal-box([Detection Pipeline], [
    1. *Alerting rules*: threshold and anomaly-based
    2. *On-call rotation*: PagerDuty escalation
    3. *War room*: shared context, single commander
    4. *Mitigation*: rollback, feature flags, traffic shed
    5. *Postmortem*: blameless, action items with owners
  ], accent: palette.primary),
  crystal-box([Error Budgets], [
    If SLO is 99.9% availability per quarter:

    - *Budget*: 21.6 minutes of downtime
    - *Burn rate*: consumption velocity
    - *Policy*: freeze deploys when budget exhausted
    - *Trade-off*: velocity vs reliability

    Error budgets align incentives between product and SRE teams.
  ], accent: palette.accent),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  bond-stat([MTTD], [< 2 min], color: palette.primary),
  bond-stat([MTTR], [< 15 min], color: palette.accent),
  bond-stat([SLO Target], [99.95%], color: palette.secondary),
  bond-stat([Incidents/Q], [3.2 avg], color: palette.primary),
)

// ══════════════════════════════════════
// Section 5: Production Lessons
// ══════════════════════════════════════
= Production Lessons

== Failure Modes

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  node-card([Cascading Failures], [
    A failure in one component overloads dependent services, triggering a chain reaction.

    *Prevention*:
    - Circuit breakers with exponential backoff
    - Bulkhead isolation (thread pools per dependency)
    - Load shedding at admission control
  ], accent: palette.primary),
  node-card([Metastable Failures], [
    System enters a self-sustaining failure state even after the trigger is removed.

    *Characteristics*:
    - Retry storms amplify load
    - Cache stampedes after cold start
    - Connection pool exhaustion

    *Recovery*: manual intervention required.
  ], accent: palette.secondary),
)

== Scaling Strategies

#cols[
  #facet-grid(
    ([Strategy], [Complexity], [Latency], [Consistency]),
    (
      ([Vertical], [Low], [None], [Strong]),
      ([Horizontal], [Medium], [LB hop], [N/A]),
      ([Sharding], [High], [Routing], [Per-shard]),
      ([CQRS], [Very High], [Eventual], [Eventual]),
    ),
  )

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    atom-tag([Auto-scaling], color: palette.primary),
    atom-tag([Sharding], color: palette.accent),
    atom-tag([Cell Architecture], color: palette.secondary),
  )
][
  #crystal-box([Cell-Based Architecture], [
    #set text(size: 0.78em)
    Partition the system into independent cells, each serving a subset of traffic:

    - *Blast radius*: failures contained within a single cell
    - *Independent scaling*: cells grow independently
    - *Deployment isolation*: canary one cell at a time
    - *Routing*: consistent hashing maps users to cells
  ], accent: palette.primary)

  #v(0.8em)

  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    bond-stat([Cells], [24 regions], color: palette.accent),
    bond-stat([Blast Radius], [< 4%], color: palette.secondary),
  )
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"Distributed systems are never 'up'; they exist in a spectrum of partially degraded states."_

  #text(size: 0.6em, weight: "regular", fill: white.transparentize(30%))[-- Charity Majors]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
