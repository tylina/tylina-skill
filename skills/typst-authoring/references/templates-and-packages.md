# Templates and Packages

Read this only when selecting, applying, or introducing a template or package.

## Templates

1. Preserve an existing selected scaffold, theme, and package versions.
2. If the user requests a template and no scaffold exists, call `template.list` before Web
   search, `typst init`, or hand-written styling.
3. Shortlist only relevant candidates. Call `template.inspect` for each exact spec to read
   its guide, manifest, entry source, files, and optional preview. Repository links are provenance,
   not a substitute for the selected version. Request a thumbnail only when visual comparison
   helps.
4. Inspection is read-only and does not apply a template. Continue with
   `template.create`; do not stop because inspection cannot write. Use the returned
   destination and entrypoint.
5. If conflicts require an isolated `themes/` or `templates/` path, author or select main from
   that real path.
6. If materialization is unavailable, report the template as unavailable. Do not guess private
   resource paths, overwrite a different file, or transcribe template source manually.
7. Do not claim a template was applied until its required files exist in the workspace and the
   selected main passes `document.validate`.

## Packages

- Existing imports and versions win. Never silently upgrade them or edit the package cache.
- Call `package.list` before Web search or a package CLI. It searches the current official
  Universe index, including packages that are not templates, and returns an exact `spec`,
  compatibility/provenance metadata, relevant `skillPaths`, and an optional `recipePath`.
- Search narrowly by capability, category, discipline, or known package name. Metadata supports
  shortlisting only: it does not prove the API, visual quality, licensing fit, or compatibility
  with an existing document.
- Read only the selected returned Skill paths and recipe. When those do not establish the needed
  API, call `package.inspect` with the returned exact `spec`. Request only the README, manifest,
  entrypoint, bounded file list, or one explicit source path needed for the task.
- `package.inspect` is read-only. Its paths are package-relative evidence, not workspace files;
  never edit the package cache, open the source as a Document/Lens target, or substitute
  repository HEAD for the selected version.
- `_shared/packages/index.json` is the compact catalog of pinned, compile-verified recipes. It is
  not the complete or current Universe index.
- Use `_shared/docs/index.json` to locate one focused official language or package reference.
- Treat bundled recipes as pinned examples, not permission to add every dependency they mention.
- Copy only required recipe assets into the workspace. Do not depend at runtime on `local/`, the
  package cache, or the bundled Skills directory.

### Evidence for an unfamiliar package

Use the narrowest source that can answer the current question:

1. Preserve the exact version already imported by the workspace. Read compiled local usage before
   introducing a second pattern.
2. Call `package.list` with the package name or one focused capability. Select the exact returned
   `spec`; a category match, description, popularity signal, or remembered API is only a lead.
3. Read the returned domain Skill and pinned recipe when present.
4. Call `package.inspect` for that exact `spec`. Start with `documentation` and `manifest`; request
   `entrypoint` and `files` only when needed. If an API remains unclear, request one explicit
   package-relative `source` path discovered from those results.
5. Follow the returned repository or documentation URL only when the selected package contents do
   not answer the question. Prefer the selected release/tag or revision. Repository HEAD, issues,
   examples for another version, and third-party tutorials are context, not proof of the installed
   API.
6. Build a minimal use in the real workspace, run `document.validate`, and inspect affected output.
   A README example without compilation is not a verified integration.

Use the [official Typst documentation](https://typst.app/docs/) for language, standard-library,
export, and compiler behavior. Use [Typst Universe](https://typst.app/universe/) and Tylina's
package tools for current package discovery. [Best of Typst](https://ydx-2147483647.github.io/best-of-typst/)
can supply search vocabulary and external project leads, including AI/LLM tooling, but its ranking
does not establish version compatibility, maintenance, license suitability, security, or API
correctness.

All packaged text paths are resource identifiers readable with `skill.read`. Templates and binary
assets enter the workspace only through the owning materializer or import command.
