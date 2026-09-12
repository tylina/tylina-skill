# Typst Compilation Pipeline

This document describes the tools and workflow for compiling Typst presentations.

## Contents

- [Tools](#tools)
- [Output Structure](#output-structure)
- [Workflow](#workflow)
- [Requirements](#requirements)
- [Common Issues](#common-issues)

## Tools

### typst_compiler.py

Unified interface for compiling Typst projects to various formats.

```bash
python3 typst_compiler.py <project_path> --all                  # PDF + PNG + overview (no PPTX)
python3 typst_compiler.py <project_path> --format pdf
python3 typst_compiler.py <project_path> --format png --ppi 144
python3 typst_compiler.py <project_path> --format overview
python3 typst_compiler.py <project_path> --format pptx          # Final export (after review)
python3 typst_compiler.py <project_path> --format pptx --force  # Overwrite externally modified PPTX
```

| Option | Description |
|--------|-------------|
| `--all` | Compile PDF + PNG + overview (excludes PPTX) |
| `--format` | Single format: `pdf`, `png`, `pptx`, `overview` |
| `--ppi` | Pixels per inch for PNG output (default: 144) |
| `--max-width` | Max overview image width in pixels (default: 2000) |
| `--max-height` | Max overview image height in pixels (default: 2000) |
| `--force` | Force overwrite externally modified PPTX files |

> **PPTX timestamp protection**: Each PPTX generation writes a `.slides.pptx_timestamp` file. If the PPTX is modified externally (e.g. in PowerPoint), subsequent generation will refuse to overwrite unless `--force` is passed.

PDF, PNG, and overview outputs are published only after the requested format is
fully generated. PNG compilation uses an isolated temporary directory, replaces
only numeric files matching the configured `slide_{n}.png` pattern, and preserves
unrelated user files. After all three canonical formats succeed, `--all` writes
`output/compile-manifest.json` with the entry hash, page count, and artifact
hashes. `--all` is still a sequence of three per-format publications rather than
a filesystem transaction; an interrupted run leaves the previous manifest in
place so the quality checker can reject a mixed artifact set.

### typst_quality_checker.py

Audits compiled output quality without modifying `output/`. It compiles PDF and
low-resolution PNG data only in memory to collect diagnostics and establish the
authoritative page count; it never overwrites `slides.pdf`, overview, or page PNGs.

```bash
python3 typst_quality_checker.py <project_path>
python3 typst_quality_checker.py <project_path> --expected-pages 20
python3 typst_quality_checker.py <project_path> --output report.txt
python3 typst_quality_checker.py <project_path> --json audit.json
python3 typst_quality_checker.py <project_path> --fail-on review
```

Checks: in-memory compilation status, authoritative rendered page count, expected
page count, compiler diagnostics, and conservative entry-file source signals.
When `--entry demo.typ` has a local sibling `template.typ`, its spacing rules
are checked too. Negative vertical stack spacing is review; zero-gap vertical
stacks are advisory because seamless component joins are a common valid
exception. The checker does not impose a positive minimum because tiny labels,
dimension marks, and decorative primitives may be intentionally compact.
KPI/stat/metric icon → value → label composition remains a source and
rendered-review rule: the checker does not infer component semantics from
function names. Entry-point-only import/show/TCS heuristics are not applied to
the template.
It does not count pre-existing PNG files for page-count evidence. It does require
the `--all` artifact contract: non-empty `slides.pdf`, `overview.png`, and a
fresh, decodable, uniquely numbered `output/pngs/slide_1.png ... slide_N.png`
set whose count matches the authoritative render. Freshness includes the entry,
the sibling template, recursively resolvable local Typst imports/includes, and
literal local image/data dependencies. Missing, corrupt, incomplete, or stale
visual artifacts, or an artifact set that does not match `compile-manifest.json`,
are blocker diagnostics;
rerun `typst_compiler.py <project_path> --all` before checking again.

Diagnostics use three severities:

| Severity | Default behavior | Examples |
|----------|------------------|----------|
| `blocker` | Fails the default gate | compile/output failure, missing resource, content overflow, layout non-convergence, expected-page mismatch |
| `review` | Requires source/render disposition | font fallback, literal undersized vertical `em` stack, unavailable warning-capture API, unclassified compiler warning |
| `advisory` | Maintenance or low-confidence render guidance | Touying flow-only empty-slide signal, zero-gap seamless-stack reminder, old package-owned Touying version, auto-break literal proxy, raw-text future syntax |

Use `--fail-on blocker` (the default), `review`, `advisory`, or `none` to
configure the quality threshold. A completed audit can still have status
`review` while passing the default blocker gate. The process exits `0` when the
configured gate passes, `1` when it fails, and `2` when the audit cannot
complete. `--json` writes the stable machine-readable receipt; `--output` keeps
the human-readable report.

## Output Structure

```
<project_path>/output/
├── slides.pdf              # PDF output
├── overview.png            # All slides in one grid (auto-sized for LLM review)
├── compile-manifest.json   # Successful --all entry/page/artifact receipt
├── pngs/
│   ├── slide_1.png         # High-res PNGs (144 PPI)
│   ├── slide_2.png
│   └── ...
└── slides.pptx             # PPTX output (generated separately via --format pptx)
```

## Workflow

### 1. Create & Edit Project
```bash
python3 project_manager.py init my-presentation
```
Edit `main.typ` and `template.typ` as needed.

### 2. Compile
```bash
python3 typst_compiler.py my-presentation --all
```
Produces PDF, PNGs, and overview. If compilation fails, diagnose the source and retry up to five times as defined by the main workflow.

### 3. Quality Check
```bash
python3 typst_quality_checker.py my-presentation --expected-pages <known-count>
```

Fix all blocker diagnostics. Disposition every review diagnostic against source
and the rendered PNGs; do not treat a fully populated `place()`-only slide as
empty merely because Touying reports zero flow height.

### 4. Visual Review

**Pass 1**: Read `output/overview.png` for a quick scan of all slides in one image.
**Pass 2**: If issues are spotted, read specific `output/pngs/slide_*.png` for detailed inspection.

| Check | What to Look For |
|-------|-----------------|
| **Overflow** | Text cut off or overflowing slide boundary |
| **Layout** | Elements aligned, whitespace balanced |
| **Color** | Text readable, colors match design spec |
| **Content** | Matches outline, nothing missing |
| **Typography** | Clear hierarchy (title > body > caption) |
| **Density** | Appropriate content per slide |

If issues found → fix code → re-compile → re-review (max 3 iterations).

### 5. Code Quality Review

- **Template-Content Separation**: No raw `rgb()` or ad hoc filled/stroked component styling in Plain/Rich `main.typ`; structural layout and local typography remain allowed
- **main.typ Conciseness**: Use theme components for reusable patterns and keep one-off structure readable; do not enforce a source-line quota
- **Maintainability**: Global visual changes belong in `template.typ` rather than repeated page-level overrides

### 6. Export PPTX (final step)

Only after all reviews pass:
```bash
python3 typst_compiler.py my-presentation --format pptx
```

## Requirements

All Python dependencies are listed in `requirements.txt` at the skill root:

```bash
pip install -r requirements.txt
```

- **typst** (Python package): Typst compiler binding — compile `.typ` to PDF/PNG
- **typ2pptx**: Convert Typst presentations to editable PPTX
- **Pillow**: Image processing for overview grid generation

## Common Issues

| Issue | Solution |
|-------|---------|
| **Compilation fails** | Check syntax in `main.typ`, verify imports, ensure fonts installed |
| **Wrong page count** | Check for hidden slides or empty pages |
| **Overflow warnings** | Reduce content, adjust font sizes, split across slides |
| **Font not found** | Install missing fonts or use system fonts |
