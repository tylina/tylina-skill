# Zap — Editable Electronic Circuit Diagrams

**Package**: `@preview/zap:0.6.0`  
**Category**: Science and Engineering  
**Typst Universe**: <https://typst.app/universe/package/zap>  
**Repository**: <https://codeberg.org/grangelouis/zap>  
**License**: MIT

## Verified Boundary

Zap 0.6.0 draws source-controlled electronic circuit diagrams with symbols inspired by IEC and
IEEE/ANSI conventions. This recipe verifies `zap.circuit`, named nodes, two-terminal `resistor`
components, relative coordinates, labels, and current annotations. The exact package documentation
covers additional sources, passive components, semiconductors, logic, instruments, and integrated
devices.

Zap draws a supplied circuit. It does not infer connectivity from prose, simulate a circuit, check
electrical correctness, or certify standards compliance. Preserve component identities, terminals,
wire ownership, polarity, labels, and values from the source evidence.

## Minimal Usage

```typst
#import "@preview/zap:0.6.0"

#zap.circuit({
  import zap: *
  node("input", (0, 0))
  resistor("r1", "input", (rel: (3, 0)), label: $R_1$, i: $i$)
  resistor("r2", (rel: (0, 0)), (rel: (3, 0)), label: $R_2$)
  node("output", (rel: (0, 0)))
})
```

Every component name must be unique. Within a circuit, relative coordinates continue from the
current drawing position; named anchors should be used when topology matters more than draw order.

## Selection and Safety

- Use Zap for conventional electronic circuit symbols and explicit wiring.
- Use Quill for quantum circuits, Circuiteria for block-style circuit diagrams, and CeTZ for custom
  geometry that is not naturally expressed as electronic components.
- Do not invent component values, terminal connections, current direction, polarity, or a ground
  reference. A neat diagram is not an electrical analysis.
- The symbols are standards-inspired illustrations, not certification. Safety-critical or regulated
  diagrams require review against the applicable official standard and source design.

## Web Compatibility and Limits

Zap 0.6.0 is implemented in Typst and imports CeTZ 0.5.2. It has no native-process or
WebAssembly-plugin dependency, so it follows the ordinary package-fetch and compilation path in Web
and native Tylina. Both packages must be available through the host package provider.

Large circuits can become slow or visually ambiguous. Split genuinely separate subsystems, reuse
styles, and inspect crossings, junctions, labels, arrow direction, component variants, clipping, and
export output at final size. For components beyond this verified subset, inspect the exact 0.6.0
documentation rather than guessing a CircuitikZ or newer Zap API.
