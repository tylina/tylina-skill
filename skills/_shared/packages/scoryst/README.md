# Scoryst — Music Engraving with Verovio

**Package**: `@preview/scoryst:0.2.0`  
**Category**: Music / integration  
**Repository**: <https://github.com/bernsteining/scoryst>  
**License**: LGPL-3.0-only

## Verified Boundary

Scoryst is a Typst WebAssembly plugin that wraps Verovio. It accepts supplied ABC, MusicXML, MEI,
Humdrum/Kern, EsAC, PAE, Volpiano, or CMME and renders an SVG through Typst. The symbolic notation
is the editable source; the SVG is only the rendered view. Scoryst does not provide Jianpu.

The public 0.2.0 functions verified from the package source are:

- `score(data, options: none, page: 1, ..args)` renders one page and forwards named image options;
- `pages(data, options: none)` returns the real score page count;
- `convert(data, to: "mei", options: none)` converts only to canonical MEI or PAE text;
- `available-options()` returns the bundled Verovio option catalogue;
- `version()` returns the bundled Verovio version;
- `music-blocks(options: none, body)` renders supported fenced code blocks.

## Minimal Usage

```typst
#import "@preview/scoryst:0.2.0": score, pages

#let tune = "X:1\nT:Scale\nM:4/4\nK:C\nCDEF|GABc|"
#score(tune, width: 100%, alt: "An ascending C-major scale in staff notation")
```

Use `read("score.musicxml")` or `read("score.mei")` for verbose source. Preserve that file beside
the Typst document. If the source spans pages, render `range(1, pages(data) + 1)` rather than
assuming one call contains the complete score.

## Selection and Safety

- Use only supplied musical facts. Do not invent or correct notes, rhythms, lyrics, or harmony.
- Pin `input-from` in the options when format detection would be ambiguous.
- Pass descriptive `alt` text through `score`; it forwards named arguments to Typst `image`.
- Treat `convert` as a reviewed conversion, not a lossy cleanup step. Keep the original source.
- Read `typst-music/references/music-engraving.md` when the request involves chord sheets,
  tablature, Jianpu, another notation system, or package selection.
- Inspect every system or page at its final size for collisions, clipping, lyric alignment, and
  staff readability.

