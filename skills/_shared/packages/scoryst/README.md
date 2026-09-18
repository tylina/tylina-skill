# Scoryst — Music Engraving with Verovio

**Package**: `@preview/scoryst:0.2.0`  
**Category**: Music / integration  
**Typst Universe**: <https://typst.app/universe/package/scoryst>

**Repository**: <https://github.com/bernsteining/scoryst>  
**Versioned documentation**: <https://raw.githubusercontent.com/bernsteining/scoryst/v0.2.0/test/documentation.pdf>
**License**: LGPL-3.0-only

## Verified Boundary

Scoryst is a Typst WebAssembly plugin that wraps Verovio. It accepts ABC, MusicXML, MEI,
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

````typst
#import "@preview/scoryst:0.2.0": score, pages

#let tune = ```abc
X:1
M:4/4
L:1/4
K:C
C C G G | A A G2 | F F E E | D D C2 |
w: Twin-kle twin-kle lit-tle star how I won-der what you are
G G F F | E E D2 | G G F F | E E D2 |
w: Up a-bove the world so high like a dia-mond in the sky
C C G G | A A G2 | F F E E | D D C2 |]
w: Twin-kle twin-kle lit-tle star how I won-der what you are
```.text
#let score-options = (
  breaks: "line",
  footer: "none",
  page-margin-top: 0,
  page-margin-bottom: 0,
)

#for page in range(1, pages(tune, options: score-options) + 1) {
  score(
    tune,
    page: page,
    options: score-options,
    width: 100%,
    alt: "Twinkle, Twinkle, Little Star in C major",
  )
}
````

Use `read("score.musicxml")` or `read("score.mei")` for verbose source. Preserve that file beside
the Typst document. The loop above uses Scoryst's real page model, so it remains complete when a
score grows beyond one page.

For a newly authored embedded example, let Typst present the title and attribution and keep the ABC
header minimal, as in `demo.typ`. `breaks: "line"` selects Verovio's line-breaking mode; it does not
make each ABC source line a score system. Verify the rendered systems when exact breaks matter. For
supplied ABC, preserve its `T:` and `C:` metadata; if the surrounding page must replace that title
block, derive a render-only string and leave the canonical source unchanged.

## Selection and Safety

- Creation requests may author original music or a clearly labelled arrangement of a named
  public-domain or traditional tune. Do not present a new arrangement as a transcription of a
  particular edition.
- For transcription, conversion, revision, and review, preserve supplied musical facts. Do not
  invent or correct notes, rhythms, lyrics, or harmony without an explicit request.
- Read this recipe and `demo.typ` directly when Scoryst fits. Package search is unnecessary unless
  the requested notation system or source format falls outside this verified boundary.
- Pin `input-from` in the options when format detection would be ambiguous.
- Pass descriptive `alt` text through `score`; it forwards named arguments to Typst `image`.
- Treat `convert` as a reviewed conversion, not a lossy cleanup step. Keep the original source.
- Verify pitches, rhythm, and lyric order from the symbolic source or a supplied reference. Use the
  rendered page to check layout, completeness, glyphs, collisions, scale, and readability; do not
  claim note-by-note musical proof by reverse-reading a downscaled preview.
- After `render.summary`, inspect each Typst page once at a readable Tylina `render.page` `ppi`.
  Repeat a page only after the source changes or an identified defect genuinely needs a higher PPI.
- Read `typst-music/references/music-engraving.md` when the request involves chord sheets,
  tablature, Jianpu, another notation system, or package selection.
- Inspect every system or page at its final size for collisions, clipping, lyric alignment, and
  staff readability.
