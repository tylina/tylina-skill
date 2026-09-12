# SeaSlides Scripts in Tylina

These scripts are an optional command-line supplement. Tylina's shared commands remain authoritative
for the live main file, Typst compilation, diagnostics, rendering, and export.

## Runtime

Scripts require a host with a terminal and a real disk workspace. Check `help` for
`runtime.prepare` before proceeding. In a browser-only host, use the available document,
template and render commands instead; a virtual workspace root is not a local shell directory.

1. Call `workspace.info` and keep its `root` as the only workspace.
2. Call `runtime.prepare` once. A working global `uv` is returned immediately. If the result
   is `installing`, continue work with Tylina commands and retry later. If it is `failed`, do
   not install another `uv`; use `retry: true` only when retrying is useful.
3. Resolve this directory as
   `<skillsRoot>/typst-slides/scripts` from the returned `skillsRoot`.
4. Run the returned absolute `uvExecutable`, pass the returned environment variables, and set
   the command working directory to the workspace root. Do not modify `PATH` or shell profiles.

Scripts that need only Python's standard library can be run with:

```text
<uv> run --no-project python <script-root>/project_manager.py workspace <workspace> \
  --entry <main.typ> --json
```

For a script with third-party dependencies, add only its matching file:

```text
<uv> run --no-project --with-requirements <script-root>/runtime/pdf.txt \
  python <script-root>/source_to_md/pdf_to_md.py <input.pdf>
```

## Workspace Contract

- Never run `project_manager.py init` in Tylina.
- Use `project_manager.py workspace` only to inspect or prepare the current root. Pass the live
  workspace-relative main through `--entry`; `--prepare` may create only `assets/`, `output/`,
  and `sources/` in that root.
- Source converters and asset tools may write only to destinations explicitly chosen inside the
  current workspace.
- Treat `validate_project.py`, `typst_quality_checker.py`, and `typst_compiler.py` as optional
  workflow helpers. They never replace `document.validate`, `render.summary`, `render.page`, `render.overview`,
  `document.setMain`, or `document.export`.
- Do not use script output as a semantic Typst parse or as authority for editor selections,
  source ranges, logical slides, animation steps, or speaker-note ownership.

## Dependency Profiles

| Need | Requirement file |
|---|---|
| PDF/PNG/overview or optional PPTX helper | `runtime/compile.txt` |
| PDF source conversion | `runtime/pdf.txt` |
| PowerPoint source conversion | `runtime/presentation.txt` |
| DOCX, HTML, EPUB, or notebook conversion | `runtime/document.txt` |
| Spreadsheet conversion | `runtime/spreadsheet.txt` |
| Web conversion | `runtime/web.txt` |
| Image search, analysis, or generation | `runtime/image.txt` |
| Edge narration | `runtime/audio.txt` |

Read `README.md` or the focused file under `docs/` only after choosing a script. The upstream
all-in-one dependency list is retained as `requirements-upstream.txt` for compatibility, but
should not be the default because it installs unrelated packages.
