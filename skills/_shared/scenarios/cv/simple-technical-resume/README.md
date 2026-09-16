# simple-technical-resume Demo

- Source package:
  [simple-technical-resume 0.1.1](https://typst.app/universe/package/simple-technical-resume/)
- Published starter:
  [template/main.typ](https://github.com/typst/packages/blob/main/packages/preview/simple-technical-resume/0.1.1/template/main.typ)
- Upstream license: MIT.
- Local adaptation: the published API and one-page structure are retained; television-themed
  sample content is replaced with a coherent fictional technical résumé.

Use this example for a dense, conventional, single-column software or ML résumé. The pinned package
uses New Computer Modern in this demo and needs no images, icon fonts, or external content data.

```bash
typst compile demo.typ output.pdf
```

The sample identity, organizations, links, dates, claims, and metrics are fictional. Replace every
fact and test the final PDF's extraction order. “ATS-friendly” describes the package's design goal;
it is not a universal compatibility guarantee.

## Date-Precision Boundary

In version 0.1.1, `work-heading` and `education-heading` require `datetime` for `start-date` and
format the result as month plus year. `end-date` also accepts the exact string `"Present"`; another
string still reaches the package's datetime formatting path. Do not turn a source that says only
`2022` into an invented month and day merely to satisfy this API.

For verified month-level evidence, keep the package helpers. For year-only evidence, keep
`resume.with` and `custom-title` but build the affected entry with native Typst content, for example:

```typst
#custom-title("Experience")[
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [*Senior Engineer* \ Example Organization],
    align(right)[2022–Present],
  )
  #v(-0.4em)
  - Replace this line with a verified achievement.
]
```

Match the surrounding typography and spacing, and use the same approach consistently for affected
entries. If the template would need repeated structural overrides, inspect another reviewed CV
template whose public API preserves the available date precision.
