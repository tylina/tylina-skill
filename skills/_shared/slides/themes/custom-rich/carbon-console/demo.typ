// Carbon Console Theme Demo — Building a Real-time Feature Store
// Engineering tech talk for internal presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#show: carbon-console-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Engineering All-Hands | Feature Store v2],
  config-info(
    title: [Building a Real-time Feature Store],
    subtitle: [Sub-millisecond feature serving at scale],
    author: [Alex Chen -- Platform Engineering],
    institution: [Infrastructure Division],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

#set text(font: ("IBM Plex Sans", "PingFang SC"))

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()
#speaker-note[Introduce the feature-store program and the target: sub-millisecond serving without sacrificing correctness or operability.]

// ══════════════════════════════════════
// Section 1: Problem
// ══════════════════════════════════════
= Problem
#speaker-note[Frame the problem section around duplicated work, training-serving skew, and the direct business cost of the current platform.]

== Why We Need a Feature Store

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    console-card([Current Pain Points], [
      - ML models retrained daily but features computed ad-hoc
      - Feature pipelines duplicated across 12 teams
      - Training/serving skew causing 3-5% accuracy loss
      - P99 feature fetch latency: *45ms* (SLA: 10ms)
    ]),
    console-card([Business Impact], [
      - \$2.1M/year in duplicated compute
      - 6-week average time-to-production for new features
      - 14 incidents last quarter from stale features
      - Recommendation quality degraded by skew
    ], accent: palette.amber),
  ),
  rack-panel[SYSTEM STATUS],
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    circuit-stat([Current P99], [45ms], color: palette.red),
    circuit-stat([Target P99], [\<2ms], color: palette.green),
    circuit-stat([Teams Affected], [12], color: palette.amber),
    circuit-stat([Annual Waste], [\$2.1M], color: palette.red),
  ),
)
#speaker-note[Contrast the current pain with measurable impact. Call out the wide range of KPI label and value lengths when explaining the status row.]

== The Feature Serving Challenge

#cols[
  #stack(
    spacing: 0.8em,
    stdout-block[Feature requests spike to 500K QPS during peak hours],
    console-card([Requirements], [
      - Sub-millisecond P99 for online serving
      - Exactly-once semantics for streaming features
      - Point-in-time correctness for training
      - Multi-tenant with per-team quotas
    ]),
  )
][
  #stack(
    spacing: 0.8em,
    console-card([Existing Solutions], [
      #status-tag(status: "warning")[Redis] #h(4pt) Fast but no versioning \
      #status-tag(status: "warning")[Feast] #h(4pt) Good API, slow serving \
      #status-tag(status: "healthy")[Tecton] #h(4pt) Great but \$500K/year \
      #status-tag(status: "error")[Homebrew] #h(4pt) Our current mess
    ], accent: palette.cyan),
    wire-divider(width: 100%),
    stdout-block[Decision: build in-house, optimized for our workload],
  )
]
#speaker-note[Explain why off-the-shelf options miss at least one hard requirement. The final decision is workload-specific optimization, not rebuilding for its own sake.]

// ══════════════════════════════════════
// Section 2: Architecture
// ══════════════════════════════════════
= Architecture
#speaker-note[Transition from the business case to the two-path architecture and its operational boundaries.]

== System Overview

#stack(
  spacing: 0.8em,
  rack-panel[ARCHITECTURE | DISTRIBUTED FEATURE STORE v2],
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    console-card([Online Serving Path], [
      + Client sends feature request via gRPC
      + Router selects shard by entity key hash
      + Hot cache (L1): thread-local, 50us P99
      + Warm cache (L2): shared memory, 200us P99
      + Cold path: RocksDB lookup, 800us P99
      + Response assembled and returned
    ]),
    console-card([Offline Compute Path], [
      + Feature definitions registered in catalog
      + Spark/Flink jobs compute batch features
      + Streaming features via Kafka consumers
      + Materialization to online store (RocksDB)
      + Backfill jobs for point-in-time training sets
      + Monitoring and alerting pipeline
    ], accent: palette.amber),
  ),
  cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    circuit-stat([Shards], [128], color: palette.green),
    circuit-stat([Replicas], [3x], color: palette.cyan),
    circuit-stat([Storage], [4.2TB], color: palette.amber),
  ),
)
#speaker-note[Walk the online and offline paths separately, then use the three metrics to anchor the deployed scale.]

== Data Flow

