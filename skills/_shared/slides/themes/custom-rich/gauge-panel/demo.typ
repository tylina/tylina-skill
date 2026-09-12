// Gauge Panel Theme Demo — Q3 Model Performance Report
// Data-focused dashboard presentation for project review
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("Arial", "Arial Unicode MS"))

#show: gauge-panel-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [ML Platform -- Q3 2026 Performance Review],
  config-info(
    title: [Q3 Model Performance Report],
    subtitle: [Machine Learning Platform -- Quarterly Review],
    author: [Dr. Sarah Chen, ML Engineering Lead],
    date: datetime(year: 2026, month: 9, day: 15),
    institution: [Meridian AI Research],
  ),
)

// ======================================
// Title Slide
// ======================================
#title-slide()

// ======================================
// Section 1: Executive Summary
// ======================================
= Executive Summary

== Key Performance Indicators

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  gauge-card([Accuracy (Top-1)], [91.2%], color: palette.accent),
  gauge-card([Inference Latency], [12], unit: [ms], color: palette.success),
  gauge-card([Training Cost], [\$48K], color: palette.copper),
  gauge-card([Model Coverage], [94.7%], color: palette.accent),
)

#v(0.6em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  reading-block([F1 Score], [0.893], delta: [+0.031]),
  reading-block([Throughput], [2.4K rps], delta: [+18%]),
  reading-block([GPU Utilization], [87.3%], delta: [+5.1%]),
  reading-block([Data Pipeline], [99.7%], delta: [+0.2%]),
)

== Quarter Highlights

#cols[
  #panel-section([Achievements])

  - Deployed Model C to production (91.2% accuracy)
  - Reduced inference latency by 34% via quantization
  - Scaled training cluster to 128 A100 GPUs
  - Launched automated retraining pipeline

  #v(0.4em)

  #stack(dir: ltr, spacing: 6pt,
    meter-tag([On Track], color: palette.success),
    meter-tag([3 Models Shipped], color: palette.accent),
    meter-tag([Budget OK], color: palette.copper),
  )
][
  #panel-section([Risks & Mitigations])

  #instrument-quote(
    [Dataset drift detected in financial segment -- retraining scheduled for Oct 1.],
    author: [Risk Register #047]
  )

  #v(0.4em)

  #data-table-wrap(accent: palette.warning)[
    #set text(size: 0.78em)
    #table(
      columns: (1fr, 1fr, auto),
      stroke: none,
      inset: 5pt,
      table.header([*Risk*], [*Impact*], [*Status*]),
      table.hline(stroke: 0.5pt + palette.border-light),
      [Data drift], [Medium], meter-tag([Monitoring], color: palette.warning),
      [GPU shortage], [Low], meter-tag([Resolved], color: palette.success),
      [Latency SLA], [High], meter-tag([Mitigated], color: palette.success),
    )
  ]
]

// ======================================
// Section 2: Method Overview
// ======================================
= Method Overview

== Architecture Comparison

#cols[
  #panel-section([Model Architectures Evaluated])

  #v(0.3em)

  #data-table-wrap[
    #set text(size: 0.75em)
    #table(
      columns: (auto, auto, auto, auto, auto),
      stroke: none,
      inset: 5pt,
      table.header([*Model*], [*Params*], [*FLOPs*], [*Arch*], [*Status*]),
      table.hline(stroke: 0.5pt + palette.border-light),
      [Baseline], [24M], [1.2G], [ResNet-50], meter-tag([Legacy], color: palette.ink-muted),
      [Model A], [38M], [2.1G], [EfficientNet], meter-tag([Active], color: palette.success),
      [Model B], [52M], [3.4G], [ViT-B/16], meter-tag([Active], color: palette.success),
      [Model C], [67M], [4.8G], [ViT-L/14], meter-tag([Deployed], color: palette.accent),
    )
  ]
][
  #panel-section([Training Configuration])

  #v(0.3em)

  #reading-block([Batch Size], [2048])
  #reading-block([Learning Rate], [3e-4], delta: [cosine decay])
  #reading-block([Epochs], [90])
  #reading-block([Hardware], [128x A100 80GB])
]

