# Typed Scores — Compact Western Staff Notation

**Package**: `@preview/typed-scores:0.5.0`  
**Category**: Music notation  
**Repository**: <https://github.com/GeronimoCastano/typed-scores>  
**License**: MIT AND OFL-1.1

## Verified Boundary

Typed Scores 0.5.0 engraves Western staff notation from compact event strings. A Rust/WASM parser
interprets the strings and Typst with CeTZ lays out bundled Bravura glyphs. `bar` is the quick
one-staff, one-measure helper; `score` supports complete, multi-bar and multi-staff scores.

This package uses its own note-and-duration grammar. It does not import arbitrary MusicXML or MEI,
and it does not provide Jianpu. It renders supplied music; it does not compose or correct it.

## Minimal Usage

```typst
#import "@preview/typed-scores:0.5.0": bar, score

#bar(
  "g4:e a4:e b4:e c5:e d5:e e5:e f#5:e g5:e",
  lyrics: "Sing __ through _ the _ night __",
  clef: "treble",
  key: "G",
  time: "4/4",
)

#score(
  clef: "treble",
  time: "4/4",
  bars: (
    (notes: "c5:q d5:q e5:q f5:q"),
    (notes: "g5:h e5:h"),
  ),
)
```

For multiple staves, declare stable staff IDs and supply the matching event strings in each bar.
Read the exact 0.5.0 reference before using voices, lyrics, harmony, pickup bars, repeats, endings,
navigation marks, system layout, or theme options.

## Selection and Safety

- Preserve every pitch, accidental, octave, duration, rest, voice, clef, key, time signature, lyric,
  harmony symbol, barline, ending, and navigation mark supplied by the author.
- Do not infer omitted pitches or durations from musical plausibility. The package may carry duration
  defaults, but relying on them must be an explicit source choice.
- Use Scoryst instead when supplied ABC, MusicXML, MEI, Humdrum, EsAC, PAE, Volpiano, or CMME is the
  canonical source. Do not transcribe between formats without permission and comparison.
- Do not use this package for Jianpu. Preserve the numbered-notation source and search for a verified
  dedicated package as described in `typst-music/references/music-engraving.md`.
- Inspect every system for spacing, clef and key changes, beams, ties, slurs, lyrics, endings, and
  readable staff size.
