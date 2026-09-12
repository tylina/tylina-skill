#import "@preview/simple-technical-resume:0.1.1": *

// Fictional, source-neutral content for demonstrating the package API.
#let name = "Leah Park"
#let phone = "+1 (555) 014-0182"
#let email = "leah.park@example.com"
#let github = "leah-example"
#let linkedin = "leah-example"
#let personal-site = "leah.example.com"

#show: resume.with(
  top-margin: 0.45in,
  font: "New Computer Modern",
  personal-info-font-size: 9.2pt,
  author-position: center,
  personal-info-position: center,
  author-name: name,
  phone: phone,
  email: email,
  website: personal-site,
  linkedin-user-id: linkedin,
  github-username: github,
)

#custom-title("Experience")[
  #work-heading(
    "Senior Machine Learning Engineer",
    "Example Search Labs",
    "Seattle, WA",
    datetime(year: 2022, month: 7, day: 1),
    "Present",
  )[
    - Reduced retrieval latency by 31\% by profiling the hot path and batching feature access.
    - Led rollout of a multilingual ranking service used by four product teams.
    - Connected offline evaluation slices to release checks and production monitoring.
    - Mentored three engineers through launch reviews, incident analysis, and on-call readiness.
  ]

  #work-heading(
    "Machine Learning Engineer",
    "Sample Data Systems",
    "Remote",
    datetime(year: 2020, month: 6, day: 1),
    datetime(year: 2022, month: 6, day: 1),
  )[
    - Built versioned evaluation pipelines with documented datasets and failure examples.
    - Added regression checks that reduced weekly model review from two days to four hours.
    - Partnered with product and data teams to define release criteria and incident playbooks.
    - Migrated feature definitions to a reviewed registry shared by training and serving systems.
  ]

  #work-heading(
    "Software Engineering Intern",
    "Example Infrastructure Group",
    "Portland, OR",
    datetime(year: 2019, month: 6, day: 1),
    datetime(year: 2019, month: 9, day: 1),
  )[
    - Added trace identifiers and dashboards for a batch-processing service.
    - Wrote load-test fixtures and a handoff guide used by the on-call rotation.
  ]
]

#custom-title("Projects")[
  #project-heading(
    "Multilingual Retrieval Benchmark",
    stack: "Python, Polars, PyTorch",
    project-url: "https://leah.example.com/benchmark",
  )[
    - Designed reproducible language slices, scoring rules, and dataset boundaries.
    - Published failure-case reports that connect aggregate metrics to concrete examples.
  ]

  #project-heading(
    "Search Observability Toolkit",
    stack: "Rust, OpenTelemetry, Prometheus",
    project-url: "https://github.com/leah-example/search-observability",
  )[
    - Unified latency, quality, and resource metrics under stable release and dataset labels.
    - Added rollback checks and tiered alerts for launch reviews.
  ]

  #project-heading(
    "Evaluation Slice Explorer",
    stack: "Python, DuckDB, Observable",
    project-url: "https://leah.example.com/slice-explorer",
  )[
    - Built a local-first report for comparing quality, latency, and coverage across dataset slices.
    - Added provenance views that trace each chart to a versioned query and source snapshot.
  ]
]

#custom-title("Selected Contributions")[
  #project-heading(
    "Reliable ML Release Notes",
    stack: "Technical writing, reproducibility",
    project-url: "https://leah.example.com/release-notes",
  )[
    - Published practical guides to evaluation gates, rollback criteria, and known-limitations reports.
    - Maintained runnable examples used in internal onboarding and community workshops.
  ]

  #project-heading(
    "Open Evaluation Mentoring",
    stack: "Code review, experiment design",
  )[
    - Held monthly review sessions for early-career contributors building retrieval evaluations.
    - Helped contributors turn ambiguous benchmark claims into reproducible checks and documentation.
  ]
]

#custom-title("Education")[
  #education-heading(
    "Example University",
    "Vancouver, BC",
    "Master of Science",
    "Computer Science",
    datetime(year: 2018, month: 9, day: 1),
    datetime(year: 2020, month: 5, day: 1),
  )[
    - Research focus: multilingual information retrieval and efficient representation learning.
  ]

  #education-heading(
    "Sample College",
    "Toronto, ON",
    "Bachelor of Science",
    "Computer Science",
    datetime(year: 2014, month: 9, day: 1),
    datetime(year: 2018, month: 5, day: 1),
  )[]
]

#custom-title("Skills")[
  #skills()[
    - *Languages:* Python, Rust, SQL, Bash
    - *ML systems:* retrieval, ranking, evaluation, model serving
    - *Platforms:* Linux, Git, Docker, Kubernetes, Prometheus
  ]
]