#stack(
  spacing: 0.8em,
  stdout-block[kafka -> transform -> materialize -> serve],
  cols[
    #console-card([Write Path], [
      *Streaming ingestion:*
      - Kafka consumer groups per feature set
      - Exactly-once via transactional writes
      - Compaction for latest-value semantics
      - Write-ahead log for crash recovery
    ])
  ][
    #console-card([Read Path], [
      *Three-tier caching:*
      - L1: per-thread, 10K entries, LRU
      - L2: shared memory, 1M entries, clock-evict
      - L3: RocksDB with bloom filters
      - Prefetch hints from model metadata
    ], accent: palette.cyan)
  ],
)
#speaker-note[Describe the write path first, then the three-tier read path. Stress exactly-once writes and predictable cache fallback.]

// ══════════════════════════════════════
// Section 3: Implementation
// ══════════════════════════════════════
= Implementation
#speaker-note[Introduce the two implementation layers: the latency-critical Rust server and the declarative Python authoring surface.]

== Core Feature Server (Rust)

#cols[
  ```rust
  pub async fn get_features(
      &self, req: FeatureRequest,
  ) -> Result<FeatureVector> {
      let shard = self.router.route(&req.entity_key);
      if let Some(v) = self.l1_cache.get(&req.key) {
          return Ok(v);
      }
      self.fetch_with_backfill(shard, &req).await
  }
  ```
][
  #stack(
    spacing: 0.8em,
    console-card([Design Decisions], [
      *Why Rust?*
      - Predictable latency (no GC pauses)
      - `unsafe` for lock-free L1 cache
      - Tokio for async I/O without overhead

      *Key optimizations:*
      - SIMD for feature vector assembly
      - Zero-copy deserialization (rkyv)
    ], accent: palette.green),
    perf-bar([Cache Hit Rate (L1)], 92, color: palette.green),
    perf-bar([Cache Hit Rate (L2)], 97, color: palette.green),
    perf-bar([Memory Utilization], 78, color: palette.amber),
  )
]
#speaker-note[Use the code excerpt to show the cache-first request path. Then connect Rust's predictability to the measured cache hit rates and memory use.]

== Feature Definition SDK (Python)

#cols[
  ```python
  user = Entity(
      name="user", join_key="user_id",
  )
  @feature_view(entities=[user])
  def user_activity(src: Stream):
      grouped = src.group_by("user_id")
      return grouped.agg(
          clicks_1h=count("click"),
          avg_session=mean("duration"),
      )
  ```
][
  #stack(
    spacing: 0.8em,
    console-card([SDK Features], [
      - Declarative feature definitions
      - Type-safe schema validation
      - Automatic backfill generation
      - Built-in data quality checks
      - CI/CD integration for feature PRs
    ]),
    console-card([Developer Experience], [
      #stack(
        spacing: 0.8em,
        stdout-block[fs register user\_activity.py],
        stdout-block[fs materialize --start 2026-01-01],
        stdout-block[fs serve --port 8080 --shards 128],
      )
    ], accent: palette.amber),
  )
]
#speaker-note[Show that feature authors stay in Python while the platform generates validation, backfills, and deployment commands.]

// ══════════════════════════════════════
// Section 4: Benchmarks
// ══════════════════════════════════════
= Benchmarks
#speaker-note[Move from implementation choices to production measurements: latency first, then throughput under load.]

== P99 Latency Comparison

#let systems = ("Redis", "Feast", "Tecton", "Ours")
#let p99 = (12.5, 45.2, 8.3, 2.1)

#cols[
  #figure[
    #lq.diagram(
      width: 320pt, height: 160pt,
      xaxis: (ticks: range(4).map(i => (i + 1, systems.at(i))), subticks: none),
      yaxis: (ticks: ((0, "0"), (15, "15ms"), (30, "30ms"), (45, "45ms")), subticks: none),
      lq.bar(range(4).map(i => i + 1), p99, fill: palette.green, width: 55%),
    )
  ]
][
  #stack(
    spacing: 0.8em,
    rack-panel[BENCHMARK RESULTS],
    perf-bar([Redis (baseline)], 12.5, max: 50, color: palette.amber),
    perf-bar([Feast OSS], 45.2, max: 50, color: palette.red),
    perf-bar([Tecton Cloud], 8.3, max: 50, color: palette.amber),
    perf-bar([Ours (v2)], 2.1, max: 50, color: palette.green),
    [#status-tag(status: "healthy")[4x faster than Redis] #h(4pt) #status-tag(status: "healthy")[SLA met]],
  )
]
#speaker-note[Compare P99 values across systems and emphasize that the new service clears the latency target with margin.]

