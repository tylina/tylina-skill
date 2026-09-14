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
6. For bundled resources only, if materialization is unavailable but direct filesystem access
   exists, copy the exact directory from a trusted root returned by `workspace.info`.
   Registry templates without a trusted host path remain unavailable; never overwrite a different
   file or transcribe template source manually.
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
- Read only the selected returned Skill paths and recipe. When there is no recipe, inspect the
  exact package version through its official Universe or repository documentation before editing.
- `_shared/packages/index.json` is the compact catalog of pinned, compile-verified recipes. It is
  not the complete or current Universe index.
- Use `_shared/docs/index.json` to locate one focused official language or package reference.
- Treat bundled recipes as pinned examples, not permission to add every dependency they mention.
- Copy only required recipe assets into the workspace. Do not depend at runtime on `local/`, the
  package cache, or the bundled Skills directory.

All packaged text paths are relative to Tylina's Skills root and readable with
`skill.read`. Resolve scripts and binary assets through `skillsRoot` from
`workspace.info` or `runtime.prepare`.
