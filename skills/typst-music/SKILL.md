---
name: typst-music
description: Create, engrave, and verify staff notation, numbered notation, chord sheets, songbooks, and music examples in Typst while preserving supplied musical sources and using verified package APIs.
---

# Typst Music

Compose this Skill with Typst Authoring.

## Entry Modes

- `engrave`: create a score from a sufficient brief, or place and revise supplied notation and its
  explanatory document content.
- `review`: inspect musical-source fidelity, notation layout, accessibility, and page flow without
  changing notes or lyrics unless requested.

## Contract

1. Distinguish creation from transcription. A creation request may compose original material or
   make a clearly labelled arrangement of a named public-domain or traditional tune. A
   transcription, conversion, revision, or review must preserve the supplied pitches, rhythm,
   voices, clefs, key and time signatures, lyrics, articulations, repeats, transposition, and
   measure structure unless the user asks to change them.
2. Keep symbolic notation files such as MusicXML, MEI, ABC, Humdrum, or PAE as canonical workspace
   resources. Rendered SVG and page images are views.
3. Choose a package by notation system and source format. Staff notation, chord sheets,
   tablature, and Jianpu are not interchangeable.
4. Existing imports win. Otherwise prefer the exact bundled recipe and example named below when it
   supports the requested representation. Read those resources through `skill.read` before using
   `package.list`, repository search, or the web. Search only when the existing and bundled choices
   do not provide the needed notation system or source format.
5. Add useful alternative text to rendered scores and preserve attribution and licensing for
   supplied music, fonts, and assets.
6. Validate and visually inspect every affected system or page for clipping, collisions, lyric
   alignment, orphan systems, scale, and readable staff size.

## Representation and Package Information

- `typst-music/references/music-engraving.md` distinguishes staff notation, Jianpu, chord sheets,
  tablature, and their supported symbolic source formats.
- Preserve an existing music package and resource layout. For ordinary Western staff notation,
  prefer the bundled Scoryst recipe when editable ABC is suitable. Its complete `demo.typ` is a
  copyable starting point for a small score, not merely package metadata.
- For a small named tune with no requested notation system, ordinary Western staff notation is a
  reasonable default: go directly to the Scoryst recipe and demo. Do not make the user choose among
  packages or search the catalog first. An explicit request for Jianpu, tablature, chord sheets, or
  another source model overrides this default.
- Read `_shared/packages/scoryst/README.md` and `_shared/packages/scoryst/demo.typ` directly before
  searching when Scoryst fits. Use the Typed Scores resources in the same way when its compact
  note-and-duration grammar is already the desired source model. For guitar, bass, ukulele, or
  custom-tuning tablature, read `_shared/packages/fretwork/README.md` and its `demo.typ` instead;
  it preserves frets, strings, rhythm, techniques, and ASCII-tab source rather than converting the
  material into staff notation.
- For a capability absent from current source and bundled recipes, use one focused `package.list`
  query and read only the selected recipe or exact versioned documentation.
- Do not use `document.eval` to discover Scoryst or Typed Scores options. Their bundled README and
  demo are the authoritative API evidence; use `render.summary` for the resulting document page
  count and `render.page` for visual inspection.
- Keep symbolic score resources canonical and surrounding text editable. For multi-page notation,
  use the selected package's real page model rather than guessing from the Typst wrapper.
- Where fidelity matters, compare rendered notation with the supplied score or symbolic source;
  inspect collisions, lyric alignment, system breaks, scale, and staff readability.

## Adaptive Workflow

1. Identify whether the request is creation, arrangement, transcription, revision, or review and
   which notation system or source format it requests. For an unqualified small named tune, use
   the Scoryst route below directly. Read `typst-music/references/music-engraving.md` when
   representation or source-format choice is material or unclear.
2. Inventory the symbolic source or creative brief, movements or tunes, parts, page size, intended
   medium, and any requested transposition, extraction, or arrangement boundary.
3. Preserve an existing package and source layout. Otherwise read the matching bundled recipe and
   example first. Search packages only when neither supports the requested representation.
4. Validate a representative difficult measure or system before scaling when the notation grammar
   or package API is unfamiliar.
5. For a score that may span multiple internal pages, use the selected package's page-count API in
   the final Typst source so every score page is emitted. Use Tylina `render.summary` for the page
   count and geometry of the resulting Typst document.
6. Compare the rendered notation with the supplied symbolic source at the fidelity requested, then
   validate and inspect the containing Typst document.

## Progressive Resources

- Representation and Jianpu boundary: `typst-music/references/music-engraving.md`.
- Verified Scoryst 0.2.0 API: `_shared/packages/scoryst/README.md` and
  `_shared/packages/scoryst/demo.typ`.
- Verified Typed Scores 0.5.1 API: `_shared/packages/typed-scores/README.md` and
  `_shared/packages/typed-scores/demo.typ`.
- Verified Fretwork 0.4.0 tablature API: `_shared/packages/fretwork/README.md` and
  `_shared/packages/fretwork/demo.typ`.
- Current alternatives: use one focused `package.list` query only when the existing document and
  the bundled Scoryst, Typed Scores, or Fretwork routes do not fit; verify the selected exact spec
  through its routed recipe or official versioned documentation.
