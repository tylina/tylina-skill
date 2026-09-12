// Plasma Arc Theme Demo — High-Voltage Power Systems Overview
// Electric discharge aesthetic, clean white with violet/blue/orange accents
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: plasma-arc-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [PlasmaGrid -- Technical Architecture Review 2026],
  config-info(
    title: [PlasmaGrid: Next-Gen Power Distribution],
    subtitle: [Intelligent Grid Management Through Real-Time Analytics],
    author: [Dr. Elena Vasquez, Chief Systems Architect],
    institution: [PlasmaGrid Energy Systems],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

#set text(font: ("IBM Plex Sans", "Heiti SC"))
#show raw: set text(font: "IBM Plex Mono")

// ==========================================
// Title Slide
// ==========================================
#title-slide()

// ==========================================
// Section 1: System Overview
// ==========================================
= System Overview

== Grid Architecture

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  arc-card([Distribution Network], [
    The PlasmaGrid system manages *12,400 nodes* across three interconnected regions. Each node operates as an autonomous unit with local intelligence, communicating state changes through a real-time mesh protocol.

    Peak load capacity: *847 GW* with dynamic rebalancing.
  ], accent: palette.primary),
  arc-card([Control Infrastructure], [
    Centralized command with distributed execution. The control plane processes *2.3 million telemetry events per second* from field sensors, transformers, and consumer endpoints.

    Decision latency: *< 50ms* from detection to action.
  ], accent: palette.secondary),
)

#v(0.5em)

#plasma-box([Critical Insight], [
  Traditional grid systems react to failures after cascading begins. PlasmaGrid *predicts* failure patterns 4.7 seconds before onset using plasma-state modeling of electrical flow dynamics.
])

== Performance Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  voltage-stat([Grid Nodes], [12.4K], color: palette.primary),
  voltage-stat([Peak Load], [847 GW], color: palette.secondary),
  voltage-stat([Uptime], [99.997%], color: palette.primary),
  voltage-stat([Response Time], [\<50ms], color: palette.accent),
)

#v(0.6em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  field-card([Telemetry Pipeline], [
    - Sensor ingestion: 2.3M events/sec continuous
    - State propagation: mesh protocol, < 12ms hop latency
    - Anomaly detection: ML-based, 99.4% precision
    - Predictive window: 4.7 seconds average lead time
  ], accent: palette.secondary),
  arc-card([Competitive Advantage], [
    *Legacy systems* (SCADA, EMS): Reliable but slow, 500ms+ reaction times.

    *New entrants* (IoT grids): Fast but fragile, lack safety certifications.

    *PlasmaGrid*: Combines millisecond response with industrial-grade reliability.
  ], accent: palette.primary),
  discharge-quote([
    The grid of tomorrow must think faster than electricity travels. PlasmaGrid achieves this through predictive state modeling.
  ], attribution: [Grid Modernization Whitepaper, 2025]),
)

// ==========================================
// Section 2: Technical Architecture
// ==========================================
= Technical Architecture

== Core Components

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  arc-card([Sensor Layer], [
    Zero-latency data capture from 48,000 IoT endpoints. Handles voltage monitoring, frequency analysis, and thermal imaging at line rate.

    - *Throughput*: 2.3M readings/sec
    - *Resolution*: 10-microsecond sampling
  ], accent: palette.primary),
  arc-card([Processing Layer], [
    Plasma-state computational engine with deterministic fault modeling. Supports both real-time streaming and batch analytics.

    - *Parallelism*: 4096 compute threads
    - *State*: 14TB distributed in-memory
  ], accent: palette.secondary),
  arc-card([Actuation Layer], [
    Direct hardware control with safety-certified command execution. Manages circuit breakers, transformers, and load balancers.

    - *Guarantees*: Triple-redundant command paths
    - *Certification*: IEC 61850 compliant
  ], accent: palette.accent),
)

#v(0.2em)

#cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
  voltage-stat([Processing], [< 12ms], color: palette.primary),
  voltage-stat([Recovery], [< 800ms], color: palette.secondary),
)

== Implementation Stack

#cols[
  #reactor-box([Event Schema], [
    ```
    message GridEvent {
      string node_id = 1;
      int64 timestamp_us = 2;
      float voltage = 3;
      float frequency = 4;
      float temperature = 5;
      enum State { NORMAL, WARNING, CRITICAL }
    }
    ```
    Protocol Buffer-based with automatic schema evolution.
  ], accent: palette.secondary)
][
  #reactor-box([Deployment Pipeline], [
    ```
    $ plasmagrid deploy --region west
    > Validating sensor mesh... OK (48,212 nodes)
    > Calibrating prediction models... OK
    > Starting control plane... ACTIVE
    > Grid online (12,400 nodes, 847 GW capacity)
    ```
  ], accent: palette.primary)

  #v(0.4em)

  #plasma-box([Deterministic Replay], [
    Every grid event is assigned a *causal timestamp* at ingestion. Processing is fully deterministic, enabling time-travel analysis for post-incident forensics.
  ])
]

