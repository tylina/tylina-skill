# resume-ng Demo

- Source package: [resume-ng 1.0.0](https://typst.app/universe/package/resume-ng/)
- Starter source:
  [template/main.typ](https://github.com/typst/packages/blob/main/packages/preview/resume-ng/1.0.0/template/main.typ)
- Upstream license: MIT.
- Local adaptation: a complete, source-neutral one-page example uses the published API while
  replacing the upstream personal content.

Use this as a starting point for a dense Chinese technical résumé. Replace all sample facts before
delivery.

```bash
typst compile demo.typ output.pdf
```

The package sets Noto Serif CJK SC internally. Install that exact family or review and fork the
package style; a fallback-rendered PDF is not a verified result. In the reviewed PDF extraction,
right-aligned dates appeared before their entry titles. The content remained text, but a strict
screening workflow should test the destination parser and choose a simpler single-column example if
that order is unacceptable.
