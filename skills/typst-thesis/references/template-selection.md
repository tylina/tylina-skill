# Thesis Template Selection

## Thesis Versus Paper

| Concern | Academic paper | Thesis or dissertation |
|---|---|---|
| Governing contract | venue or style guide | institution, degree, department, and submission rules |
| Scale | one submission unit | front matter, chapters, references, appendices, and variants |
| Pagination | usually continuous | often roman-to-arabic transitions, recto rules, and binding margins |
| Identity | author and affiliation | degree, supervisors or committee, declarations, and approvals |
| Variants | review and camera-ready | blind review, draft, print/bound, electronic, and final deposit |
| Acceptance evidence | venue checks | current institutional regulations and submission portal checks |

Do not route a thesis request through a paper template merely because both contain citations and
sections. Do not route an ordinary long paper through a thesis template merely to obtain chapters.

## Requirements Gate

Before changing layout, obtain or identify:

- the authoritative requirement document and its effective date;
- institution, department or program, degree level, and document language;
- required title, declaration, approval, abstract, contents, lists, bibliography, and appendix
  sections;
- paper size, margins, binding side, one/two-sided policy, type constraints, spacing, page-number
  placement, and blank-page policy;
- anonymization, signatures, embargo, metadata, accessibility, archival, and upload requirements;
- whether the institution supplies or endorses a template.

Missing requirements are review findings. Never fill them from another institution's template.

## Discovery

Use Tylina's current `template.list` and `template.inspect` results as the operational source.
Search `thesis` together with the institution, country or language. The following Typst Universe
pages are discovery examples, not endorsements or timeless recommendations:

- [cardinal-su-thesis](https://typst.app/universe/package/cardinal-su-thesis) demonstrates a
  requirement-mapped US dissertation scaffold and explicitly tells authors to verify the rules.
- [classic-msc-thesis](https://typst.app/universe/package/classic-msc-thesis) demonstrates a
  general multi-file MSc structure with front matter, lists, references, and appendices.
- [modern-nenu-thesis](https://typst.app/universe/package/modern-nenu-thesis/) demonstrates
  Chinese bachelor/master/doctoral variants, blind review, and bound-print concerns.
- [modern-nju-thesis](https://typst.app/universe/package/modern-nju-thesis/) demonstrates a
  configurable façade with separate front pages, long-range layouts, and non-rendering helpers.
- [uo-tsinghua-thesis](https://typst.app/universe/package/uo-tsinghua-thesis/) demonstrates a
  Chinese graduate scaffold whose own page warns users to confirm current institutional rules.

For each candidate, inspect the exact current version's documentation, manifest, entrypoint, and
files. Check minimum Typst version, license, fonts, bundled resources, project structure, known
issues, update date, and whether the required variant actually exists. Repository HEAD can explain
an unresolved implementation detail, but it cannot replace the selected package version.

## Verification Matrix

At minimum inspect:

- title page and every required preliminary section;
- transition into chapter 1 and the first odd/even pair;
- contents plus lists of figures, tables, abbreviations, or symbols;
- representative long headings, captions, equations, tables, footnotes, citations, and links;
- references-to-appendix transition and the final page;
- blind/draft/final switches and PDF metadata for identity leakage;
- page count, paper size, inner/outer margins, numbering sequence, blank pages, missing fonts,
  overflow, and clipped content.

Compilation confirms that the source is valid. Only a requirement-by-requirement review can support
a compliance claim.
