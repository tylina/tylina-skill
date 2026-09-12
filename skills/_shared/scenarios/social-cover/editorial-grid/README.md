# Editorial Grid social cover

A 1080×1350 (4:5) publication-style cover adapted from the local
`themes/custom-rich/editorial-grid` design language.

- `template.typ` owns the paper field, dark information rail, typography, and component API.
- `demo.typ` supplies a complete Chinese example about editing long-form content for small screens.
- The inline SVG is structural only: paper grain, rules, zones, and the four-step signal rail. All meaningful copy remains native Typst content.
- `principle-label` and `principle` provide the lower anchor in the light column. The red statement
  closes the page with a separate audience-facing claim; avoid repeating the same sentence in both
  roles.
- The dark rail includes inset beyond its red divider so markers and opening glyphs do not collide
  with the structural accent.

Compile from this directory:

```bash
typst compile demo.typ editorial-grid.png --ppi 144
```
