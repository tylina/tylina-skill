---
name: typst-linguistics
description: Create or review linguistic Typst documents with source-faithful examples, interlinear glosses, IPA, syntax trees, romanization, and multilingual scripts.
---

# Typst Linguistics

Compose this Skill with Typst Authoring. Add Typst Academic or Typst Research for scholarly claims
and citations.

## Entry Modes

- `write`: create or revise linguistic examples, handouts, papers, grammars, dictionaries, or field
  notes from supplied language data and analysis.
- `review`: inspect data fidelity, alignment, labels, references, scripts, fonts, accessibility, and
  page flow without normalizing the language data unless requested.

## Contract

1. Preserve the exact object-language form, segmentation, capitalization, punctuation, diacritics,
   tone, stress, length, grammaticality judgment, gloss, translation, citation, and speaker metadata.
2. Do not present an invented gloss, morpheme boundary, transcription, pronunciation, translation,
   syntactic structure, reconstruction, language identity, or acceptability judgment as supplied
   data. For an explicit analysis request, label proposed analyses and uncertainty and keep them
   distinct from source transcription and speaker judgments.
3. Keep examples, subexamples, gloss lines, labels, references, and abbreviation lists semantic.
   Do not align interlinear data with hand-inserted spaces or draw syntax with decorative text.
4. Distinguish orthography, transliteration, phonemic transcription, phonetic transcription, and
   normalized display. Transform one into another only from a supplied or cited rule.
5. Preserve confidentiality and consent boundaries for field data. Do not expose speaker names,
   coordinates, recordings, or restricted examples through metadata or exported resources.
6. Compile and inspect the actual scripts and fonts. Check combining marks, line breaking,
   right-to-left boundaries, ruby or romanization alignment, example continuation, and references.

## Typst and Package Information

- `references/linguistic-notation.md` distinguishes example, gloss, IPA, tree, romanization, and
  multilingual-script representations and routes relevant package information.
- Preserve a working package. For a missing capability, use `package.list` with
  `discipline: "linguistics"` or a focused query, then read the returned recipe or exact versioned
  documentation.
- Keep linguistic data editable and attributable. Inspect changed scripts, combining marks,
  directionality, gloss alignment, labels, and line breaks at the intended output size.
- In review work, distinguish uncertain linguistic analysis from observable typesetting defects.

## Adaptive Workflow

1. Read only the relevant part of `references/linguistic-notation.md` for the representation being
   edited.
2. Inventory the languages, scripts, transcription standard, example schema, gloss abbreviations,
   judgments, source references, fonts, directionality, and existing package model that matter.
3. Preserve a working package. For a missing capability, search by discipline or focused capability
   and read the returned exact recipe or versioned documentation.
4. Validate a representative example containing the hardest script, gloss, label, and line break
   early when those features are unfamiliar, then apply the pattern to the requested scope.
5. Keep language data editable and attributable, verify transformations against their stated rule,
   and inspect every changed script class and boundary example at the intended size.
6. In review work, report uncertain linguistic analysis separately from observable layout defects.

## Progressive Resources

- Representation and package routing: `typst-linguistics/references/linguistic-notation.md`.
- Verified interlinear-example API: `_shared/packages/eggs/README.md`.
- Syntax trees or diagrams: `typst-diagrams/SKILL.md` when that Skill is available.
- Citations and research evidence: `typst-research/SKILL.md` when applicable.
