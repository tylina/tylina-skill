# SeaSlides Typst Slides Toolset

This directory contains stable workflow entry points, specialized maintenance tools, and shared Python modules for SeaSlides Typst projects.

## Contents

- [Directory Layout](#directory-layout)
- [Quick Start](#quick-start)
- [Script Index](#script-index)
- [Internal Modules](#internal-modules)
- [High-Frequency Commands](#high-frequency-commands)
- [Recommendations](#recommendations)
- [Related Docs](#related-docs)

## Directory Layout

- Top-level `scripts/`: stable entry points plus a small number of shared modules
- `scripts/source_to_md/`: source converters and conversion-receipt support
- `scripts/image_backends/`, `scripts/image_sources/`, `scripts/tts_backends/`: provider internals used through their unified entry points
- `scripts/docs/`: topic-focused operational documentation
- `scripts/tests/`: maintenance tests; do not load them during ordinary presentation generation

Install `${SKILL_DIR}/requirements.txt` before probing provider-specific CLIs; some tools import their required libraries before argument parsing.

## Quick Start

Typical end-to-end workflow:

```bash
python3 scripts/source_to_md/pdf_to_md.py <file.pdf>
# or
python3 scripts/source_to_md/ppt_to_md.py <deck.pptx>
python3 scripts/project_manager.py init <project_name>
# Existing editor/user workspace instead:
python3 scripts/project_manager.py workspace <workspace_path> --entry <entry.typ> --prepare
python3 scripts/project_manager.py import-sources <project_path> <source_files...> --copy
# ... AI generates template.typ and main.typ ...
python3 scripts/typst_compiler.py <project_path> --all
python3 scripts/typst_quality_checker.py <project_path>
# Export to PPTX (optional)
python3 scripts/typst_compiler.py <project_path> --format pptx
```

Add `--exact-name` only for deterministic benchmark/test directories; normal projects keep the dated suffix.
Never run `init` inside an existing workspace. Use `workspace` and keep passing its returned entry through
`--entry`; nested entry files still publish artifacts under the workspace root `output/` directory.

## Script Index

Use the primary workflow entry points first. Load specialized tools only for the named need.

| Need | Scripts or modules | Role and caution | Documentation |
|---|---|---|---|
| Convert source material | `source_to_md/pdf_to_md.py`, `doc_to_md.py`, `ppt_to_md.py`, `excel_to_md.py`, `web_to_md.py` | Normal source-ingestion path | [Conversion](./docs/conversion.md) |
| Inventory converted sources | `source_inventory.py` | Read-only Markdown inventory on stdout | [Image tools](./docs/image.md) |
| Create, import, inspect, or validate projects | `project_manager.py` | Preferred project lifecycle CLI | [Project tools](./docs/project.md) |
| Compile PDF/PNG/overview or export PPTX | `typst_compiler.py` | Preferred publication entry point | [Typst pipeline](./docs/typst-pipeline.md) |
| Audit compiled quality | `typst_quality_checker.py` | Read-only diagnostic gate; does not republish output | [Typst pipeline](./docs/typst-pipeline.md) |
| Validate Full/Quick delivery or theme structure and semantics | `validate_project.py` | Final structural/semantic contract check | [Project tools](./docs/project.md) |
| Validate many projects | `batch_validate.py` | Batch/maintenance use; may compile when requested | See `--help` |
| Generate AI images | `image_gen.py` | Unified provider dispatcher | [Image tools](./docs/image.md) |
| Search licensed web images | `image_search.py` | Writes the image and attribution manifest | [Image tools](./docs/image.md) |
| Analyze image dimensions | `analyze_images.py` | Writes an analysis CSV next to the image directory | [Image tools](./docs/image.md) |
| Convert SVG to PNG/overview | `svg_to_png.py` | Single, batch, and overview conversion | See `--help` |
| Inspect or repair image orientation | `rotate_images.py` | `gen <images_directory>` is diagnostic; `fix <fixes.json>` modifies image files | Module docstring |
| Remove a Gemini image watermark | `gemini_watermark_remover.py` | Provider-specific image rewrite; preserve the original asset | Module docstring; requires installed dependencies |
| Generate narration audio | `notes_to_audio.py` | Run only after slide content and notes are stable | [Audio workflow](../workflows/generate-audio.md) |
| Apply the legacy MiTeX/dash repair | `fix_and_compile.py` | Narrow source-rewriting migration; inspect its diff and do not use as a general fixer | See `--help` |
| Inspect configuration | `config.py` | Lists formats, palettes, fonts, or exports configuration JSON | See `--help` |
| Explain a known error code | `error_helper.py` | Diagnostic helper used by validators; run without arguments to list keys | [Project tools](./docs/project.md) |
| Regenerate the examples catalog | `generate_examples_index.py` | Repository maintenance; writes index files | See `--help` |
| Troubleshoot validation, preview, export, or dependencies | — | Start with the documented symptom | [Troubleshooting](./docs/troubleshooting.md) |

`typ2pptx` is an external CLI dependency used by `typst_compiler.py --format pptx`; invoke it directly only when diagnosing the adapter.

## Internal Modules

- `project_utils.py` — shared project discovery, structure, and filesystem helpers. Prefer `project_manager.py` or `validate_project.py` as the user-facing CLI.
- `typst_diagnostics.py` — stable diagnostic taxonomy consumed by quality tools; it is not a standalone CLI.
- `typst_lazy_layout_check.py` — narrow parser consumed by validators and tests; it is not a standalone CLI.
- Provider modules under `image_backends/`, `image_sources/`, and `tts_backends/` — load them only when maintaining a backend. Normal workflows use `image_gen.py`, `image_search.py`, or `notes_to_audio.py`.
- `source_to_md/conversion_receipt.py` — shared conversion-receipt implementation used by source converters and validators.

## High-Frequency Commands

Project setup:
```bash
python3 scripts/project_manager.py init <project_name>
python3 scripts/project_manager.py workspace <workspace_path> --entry <entry.typ> --prepare
python3 scripts/project_manager.py import-sources <project_path> <source_files...> --copy
python3 scripts/project_manager.py copy-theme <project_path> <theme_name>
python3 scripts/project_manager.py validate <project_path>
```

Compilation and export:
```bash
# Compile to PDF
python3 scripts/typst_compiler.py <project_path> --format pdf
# Compile to PNG (for visual inspection)
python3 scripts/typst_compiler.py <project_path> --format png --ppi 144
# Overview grid (all slides in one image, for quick visual scan)
python3 scripts/typst_compiler.py <project_path> --format overview --ppi 72
# Export to editable PPTX
python3 scripts/typst_compiler.py <project_path> --format pptx
# Compile PDF, PNG, and overview, then write their coherent compile manifest
python3 scripts/typst_compiler.py <project_path> --all
# Read-only severity-aware quality gate (diagnostics, page count, artifact integrity, JSON receipt)
python3 scripts/typst_quality_checker.py <project_path>
```

Image generation:
```bash
python3 scripts/image_gen.py "A modern futuristic workspace"
python3 scripts/image_gen.py --list-backends
python3 scripts/image_search.py "offshore wind farm" --filename hero.jpg -o <project_path>/assets
python3 scripts/analyze_images.py <project_path>/assets
```

## Recommendations

- Keep stable user-facing entry points at the top level of `scripts/`
- Use `project_manager.py workspace` for an existing root; never create a nested project implicitly
- Put provider-specific implementations and non-CLI helpers in focused subdirectories
- Prefer the unified entry points `project_manager.py`, `typst_compiler.py`, and `image_gen.py`
- Run `typst_compiler.py --all` before `typst_quality_checker.py`; the checker audits existing artifacts and never republishes them
- Read a write-capable tool's `--help` and preserve originals before running repair, rotation, watermark-removal, or index-generation commands
- Always compile, inspect every rendered page, and verify Typst output before delivering

## Related Docs

- [Conversion Tools](./docs/conversion.md)
- [Project Tools](./docs/project.md)
- [Typst Pipeline Tools](./docs/typst-pipeline.md)
- [Image Tools](./docs/image.md)
- [Troubleshooting](./docs/troubleshooting.md)
