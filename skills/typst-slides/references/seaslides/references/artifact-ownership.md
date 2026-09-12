# Artifact Ownership and Visual Correction

Use this reference when compilation or visual review finds a defect. Correct the owning source instead of patching a derived PDF, PNG, or PPTX.

## Artifact Authority

| Artifact | Authority / Owner | Derived? | Correction or Rebuild |
|---|---|---:|---|
| `sources/` originals and direct user Markdown | Source owner | No | Correct or replace only with user/source authority |
| Source conversion receipt, when present | Source converter | Yes | Rerun the owning converter; never edit a pass receipt by hand |
| `content_design_spec.md` | Strategist | No | Update when the underlying claims, narrative, theme, or visual direction deliberately changes |
| `main.typ` | Content executor | No | Correct claims, page composition, notes, and project-local component use |
| project `template.typ` or catalog theme source | Theme owner | No | Correct reusable components, tokens, layout behavior, and theme-wide defects |
| PDF, slide PNGs, overview, and PPTX | Compiler/export owner | Yes | Rebuild from current Typst source; never patch these as the source fix |
| Quality-checker diagnostics | Quality gate | Yes | Correct the owning source, then rerun compilation and the checker |

## Issue Ownership

1. Wrong or excessive copy, missing notes, and one-off page composition belong to `main.typ`.
2. Repeated spacing, component geometry, theme typography, and reusable layout failure belong to the project or catalog `template.typ`.
3. A correct PDF/PNG that changes only in PPTX belongs to the export route; do not distort the Typst source merely to hide a converter defect.
4. A missing/stale source or conversion receipt returns to source processing or Strategist.
5. A changed narrative, theme, or visual direction returns to the corresponding owner recorded in the design spec.

## Correction Ladder

Apply the first step that preserves the intended claim and theme:

1. Remove accidental duplication or tighten nonessential copy.
2. Recompose with the theme's existing components and the correct `stack`, `grid`, or `cols` contract.
3. Add or correct a reusable theme component. Use `lazy-layout: true` only when every column has exactly one direct stretchable component; keep the component's terminal `lazy-v(1fr)` marker.
4. Correct a compiler, checker, or export defect at its owner.
5. Return upstream when source, claim, theme, or visual direction must change.

After any source correction, compile all required formats, inspect native PNGs, rerun the quality checker, and verify affected pages plus the overview.
