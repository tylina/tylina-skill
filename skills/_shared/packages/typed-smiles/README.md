# Typed Smiles — Molecular Structures from SMILES

**Package**: `@preview/typed-smiles:0.11.0`  
**Category**: Chemistry diagram  
**Typst Universe**: <https://typst.app/universe/package/typed-smiles>  
**Repository**: <https://github.com/GeronimoCastano/typed-smiles>  
**License**: MIT

## Verified Boundary

Typed Smiles 0.11.0 parses SMILES and renders editable-source 2D molecular diagrams with a bundled
Rust/WASM parser and CeTZ. It supports ordinary skeletal structures, aromatic input, explicit
hydrogens, stereochemical bonds, scale and journal-size presets, atom annotations, lone pairs,
custom labels, reactions, and mechanism helpers.

It renders the supplied chemical graph. It does not verify the identity, synthesis, safety,
stereochemical claim, or scientific correctness of a molecule. Never “repair” an unfamiliar
SMILES string because the result looks implausible.

## Minimal Usage

```typst
#import "@preview/typed-smiles:0.11.0": smiles

#smiles("CCO")
#smiles("CC(N)C(=O)O", style: "acs", font: "New Computer Modern")
#smiles("c1ccccc1", aromatic: "circle")
```

`scale` changes bond length, labels, and strokes together. A journal preset such as `"acs"`,
`"rsc"`, `"nature"`, or `"wiley"` supplies published drawing dimensions and may also name a
system font. Explicit `font`, `font-size`, `bond-length`, and `bond-stroke` parameters override the
preset. The example keeps ACS dimensions while selecting Typst's bundled New Computer Modern so
its atom labels do not depend on Helvetica or Arial being installed.

## Selection Guidance

- Use Typsium for formulas, ions, isotopes, reaction equations, phases, and annotated reaction
  arrows that do not require a molecular structure drawing.
- Use Typed Smiles when canonical input is SMILES and a 2D skeletal structure belongs in Typst.
- Use Molchemist for supplied Molfile or SDF data, and inspect its exact current package API.
- Use a domain drawing tool or a supplied figure when the required stereochemistry, conformation,
  or publication standard cannot be represented faithfully by the verified package route.

## Source Fidelity and Verification

- Preserve the original SMILES string and its provenance. Aromatic and Kekulé spellings may render
  similarly while remaining different source representations.
- `mirror` exchanges wedge and hash orientation on a single-axis reflection so the depicted
  stereochemistry remains coherent, but mirroring is not authorization to change a chemical claim.
- `show-h`, custom labels, atom annotations, lone-pair modes, and reaction helpers affect semantics
  as well as appearance. Use only values supported by the source or explicit user intent.
- Verify parse errors against the exact input. Inspect atom labels, bond order, aromatic rings,
  wedges/hashes, charges, hydrogens, lone pairs, scaling, and reaction alignment at final size.
- Read the exact 0.11.0 documentation before using reaction or mechanism helpers, custom-label
  modifiers, or atom-indexed annotations not shown in the minimal example.
