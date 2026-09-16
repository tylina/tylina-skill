---
name: typst-music
description: Engrave and verify supplied staff notation, numbered notation, chord sheets, songbooks, and music examples in Typst without guessing pitches, rhythm, lyrics, or package APIs.
---

# Typst Music

Compose this Skill with Typst Authoring.

## Entry Modes

- `engrave`: place or revise supplied music notation and its explanatory document content.
- `review`: inspect musical-source fidelity, notation layout, accessibility, and page flow without
  changing notes or lyrics unless requested.

## Contract

1. Treat pitches, rhythm, voices, clefs, key and time signatures, lyrics, articulations, repeats,
   transposition, and measure structure as user-supplied facts. Never complete or “correct” them by
   musical plausibility alone.
2. Keep symbolic notation files such as MusicXML, MEI, ABC, Humdrum, or PAE as canonical workspace
   resources. Rendered SVG and page images are views.
3. Choose a package by notation system and source format. Staff notation, chord sheets,
   tablature, and Jianpu are not interchangeable.
4. Search the current Universe with `package.list`. Existing imports win. Read the returned pinned
   recipe, or verify the exact spec against official versioned documentation before using its API.
   Use the Scoryst recipe only when its supported formats match.
5. Add useful alternative text to rendered scores and preserve attribution and licensing for
   supplied music, fonts, and assets.
6. Validate and visually inspect every affected system or page for clipping, collisions, lyric
   alignment, orphan systems, scale, and readable staff size.

## Workflow

1. Read `references/music-engraving.md` to choose a representation.
2. Inventory the supplied source format, movements or tunes, parts, page size, intended print or
   screen use, and any required transposition or excerpts.
3. Preserve an existing music package and source-resource layout. For new work, shortlist through
   `package.list` and read only returned Skill or recipe paths.
4. Make one minimal example compile before scaling to a full score or songbook.
5. For multi-page notation, determine the real page count through the selected package API and
   render every page. Do not silently rasterize editable surrounding text.
6. Compare output with the supplied score or symbolic source measure by measure where fidelity is
   required, then validate the containing Typst document.

## Progressive Resources

- Representation and Jianpu boundary: `typst-music/references/music-engraving.md`.
- Verified Scoryst 0.2.0 API: `_shared/packages/scoryst/README.md` and its `demo.typ`.
- Verified Typed Scores 0.5.0 API: `_shared/packages/typed-scores/README.md` and its `demo.typ`.
- Current alternatives: `package.list` with `discipline: "music"`; verify the returned exact spec
  through its routed recipe or official versioned documentation.