== Training Pipeline

#cols[
  #panel-section([Data Processing])

  - *Source*: 12.4M labeled images across 1,000 classes
  - *Augmentation*: RandAugment + CutMix + MixUp
  - *Validation*: 50K held-out balanced samples
  - *Test*: 100K production-sampled images

  #v(0.4em)

  #instrument-quote(
    [The key insight was combining progressive resizing with heavy augmentation -- this gave us a 2.3% accuracy boost at no extra compute cost.],
    author: [Training Log, Week 6]
  )
][
  #panel-section([Optimization Details])

  #v(0.3em)

  #data-table-wrap(accent: palette.copper)[
    #set text(size: 0.75em)
    #table(
      columns: (1fr, 1fr),
      stroke: none,
      inset: 5pt,
      table.header([*Parameter*], [*Value*]),
      table.hline(stroke: 0.5pt + palette.border-light),
      [Optimizer], [AdamW],
      [Weight Decay], [0.05],
      [Warmup], [5 epochs],
      [Label Smoothing], [0.1],
      [Gradient Clip], [1.0],
      [Mixed Precision], [FP16],
    )
  ]
]

// ======================================
// Section 3: Results by Dataset
// ======================================
= Results by Dataset

== Accuracy Comparison

#let models = ("Baseline", "Model A", "Model B", "Model C")
#let accuracy = (82.1, 87.3, 89.5, 91.2)

#figure[
  #lq.diagram(
    width: 400pt, height: 150pt,
    ylim: (80, 95),
    xaxis: (ticks: range(4).map(i => (i + 1, models.at(i))), subticks: none),
    yaxis: (ticks: ((80, "80%"), (85, "85%"), (90, "90%"), (95, "95%")), subticks: none),
    lq.bar(range(4).map(i => i + 1), accuracy, fill: palette.accent, width: 55%),
  )
]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  reading-block([Baseline], [82.1%], color: palette.ink-muted),
  reading-block([Model A], [87.3%], delta: [+5.2%]),
  reading-block([Model B], [89.5%], delta: [+7.4%]),
  reading-block([Model C], [91.2%], delta: [+9.1%]),
)

== Training Loss Curves

#let epochs = range(10).map(i => i + 1)
#let loss-a = (2.1, 1.8, 1.5, 1.2, 0.9, 0.7, 0.55, 0.45, 0.38, 0.32)
#let loss-b = (2.0, 1.6, 1.3, 1.0, 0.75, 0.55, 0.4, 0.3, 0.25, 0.2)

#figure[
  #lq.diagram(
    width: 400pt, height: 150pt,
    xaxis: (ticks: ((1, "1"), (5, "5"), (10, "10")), subticks: none, label: [Epoch]),
    yaxis: (ticks: ((0, "0"), (1, "1"), (2, "2")), subticks: none, label: [Loss]),
    lq.plot(epochs, loss-a, stroke: 2pt + palette.accent, label: [Model A]),
    lq.plot(epochs, loss-b, stroke: 2pt + palette.copper, label: [Model B]),
  )
]

#v(0.3em)

#instrument-quote(
  [Model B converges 23% faster than Model A due to ViT architecture's superior gradient flow properties.],
  author: [Convergence Analysis]
)

== Per-Dataset Breakdown

#data-table-wrap[
  #set text(size: 0.78em)
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr, 1fr),
    stroke: none,
    inset: 5pt,
    table.header([*Dataset*], [*Baseline*], [*Model A*], [*Model B*], [*Model C*]),
    table.hline(stroke: 0.5pt + palette.border-light),
    [ImageNet-1K], [76.3%], [81.2%], [84.1%], [86.7%],
    [CIFAR-100], [82.1%], [87.3%], [89.5%], [91.2%],
    [ObjectNet], [61.4%], [68.9%], [72.3%], [75.8%],
    [ImageNet-V2], [73.8%], [79.5%], [82.7%], [84.9%],
    [ImageNet-Sketch], [48.2%], [55.1%], [61.4%], [65.3%],
  )
]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  gauge-card([Best Overall], [91.2%], color: palette.success),
  gauge-card([OOD Robustness], [75.8%], color: palette.copper),
  gauge-card([Avg Improvement], [+8.6%], color: palette.accent),
)