== Throughput Under Load

#let qps-labels = ("100K", "200K", "300K", "400K", "500K")
#let qps-x = range(5).map(i => i + 1)
#let latency-curve = (0.8, 1.1, 1.4, 1.8, 2.1)

#cols[
  #figure[
    #lq.diagram(
      width: 320pt, height: 160pt,
      xaxis: (ticks: range(5).map(i => (i + 1, qps-labels.at(i))), subticks: none),
      yaxis: (ticks: ((0, "0"), (1, "1ms"), (2, "2ms"), (3, "3ms")), subticks: none),
      lq.plot(qps-x, latency-curve, stroke: 2.5pt + palette.green, label: none),
    )
  ]
][
  #stack(
    spacing: 0.8em,
    console-card([Load Test Results], [
      - Linear scaling up to 400K QPS
      - P99 stays under 2ms at 500K QPS
      - Zero timeouts during 72h soak test
      - Graceful degradation at 600K+ QPS
    ]),
    cols(columns: (1fr, 1fr), gutter: 0.6em, lazy-layout: true,
      circuit-stat([Peak QPS], [523K], color: palette.green),
      circuit-stat([Uptime], [99.99%], color: palette.green),
    ),
  )
]
#speaker-note[Read the curve left to right. The service scales linearly through the target load, with a strong peak-QPS and uptime result.]

// ══════════════════════════════════════
// Section 5: Lessons
// ══════════════════════════════════════
= Lessons
#speaker-note[Transition from results to the decisions that worked, the mistakes that hurt, and the next platform investments.]

== What We Learned

#cols[
  #stack(
    spacing: 0.8em,
    console-card([Things That Worked], [
      + *Rust for the hot path* -- predictable latency, no GC surprises
      + *Three-tier cache* -- 97% hit rate means RocksDB rarely touched
      + *Feature registry* -- single source of truth eliminated drift
      + *Canary deployments* -- caught 3 regressions before prod
    ], accent: palette.green),
    wire-divider(width: 100%),
    [#status-tag(status: "healthy")[Production since March] #h(4pt) #status-tag(status: "healthy")[12 teams onboarded] #h(4pt) #status-tag(status: "healthy")[Zero P0 incidents]],
  )
][
  #stack(
    spacing: 0.8em,
    console-card([Things That Hurt], [
      + *RocksDB tuning* -- took 3 weeks to get compaction right
      + *Schema evolution* -- v1 had no migration path
      + *Observability* -- custom metrics were a mistake (use OpenTelemetry)
      + *Python SDK DX* -- type stubs are hard to maintain
    ], accent: palette.red),
    console-card([Next Steps], [
      - GPU feature serving for embedding lookups
      - Cross-region replication (EU compliance)
      - Feature lineage and impact analysis
      - Self-serve onboarding portal
    ], accent: palette.amber),
  )
]
#speaker-note[Balance the retrospective: keep the successful architecture choices, acknowledge operational mistakes, and connect each next step to an observed gap.]

== Impact Summary

#stack(
  spacing: 0.8em,
  rack-panel[PRODUCTION METRICS | 90 DAYS POST-LAUNCH],
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    circuit-stat([P99 Latency], [1.8ms], color: palette.green),
    circuit-stat([Cost Saved], [\$1.4M], color: palette.green),
    circuit-stat([Time-to-Prod], [4 days], color: palette.green),
    circuit-stat([Accuracy Gain], [+2.3%], color: palette.amber),
  ),
  cols[
    #stack(
      spacing: 0.8em,
      perf-bar([Team Adoption], 85, color: palette.green),
      perf-bar([Feature Coverage], 72, color: palette.amber),
      perf-bar([SLA Compliance], 99, color: palette.green),
    )
  ][
    #stack(
      spacing: 0.8em,
      stdout-block[All KPIs exceeded targets for Q1 2026],
      stdout-block[Projected full ROI by end of Q2],
    )
  ],
)
#speaker-note[Summarize the 90-day production impact. The KPI row deliberately mixes short and long values and labels; all remain centered and readable.]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"The best infrastructure is the kind your users forget exists."_

  #text(size: 0.6em, weight: "regular", fill: palette.ink-muted)[-- Our team motto]
]
#speaker-note[Pause on the team motto and let the audience connect it to the reliability and developer-experience results.]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Questions?]
#speaker-note[Invite questions, especially on cache architecture, migration strategy, and measured production performance.]
