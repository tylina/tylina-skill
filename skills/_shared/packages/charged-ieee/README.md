# Charged IEEE — Two-column IEEE-style papers

**Package**: `@preview/charged-ieee:0.1.4`  
**Category**: Academic paper template  
**Typst Universe**: <https://typst.app/universe/package/charged-ieee>  
**Repository**: <https://github.com/typst/templates>  
**License**: MIT-0

## Verified Boundary

Charged IEEE 0.1.4 is a maintained Typst template for a tightly spaced, two-column
IEEE-style paper. Its `ieee` show rule formats the title and author block, abstract,
index terms, headings, figures, equations, and numeric IEEE bibliography style. It is
an implementation of a published style, not an IEEE approval or submission guarantee.

The verified `ieee` parameters are `title`, `authors`, `abstract`, `index-terms`,
`paper-size`, `bibliography`, and `figure-supplement`. Authors are dictionaries with
`name` plus optional `department`, `organization`, `location`, and `email` content.
The default paper size is US letter; pass `paper-size: "a4"` only when that is the
requested venue format and inspect the resulting margins and columns.

## Minimal Usage

```typst
#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [A Small Typst Experiment],
  abstract: [This example demonstrates a source-controlled IEEE-style layout.],
  authors: (
    (
      name: "Example Author",
      department: [Document Systems],
      organization: [Tylina],
      location: [Online],
      email: "author@example.invalid",
    ),
  ),
  index-terms: ("Typst", "document systems"),
  bibliography: bibliography("refs.bib"),
)

= Introduction
This paragraph cites a deliberately synthetic record @example.
```

The bundled `demo.typ` and `refs.bib` compile this complete pattern with Typst 0.15.0.
For a new project, `template.create` or `typst init @preview/charged-ieee:0.1.4`
materializes the upstream starter. For an existing paper, preserve its source and
bibliography and add the show rule only after checking the venue's required paper size,
columns, title metadata, author fields, and citation style.

## Selection and Safety

- Choose Charged IEEE for an IEEE-style paper or a closely related two-column engineering
  or computer-science manuscript. It is not a thesis, proceedings-specific compliance
  certificate, or a substitute for the venue's current author instructions.
- Keep claims, author identity, affiliations, citations, and bibliography records
  supplied and reviewable. A template must not invent a paper's evidence or metadata.
- The template requests TeX Gyre Termes and TeX Gyre Cursor. If those fonts are not
  installed in the target host, Typst reports fallback warnings and line metrics can
  change; inspect the real output before submission.
- `bibliography` is the result of a Typst `bibliography(...)` call or `none`. The style
  configures numeric IEEE citations but does not check whether a source supports a claim.
- Keep figures, tables, equations, labels, and references semantic. Do not recreate the
  template with positioned text boxes merely to imitate a screenshot.

## Review Checklist

Inspect the first page title/author/abstract block, both columns at a page transition,
equation and figure captions, bibliography ordering, paper size, margins, font fallback,
and the final page. A successful compile proves the API call, not IEEE compliance.
