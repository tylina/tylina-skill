// Field Guide Theme Demo — ML Pipeline Onboarding: Data to Deployment
// Training materials / instructional guide style presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/cheq:0.4.0": checklist

#show: codly-init.with()
#codly(languages: codly-languages)
#show raw: set text(size: 14pt)

#show: checklist.with(stroke: palette.accent, radius: 0.2em)

#show: field-guide-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [ML Pipeline Field Guide -- Onboarding],
  config-info(
    title: [ML Pipeline Onboarding],
    subtitle: [A Field Guide: From Data to Deployment],
    author: [ML Platform Team],
    institution: [Acme AI Engineering],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

#set text(font: ("Arial", "Hiragino Sans"))
#show raw: set text(font: "Menlo")

// ========================================
// Title Slide
// ========================================
#title-slide()

// ========================================
// Section 1: Environment Setup
// ========================================
= Environment Setup

== Prerequisites

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  entry-card([Python Environment], [
    All ML pipelines run on *Python 3.11+* with `uv` as the package manager. Ensure you have access to the internal PyPI mirror.

    - Python 3.11 or higher
    - `uv` package manager installed
    - Access to `ml-registry.internal`
  ], number: 1, accent: palette.accent),
  entry-card([Cloud Access], [
    You will need credentials for:
    - *AWS S3* -- data lake storage
    - *MLflow* -- experiment tracking
    - *Kubernetes* -- model serving cluster

    Request access via the onboarding portal.
  ], number: 2, accent: palette.tab),
)

#v(0.5em)

#trail-note[
  *Important:* Never store credentials in code repositories. Use the secrets manager (`vault-cli`) for all sensitive configuration.
]

== Setting Up Your Workspace

#waypoint-step(1, [Clone the Repository], [
  Clone the ML pipeline monorepo and navigate to the project root.
])
#waypoint-step(2, [Install Dependencies], [
  Run `uv sync` to install all packages from the lockfile.
])
#waypoint-step(3, [Configure Environment], [
  Copy `.env.example` to `.env` and fill in your credentials from Vault.
])
#waypoint-step(4, [Verify Setup], [
  Run `make verify` to check all connections and dependencies are working.
], is-last: true)

// ========================================
// Section 2: Data Pipeline
// ========================================
= Data Pipeline

== Data Sources Overview

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  tab-section([Raw Data Lake], [
    Data arrives in S3 from multiple upstream systems:
    - *Event streams* -- Kafka topics (JSON)
    - *Batch exports* -- Daily CSV/Parquet dumps
    - *Feature store* -- Pre-computed features (Feast)
    - *External APIs* -- Third-party enrichment data
  ], tab-label: [S3]),
  tab-section([Processed Store], [
    After ETL, clean data lives in the feature warehouse:
    - Delta Lake tables (versioned)
    - Partitioned by date and entity
    - Schema-validated on write
    - Retention policy: 90 days raw, 2 years aggregated
  ], tab-label: [Delta]),
)

#v(0.5em)

#stack(dir: ltr, spacing: 0.5em,
  specimen-tag([Parquet], color: palette.accent),
  specimen-tag([Delta Lake], color: palette.tab),
  specimen-tag([Feast], color: palette.entry-num),
)

== Data Ingestion Pipeline

#cols[
  #entry-card([Pipeline Configuration], [
    All pipelines are defined in YAML. Each config specifies source, transformations, and sink.
  ], number: 3)

  ```yaml
  pipeline:
    name: user-features
    source:
      type: s3
    transforms:
      - deduplicate:
          keys: [user_id, timestamp]
    sink:
      type: delta
      table: features.user_activity
  ```
][
  #trail-note(color: palette.accent)[
    *Tip:* Use `pipeline validate config.yaml` to check your configuration before deploying.
  ]

  #v(0.5em)

  - [x] Define source connector
  - [x] Add deduplication step
  - [x] Configure aggregation window
  - [ ] Add data quality checks
  - [ ] Set up alerting on failure
]

== Data Validation

