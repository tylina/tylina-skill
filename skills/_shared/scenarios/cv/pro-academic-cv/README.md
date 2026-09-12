# pro-academic-cv Demo

- Source package:
  [pro-academic-cv 0.1.0](https://typst.app/universe/package/pro-academic-cv/)
- Published starter:
  [template/main.typ](https://github.com/typst/packages/blob/main/packages/preview/pro-academic-cv/0.1.0/template/main.typ)
- Upstream license: MIT; the package also credits an earlier CC BY 4.0 academic-CV design.
- Local adaptation: the package API and section primitives are retained; placeholder fields are
  replaced with a coherent two-page fictional academic record.

Use this example for a cumulative academic CV rather than a compressed professional résumé. It
demonstrates appointments, education, sponsored research, supervision, research leadership,
journal/conference/book-chapter/preprint records, open research artifacts, talks, teaching,
service, awards, and methods without YAML or another external data layer.

```bash
typst compile demo.typ output.pdf
```

The demo uses Palatino, which must be installed or replaced through the package's documented
`font-settings`. Under Typst 0.15.0 the pinned package emits one forward-compatibility warning for
its own inline SVG raw-text literal; the reviewed PDF still renders correctly. Do not patch the
package cache to suppress that warning.

Every identity, institution, publication, grant, DOI, profile, date, amount, and claim in the demo
is fictional. Replace the record from verified sources, preserve canonical author order and
publication status, and let evidence determine the final page count. The included two-page sample
uses meaningful records to demonstrate balanced pagination; do not preserve a section merely as
filler when a real candidate has no corresponding evidence.
