# Fretwork — Editable Guitar Tablature

**Package**: `@preview/fretwork:0.4.0`

**Category**: Music / guitar tablature

**Typst Universe**: <https://typst.app/universe/package/fretwork>

**Repository**: <https://github.com/snaggen/fretwork>

**Versioned guide**: <https://github.com/snaggen/fretwork/blob/v0.4.0/GUIDE.md>

**License**: EUPL-1.2

## Verified Boundary

Fretwork 0.4.0 typesets guitar, bass, ukulele, and custom-tuning tablature from editable text.
It draws string lines, rhythm stems, beams, repeat signs, techniques, dynamics, chord names, and
lyrics with Typst paths instead of requiring a music font. It requires Typst 0.15.0 or newer.

Fretwork is tablature, not Western staff notation, chord-diagram generation, or a MusicXML/MEI
importer. Preserve supplied string, fret, tuning, rhythm, technique, lyric, capo, repeat, and time
signature data. Do not translate staff notation into tablature or choose a playable fingering
without the user's permission; the same sounding pitch can have several valid fret positions.

The native DSL uses:

- `fret/string`, with string 1 as the highest-pitched string;
- sticky values `w h q e s t` from whole through thirty-second notes;
- `r` for a rest, `x/string` for a dead note, and parenthesized notes for a chord;
- `|`, `|:`, and `:|` for bar and repeat boundaries;
- suffixes such as `h`, `p`, `s`, `b`, `v`, and `~` for documented techniques;
- groups such as `{PM: ...}`, `{LR: ...}`, and `{3: ...}` for spans and tuplets.

`tab` accepts the DSL or an already parsed part. `ascii-tab` imports column-aligned ASCII
tablature, but ASCII source contains no reliable rhythm unless an `R:` row or an explicit
`rhythm` argument supplies it. `song` is an optional document show rule; ordinary embedded
examples can call `tab` without taking over the containing document.

## Minimal Usage

```typst
#import "@preview/fretwork:0.4.0": tab, theme

#let tab-theme = theme(font: "Libertinus Serif")

#tab(
  theme: tab-theme,
  time: (4, 4),
  ```
  |: q 0/6 3/6 5/6 3/6 | @G5 q 3/6 5/6 3/6 0/6 :|
  ```,
)
```

The explicit font above uses a Typst-bundled family and avoids relying on the package's optional
Montserrat-first text-font chain. Music symbols remain vector paths. A production document may
pass another installed text font through `theme(font: ...)` after verifying it in every target
host.

## Source Fidelity and Verification

- Preserve the source model already in the workspace. Use Scoryst for supplied ABC, MusicXML,
  MEI, Humdrum, EsAC, PAE, Volpiano, or CMME; use Fretwork only when tablature is intended.
- `ascii-tab` is a preservation aid, not proof that timing, tuning, capo, repeats, or techniques
  were recovered. Keep the original ASCII source and make added musical facts explicit.
- The package reports incomplete measures, leftover lyrics, and related advisory diagnostics on
  the page because Typst has no non-fatal package warning channel. Keep `warn: true` while
  authoring; use `warn: false` only after comparing the source and output deliberately.
- Check string order, fret numbers, chord membership, rhythm grouping, ties, repeats, tunings,
  capo, lyrics, and every technique against the supplied source. Then inspect system wrapping,
  collisions, staff size, text-font availability, and page breaks at final output size.
- Use the versioned guide for techniques, alternate tunings, ASCII annotations, lyrics, and
  advanced layout. Do not guess a token from another tablature language.
