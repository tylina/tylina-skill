# Sanity — Reference and Manuscript Preflight

**Package**: `@preview/sanity:0.2.0`  
**Category**: Research and document audit  
**Typst Universe**: <https://typst.app/universe/package/sanity>  
**Repository**: <https://github.com/techgustavo/sanity>  
**Versioned manual**: <https://github.com/techgustavo/sanity/blob/v0.2.0/docs/manual.pdf>  
**License**: MIT

## Verified Boundary

Sanity 0.2.0 reports manuscript-structure problems including unreferenced labelled figures,
tables, listings, and equations; references before targets; empty captions; duplicate captions;
and uncited bibliography entries when bibliography data is supplied.

It complements the compiler. A document may compile successfully while still containing an
uncited source or an unreferenced figure. Sanity does not establish whether a claim is supported,
whether a source is trustworthy, or whether an intentionally decorative element needs a label.

## Minimal Usage

```typst
#import "@preview/sanity:0.2.0": sanity

#show: sanity.with(bibliography: read("references.bib"))

See @fig:flow and @used-example.

#figure([A source-backed figure], caption: [Review flow]) <fig:flow>
#bibliography("references.bib")
```

The show rule appends a report page only when it finds issues. Use `strict: true` when findings
must fail compilation, but do not make strict mode a surprise in an interactive editing workflow.

## Selection Guidance

- Run ordinary `document.validate` first; Sanity is not a replacement for compiler diagnostics.
- Use Sanity for structural preflight of a paper, thesis, report, or book with semantic labels and
  references.
- Use the Tylina literature audit for claim-to-source support, DOI/arXiv identity, duplicate
  records, and inaccessible evidence. Sanity sees document structure, not scholarly truth.
- Do not add this package permanently when a one-time audit is enough. If it is retained, make the
  review/final behavior explicit so the report page cannot leak into delivery output unnoticed.

## Bibliography and Exceptions

- A Typst package cannot discover which `.bib` or Hayagriva file the document uses. Pass its bytes
  explicitly with `bibliography: read("...")` to enable `uncited-entry` checks.
- Ignore a finding only when the semantic reason is known. For example,
  `sanity-ignore(<fig:cover>, reason: "decorative")` documents why one labelled figure may remain
  unreferenced.
- Narrow an exception with `checks: "unreferenced-figure"` when other checks should still apply.
- Inspect the appended report or strict diagnostics and resolve each finding against the actual
  document. Compilation alone does not show that the report was reviewed.

Sanity 0.2.0 requires Typst 0.14 or newer. Its optional external command-line wrapper is not part
of the Typst package and is not needed in Web Tylina; use the package show rule and Tylina's own
validation/render tools.
