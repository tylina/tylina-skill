# Quill — Quantum Circuit Diagrams

**Package**: `@preview/quill:0.8.0`  
**Category**: Scientific diagram  
**Repository**: <https://github.com/Mc-Zen/quill>  
**License**: MIT

## Verified Boundary

Quill 0.8.0 renders quantum circuits with two related models. `quantum-circuit` accepts a manual
grid of gates and wire breaks. Its `tequila` submodule builds and composes instruction-driven
circuits in a QASM- or Qiskit-like order before embedding them in the grid model.

The package owns circuit geometry. It does not prove that an algorithm, state expression, gate
sequence, measurement, or result is physically or mathematically correct.

## Minimal Grid Usage

```typst
#{
  import "@preview/quill:0.8.0": *

  quantum-circuit(
    lstick($|0〉$), $H$, ctrl(1), rstick($(|00〉 + |11〉) / sqrt(2)$, n: 2), [\ ],
    lstick($|0〉$), 1, targ(), 1,
  )
}
```

For automatic placement, import `tequila as tq`, call `tq.build(...)`, and expand the returned gates
inside `quantum-circuit` with `..`. Read the exact 0.8.0 documentation before mixing the two models.

## Selection and Safety

- Preserve wire identity, initial states, gate order, controls, targets, measurements, classical
  wires, grouping, labels, and output states from the supplied circuit.
- Use integers only for deliberate empty grid cells. A new wire begins with the documented `[\ ]`
  content item; do not approximate connections with drawn lines.
- Verify multi-wire gates and `n`-wire labels against the source, not only visual alignment.
- Inspect the circuit at final size for crossed labels, clipped wires, ambiguous controls, and
  insufficient contrast.
- Read `typst-science/references/scientific-notation.md` for scientific-figure provenance.
