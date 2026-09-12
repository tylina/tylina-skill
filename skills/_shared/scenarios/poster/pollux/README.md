# pollux Example

This example uses [`@preview/pollux:0.1.0`](https://typst.app/universe/package/pollux/).
The upstream project is MIT-licensed and maintained at
[`taka255/pollux`](https://github.com/taka255/pollux). It builds on a Gemini-inspired,
two-column A0 poster system.

`demo.typ` follows the published starter structure—`set-theme`, `layout-a0`, `title-box`, and
`column-box`—while replacing generic filler with a complete fictional study about accessible chart
descriptions. A full-width bottom decision band closes the page and carries the visible demo-data
disclaimer; it intentionally replaces the package's optional flow-positioned `bottom-box` because
that box can overflow when the main columns already consume the page.

```bash
typst compile demo.typ output.pdf
typst compile demo.typ output.png --ppi 48
```

The upstream theme requests Raleway, Lato, and Noto Sans CJK JP. If those families are absent,
Typst emits package-owned font warnings and falls back. The sample still compiles, but the title and
body metrics can change, so inspect the actual render or install the documented fonts before final
layout tuning.

The example compiled as one page with Typst 0.15.0 during maintenance. Replace every fictional
participant, organization, value, and link; review the MIT terms; then repeat full-size, thumbnail,
font, citation, link, and print checks.
