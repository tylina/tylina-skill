# heading-resume Demo

- Source package: [heading-resume 0.1.0](https://typst.app/universe/package/heading-resume/)
- Published starter:
  [template/main.typ](https://github.com/typst/packages/blob/main/packages/preview/heading-resume/0.1.0/template/main.typ)
- Upstream license: MIT No Attribution (MIT-0).
- Local change: none; `demo.typ` is the published starter.

Use this example when a compact editorial two-column résumé is appropriate. The package uses fonts
bundled with Typst, requires no image assets, and keeps the content in small Typst arrays and content
blocks inside one visible entry file.

```bash
typst compile demo.typ output.pdf
```

The sample identity, organizations, links, projects, and claims are explicitly fictional. Replace
all of them, then confirm that the left/right reading order is acceptable for the destination's
screening process. A conservative ATS workflow may be better served by `basic-resume` or
`simple-technical-resume`.
