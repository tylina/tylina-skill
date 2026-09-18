# Music Engraving Selection

## Choose by Source and Deliverable

- Use Scoryst for ABC, MusicXML, MEI, Humdrum/Kern, EsAC, PAE, Volpiano, or CMME when a
  Verovio-rendered staff score embedded in Typst fits the deliverable. For a creation request,
  editable ABC is a practical source for a small original piece or a clearly labelled arrangement
  of a named public-domain or traditional tune.
- Use the pinned Typed Scores 0.5.1 recipe when compact note-and-duration text is the canonical
  Western staff-notation source. Search `scorify` for another current Rust/WASM-backed notation
  model and inspect its exact grammar, font behavior, supported score structure, and output before
  selecting it. Similar rendered staff output does not make the source grammars interchangeable.
- Read the pinned Fretwork 0.4.0 recipe for guitar, bass, ukulele, or custom-tuning tablature whose
  canonical source records frets, strings, rhythm, techniques, or annotated ASCII tab. It does not
  infer a fingering from staff notation and is not a MusicXML/MEI importer.
- Search `chordish`, `chordx`, `conchord`, or `songb` for chord sheets, lyrics, or songbooks. Do
  not force a staff-score package onto chord-over-lyric source.
- Search `staves` for isolated clefs or key signatures.
- Search `swaralipi` only for its documented Indian classical-notation model. It is not evidence of
  Jianpu support, and no notation system should be transliterated into another without permission.
- For Jianpu or another numbered notation system, do not substitute ordinary digits or convert to
  Western staff notation without permission. The current curated Scoryst recipe does not render
  Jianpu. Use a verified dedicated package if current discovery finds one; otherwise preserve the
  user's notation source and explain the unsupported layout. A font alone does not define musical
  duration, beams, octave dots, slurs, lyrics, or line breaking.

## External LilyPond Sources

Keep supplied `.ly` and `.ily` files as canonical music sources. They are not Scoryst inputs and
should not be silently transcribed into ABC, MusicXML, or another notation grammar. When a real
LilyPond executable is available in the authorized host environment, render PDF, SVG, or PNG and
use that output as a Typst resource while retaining the source. A browser-only Tylina session does
not imply that LilyPond compilation is available.

## Scoryst Boundary

Scoryst 0.2.0 is a Typst WASM plugin wrapping Verovio. Its public functions include `score`,
`pages`, `convert`, `available-options`, `version`, and the `music-blocks` show rule. It produces an
SVG score image inside Typst; the original symbolic notation remains the editable source.

Use compact ABC inline for short, self-contained examples. Keep longer or reused ABC, existing
file-based notation, and verbose MusicXML, MEI, Humdrum, or CMME in separate workspace resources
and load them with `read`. Choose the boundary from source length, reuse, and the document's
existing resource layout. Pin input format when automatic detection would be ambiguous. `convert`
supports canonical MEI or PAE output; conversion must not replace a supplied original unless the
user explicitly chooses it and the result is compared.

## Visual Verification

Inspect the real physical or presentation size. Check staff and lyric readability, system and page
breaks, headers, measure numbers, ties and slurs at boundaries, tuplets, multi-voice collisions,
accidentals, endings, and whether excerpts start with enough context. For a multi-page score,
render all pages returned by `pages`; never assume one SVG contains the whole piece.

## Typed Scores Boundary

Typed Scores 0.5.1 accepts compact event strings through `bar` and `score`, parsed by its bundled
Rust/WASM plugin and laid out with CeTZ and Bravura glyphs. Use it when that text is already the
chosen canonical notation, when the user explicitly authorizes transcription into it, or when a
creation brief explicitly chooses that source model. It is not a MusicXML/MEI importer and not a
Jianpu renderer.

Preserve pitches, accidentals, octaves, durations, rests, voices, clefs, keys, meters, lyrics,
harmony, barlines, endings, and navigation marks. Its shorthand or defaults must not become a reason
to guess missing musical facts. Read `_shared/packages/typed-scores/README.md` before authoring.

## Fretwork Boundary

Fretwork 0.4.0 typesets tablature from a compact text DSL or annotated ASCII tab. Choose it only
when tablature is the intended representation or supplied source. Preserve string and fret choices,
tuning, capo, rhythm, techniques, repeats, chords, and lyrics; equivalent sounding pitches do not
authorize a new fingering. Read `_shared/packages/fretwork/README.md` before authoring.