#reset-entries()

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  entry-card([Schema Checks], [
    Validate column types, nullability, and constraints before processing.

    Uses Great Expectations under the hood.
  ], number: 1, accent: palette.accent),
  entry-card([Distribution Drift], [
    Compare incoming data distributions against a reference baseline.

    Alert on KL-divergence > 0.1.
  ], number: 2, accent: palette.tab),
  entry-card([Freshness Monitor], [
    Verify data arrives within SLA windows (< 2 hours for streaming, < 24h for batch).
  ], number: 3, accent: palette.entry-num),
)

#v(0.4em)

#topo-divider(color: palette.accent)

// ========================================
// Section 3: Model Training
// ========================================
= Model Training

== Experiment Tracking

#cols(columns: (3fr, 2fr), gutter: 1.2em)[
  #tab-section([MLflow Integration], [
    Every training run is tracked in MLflow:
    - Hyperparameters logged automatically
    - Metrics recorded at each epoch
    - Model artifacts stored in S3
    - Git commit SHA linked to each run

    Access the UI at `mlflow.internal.acme.ai`
  ], tab-label: [MLflow])
][
  ```python
  import mlflow

  with mlflow.start_run():
      mlflow.log_params({
          "lr": 0.001,
          "epochs": 50,
          "batch_size": 256,
      })
      # Training loop...
      mlflow.log_metric("auc", 0.94)
      mlflow.sklearn.log_model(
          model, "model"
      )
  ```
]

== Training Configuration

#cols[
  ```python
  from pipeline.training import Trainer
  from pipeline.config import load_config

  config = load_config("models/churn.yaml")
  trainer = Trainer(config)

  trainer.fit(dataset="churn", cv_folds=5)
  ```
][
  #entry-card([Training Best Practices], [
    - Always use *time-based splits* (no future leakage)
    - Log *all* hyperparameters (reproducibility)
    - Use *early stopping* to prevent overfitting
    - Save training data *checksums* for lineage
  ], number: 4)

  #trail-note(color: palette.tab)[
    *Warning:* Never use random splits for time-series data. This causes data leakage and inflated metrics.
  ]
]

== Pipeline Stages

#let stages = ("Ingest", "Clean", "Feature", "Train", "Eval", "Deploy")
#let durations = (12, 8, 25, 45, 15, 20)

#figure[
  #set text(0.7em)
  #lq.diagram(
    width: 480pt, height: 180pt,
    xaxis: (ticks: range(6).map(i => (i + 1, stages.at(i))), subticks: none, label: none),
    yaxis: (ticks: ((0, "0"), (15, "15m"), (30, "30m"), (45, "45m")), subticks: none, label: none),
    lq.bar(
      range(6).map(i => i + 1),
      durations,
      fill: (palette.accent, palette.accent, palette.tab, palette.entry-num, palette.tab, palette.accent),
    ),
  )
]

// ========================================
// Section 4: Evaluation
// ========================================
= Evaluation

== Model Metrics

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  entry-card([Classification Metrics], [
    For binary classification models:
    - *AUC-ROC* -- primary ranking metric
    - *Precision\@K* -- top-K decision quality
    - *F1 Score* -- balanced precision/recall
    - *Calibration* -- predicted vs actual probabilities
  ], number: 5, accent: palette.accent),
  entry-card([Business Metrics], [
    Translate model performance to business impact:
    - *Revenue protected* -- churn prevention value
    - *False positive cost* -- unnecessary interventions
    - *Lift over baseline* -- improvement vs heuristic
    - *Latency budget* -- p99 inference time
  ], number: 6, accent: palette.tab),
)

#v(0.4em)

#trail-note[
  *Guideline:* A model must exceed the champion baseline by >= 2% AUC on the holdout set before being promoted to staging.
]

== Evaluation Checklist

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  [
    - [x] Holdout set AUC > baseline + 2%
    - [x] No feature leakage detected
    - [x] Calibration curve within bounds
    - [ ] Fairness metrics across segments
    - [ ] Latency budget < 50ms p99
  ],
  tab-section([Approval Process], [
    Before deployment, models require:
    + Automated metric gates pass
    + Peer review of training code
    + Shadow-mode validation (24h)
    + Sign-off from model risk team
  ], tab-label: [Gate]),
)

