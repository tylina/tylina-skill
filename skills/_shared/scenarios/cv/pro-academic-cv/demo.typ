#import "@preview/pro-academic-cv:0.1.0": *

// All people, institutions, publications, grants, and links below are fictional.
#show: resume.with(
  author-info: (
    name: "Maya Chen",
    primary-info: [
      #link("mailto:maya.chen@example.edu")[maya.chen\@example.edu] |
      #link("https://maya.example.edu")[maya.example.edu] | +1-555-0142
    ],
    secondary-info: [
      #link("https://example.edu/lab")[Language Systems Lab] |
      #link("https://orcid.org/0000-0000-0000-0000")[ORCID] |
      #link("https://scholar.example.edu/maya-chen")[Scholar profile]
    ],
    tertiary-info: "Northlake University · Vancouver, Canada",
  ),
  author-position: center,
)

== Research Profile

Associate professor working on multilingual information retrieval, evaluation methodology, and
human-centered machine-learning systems. My group studies how dataset design, measurement choices,
and deployment constraints shape the reliability of language technologies in low-resource settings.

== Academic Appointments

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [Northlake University],
      top-right: [2023–Present],
      bottom-left: [Associate Professor of Computer Science],
      bottom-right: [Vancouver, Canada],
    ),
    list-items: (
      [Direct research on multilingual evaluation, measurement validity, and responsible deployment.],
      [Teach graduate methods courses and serve on the computer science graduate program faculty.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [Northlake University],
      top-right: [2019–2023],
      bottom-left: [Assistant Professor of Computer Science],
      bottom-right: [Vancouver, Canada],
    ),
    list-items: (
      [Established a research program on multilingual retrieval and participatory benchmark design.],
      [Co-developed a graduate seminar connecting evaluation theory with production ML practice.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [Riverside Institute for Language Technology],
      top-right: [2017–2019],
      bottom-left: [Postdoctoral Research Fellow],
      bottom-right: [Montreal, Canada],
    ),
    list-items: (
      [Studied domain shift in cross-lingual search and released evaluation tools with documented data lineage.],
    ),
  ),
)

== Education

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [Example Institute of Technology],
      top-right: [2012–2017],
      bottom-left: [Ph.D. in Computer Science],
      bottom-right: [Toronto, Canada],
    ),
    list-items: (
      [Dissertation: _Evaluation under distribution shift for multilingual information access_.],
      [Advisor: Professor A. Example.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [Sample University],
      top-right: [2008–2012],
      bottom-left: [B.Sc. in Computer Science, minor in Linguistics],
      bottom-right: [Ottawa, Canada],
    ),
    list-items: (),
  ),
)

== Sponsored Research

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [Community-grounded evaluation for multilingual search],
      top-right: [2024–2027],
      bottom-left: [Principal investigator · Example Research Council],
      bottom-right: [CAD 410,000],
    ),
    list-items: (
      [Supports two doctoral researchers, community workshops, and an openly documented benchmark release.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [Auditable language-model evaluation infrastructure],
      top-right: [2021–2024],
      bottom-left: [Co-principal investigator · Northlake Research Fund],
      bottom-right: [CAD 180,000],
    ),
    list-items: (
      [Built shared tooling for versioned datasets, slice-level reporting, and reproducible model comparisons.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [Robust evaluation for public-interest language technology],
      top-right: [2018–2021],
      bottom-left: [Co-investigator · Sample Foundation],
      bottom-right: [CAD 125,000],
    ),
    list-items: (
      [Developed community review protocols and evaluation resources for multilingual public-service search.],
    ),
  ),
)

== Graduate Supervision

#multi-line-list(
  single-line-entry([Priya Raman], [Ph.D., multilingual retrieval evaluation], [2022–Present]),
  single-line-entry([Noah Williams], [Ph.D., interaction-aware ranking], [2021–Present]),
  single-line-entry([Luca Bianchi], [Ph.D., evaluation under domain shift; completed], [2018–2023]),
  single-line-entry([Elena García], [M.Sc., dataset documentation; completed], [2022–2024]),
  single-line-entry([Samir Okafor], [M.Sc., search observability; completed], [2020–2022]),
  single-line-entry([Amara Nwosu], [M.Sc., participatory benchmark design; completed], [2019–2021]),
)

== Research Leadership

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [Language Systems Lab],
      top-right: [2019–Present],
      bottom-left: [Founder and director · reproducible-evaluation initiative co-chair],
      bottom-right: [Northlake University],
    ),
    list-items: (
      [Established open review for study protocols, dataset documentation, and release decisions.],
      [Built a mentoring ladder linking undergraduate researchers, graduate mentors, and project leads.],
      [Convened a six-lab working group on versioned evidence, audit trails, and shared review criteria.],
    ),
  ),
)

#pagebreak()

== Selected Publications (note:C=Conference, J=Journal, B=Book Chapter, P=Preprint)

