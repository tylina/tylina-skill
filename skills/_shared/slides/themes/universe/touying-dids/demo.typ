// ===============================================================
// DIDS Lab Theme Demo
// Universe package: @preview/touying-dids:0.1.0
// Touying version: 0.5.2
// Theme for DIDS Lab at NUDT (National University of Defense Technology)
// ===============================================================

#import "@preview/touying:0.5.3": *
#import "@preview/touying-dids:0.1.0": *
#import "@preview/mitex:0.2.7": *

#show: dids-theme.with(
  aspect-ratio: "16-9",
  progress-bar: true,
  config-info(
    title: [Data-Driven Decision Systems],
    subtitle: [DIDS Lab Research Seminar],
    author: [Dr. Wei Zhang],
    date: datetime.today(),
    institution: [DIDS Lab, National University of Defense Technology],
  ),
)

// ---- Title and Outline ----

#title-slide()

#outline-slide()

// ---- Section 1: Research Background ----

= Research Background

== Motivation and Problem Statement

Modern complex systems generate massive volumes of heterogeneous data:

- *Volume*: Terabytes of sensor data collected daily
- *Velocity*: Real-time streaming from distributed sources
- *Variety*: Structured, semi-structured, and unstructured formats
- *Veracity*: Noise, missing values, and adversarial corruption

#pause

The key challenge: how to extract _actionable intelligence_ from such data?

== Formal Problem Definition

#tblock(title: [Problem Statement])[
  Given a data stream #mi(`\mathcal{D} = \{(x_i, y_i)\}_{i=1}^N`) where #mi(`x_i \in \mathbb{R}^d`) and
  #mi(`y_i \in \{0, 1\}`), find a mapping #mi(`f: \mathbb{R}^d \to \{0, 1\}`) that minimizes the
  expected risk:
  #mitex(`\mathcal{R}(f) = \mathbb{E}_{x,y} [\ell(f(x), y)]`)
  subject to real-time latency constraints #mi(`\Delta t \leq \tau`).
]

// ---- Section 2: Methodology ----

= Proposed Methodology

== Architecture Overview

Our framework consists of three core modules:

+ *Data Ingestion Layer* — streaming preprocessing with anomaly filtering
+ *Feature Extraction Engine* — adaptive dimensionality reduction
+ *Decision Module* — ensemble learning with uncertainty quantification

#pause

Each module communicates via message queues for fault tolerance.

== Mathematical Foundation

The optimization objective combines empirical risk with a regularizer:

#mitex(`\min_\theta \frac{1}{N} \sum_{i=1}^N \ell(f_\theta(x_i), y_i) + \lambda \Omega(\theta)`)

where #mi(`\Omega(\theta) = \|\theta\|_2^2`) is the #mi(`\ell_2`) penalty and #mi(`\lambda > 0`)
controls the bias-variance trade-off.

#tblock(title: [Convergence Guarantee])[
  Under Assumptions A1–A3, the proposed algorithm converges at rate
  #mi(`O(1/\sqrt{T})`) where #mi(`T`) is the number of iterations.
]

== Two-Column Comparison

#slide(composer: (1fr, 1fr))[
  === Traditional Approach

  - Batch processing only
  - Fixed feature set
  - Single model inference
  - No uncertainty estimates
  - Offline evaluation
][
  === Our Approach

  - Real-time streaming support
  - Adaptive feature selection
  - Ensemble decision fusion
  - Calibrated confidence scores
  - Online performance monitoring
]

// ---- Section 3: Experiments ----

= Experimental Evaluation

== Benchmark Datasets

We evaluate on three standard benchmarks:

#figure[
  #table(
    columns: (1fr, auto, auto, auto),
    align: (left, center, center, center),
    table.header(
      [*Dataset*], [*Samples*], [*Features*], [*Classes*],
    ),
    [SensorNet-2024], [1.2M], [128], [5],
    [CyberFlow], [850K], [64], [2],
    [MultiModal-D], [2.4M], [256], [10],
  )
]

== Key Results

Our method achieves state-of-the-art performance:

- *SensorNet-2024*: #mi(`F_1 = 0.947`) (vs. 0.912 baseline)
- *CyberFlow*: AUC #mi(`= 0.983`) with 3.2 ms latency
- *MultiModal-D*: Accuracy #mi(`= 92.1\%`) with #mi(`40\%`) fewer parameters

The improvement is statistically significant (#mi(`p < 0.001`), paired #mi(`t`)-test).

// ---- Section 4: Summary ----

= Conclusion

== Summary and Future Work

Key contributions of this work:

+ A real-time data-driven decision framework for complex systems
+ Theoretical convergence guarantees under mild assumptions
+ Extensive empirical validation on large-scale benchmarks

#pause

*Future directions:*
- Federated learning across distributed DIDS Lab nodes
- Causal inference for interpretable decision making
- Integration with digital twin simulations

== References

- J. Smith et al., "Streaming Decision Systems," _IEEE TPAMI_, 2024.
- L. Chen et al., "Adaptive Feature Selection for Real-Time Analytics," _NeurIPS_, 2023.
- DIDS Lab Technical Report TR-2024-07, NUDT.

#ending-slide[
  #stack(
    spacing: .8em,
    [*Thank You!*],
    [DIDS Lab — National University of Defense Technology],
  )
]
