---
name: typst-authoring
description: Author, refactor, diagnose, and verify Typst documents through Tylina while preserving canonical source, package versions, and visual correctness.
---

# Typst Authoring

Typst source and workspace resources are canonical; rendered pages are views.

## Commands

Invoke `tylina` with `{command, args}` for editor context, compilation, preview and export.
Use `help` only for unfamiliar commands. Use the host's normal file tools to read and edit;
the browser host supplies them when there is no native filesystem. No model-computed hashes or
edit offsets are required. `workspace.info` provides the actual workspace and main file.
`editor.state` reads live selection/caret without compilation; standalone hosts have no selection.
Lens offsets belong to a transient draft, not canonical source.
For a PDF or Office source in the workspace, use `document.import` and read
`typst-authoring/references/source-ingestion.md`; do not invoke a Python converter.

## Contract

1. Read current source and relevant imports/assets before editing; captured context may be stale.
2. Preserve unrelated source, labels, references, package versions, whitespace, and established
   style. Make the smallest reviewable change.
3. Never guess a Typst or package API. Reuse a compiled workspace pattern or read one narrow,
   version-matched reference. Restrict discovery to the current workspace, resources returned by
   `skill.read`, and the exact imported package version; never recursively search a home or temp tree.
4. Respect markup, math, and code modes. If an API accepts `content`, prefer `[content]`; use
   strings only where the real signature requires `str`. Prefer semantic structure.
5. A selection or insertion point bounds the edit. Document context does not authorize a rewrite.
6. Edit normal workspace files so History remains authoritative. Never insert preview anchors,
   placeholders, or invisible projection characters into source, history, or clipboard data;
   preserve Chinese IME text. Native edits arrive through external-change handling;
   resolve pending-input conflicts before claiming success.
7. After changing source, require a successful validation receipt from
   `document.validate`. A last-successful preview does not make a failed edit valid.
   Do not substitute a shell `typst compile`: it bypasses Tylina's current-main, verifier, and
   preview state while duplicating work.
8. For layout changes, inspect affected pages with `render.page`; use `render.summary` or
   an overview only when page count or location is unknown. Check overflow, clipping,
   collisions, contrast, missing content, and pagination.
9. Export inside the workspace only after validation; overwrite only when explicit. Review-only
   requests do not modify files unless requested. Report incomplete verification.

## Workspace and Mutation Gate

An empty current main does not prove that the workspace is empty. These are scope boundaries,
not a required classification step:

- **Truly blank draft**: no authored source or materialized scaffold. A sufficient creation brief
  may start from scratch; use the template workflow when a template is relevant.
- **Selected scaffold**: stored materialization provenance or a coherent template-owned entrypoint
  and file set establishes that its files exist. An explicit user choice identifies which template
  to apply, but does not prove materialization. Never infer a scaffold from a filename alone.
  Preserve its contract, author the intended entrypoint, switch with
  `document.setMain({file: "relative/path.typ"})`, and validate the newly current main.
- **Populated document**: default to in-place continuation. An explicit overwrite or separate
  artifact requires that intent from the user; a current-document addition stays in place.
  Ask only when continuation versus overwrite is ambiguous and materially changes the result.

Apply these target rules:

1. A selection, insertion point, or explicit current-document edit stays at that target.
2. Replace current authored source only when overwrite is explicit.
3. A distinct new artifact beside a populated document uses a conflict-free `.typ` file. Keep
   the previous file, switch through `document.setMain({file: "relative/path.typ"})`, then
   validate the new current main.
4. A selected scaffold keeps its examples and assets; author its intended main or a conflict-free
   equivalent rather than replacing the scaffold blindly.
5. Use multiple files only when the requested structure benefits; keep one validated entrypoint.

Creating a file alone does not authorize changing main; a distinct new document normally does.
Changing main never authorizes deleting the old document. Creation needs a sufficient brief;
transformation and review need existing or supplied source. Otherwise ask for the missing material.

## High-Frequency Typst Boundaries

In markup and content blocks, enter code with `#`. Function argument lists, `{...}`, bindings,
conditions, and loops are already code mode, so nested calls do not take another `#`:

```typst
#figure(
  table(columns: 2, [Item], [Value]),
  caption: [Measured values],
)
```

Treat `content` and `str` as different types. Use `[reader-visible content]` when the API accepts
content; keep strings for real `str` parameters. Use `#(...)` or `#{...}` to enter code from markup
when a boundary is needed, and `[...]` to return content from code. Read
`_shared/docs/typst/language-modes.md` before changing an uncertain boundary.

## Math Integrity Gate

Every formula must use real math content. Use native `$...$` Typst math by default, preserve
verified notation already established by the document, and validate and inspect every changed
formula. Never put LaTeX commands inside native Typst math or imitate an equation with ordinary
text, code styling, or Unicode lookalikes outside math content.

For example:

```typst
// Wrong: visually imitates math but has no math semantics.
#raw("Attention(Q,K,V) = softmax((QKᵀ)/√dₖ)V")

// Right: native Typst math.
$ "Attention"(Q, K, V) = op("softmax")((Q K^T) / sqrt(d_k)) V $
```

Use MiTeX only when the user supplies LaTeX that should remain LaTeX-authored, or when the existing
document already depends on MiTeX. Do not add it merely because LaTeX spelling is more familiar.
When it is genuinely required, read `_shared/packages/mitex/README.md` and its `demo.typ`, keep its
version pinned, and pass raw backtick input:

```typst
#import "@preview/mitex:0.2.7": *

#mitex(`\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}`)
```

Compilation proves syntax, not mathematical correctness; compare the formula with its source and
inspect the rendered notation.

## Package Discovery

Use `package.list` for the current official Typst Universe catalog, including non-template
packages. Filter by a focused query, category, or discipline, then read only the returned
`skillPaths` and optional `recipePath`. `_shared/packages/index.json` retains pinned,
compile-verified examples for selected packages. When the selected recipe or current workspace
does not establish the needed API, call `package.inspect` with the returned exact `spec` and only
the needed README, manifest, entrypoint, file list, or explicit source path. Package source is
read-only: never edit the package cache, treat it as a Document target, or replace the selected
version with repository HEAD. Existing workspace imports win; never recall a version from memory,
infer an API from list metadata, or add a package merely because it is listed.

## Modes

- `author`: create or refactor semantic, maintainable Typst.
- `continue`: preserve surrounding purpose, voice, terminology, hierarchy, labels, and references.
- `improve`: improve clarity and flow without changing claims, facts, structure, or unrelated source.
- `summarize`: preserve attribution while reporting supported ideas, evidence, decisions, and limits.
- `organize-notes`: preserve facts, attribution, tasks, unresolved items and non-duplicate material.
- `report`: distinguish evidence, interpretation, recommendations and limits.
- `assignment`: establish learner, objectives, artifact type, prompts, solutions, hints, and rubric;
  read `typst-authoring/references/assignment.md` before selecting an exam or worksheet template.
- `diagnose`: validate, explain the owning boundary, apply the smallest safe fix unless the user
  requested diagnosis only, then validate again.

## Progressive Resources

- Syntax pattern uncertain: `typst-authoring/references/syntax-patterns.md`.
- Markup/code/math boundary uncertain: `_shared/docs/typst/language-modes.md`.
- Assignment, worksheet, or exam: `typst-authoring/references/assignment.md`.
- Formal exam or educational artifact: `typst-education/SKILL.md` when available.
- Music notation: `typst-music/SKILL.md` when available.
- Long note, report, thesis, manual, or book: `typst-longform/SKILL.md` when available.
- Literature research or citation audit: `typst-research/SKILL.md` when available.
- PDF, DOCX, PPTX, or XLSX source evidence:
  `typst-authoring/references/source-ingestion.md`.
- New external raster image: `tylina/references/image-sourcing.md`.
- New package or template selection/application:
  `typst-authoring/references/templates-and-packages.md`.
- Official Typst or Touying behavior: route through `_shared/docs/index.json` to one narrow page.
- Package capability/API: route through `_shared/packages/index.json` to one README and demo.

Read the paths above through `skill.read`; use `skill.list` when the relevant domain is not yet
known. Reuse references already in context. Never import a packaged Skill path from final Typst
source.