== Performance Comparison

#cols[
  ```python
  from pipeline.eval import compare_models

  report = compare_models(
      champion="models/churn_v2.3",
      challenger="models/churn_v2.4",
      test_set="holdout_2026_q1",
  )

  print(report.summary())
  # Champion AUC: 0.912
  # Challenger AUC: 0.934
  # Delta: +0.022 (significant p<0.01)
  ```
][
  #waypoint-step(1, [Run Evaluation], [
    Execute comparison on holdout set.
  ])
  #waypoint-step(2, [Review Report], [
    Check statistical significance and segment analysis.
  ])
  #waypoint-step(3, [Shadow Deploy], [
    Run challenger in shadow mode for 24h alongside champion.
  ])
  #waypoint-step(4, [Promote], [
    If shadow metrics confirm, promote to production.
  ], is-last: true)
]

// ========================================
// Section 5: Deployment
// ========================================
= Deployment

== Deployment Architecture

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  tab-section([Serving Infrastructure], [
    Models are served via Kubernetes:
    - *Seldon Core* for model serving
    - *Istio* for traffic management
    - *Prometheus* for monitoring
    - Autoscaling: 2-20 replicas based on RPS
    - Rolling deployments with canary analysis
  ], tab-label: [K8s]),
  tab-section([CI/CD Pipeline], [
    Automated deployment flow:
    - PR merged triggers build
    - Container image pushed to registry
    - Staging deploy + smoke tests
    - Canary (5% traffic) for 1 hour
    - Full rollout if metrics are green
  ], tab-label: [CI/CD]),
)

#v(0.5em)

#stack(dir: ltr, spacing: 0.5em,
  specimen-tag([Kubernetes], color: palette.accent),
  specimen-tag([Seldon], color: palette.tab),
  specimen-tag([Canary], color: palette.entry-num),
  specimen-tag([Prometheus], color: palette.ink-muted),
)

== Deployment Commands

#cols[
  ```bash
  # Build and push model image
  make build-model MODEL=churn VERSION=2.4

  # Deploy to staging
  kubectl apply -f deploy/staging.yaml

  # Run smoke tests
  make test-staging MODEL=churn

  ```
][
  #trail-note(color: palette.tab)[
    *Rollback:* If canary metrics degrade, run `make rollback MODEL=churn` to instantly revert to the previous version.
  ]

  #v(0.5em)

  #entry-card([Monitoring Alerts], [
    Production models trigger alerts on:
    - Prediction drift (PSI > 0.2)
    - Latency spike (p99 > 100ms)
    - Error rate > 0.1%
    - Feature pipeline staleness
  ], number: 7, accent: palette.entry-num)
]

== Post-Deployment Monitoring

#reset-entries()

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  entry-card([Live Metrics], [
    Track real-time model performance:
    - Request throughput (RPS)
    - Inference latency percentiles
    - Prediction distribution
    - Error rates by endpoint
  ], number: 1, accent: palette.accent),
  entry-card([Drift Detection], [
    Automated monitoring for:
    - Feature distribution shifts
    - Prediction output changes
    - Label feedback loops
    - Upstream data quality
  ], number: 2, accent: palette.tab),
  entry-card([Retraining Triggers], [
    Model retraining fires when:
    - AUC drops below threshold
    - Data drift score > 0.15
    - 30 days since last training
    - Manual trigger by team
  ], number: 3, accent: palette.entry-num),
)

// ========================================
// Focus Slide
// ========================================

#focus-slide[
  _"A model is only as good as the pipeline that feeds it and the monitoring that watches it."_

  #text(size: 0.6em, weight: "regular", fill: palette.ink-muted)[-- ML Platform Team Principles]
]

// ========================================
// Ending Slide
// ========================================

#ending-slide[Happy Deploying!]
