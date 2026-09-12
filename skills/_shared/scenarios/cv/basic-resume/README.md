# basic-resume Demo

- Source package: [basic-resume 0.2.9](https://typst.app/universe/package/basic-resume/)
- Starter source:
  [template/main.typ](https://github.com/typst/packages/blob/main/packages/preview/basic-resume/0.2.9/template/main.typ)
- Upstream license: [Unlicense](https://unlicense.org/).
- Local change: provenance comments only.

The demo preserves the published starter and imports the pinned Universe package. It is a useful
first check for a conventional, single-column, ATS-oriented résumé.

```bash
typst compile demo.typ output.pdf
```

The package imports scienceicons 0.1.0 for optional ORCID support. Under Typst 0.15.0 that
transitive package currently emits raw-text deprecation warnings even when ORCID is unused.
