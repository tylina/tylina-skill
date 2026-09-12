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
