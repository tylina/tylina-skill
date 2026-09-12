# Image Tools

This document describes the tools for image generation and analysis.

## Contents

- [Image Generator](#image-generator)
- [Licensed Image Search](#licensed-image-search)
- [Image Analyzer](#image-analyzer)
- [Source Inventory](#source-inventory)
- [Image Backends](#image-backends)
- [Supported Formats and Configuration](#supported-image-formats)
- [Best Practices](#best-practices)
- [Common Issues](#common-issues)
- [Requirements](#requirements)

## Image Generator

The `image_gen.py` script generates images using various AI backends.

### Generate Image

```bash
python3 image_gen.py "A modern futuristic workspace"
```

### Specify Backend

```bash
python3 image_gen.py "A serene mountain landscape" --backend stability
```

### Custom Output

```bash
python3 image_gen.py "Abstract geometric patterns" -o output/ --filename hero
```

`--output` is a directory. Use `--filename` for the output basename.

### Custom Aspect Ratio

```bash
python3 image_gen.py "Portrait style image" --aspect_ratio 9:16
```

### Custom Size

```bash
python3 image_gen.py "High resolution image" --image_size 2K
```

### List Available Backends

```bash
python3 image_gen.py --list-backends
```

### Check Available Backends

Check which backends have API keys configured:

```bash
python3 image_gen.py --check-available
```

#### Options
- `--backend, -b`: Backend to use (e.g., gemini, openai, openrouter, minimax, qwen, zhipu, etc.)
- `--output, -o`: Output directory for generated images
- `--filename, -f`: Output basename without extension
- `--aspect_ratio`: Aspect ratio (default: 1:1)
- `--image_size`: Image size (`512px`, `1K`, `2K`, or `4K`; default: `1K`)
- `--manifest`: Generate every pending/failed item in an image prompt manifest
- `--concurrency`: Maximum parallel requests in manifest mode
- `--list-backends`: List all available backends
- `--check-available`: Check which backends have API keys configured

Use the underscore spellings shown above; `--aspect-ratio` and `--image-size` are not accepted by the current CLI.

## Licensed Image Search

The `image_search.py` script searches allowed web providers, downloads the best candidate, and updates `image_sources.json` for downstream attribution.

```bash
python3 image_search.py "offshore wind farm" \
  --filename cover_bg.jpg --slide 01_cover \
  --orientation landscape -o <project_path>/assets
```

Use `--strict-no-attribution` only when attributed CC BY/CC BY-SA assets are unacceptable. Otherwise preserve the generated manifest and render required credits as specified in `references/image-searcher.md`.

## Image Analyzer

The `analyze_images.py` script analyzes image files in a directory.

### Analyze Directory

```bash
python3 analyze_images.py ./assets
```

### Specify Canvas Format

```bash
python3 analyze_images.py ./assets --canvas ppt169
```

#### Output Information
- File dimensions (width x height)
- Aspect ratio and orientation category
- Canvas-aware layout dimensions (image area, text area)
- File size
- Markdown snippet for strategist prompts
- CSV export

## Source Inventory

The `source_inventory.py` script scans a project's `sources/` directory and
produces a complete inventory (file listing, markdown content, image analysis
with Typst layout hints) as Markdown on stdout.

### Scan Sources

```bash
python3 source_inventory.py <sources_dir>
```

#### Output Sections

1. **Source File Inventory** -- categorized file listing (markdown, images, PDFs, other)
2. **Source Content** -- full text of all `.md` files
3. **Source Images** -- table with dimensions, orientation, and recommended Typst layout

The output is designed for direct embedding into LLM prompts.

## Image Backends

The backend registry currently exposes these providers across three support tiers. Run `image_gen.py --list-backends` instead of relying on a copied count.

| Tier | Backends |
|------|----------|
| **Core** | gemini, openai, qwen, zhipu, volcengine |
| **Extended** | stability, bfl, ideogram |
| **Experimental** | minimax, modelscope, siliconflow, fal, replicate, openrouter |

Configure by setting `IMAGE_BACKEND` and the provider's API key in environment or `.env`:

```bash
export IMAGE_BACKEND=openai
export OPENAI_API_KEY=sk-...
```

Run `python3 image_gen.py --check-available` to verify which backends are ready.

## Supported Image Formats

The image tools support the following formats:

- JPG/JPEG
- PNG
- GIF
- BMP
- TIFF
- WebP
- SVG

## Configuration

Generation defaults and accepted values are owned by `image_gen.py` and its backend registry; use `image_gen.py --help` and `--list-backends` as the executable contract. Shared canvas and analysis settings remain available through `config.py`, but they do not override generation CLI defaults.

## Best Practices

### Image Generation
1. **Use descriptive prompts**: More specific prompts yield better results
2. **Match aspect ratio to use case**: 16:9 for presentations, 9:16 for mobile
3. **Choose appropriate size**: Higher for print, lower for web
4. **Test different backends**: Results vary by provider
5. **Review generated images**: AI may produce unexpected results

### Image Analysis
1. **Regularly analyze assets**: Track image usage and quality
2. **Generate manifests**: Keep documentation of image resources
3. **Check aspect ratios**: Ensure images match slide dimensions
4. **Monitor file sizes**: Large images slow compilation
5. **Validate formats**: Ensure all images are supported

## Common Issues

### Generation Fails
- Check API keys and credentials
- Verify network connectivity
- Review backend-specific error messages
- Try alternative backend

### Image Too Large
- Reduce image size
- Use more efficient format (WebP)
- Compress existing images
- Consider external hosting

### Aspect Ratio Issues
- Calculate correct dimensions
- Use standard ratios (16:9, 4:3, 1:1)
- Check image analyzer output
- Resize images appropriately

## Requirements

### Core
- Install the skill's full dependency set before using image CLIs: `pip install -r ../requirements.txt` when running from `scripts/`.
- `Pillow` supports analysis and conversion; `requests` supports licensed image search.

### Backend-Specific
Each generation backend may require a provider SDK and API credential. Run `image_gen.py --check-available` after installing requirements and configuring `.env`.

## Tips

1. **Batch generate images**: Script multiple generations for efficiency
2. **Use version control**: Track generated images
3. **Organize by project**: Keep images in project-specific directories
4. **Document prompts**: Save successful prompts for reuse
5. **Optimize for web**: Compress images before use in presentations
