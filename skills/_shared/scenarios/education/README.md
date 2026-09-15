# Education Scenarios

These Tylina-owned, package-free workspaces cover ordinary homework and a printable exam. Both
derive learner and solution outputs from one canonical question source. They do not supply course
facts, official standards, answers, scoring policy, or institution wording.

| Entry | Best for | Solution build |
|---|---|---|
| `homework` | A short assignment with writable space and instructor solutions | `typst compile --input solutions=true main.typ homework-solutions.pdf` |
| `exam` | A timed paper with candidate fields, visible point values, and an answer edition | `typst compile --input solutions=true main.typ exam-solutions.pdf` |

The default build is the learner edition. Inspect both outputs before delivery and manually check
point totals against the canonical source. Source visibility is not cryptographic answer secrecy.
