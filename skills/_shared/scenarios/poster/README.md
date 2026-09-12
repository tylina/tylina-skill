# Poster Scenario Demos

This directory contains eight single-file, editable poster examples built on five pinned Typst
Universe packages. Each `.typ` file is a complete runnable document; the adjacent README records
the upstream package, license, design intent, and known build constraints. There is intentionally
no copied `typst.toml` or upstream license file for these small demonstrations.

All names, organizations, measurements, URLs, and outcomes in the examples are fictional. Replace
them with verified source material before delivery.

| Demo | Package | Canvas | Composition to borrow |
|---|---|---:|---|
| [Field transect](peace-of-posters/demo.typ) | `peace-of-posters 0.6.0` | A1 portrait | Flexible two-column scientific route with explicit evidence and interpretation boxes |
| [Three-column pilot](peace-of-posters/demo-three-column.typ) | `peace-of-posters 0.6.0` | A0 landscape | Dense decision poster with three distinct column jobs and aligned lower closure |
| [Visual-first acoustic audit](peace-of-posters/demo-visual-first.typ) | `peace-of-posters 0.6.0` | A1 landscape | One large visual signature, a hero result, and a compact evidence rail |
| [Shared-kitchen field test](placard/demo.typ) | `placard 0.1.0` | A1 portrait | Light two-column cards with compact native charts and a practical action route |
| [Night-bus transfer audit](placard/demo-dark.typ) | `placard 0.1.0` | A1 landscape | Dark three-column operational poster with status colors and a strong footer |
| [Accessible chart authoring](pollux/demo.typ) | `pollux 0.1.0` | A0 portrait | Gemini-inspired two-column research poster with a full-width decision band |
| [Curbside air pilot](pasquino/demo.typ) | `pasquino 0.1.0` | 75 × 100 cm portrait | Minimal serif/sans editorial poster with rules, paired evidence, and a restrained palette |
| [Clinic check-in result](postercise/demo.typ) | `postercise 0.2.0` | 24 × 18 in landscape | Better Poster layout: one billboard conclusion with narrow evidence and interpretation rails |

## Package router

- Start with `peace-of-posters` when the section system, number of columns, or page geometry needs
  substantial adaptation.
- Start with `placard` when a compact card API and light/dark variants are more useful than a large
  theme surface.
- Start with `pollux` for its opinionated Gemini-like A0 structure and bilingual font stack.
- Start with `pasquino` for a quiet 75 × 100 cm two-column editorial composition.
- Start with `postercise` when the result should dominate the page at billboard scale.

## Compile and inspect

Run from this directory, substituting any entry from the table:

```bash
typst compile peace-of-posters/demo.typ output.pdf
typst compile peace-of-posters/demo.typ output.png --ppi 72
typst compile peace-of-posters/demo.typ thumbnail.png --ppi 16
```

The first build may download the pinned preview package. A reviewed poster must compile to exactly
one physical page. Inspect both the full-size render and a small thumbnail: the former catches
clipping and unreadable body text; the latter reveals whether title, primary result, reading order,
and lower-edge closure survive at a glance.

## Required adaptation pass

1. Lock the venue's exact page size, orientation, bleed, and viewing distance.
2. Build a claim-to-evidence inventory and remove every unsupported sample claim.
3. Choose one primary result or decision; give it more visual weight than background and method.
4. Reallocate complete sections, figures, and column ratios before shrinking typography.
5. Resolve the whole canvas to a deliberate lower edge: a footer, continuing field, aligned section
   boundary, or clearly framed quiet zone. Individual columns and cards do not all need equal height.
6. Keep factual text, table values, axis labels, and annotations as Typst content. Inline SVG is useful
   for non-semantic visual signatures, textures, or background geometry, not for hiding evidence.
7. Recompile and inspect at full size and thumbnail size; then test fonts, citations, links, QR codes,
   image resolution, and print output as applicable.

Never add filler claims, inflate padding, or stretch an empty metadata box merely to consume space.
Deliberate negative space is valid when another stable visual field or frame makes that intent clear.