== Latency & Throughput

#let model-names = ("Baseline", "Model A", "Model B", "Model C")
#let latency-vals = (5.2, 8.1, 11.3, 12.0)

#cols[
  #panel-section([Inference Benchmarks])

  #v(0.3em)

  #figure[
    #lq.diagram(
      width: 260pt, height: 140pt,
      xaxis: (
        ticks: range(4).map(i => (i + 1, text(size: 0.7em, model-names.at(i)))),
        subticks: none,
      ),
      yaxis: (ticks: ((0, "0"), (5, "5ms"), (10, "10ms"), (15, "15ms")), subticks: none),
      lq.bar(range(4).map(i => i + 1), latency-vals, fill: palette.copper, width: 55%),
    )
  ]
][
  #panel-section([Throughput Summary])

  #v(0.3em)

  #reading-block([Baseline Throughput], [4.8K rps])
  #reading-block([Model C Throughput], [2.4K rps], delta: [-50%])
  #reading-block([Model C (Quantized)], [3.9K rps], delta: [-19%])

  #v(0.3em)

  #meter-tag([INT8 Quantized], color: palette.success)
  #h(4pt)
  #meter-tag([TensorRT], color: palette.accent)
]

// ======================================
// Section 4: Next Steps
// ======================================
= Next Steps

== Q4 Roadmap

#cols(columns: (3fr, 2fr), gutter: 1em)[
  #panel-section([Immediate Actions (Oct)])

  + Deploy Model C INT8 to all production endpoints
  + Retrain on refreshed financial dataset
  + Complete A/B test for recommendation pipeline
  + Establish drift monitoring dashboard

  #panel-section([Research Initiatives (Nov--Dec)])

  + Evaluate MoE (Mixture of Experts) architectures
  + Prototype multimodal (vision + text) embeddings
  + Benchmark against GPT-4V on internal tasks
  + Publish internal technical report
][
  #panel-section([Resource Requirements])

  #v(0.3em)

  #data-table-wrap(accent: palette.accent)[
    #set text(size: 0.75em)
    #table(
      columns: (1.5fr, 1fr, auto),
      stroke: none,
      inset: 5pt,
      table.header([*Item*], [*Q4 Budget*], [*Priority*]),
      table.hline(stroke: 0.5pt + palette.border-light),
      [GPU Compute], [\$62K], meter-tag([P0], color: palette.danger),
      [Data Labeling], [\$18K], meter-tag([P1], color: palette.warning),
      [Engineering HC], [2 FTE], meter-tag([P0], color: palette.danger),
      [Tooling / Infra], [\$8K], meter-tag([P2], color: palette.accent),
    )
  ]

  #v(0.5em)

  #instrument-quote(
    [Total Q4 projected spend: \$88K (within 5% of annual plan allocation).],
    author: [Finance Review]
  )
]

== Success Criteria

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  gauge-card([Target Accuracy], [93%+], color: palette.accent),
  gauge-card([Latency Target], [\<10ms], color: palette.success),
  gauge-card([Cost Target], [<\$70K], color: palette.copper),
)

#v(0.6em)

#dial-divider(width: 60%)

#v(0.4em)

#cols[
  #panel-section([Definition of Done])

  - Model accuracy >= 93% on CIFAR-100
  - P99 latency < 10ms under 5K rps load
  - Zero regression on existing benchmarks
  - Full documentation and model card
][
  #panel-section([Key Dependencies])

  - GPU cluster expansion (ETA: Oct 15)
  - Updated labeling guidelines (ETA: Oct 8)
  - Partner API access for multimodal data
  - Security review for production deployment
]

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  Model C achieves *91.2% accuracy* with *12ms latency* -- \
  ready for full production rollout.
]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Thank You]
