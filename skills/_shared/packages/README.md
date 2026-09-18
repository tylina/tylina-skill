# Useful Typst Packages

Curated packages commonly useful in Typst documents and Touying presentations. Each directory contains:
- `demo.typ` — Working document or presentation example
- `README.md` — Package documentation and usage guide

> **For Agent use**: discover by capability or exact name with `package.list`, then pass its exact
> `recipePath` and `demoPath` to `skill.read`. Do not load the raw package index as a default
> discovery step. The index is the collection maintainer's source for those routed projections;
> search terms are routing hints, not API or compatibility evidence.
> This README is for human browsing.

## Contents

- [Package Categories](#package-categories)
- [Quick Reference](#quick-reference)
- [LaTeX Orientation](#latex-orientation)
- [Usage Pattern](#usage-pattern)

---

## Package Categories

### Heading & Numbering

| Package | Version | Description |
|---------|---------|-------------|
| **[numbly](./numbly/)** | 0.1.0 | Custom heading numbering formats per level |

### Long Documents and Review

| Package | Version | Description |
|---------|---------|-------------|
| **[glossarium](./glossarium/)** | 0.5.10 | Glossaries, acronyms, first-use expansion, and back-references |
| **[sanity](./sanity/)** | 0.2.0 | Structural preflight for references, labels, captions, and uncited entries |

### Academic Paper Templates

| Package | Version | Description |
|---------|---------|-------------|
| **[charged-ieee](./charged-ieee/)** | 0.1.4 | Maintained two-column IEEE-style paper layout with numeric citations |

### Math & Theorems

| Package | Version | Description |
|---------|---------|-------------|
| **[theorion](./theorion/)** | 0.6.0 | Theorem, definition, lemma, proof environments |
| **[mitex](./mitex/)** | 0.2.7 | LaTeX math equations in Typst (WASM) |

### Science and Engineering

| Package | Version | Description |
|---------|---------|-------------|
| **[unify](./unify/)** | 0.8.1 | Supplied numbers, uncertainty, quantities, units, and ranges |
| **[typsium](./typsium/)** | 0.3.2 | Chemical formulas, reactions, isotopes, phases, and annotated arrows |
| **[physica](./physica/)** | 0.9.8 | Vectors, derivatives, matrices, Dirac notation, tensors, and scientific math helpers |
| **[quill](./quill/)** | 0.8.0 | Quantum circuits through manual-grid and Tequila instruction models |
| **[zap](./zap/)** | 0.6.0 | Source-controlled electronic circuit diagrams |

### Code Display

| Package | Version | Description |
|---------|---------|-------------|
| **[lovelace](./lovelace/)** | 0.3.1 | Pseudocode with arbitrary keywords |
| **[codly](./codly/)** | 1.3.0 | Beautiful code blocks with line numbers and annotations |
| **[zebraw](./zebraw/)** | 0.6.3 | Lightweight code blocks with line highlighting (zebra-striped) |

### Lists & Tables

| Package | Version | Description |
|---------|---------|-------------|
| **[cheq](./cheq/)** | 0.4.0 | Markdown-like checklists (`[x]`, `[ ]`, `[/]`, `[-]`) |
| **[tablem](./tablem/)** | 0.3.0 | Markdown-like tables, three-line-table preset |

### Education and Assessment

| Package | Version | Description |
|---------|---------|-------------|
| **[examora](./examora/)** | 0.2.0 | Chinese examination papers with score tables, randomized questions, and answer editions |
| **[ezexam](./ezexam/)** | 0.3.1 | Chinese exams and handouts with localized print, answer, and solution controls |

### Layout & Annotation

| Package | Version | Description |
|---------|---------|-------------|
| **[pinit](./pinit/)** | 0.2.2 | Relative positioning, text highlighting, annotations |
| **[shadowed](./shadowed/)** | 0.3.0 | CSS-like reusable box shadows for cards and blocks |

### Data Visualization

| Package | Version | Description |
|---------|---------|-------------|
| **[lilaq](./lilaq/)** | 0.6.0 | Mature Typst-native plotting; default for existing SeaSlides statistical chart templates |
| **[gribouille](./gribouille/)** | 0.6.0 | Layered Grammar of Graphics API for mapped aesthetics and statistical transformations |

Use Lilaq for the existing SeaSlides line, bar, scatter, area, and distribution
templates or when direct mark/axis control is clearest. Use Gribouille when the
plot is naturally expressed as data mappings plus layers, statistics, scales,
and themes. Gribouille is in active development, so pin the catalog version and
read its current documentation before authoring.

### Diagrams

| Package | Version | Description |
|---------|---------|-------------|
| **[cetz](./cetz/)** | 0.5.2 | Typst-native canvas and primitives for custom drawings |
| **[merman](./merman/)** | 0.1.0 | Mermaid source rendered to SVG during Typst compilation via a bundled WASM plugin |
| **[fletcher](./fletcher/)** | 0.5.8 | Typst-native editable node-and-edge diagrams |
| **[chronos](./chronos/)** | 0.3.0 | Typst-native sequence diagrams with participants and lifelines |

### Linguistics

| Package | Version | Description |
|---------|---------|-------------|
| **[eggs](./eggs/)** | 0.9.0 | Numbered examples, interlinear glosses, judgments, references, and abbreviations |
| **[synkit](./synkit/)** | 0.1.0 | Linguistic syntax trees from bracket notation |

### Music Engraving

| Package | Version | Description |
|---------|---------|-------------|
| **[scoryst](./scoryst/)** | 0.2.0 | Editable symbolic staff notation rendered through Verovio WASM |
| **[typed-scores](./typed-scores/)** | 0.5.1 | Western staff notation from compact note-and-duration text |
| **[fretwork](./fretwork/)** | 0.4.0 | Guitar, bass, ukulele, and custom-tuning tablature from editable text |

### Utility

| Package | Version | Description |
|---------|---------|-------------|
| **[tiaoma](./tiaoma/)** | 0.3.0 | QR codes and barcodes (50+ types) |
| **[cuti](./cuti/)** | 0.4.0 | Fake bold/italic for CJK fonts |

### Molecular Structures

| Package | Version | Description |
|---------|---------|-------------|
| **[typed-smiles](./typed-smiles/)** | 0.11.0 | 2D molecular structures from supplied SMILES source |

---

## Quick Reference

```
Need what?
├── Custom heading numbering → numbly
├── Glossary, acronyms, first-use expansion → glossarium
├── Unreferenced figures, lost labels, uncited entries → sanity
├── Theorem/proof environments → theorion
├── LaTeX equations → mitex
├── Measurements, uncertainty, or units → unify
├── Vectors, derivatives, tensors, or Dirac notation → physica
├── Chemical formulas or reactions → typsium
├── Quantum circuits → quill
├── Electronic circuit diagrams → zap
├── Pseudocode → lovelace
├── Beautiful code blocks → codly or zebraw
├── Checklists → cheq
├── Markdown tables → tablem
├── Chinese exam papers with binding-aware geometry → examora
├── Chinese exams or handouts with sealing lines and solutions → ezexam
├── Text annotations / arrows → pinit
├── Card and block shadows → shadowed
├── Standard statistical charts → lilaq
├── Layered grammar-of-graphics plots → gribouille
├── Custom geometry and illustrations → cetz
├── Mermaid diagrams → merman
├── Editable node-and-edge diagrams → fletcher
├── Sequence diagrams with lifelines → chronos
├── Linguistic examples and glosses → eggs
├── Linguistic syntax trees → synkit
├── Molecular structures from SMILES → typed-smiles
├── MusicXML, MEI, or ABC staff notation → scoryst
├── Compact Western note text → typed-scores
├── Guitar, bass, or ukulele tablature → fretwork
├── QR codes / barcodes → tiaoma
└── CJK fake bold → cuti
```

---

## LaTeX Orientation

These are rough capability analogies for discovery, not API compatibility claims:

| Typst package | Rough LaTeX or adjacent analogue |
|---|---|
| Numbly | Section counters, `titlesec` |
| Glossarium | `glossaries`, `acronym` |
| Sanity | `refcheck`, manuscript linters |
| Theorion | `amsthm`, `thmtools`, theorem-style `tcolorbox` |
| MiTeX | Familiar `amsmath`-style LaTeX formula input |
| Unify | `siunitx` |
| Physica | `physics`, `commath`, `braket` |
| Typsium | `mhchem` |
| Quill | `quantikz`, `qcircuit` |
| Zap | `circuitikz` |
| Lovelace | `algorithm2e`, `algorithmicx` |
| Codly / Zebraw | `minted`, `listings` |
| Tablem | `booktabs`, `tabularx` |
| Cheq | `enumitem`-style task lists |
| Examora | `exam`, `exam-zh` |
| Ezexam | `exam-zh`, `exam` |
| Lilaq | `pgfplots` |
| Gribouille | Layered `pgfplots` or a `ggplot2`-style grammar |
| CeTZ | TikZ/PGF drawing and Processing-style canvases |
| Merman | Mermaid; often fills a role otherwise handled by TikZ/PGF diagrams |
| Fletcher | TikZ graphs, `tikz-cd` |
| Chronos | PlantUML or Mermaid sequence diagrams |
| Eggs | `expex`, `gb4e`, `linguex` |
| Synkit | `tikz-qtree`, `forest` syntax trees |
| Typed Smiles | SMILES renderers, ChemDraw-style skeletal structures |
| Scoryst | Verovio-backed MusicXML/MEI/ABC score embedding |
| Typed Scores | Text-authored Western staff engraving, roughly analogous to a compact LilyPond-style source |
| Fretwork | LilyPond-style tablature or a source-controlled guitar tab editor |
| Pinit | `tikzmark`, TikZ annotations |
| Shadowed | `tcolorbox` or TikZ shadows |
| Tiaoma | `qrcode`, `pst-barcode` |
| Cuti | `xeCJK` synthetic bold and italic options |

The machine-readable `rough_analogues` field in `index.json` carries the same discovery hint.
Always read the selected package's pinned README and demo before authoring.

---

## Usage Pattern

Presentation-oriented demos follow the same structure as `_shared/charts/`. Document-oriented
recipes such as Scoryst use an ordinary page so physical output can be verified directly.

```typst
#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/<package>:<version>": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Slide Title

// Package usage here
```
