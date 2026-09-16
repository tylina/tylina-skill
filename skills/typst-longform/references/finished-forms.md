# Finished Long-form Documents

Tylina uses one document-first editing model across forms; templates supply the starting contract,
not a disposable visual sample. Continue an existing scaffold in place. For a new artifact, search
and inspect the current exact template before materializing it.

| Form | Search seeds | Best fit | Required checks |
|---|---|---|---|
| Growing note collection | `bananote`, `note`, `lecture notes` | Ideas and formulas that may become sections, references, and a larger document | heading depth, backlinks or navigation if present, math, references, and readable screen/print density |
| Evidence-led report | `breezy-report`, `report` | Findings, data, interpretation, recommendations, and limitations | source attribution, tables/figures, executive summary, pagination, and reviewable changes |
| Book or manual | `min-book`, `book`, `manual` | Chapters, contents, running heads, front/back matter, and long print flow | chapter openings, outline, page numbering, binding margins, blank pages, footnotes, bibliography, and index |
| Academic monograph | `monograph`, `book` plus discipline/language | Scholarly long-form argument not governed by a degree submission | chapter structure, citations, appendices, index, print geometry, and publication contract |

Use `typst-thesis/SKILL.md` for a degree thesis or dissertation. Its institution, degree,
front-matter, review-variant, binding, and submission requirements are not an ordinary long-form
template choice.

The named packages mirror Tylina's “Beyond papers” showcase and are discovery seeds, not pinned
recommendations. `template.list` decides what is currently available; `template.inspect` supplies
the exact manifest, entrypoint, guide, files, and optional preview. Do not copy a website screenshot
or repository HEAD in place of that inspected template version.

## Source Shape

Keep one main file that owns document metadata and global show/set rules. Move stable chapters or
appendices into focused files when it improves authoring and review. Use semantic labels and
references across files. Centralize shared figure/table/theorem components; do not create a second
theme inside content files.

For a note that grows into a book, migrate structure deliberately: preserve source history, map old
labels, keep the bibliography, and validate each move. A new template does not authorize deleting
the original note or overwriting a populated main.
