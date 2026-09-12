// Single-file adaptation of the official usage example:
// https://typst.app/universe/package/modern-cv/
#import "@preview/modern-cv:0.10.0": *

#show: resume.with(
  author: (
    firstname: "Jane",
    lastname: "Smith",
    address: "Shanghai",
    positions: ("Machine Learning Engineer",),
    custom: (
      (text: "+86 188 0000 0000", link: "tel:+8618800000000"),
      (text: "jane@example.com", link: "mailto:jane@example.com"),
      (text: "janesmith.example.com", link: "https://janesmith.example.com"),
      (text: "github.com/janesmith", link: "https://github.com/janesmith"),
    ),
  ),
  profile-picture: none,
  contact-items-separator: box[#h(3pt)#text(fill: luma(55%))[|]#h(3pt)],
  date: "2026",
  font: "IBM Plex Sans",
  header-font: "IBM Plex Sans",
  paper-size: "a4",
)

= Experience

#resume-entry(
  title: "Example Company",
  location: "Senior Machine Learning Engineer",
  date: "2022–Present",
  description: "Shanghai",
)

#resume-item[
  - Reduced retrieval latency by 31% after profiling the hot path and batching feature access.
  - Led the rollout of a multilingual ranking service used by four product teams.
  - Connected offline evaluation slices to production monitoring and release decisions.
]

#resume-entry(
  title: "Example Research Lab",
  location: "Machine Learning Engineer",
  date: "2020–2022",
  description: "Beijing",
)

#resume-item[
  - Built a reproducible text-evaluation pipeline with versioned datasets and failure examples.
  - Added regression checks and source notes so model comparisons could be independently reviewed.
]

= Projects

#resume-entry(
  title: "Multilingual Retrieval Benchmark",
  location: "Designer and Maintainer",
  date: "2024–Present",
  description: "Independent project",
)

#resume-item[
  - Defined language slices, scoring rules, and dataset boundaries for repeatable evaluation.
  - Published a compact report that connects aggregate metrics to representative failure cases.
]

#resume-entry(
  title: "Search Observability Toolkit",
  location: "Technical Lead",
  date: "2023",
  description: "Internal platform",
)

#resume-item[
  - Unified latency, quality, and resource metrics under consistent release and dataset labels.
  - Introduced rollback checks and alert tiers that reduced manual diagnosis during launches.
]

= Education

#resume-entry(
  title: "Example University",
  location: "M.S. in Computer Science",
  date: "2018–2020",
  description: "Beijing",
)

#resume-item[
  - Research focus: multilingual information retrieval and efficient representation learning.
  - Coursework: statistical learning, information retrieval, distributed systems, and databases.
]

= Skills

#resume-skill-item(
  "Programming",
  (strong("Python"), strong("Rust"), "SQL", "Bash"),
)

#resume-skill-item(
  "Machine Learning",
  (strong("Retrieval"), "Evaluation", "Ranking", "Model Serving"),
)

#resume-skill-item(
  "Engineering",
  (strong("Linux"), "Git", "Docker", "Kubernetes", "Prometheus"),
)

= Selected Contributions

#resume-entry(
  title: "Evaluation Practice Notes",
  location: "Author",
  date: "2025",
  description: "Technical writing",
)

#resume-item[
  - Documented metric definitions, dataset boundaries, reproducible commands, and failure cases.
]

#resume-entry(
  title: "Open-source Documentation and Tests",
  location: "Contributor",
  date: "2023–Present",
  description: "Community work",
)

#resume-item[
  - Improved regression coverage and maintenance guides for two public engineering projects.
]
