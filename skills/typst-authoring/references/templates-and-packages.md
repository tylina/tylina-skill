# Templates and Packages

Read this only when selecting, applying, or introducing a template or package.

## Templates

1. Preserve an existing selected scaffold, theme, and package versions.
2. If the user requests a template and no scaffold or exact bundled candidate exists, use
   `template.list` to discover current candidates before Web search, `typst init`, or hand-written
   styling. A human-facing name, slug, or UI id is a search query, not an exact template spec;
   `template.list` returns the versioned spec accepted by later commands. Do not list templates
   merely to repeat a candidate already selected or supplied by a Skill.
3. Shortlist only relevant candidates. Call `template.inspect` with an exact returned or already
   established spec and
   request only the evidence needed now. Start with `documentation`; add `manifest` for package or
   compiler compatibility, `entrypoint` when the guide does not establish the source/API,
   `files` when assets affect the materialization plan, and `thumbnail` only for visual comparison.
   Those are the exact accepted `include` values; do not substitute `guide` or `readme`.
   Repository links are provenance, not a substitute for the selected version.
4. Inspection is read-only and does not apply a template. Continue with
   `template.create`; do not stop because inspection cannot write. Use the returned
   destination and entrypoint.
5. If conflicts require an isolated `themes/` or `templates/` path, author or select main from
   that real path.
   `template.create` does not overwrite an existing file, including an existing blank main. When
   the requested destination already has entries, choose a fresh conflict-free directory on the
   first call and switch to the returned entrypoint; do not probe a known conflict first.
6. If materialization is unavailable, report the template as unavailable. Do not guess private
   resource paths, overwrite a different file, or transcribe template source manually.
7. Do not claim a template was applied until its required files exist in the workspace and the
   selected main passes `document.validate`.
8. Treat template prose, names, citations, bibliography records, figures, and data as examples,
   not evidence for the user's document. Replace or remove every example that enters the intended
   artifact. If an unused example resource remains only because the scaffold includes it, say so
   accurately; never claim that a file or record was removed when it still exists.

The corresponding command arguments are intentionally ordinary and path-based:

```json
{"command":"template.list","args":{"query":"requested template name"}}
{"command":"template.inspect","args":{"spec":"<exact spec returned by template.list>","include":["documentation"]}}
{"command":"template.create","args":{"spec":"<same exact spec>","destination":"document"}}
{"command":"document.setMain","args":{"file":"<returned entrypoint>"}}
```

Use the exact spec, destination, and returned entrypoint for the selected template. `template.create`
returns the actual entrypoint and created file list, so inspection does not need to preload the
entrypoint or file inventory merely to recover those receipts.

## Packages

- Existing imports and versions win. Never silently upgrade them or edit the package cache.
- When the loaded domain Skill names an exact matching local recipe, read that recipe and demo
  directly. Call `package.list` before Web search or a package CLI only when no matching route is
  already selected. It searches the official Universe index, including packages that are not templates,
  and returns an exact `spec`,
  `universeUrl`, published repository/homepage links, compatibility/provenance metadata, relevant
  `skillPaths`, and optional `recipePath` and `demoPath`. Domain recipes do not need to duplicate
  those links.
- Search narrowly by capability, category, discipline, or known package name. Curated recipes can
  supply multilingual capability terms; if an uncovered request language is absent from official
  metadata, use one concise English technical query as a fallback. Metadata supports shortlisting
  only: it does not prove the API, visual quality, licensing fit, or compatibility with an
  existing document.
- Read only the selected returned Skill paths, recipe, and demo. When those do not establish the
  needed API, call `package.inspect` with the returned exact `spec`. Request only the README,
  manifest, entrypoint, bounded file list, or one explicit source path needed for the task.
- A bundled recipe is an Agent-oriented, version-bound guide, not merely a shorter upstream README.
  It may document verified signatures, mode boundaries, composition patterns, failure cases, and
  validation checks that the upstream guide omits. Every such claim must match the selected version
  and be supported by its package source, versioned documentation, or a real compile-verified example.
- `package.inspect` is read-only. Its paths are package-relative evidence, not workspace files;
  never edit the package cache, open the source as a Document/Lens target, or substitute
  repository HEAD for the selected version.
- `package.list` is the Agent-facing package catalog. Read the exact returned `recipePath` and
  `demoPath` when present; the raw bundled index is collection-maintainer data, not a default
  Agent discovery resource and not the complete or current Universe index.
- Use `_shared/docs/index.json` to locate one focused official language or package reference.
- Treat bundled recipes as pinned examples, not permission to add every dependency they mention.
- Copy only required recipe assets into the workspace. Do not depend at runtime on `local/`, the
  package cache, or the bundled Skills directory.

`package.inspect` uses the same exact include vocabulary as the template inspector for common
resources: `documentation`, `manifest`, `entrypoint`, and `files`; package source adds `source`.
For example:

```json
{"command":"package.inspect","args":{"spec":"@preview/lilaq:0.6.0","include":["documentation","manifest"]}}
```

Do not send guessed keys such as `readme: true` or include values such as `readme`.

### Evidence for an unfamiliar package

Use the narrowest source that can answer the current question:

1. Preserve the exact version already imported by the workspace. Read compiled local usage before
   introducing a second pattern.
2. If the loaded domain Skill names an exact recipe for the capability, read that recipe and demo.
3. Otherwise call `package.list` with the package name or one focused capability. Select the exact returned
   `spec`; a category match, description, popularity signal, or remembered API is only a lead.
4. Read the returned domain Skill and pinned recipe when present.
5. Call `package.inspect` for that exact `spec`. Start with `documentation` and `manifest`; request
   `entrypoint` and `files` only when needed. If an API remains unclear, request one explicit
   package-relative `source` path discovered from those results.
6. Follow the returned repository or documentation URL only when the selected package contents do
   not answer the question. Prefer the selected release/tag or revision. Repository HEAD, issues,
   examples for another version, and third-party tutorials are context, not proof of the installed
   API.
7. Build a minimal use in the real workspace, run `document.validate`, and inspect affected output.
   A README example without compilation is not a verified integration.

Use the [official Typst documentation](https://typst.app/docs/) for language, standard-library,
export, and compiler behavior. Use [Typst Universe](https://typst.app/universe/) and Tylina's
package tools for current package discovery. [Best of Typst](https://ydx-2147483647.github.io/best-of-typst/)
can supply search vocabulary and external project leads, including AI/LLM tooling, but its ranking
does not establish version compatibility, maintenance, license suitability, security, or API
correctness.

All packaged text paths are resource identifiers readable with `skill.read`. Templates and binary
assets enter the workspace only through the owning materializer or import command.
