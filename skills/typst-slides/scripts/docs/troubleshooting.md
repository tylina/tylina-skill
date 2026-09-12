# Troubleshooting Guide

This document provides solutions to common issues with the SeaSlides Typst Slides toolset.

## Contents

- [Installation Issues](#installation-issues)
- [Project Issues](#project-issues)
- [Compilation Issues](#compilation-issues)
- [Image Issues](#image-issues)
- [Conversion Issues](#conversion-issues)
- [Performance Issues](#performance-issues)
- [Getting Help](#getting-help)
- [Common Patterns](#common-patterns)
- [Additional Resources](#additional-resources)

## Installation Issues

### Typst Binding or CLI Not Found

**Error**: `ModuleNotFoundError: No module named 'typst'` or `typst is not installed or not in PATH`

**Solution**:
```bash
# Install the Python binding used by SeaSlides scripts, from the skill root
pip install -r requirements.txt
python3 -c "import typst; print('Typst Python binding available')"

# If you separately installed the optional standalone CLI, verify it
typst --version
```

Install the standalone CLI from the official Typst installation instructions only when a direct `typst` or `typst watch` command is needed; the SeaSlides compiler uses the Python binding.

### Pandoc Not Found

**Error**: `Pandoc is not installed or not in PATH`

**Solution**:
```bash
# macOS
brew install pandoc

# Ubuntu/Debian
sudo apt-get install pandoc

# Or download from https://pandoc.org/installing.html

# Verify installation
pandoc --version
```

### Missing Python Packages

**Error**: `ModuleNotFoundError: No module named 'xxx'`

**Solution**:
```bash
# From the skill root
pip install -r requirements.txt
```

## Project Issues

### Project Initialization Fails

**Error**: `Project directory already exists`

**Solution**:
```bash
# Use a different project name
python3 project_manager.py init my-presentation-2
```

Inspect the existing directory before deciding whether it should be reused, renamed, or removed. Project initialization never authorizes deleting it.

### Validation Fails

**Error**: `Missing required file: main.typ`

**Solution**:
```bash
# Copy a selected theme, then author main.typ from the approved design spec
python3 project_manager.py copy-theme <project_path> <theme_name>
python3 project_manager.py validate <project_path>
```

`project_manager.py init` creates the project directories but intentionally does not create empty `main.typ` or `template.typ` placeholders.

### Import Sources Fails

**Error**: `Source file not found`

**Solution**:
```bash
# Verify file paths are correct
ls -la <source_file>

# Use absolute paths if needed
python3 project_manager.py import-sources <project> /full/path/to/file.pdf

# Check file permissions
chmod 644 <source_file>
```

## Compilation Issues

### Compilation Fails

**Error**: `error: unknown function: xxx`

**Solutions**:
```bash
# 1. Check import statements
# Ensure touying is imported:
#show: slide.with(...)

# 2. Verify function names are spelled correctly

# 3. Look up the matching stable error category
python3 error_helper.py unknown_function

# 4. Check Typst documentation
# https://typst.app/docs/
```

### Overflow Warnings

**Error**: `warning: content overflow`

**Solutions**:
```bash
# 1. Refresh the canonical artifacts, then run the read-only quality check
python3 typst_compiler.py <project_path> --all
python3 typst_quality_checker.py <project_path>

# 2. Reduce content per slide
# - Shorten text
# - Use smaller fonts
# - Split into multiple slides

# 3. Adjust layout
# - Use columns
# - Reduce margins
# - Resize images
```

### Font Not Found

**Error**: `error: font not found: xxx`

**Solutions**:
```bash
# 1. Check available fonts
typst fonts

# 2. Install missing fonts
# macOS: Copy to ~/Library/Fonts/
# Linux: Copy to ~/.local/share/fonts/
# Windows: Copy to C:\Windows\Fonts\

# 3. Use system fonts
# Change font names in template.typ

# 4. Specify font path
#set text(font: "/path/to/font.ttf")
```

### Wrong Page Count

**Error**: Expected 20 pages, got 18

**Solutions**:
```bash
# 1. Check for empty slides
# Review main.typ for empty sections

# 2. Verify page breaks
# Ensure page breaks are correctly placed

# 3. Check for hidden content
# Some content may not be rendering

# 4. Recompile and compare against the intended physical page count
python3 typst_compiler.py <project_path> --all
python3 typst_quality_checker.py <project_path> --expected-pages 20
```

## Image Issues

### Image Generation Fails

**Error**: `Error generating image: xxx`

**Solutions**:
```bash
# 1. Check backend availability
python3 image_gen.py --list-backends

# 2. Verify API credentials
# Check backend-specific configuration

# 3. Try different backend
python3 image_gen.py "prompt" --backend <other_backend>

# 4. Check network connectivity
ping api.example.com
```

### Image Not Found

**Error**: `file not found: image.png`

**Solutions**:
```bash
# 1. Verify image path
# Use relative paths from main.typ location

# 2. Check image location
# Images should be in assets/ directory

# 3. Import sources non-destructively
python3 project_manager.py import-sources <project> image.png --copy

# 4. Use absolute path (not recommended)
#image("/full/path/to/image.png")
```

### Image Too Large

**Error**: Content overflow due to large image

**Solutions**:
```bash
# 1. Analyze image size
python3 analyze_images.py <project>/assets

# 2. Resize image
# Use image editing software or Python

# 3. Adjust image in Typst
#image("image.png", width: 50%)

# 4. Re-render and inspect the affected slide
python3 typst_compiler.py <project_path> --all
```

## Conversion Issues

### PDF Conversion Fails

**Error**: `PyMuPDF (fitz) is not installed`

**Solution**:
```bash
pip install pymupdf

# Or use pdfplumber
pip install pdfplumber
```

### Webpage Conversion Fails

**Error**: `Error fetching webpage: xxx`

**Solutions**:
```bash
# 1. Check URL is accessible
curl <url>

# 2. Install curl_cffi for sites that reject plain requests
pip install curl_cffi

# 3. Check network connectivity
ping example.com

# 4. Use different user agent
# Modify script to include headers
```

### Pandoc Conversion Fails

**Error**: `Error during conversion: xxx`

**Solutions**:
```bash
# 1. Verify file format is supported
pandoc --list-input-formats

# 2. Check file is not corrupted
file <input_file>

# 3. Try different output format
pandoc -f docx -t markdown -o output.md input.docx

# 4. Use verbose output
pandoc -v input.docx -o output.md
```

## Performance Issues

### Slow Compilation

**Solutions**:
```bash
# 1. Reduce image sizes
# Compress images before importing

# 2. Use PDF instead of PNG
# PDF compilation is faster

# 3. Disable unnecessary features
# Remove unused packages

# 4. Use typst watch while editing, then publish through typst_compiler.py
typst watch <project_path>/main.typ
```

### Out of Memory

**Error**: Memory error during compilation

**Solutions**:
```bash
# 1. Reduce image resolution
# Resize images to smaller dimensions

# 2. Compile in batches
# Split large presentations

# 3. Close other applications
# Free up system memory

# 4. Increase system swap
# Add more virtual memory
```

## Getting Help

### Check Documentation
- [Typst Documentation](https://typst.app/docs/)
- [Touying Documentation](https://github.com/touying-typ/touying)
- [Script Documentation](./)

### Use Error Helper
```bash
python3 error_helper.py <known_error_code> project_path=<project_path>
```

### Run Quality Check
```bash
python3 typst_quality_checker.py <project_path>
```

### Validate Project
```bash
python3 project_manager.py validate <project_path>
```

## Common Patterns

### Fresh Start
```bash
# Create a separate project and copy sources non-destructively
python3 project_manager.py init <new_project_name>
python3 project_manager.py import-sources <new_project_path> <sources> --copy
```

### Debug Mode
```bash
# Publish canonical artifacts, then run both validation layers
python3 typst_compiler.py <project_path> --all
python3 typst_quality_checker.py <project_path>
python3 validate_project.py <project_path>
```

### Test Compilation
```bash
# Compile an existing theme demo without creating scratch files
python3 typst_compiler.py <theme_directory> --entry demo.typ --format pdf
```

## Additional Resources

- [Typst GitHub](https://github.com/typst/typst)
- [Touying GitHub](https://github.com/touying-typ/touying)
- [Typst Discord](https://discord.gg/typst)
- [Stack Overflow - Typst Tag](https://stackoverflow.com/questions/tagged/typst)
