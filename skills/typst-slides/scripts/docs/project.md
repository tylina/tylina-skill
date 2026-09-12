# Project Management Tools

This document describes the tools for managing Touying/Typst presentation projects.

## Contents

- [Project Manager](#project-manager)
- [Use an Existing Workspace](#use-an-existing-workspace)
- [Error Helper](#error-helper)
- [Project Utils](#project-utils)
- [Batch Validation](#batch-validation)
- [Configuration](#configuration)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

## Project Manager

The `project_manager.py` script provides unified project management functionality.

### Initialize a New Project

Create a new Touying project with the standard directory structure.

```bash
python3 project_manager.py init <project_name> [--dir projects] [--exact-name]
```

By default the directory receives a date suffix. `--exact-name` creates a deterministic, date-free directory name after safety sanitization. Canvas format is selected with the theme/project configuration, not by `project_manager.py init`.

#### Created Structure
```
project_name_YYYYMMDD/
├── assets/           # Images and resources
├── output/           # Compiled output files
├── sources/          # Imported source materials
└── README.md         # Project structure summary
```

`main.typ` and `template.typ` are added during theme selection/authoring rather than by initialization.

### Use an Existing Workspace

Attach SeaSlides tooling to a directory already owned by an editor or user:

```bash
python3 project_manager.py workspace <workspace_path> --entry <entry.typ> --prepare
```

The entry is a workspace-relative `.typ` path and may be nested. Absolute paths, `..` escapes,
and symlink escapes are rejected. `--prepare` creates only missing `assets/`, `output/`, and
`sources/` directories. It never creates a child project or overwrites the entry.

Pass the same entry to the publication pipeline:

```bash
python3 typst_compiler.py <workspace_path> --all --entry <entry.typ>
python3 typst_quality_checker.py <workspace_path> --entry <entry.typ>
python3 validate_project.py <workspace_path> --entry <entry.typ>
```

Converters launched by `import-sources` run with the attached workspace as their current directory.
This keeps relative outputs and configuration discovery within the user's active workspace.

### Import Source Files

Copy or move source files into the project.

```bash
python3 project_manager.py import-sources <project_path> <source_files...> [--move | --copy]
```

#### Options
- `--move`: Move source files instead of copying; use only when explicitly requested
- `--copy`: Explicit spelling of the default non-destructive copy behavior; mutually exclusive with `--move`

By default, source files are copied. URL imports are recorded and normalized by the importer; review the command summary for archived originals, normalized Markdown, imported asset directories, notes, and skipped inputs.

### Copy a Theme

```bash
python3 project_manager.py copy-theme <project_path> <theme_name>
```

The command resolves the named theme through the registered theme directories and copies its project-owned files without overwriting existing files.

### Validate Project

Run the lightweight project-manager check or the final structural/semantic validator.

```bash
python3 project_manager.py validate <project_path>
python3 validate_project.py <project_path>
python3 validate_project.py <project_path> --entry <entry.typ>
python3 validate_project.py <project_path> --mode quick
python3 validate_project.py <theme_path> --mode theme
```

Use the default `delivery` mode for Full Mode projects. Use `quick` for a final delivery that
intentionally omits `content_design_spec.md`; it still requires compiled output. Use `theme` only
for theme-development projects that intentionally omit both the delivery bundle and design spec.
Run `typst_quality_checker.py` before the final validator; it verifies artifact integrity and
compile-manifest coherence that `validate_project.py` does not duplicate.

#### Project Manager Checks
- Required files exist (main.typ, template.typ)
- Required directories exist (assets/, output/)
- main.typ contains valid content

### Inspect Project Information

Inspect project metadata and source status.

```bash
python3 project_manager.py info <project_path>
```

## Error Helper

The `error_helper.py` script provides diagnostics for common Typst errors.

### Look Up a Known Error Code

Pass one of the helper's stable error keys, optionally followed by `key=value` context.

```bash
python3 error_helper.py overflow project_path=<project_path>
python3 error_helper.py missing_main_typ project_path=<project_path>
```

The file-analysis functions in `error_helper.py` are library APIs consumed by `typst_quality_checker.py`; they are not separate `--file` CLI options.

## Project Utils

The `project_utils.py` module provides utility functions for project operations.

### Available Functions
- `parse_project_name()` and `get_project_info()`: Read project metadata
- `validate_project_structure()`: Validate project integrity
- `find_all_projects()` and `list_projects()`: Discover projects
- `create_directory_structure()` and `copy_or_move_files()`: Shared filesystem helpers
- `clean_output_directory()`: Destructive maintenance helper; do not call during ordinary validation
- `get_project_stats()`: Summarize file counts and sizes

## Batch Validation

The `batch_validate.py` script validates multiple projects at once. Unless
`--no-compile` is used, each structurally valid project runs the public
`typst_compiler.py --all` pipeline, delivery validation, and the default
blocker-level `typst_quality_checker.py` audit. Review/advisory diagnostics are
reported as warnings; blockers fail the batch result.

```bash
python3 batch_validate.py --dir ../examples
python3 batch_validate.py --dir ./projects --verbose
python3 batch_validate.py --dir ./projects --no-compile
python3 batch_validate.py --dir ./projects --export report.txt
```

#### Options
- `--dir`: Root directory containing Typst projects (default: `.`)
- `--verbose, -v`: Show detailed validation messages
- `--no-compile`: Skip compilation, delivery validation, and quality audit;
  the row is reported as not fully validated (`N/A`), not as a full pass;
  structure errors still fail and a structurally valid requested scan exits 0
- `--export`: Export report to a text file

## Configuration

The `config.py` module contains project configuration settings.

### Available Settings
- `INDUSTRY_COLORS`: 18 industry color schemes
- `FONT_PRESETS`: P1-P5 font presets
- `PAGE_FORMATS`: Page format configurations
- `DEFAULT_PACKAGES`: Default Typst packages

### CLI Inspector

```bash
python3 config.py list-formats      # List available page formats
python3 config.py list-colors       # List design color schemes
python3 config.py list-industries   # List industry color palettes
python3 config.py list-fonts        # List font presets
python3 config.py export            # Export all configuration as JSON
python3 config.py ppt169            # Show details for a specific format
```

### Programmatic Usage

```python
from config import get_industry_colors, get_font_preset, export_config

colors = get_industry_colors('technology')
fonts = get_font_preset('P1')
all_config = export_config()  # Returns full config as dict
```

## Best Practices

1. **Initialize only new standalone projects**; attach existing workspaces in place
2. **Validate before compiling** to catch issues early
3. **Use descriptive project names** for easy identification
4. **Keep assets organized** in the assets/ directory
5. **Let the compiler publish output**; do not clean or rewrite output merely to satisfy a validator

## Troubleshooting

### Project Not Found
Ensure you're using the correct project path relative to the current directory.

### Validation Fails
Check that all required files and directories exist in the project.

### Import Issues
Verify source files exist and you have read permissions.