// ==========================================
// Section 3: Reliability
// ==========================================
= Reliability

== Fault Tolerance

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  arc-card([Predictive Protection], [
    Plasma-state modeling detects instability patterns *before* cascading failure begins. The system can isolate affected segments and reroute power in under 50ms.

    - *Prediction accuracy*: 99.4%
    - *False positive rate*: 0.02%
    - *Lead time*: 4.7 seconds average
    - *Mitigation*: Automatic load shedding

    Instantaneous power flow: #mi(`P = \frac{V^2}{R} = I^2 R`)
  ], accent: palette.primary),
  arc-card([Recovery Mechanisms], [
    Multi-layer redundancy with automatic failover. Black-start capability from distributed energy storage without external power source.

    - *Single node failure*: < 800ms recovery
    - *Segment failure*: < 3 seconds rerouting
    - *Regional failure*: < 30 seconds failover
    - *Total blackout*: < 4 minutes black-start
  ], accent: palette.secondary),
)

#v(0.2em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pulse-meter([Availability], [99.997%], 99.9%, color: palette.primary),
  pulse-meter([Prediction], [99.4%], 99%, color: palette.secondary),
  pulse-meter([Recovery SLA], [< 800ms], 95%, color: palette.primary),
  pulse-meter([Certification], [IEC 61850], 100%, color: palette.accent),
)

== Monitoring Dashboard

#cols[
  #field-card([Real-Time Metrics], [
    - 86,000 metrics exported every 5 seconds
    - Custom power-flow visualization
    - Automatic anomaly detection with ML baselines
    - Alert routing: PagerDuty, control room, field ops
  ], accent: palette.secondary)

  #v(0.4em)

  #field-card([Distributed Tracing], [
    - End-to-end event lineage across grid segments
    - Causal ordering visualization
    - Automatic bottleneck identification
    - Integration with SCADA and EMS systems
  ], accent: palette.primary)
][
  #reactor-box([Alert Configuration], [
    ```yaml
    alerts:
      - name: voltage_deviation
        condition: abs(voltage - nominal) > 5%
        duration: 100ms
        severity: warning
      - name: cascade_risk
        condition: prediction_score > 0.85
        duration: 0ms
        severity: critical
    ```
  ], accent: palette.secondary)
]

// ==========================================
// Section 4: Scaling
// ==========================================
= Scaling

== Growth Trajectory

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  voltage-stat([Current], [12.4K], color: palette.primary),
  voltage-stat([Q4 2026], [18.6K], color: palette.secondary),
  voltage-stat([Q2 2027], [31.2K], color: palette.primary),
  voltage-stat([Target], [50K+], color: palette.accent),
)

#v(0.6em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  arc-card([Linear Scalability], [
    *Horizontal scaling* through mesh partitioning. Adding nodes automatically rebalances without service interruption.

    - 12K nodes: 847 GW capacity
    - 18K nodes: 1,280 GW (98% efficiency)
    - 31K nodes: 2,150 GW (96% efficiency)
    - 50K nodes: 3,400 GW (94% efficiency)
  ], accent: palette.primary),
  arc-card([Regional Expansion], [
    *Phase 1* (current): Western grid coverage complete.

    *Phase 2* (Q4 2026): Eastern interconnect integration.

    *Phase 3* (Q2 2027): Southern grid with renewable focus.

    *Phase 4* (2028): National unified control plane.
  ], accent: palette.secondary),
)

#v(0.4em)

#stack(dir: ltr, spacing: 0.5em,
  ion-tag([Mesh Protocol], color: palette.primary),
  ion-tag([Auto-Scale], color: palette.secondary),
  ion-tag([Zero-Downtime], color: palette.accent),
  ion-tag([IEC Certified], color: palette.primary),
)

== Investment Requirements

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  voltage-stat([Engineers], [+14], color: palette.primary),
  voltage-stat([Budget], [\$28M], color: palette.secondary),
  voltage-stat([Timeline], [18 mo], color: palette.accent),
)

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  field-card([Infrastructure (50%)], [
    Deploy 6,200 additional sensor nodes. Upgrade transformer substations with real-time monitoring.
  ], accent: palette.primary),
  field-card([Engineering (35%)], [
    14 senior engineers, 4 SREs, 2 certification specialists. Focus on IEC compliance.
  ], accent: palette.secondary),
  field-card([R&D (15%)], [
    Plasma-state model v3 development. Quantum computing readiness research.
  ], accent: palette.accent),
)

// ==========================================
// Focus Slide
// ==========================================

#focus-slide[
  _"The grid that anticipates failure is the grid that never fails."_

  #v(0.3em)
  #text(size: 0.6em, weight: "regular", fill: rgb("#C4B5FD"))[-- PlasmaGrid Engineering Principles]
]

// ==========================================
// Ending Slide
// ==========================================

#ending-slide[Thank You]