#publication-entry-list(
  (
    (category: "J", value: [*M. Chen*, P. Raman, and N. Williams. (2026). Measurement choices in multilingual retrieval. _Journal of Responsible Information Systems_, 8(2), 41–68. #link("https://doi.org/10.0000/example.2026.1")[doi:10.0000/example.2026.1]]),
    (category: "P", value: [*M. Chen* and L. Bianchi. (2026). Governance notes for multilingual benchmark releases. _Preprint_. #link("https://doi.org/10.0000/example.2026.5")[record]]),
    (category: "C", value: [E. García, *M. Chen*, and S. Okafor. (2025). Dataset cards as executable evaluation contracts. In _Proceedings of the Example Conference on Information Access_, 118–131. #link("https://doi.org/10.0000/example.2025.2")[doi:10.0000/example.2025.2]]),
    (category: "C", value: [P. Raman and *M. Chen*. (2024). Community-defined relevance for low-resource search. In _Proceedings of the Sample Conference on Language Technology_, 204–219. #link("https://doi.org/10.0000/example.2024.3")[doi:10.0000/example.2024.3]]),
    (category: "J", value: [*M. Chen*, A. Dubois, and R. Singh. (2023). Reproducibility gaps in cross-lingual retrieval evaluation. _Transactions on Language Systems_, 5(4), 1–27. #link("https://doi.org/10.0000/example.2023.4")[doi:10.0000/example.2023.4]]),
    (category: "B", value: [*M. Chen* and R. Singh. (2022). Auditing multilingual information-access benchmarks. In _Handbook of Responsible Language Technology_, 155–178. #link("https://doi.org/10.0000/example.2022.6")[doi:10.0000/example.2022.6]]),
    (category: "C", value: [S. Okafor, *M. Chen*, and L. Park. (2021). Connecting offline slices to production search monitoring. In _Proceedings of the Systems Evaluation Workshop_, 52–63.]),
  ),
)

== Open Research Artifacts

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [Northlake Multilingual Retrieval Benchmark],
      top-right: [2024–Present],
      bottom-left: [Dataset, evaluation harness, and documentation],
      bottom-right: [#link("https://example.edu/nmrb")[project site]],
    ),
    list-items: (
      [Defines twelve language and domain slices, with provenance records and known-limitations reports.],
      [Released under permissive licenses after consent and governance review.],
    ),
  ),
)

== Invited Talks

#multi-line-list(
  single-line-entry([What should multilingual evaluation measure?], [Example Institute Distinguished Lecture], [2026]),
  single-line-entry([From benchmark scores to deployment decisions], [Sample Systems Seminar], [2025]),
  single-line-entry([Participatory relevance assessment], [Northwest Language Technology Forum], [2024]),
)

== Editorial and Reviewing

#multi-line-list(
  single-line-entry([Associate editor], [_Journal of Responsible Information Systems_], [2024–Present]),
  single-line-entry([Area chair], [Example Conference on Information Access], [2023–2026]),
)

== Teaching

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [CPSC 642 · Evaluation of Machine-Learning Systems],
      top-right: [2021–2026],
      bottom-left: [Graduate seminar · instructor],
      bottom-right: [Northlake University],
    ),
    list-items: (
      [Designed project-based modules on validity, uncertainty, dataset documentation, and release decisions.],
      [Students reproduce one published result and submit an evidence-linked audit report.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [CPSC 431 · Information Retrieval],
      top-right: [2019–2025],
      bottom-left: [Upper-division course · instructor],
      bottom-right: [Northlake University],
    ),
    list-items: (
      [Rebuilt assignments around multilingual corpora, error analysis, and reproducible experiments.],
    ),
  ),
)

== University and Professional Service

#r2c2-entry-list(
  (
    entry-header-args: (
      top-left: [Graduate curriculum committee],
      top-right: [2023–Present],
      bottom-left: [Member; methods subcommittee lead],
      bottom-right: [Northlake University],
    ),
    list-items: (
      [Coordinated a department-wide review of research-methods and reproducibility training.],
    ),
  ),
  (
    entry-header-args: (
      top-left: [Open Evaluation Mentorship Program],
      top-right: [2021–Present],
      bottom-left: [Founding mentor],
      bottom-right: [Professional service],
    ),
    list-items: (
      [Provide structured project feedback for early-career researchers outside major research centers.],
    ),
  ),
)

== Honors and Awards

#multi-line-list(
  single-line-entry([Distinguished Teaching Award], [Northlake Faculty of Science], [2025]),
  single-line-entry([Open Research Practice Award], [Example Research Council], [2024]),
  single-line-entry([Best Resource Paper], [Sample Conference on Language Technology], [2024]),
)

== Methods and Tools

#multi-line-list(
  single-line-entry([Research methods:], [information retrieval, experimental design, qualitative coding, participatory evaluation], []),
  single-line-entry([Technical tools:], [Python, Rust, SQL, PyTorch, Polars, containerized reproducibility], []),
  single-line-entry([Languages:], [English (professional), Mandarin Chinese (professional), French (reading)], []),
)
