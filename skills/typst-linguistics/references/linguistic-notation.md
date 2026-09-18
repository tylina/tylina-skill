# Linguistic Notation Selection

For numbered examples and interlinear glosses, read the curated Eggs recipe directly. For
bracket-authored phrase-structure trees, read the curated Synkit recipe. For another missing
representation, call `package.list`, then read its routed recipe or verify the returned exact spec
against official versioned documentation. Other names below are search seeds only.

## Representation Routing

| Need | Search seeds | Verify before use |
|---|---|---|
| Numbered examples and interlinear glosses | `eggs`, `leipzig-glossing`, `glossarium` | nested examples, gloss-line syntax, judgments, labels, references, abbreviation tracking, long-line behavior |
| IPA and phonological notation | `phonokit`, `ascii-ipa`, `tyipa`, `linphon` | transcription standard, ASCII conversion boundary, combining marks, font coverage, feature or rule syntax |
| Syntax and dependency trees | `synkit`; also search `syntree`, `lingotree`, `fletcher` | tree model, edge labels, movement or coindexing, wrapping, source editability |
| Mandarin romanization or annotation | `auto-mando` | input script, pinyin and tone convention, segmentation, heteronym handling, ruby alignment |
| Cantonese romanization or annotation | `auto-canto` | Jyutping convention, segmentation, pronunciation evidence, ruby alignment |
| Sign-language transcription | `hamnosys-includer` | exact HamNoSys source, required fonts or assets, attribution, accessible alternative |
| Right-to-left and mixed scripts | search by language plus `linguistics` | base direction, bidi isolation, numerals, punctuation, gloss direction, font fallback |

## Interlinear Examples

- Establish the project's line model before editing: object language, morpheme segmentation,
  morpheme gloss, word gloss, translation, source, and judgment are distinct fields.
- Preserve hyphens, equals signs, clitics, zero morphemes, capitalization, and abbreviation periods.
  They encode analysis and must not be normalized as ordinary prose punctuation.
- Keep judgments attached to the intended example and translations visibly distinct from glosses.
  Preserve trailing sources and labels when reordering examples.
- Maintain one abbreviation definition per intended meaning. Do not silently expand an unfamiliar
  abbreviation; flag it for the author.

The curated `eggs` 0.9.0 recipe supports semantic examples, subexamples, interlinear gloss lines,
judgments, labels, references, trailing citations, and tracked Leipzig-style abbreviations. Read
the recipe before using its compact list syntax.

The curated `synkit` 0.1.0 recipe verifies bracket-authored phrase-structure trees. The bracket
structure remains a linguistic analysis; do not invent or silently normalize it.

## Transcription and Scripts

- Confirm whether brackets and slashes are literal orthography or the conventional distinction
  between phonetic and phonemic transcription. Do not add or remove them by style preference.
- Normalize Unicode only when the user or source standard requires it. Visually identical
  precomposed and combining sequences may matter to search, collation, and downstream data.
- Verify font support with real rendering, especially combining diacritics, tone letters, click
  symbols, historical characters, vertical annotation, and mixed-script punctuation.
- Treat automatic romanization as a reviewed transformation. Context-dependent pronunciation,
  segmentation, and tone sandhi require evidence; preserve the original script beside derived text
  when appropriate.

## Trees, Directionality, and Accessibility

- A tree layout package owns geometry, but the supplied nodes, constituency, dependency direction,
  indices, and labels remain canonical linguistic claims.
- Inspect deep and wide trees at final size; avoid shrinking labels below readable type. Split or
  rotate only when that preserves the intended structure.
- Isolate right-to-left and left-to-right runs deliberately. Check bracket placement, example
  numbers, punctuation, and gloss alignment in the compiled output.
- Provide an adjacent text or structured description for a diagram when the tree or transcription
  is essential and the rendered visual alone is not accessible.
