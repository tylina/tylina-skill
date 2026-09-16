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

## Representation and Package Information

- `references/music-engraving.md` distinguishes staff notation, Jianpu, chord sheets, tablature,
  and their supported symbolic source formats.
- Preserve an existing music package and resource layout. For a missing capability, use a focused
  `package.list` query and read only the selected recipe or exact versioned documentation.
- Keep symbolic score resources canonical and surrounding text editable. For multi-page notation,
  use the selected package's real page model rather than guessing from the Typst wrapper.
- Where fidelity matters, compare rendered notation with the supplied score or symbolic source;
  inspect collisions, lyric alignment, system breaks, scale, and staff readability.

## Adaptive Workflow

1. Read `references/music-engraving.md` for the requested notation system and source format.
2. Inventory the symbolic source, movements or tunes, parts, page size, intended medium, and any
   requested transposition, extraction, or arrangement boundary.
3. Preserve an existing music package and source-resource layout. Otherwise use a focused package
   search and read only the selected exact recipe or versioned documentation.
4. Validate a representative difficult measure or system before scaling when the notation grammar
   or package API is unfamiliar.
5. For multi-page notation, use the selected package's actual page-count API and render every page;
   do not infer the count from the Typst wrapper.
6. Compare the rendered notation with the supplied symbolic source at the fidelity requested, then
   validate and inspect the containing Typst document.

## Progressive Resources

- Representation and Jianpu boundary: `typst-music/references/music-engraving.md`.
- Verified Scoryst 0.2.0 API: `_shared/packages/scoryst/README.md` and its `demo.typ`.
- Verified Typed Scores 0.5.0 API: `_shared/packages/typed-scores/README.md` and its `demo.typ`.
- Current alternatives: `package.list` with `discipline: "music"`; verify the returned exact spec
  through its routed recipe or official versioned documentation.
