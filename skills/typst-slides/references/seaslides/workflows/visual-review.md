# Visual Review Workflow

## Trigger

After Step 7.1-7.2 compilation when the selected review policy requires rendered inspection. This
corresponds to Step 7.3 in `SKILL.md`.

## Process

1. Run `document.validate`, then obtain the physical-page contract with
   `render.summary`
2. Run `render.overview` for a rapid full-deck scan
3. Apply the rubric to the active scope with `render.page`: inspect every page for
   **Full**, or only pages flagged by validation/overview for **Targeted**
4. Optionally run the packaged quality checker as a supplemental audit; disposition each finding
   against canonical source and the live Tylina render
5. Fix any Hard rule violations (edit `main.typ`, recompile)
6. Fix clustered Soft rule violations (3+ issues on one page)
7. Recompile if fixes were made, re-verify
8. Repeat up to 3 iterations maximum
9. Document any remaining known issues or escalations

## Inputs

- Live Tylina validation and physical-page summary
- Tylina overview and requested readable page renders
- Optional packaged quality-checker findings
- Design spec: `<project_path>/content_design_spec.md` when present; in Quick Mode, use the
  readable source, `main.typ`, and selected theme contract instead
- Theme file: `<project_path>/template.typ` (read-only reference for palette/components)

## Outputs

- Fixed `main.typ` (if issues found and correctable)
- Revalidated live render and requested exports (if fixes applied)
- Review scope: `full` / `targeted` / `none`
- Review result: `pass` / `fixed` / `needs_human` / `not_reviewed`

## Decision Table

| Review Result | Action |
|--------------|--------|
| Full scope passes all Hard rules, <3 Soft issues per page | `scope=full`, `result=pass` — proceed to export |
| Targeted scope passes all inspected pages | `scope=targeted`, `result=pass` — proceed without claiming a full visual pass |
| Hard violations found and fixed within 3 iterations | Preserve scope, set `result=fixed`, and proceed |
| Visual review explicitly skipped | `scope=none`, `result=not_reviewed` — proceed with disclosure |
| Hard violation requires Don't-Touch change | Preserve scope, set `result=needs_human`, and report a suggested fix |
| 3 iterations exhausted with remaining Hard violations | Preserve scope, set `result=needs_human`, and request guidance |

## Quick Mode

Infer review depth from the user's request without adding a separate decision gate:

| User intent | Review depth |
|---|---|
| Explicitly requests no visual review, compile-only output, or maximum speed | **None** — skip this workflow, retain compilation/mechanical checks/validation, and disclose that no visual review was performed |
| Requests an ordinary fast draft without a review preference | **Targeted** — inspect the overview and only pages flagged by the overview or mechanical checker |
| Requests visual assurance, per-page checking, polish, or delivery-grade review | **Full** — inspect the overview and every slide PNG once |

Honor an explicit review instruction over these inference examples. Within the selected scope, fix
Hard violations and obvious clusters of Soft violations, then stop instead of adding discretionary
polish rounds. Always report both scope and result; never describe `none` or `targeted` as a full
visual pass.

## Related

- `typst-slides/references/seaslides/references/visual-review.md` — full review rubric
- `typst-slides/references/seaslides/references/executors/canvas.md` — Canvas checklist
- `typst-slides/references/seaslides/references/shared-standards.md` — Typst constraints
