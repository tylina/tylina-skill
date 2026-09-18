# Synkit — Linguistic Syntax Trees

**Package**: `@preview/synkit:0.1.0`  
**Category**: Linguistics  
**Typst Universe**: <https://typst.app/universe/package/synkit>  
**Repository**: <https://github.com/guilhermegarcia/synkit>  
**Versioned manual**: <https://doi.org/10.5281/zenodo.19405774>  
**License**: MIT

## Verified Boundary

Synkit 0.1.0 turns bracket notation into editable linguistic syntax trees. This recipe verifies the
public `tree` function with a nested phrase-structure tree. The package also documents movement
arrows, multidominance, annotations, multiple-tree `garden` layouts, examples, and glosses; read the
exact 0.1.0 documentation before using those advanced surfaces.

Synkit renders a supplied analysis. It does not determine constituents, attachment, movement,
coindexing, grammaticality, or interpretation. Preserve the user's bracket structure and labels,
and clearly identify any new linguistic analysis instead of presenting it as source data.

## Minimal Usage

```typst
#import "@preview/synkit:0.1.0": tree

#tree(
  "[S [NP [Det the] [N cat]] [VP [V sat] [PP [P on] [NP [Det the] [N mat]]]]]",
)
```

The bracket string is the semantic source. Spaces between brackets are flexible, but labels,
bracketing, primes, subscripts, and trace names carry meaning and should not be normalized casually.

## Selection Guidance

- Use Synkit for phrase-structure trees authored from bracket notation, especially when movement or
  other linguistics-specific annotations are needed.
- Use Eggs for numbered examples and interlinear glosses when no syntax tree is required.
- Use Fletcher for general trees or graphs that are not linguistic constituent structures.
- Keep a working syntax-tree package already used by the document unless a requested capability is
  genuinely missing.

## Web Compatibility and Limits

Synkit 0.1.0 is implemented in Typst and imports CeTZ 0.5.2. It has no native-process or
WebAssembly-plugin dependency, so it follows the ordinary package-fetch and compilation path in Web
and native Tylina. Both packages must be available through the host package provider.

This is an early package release. Pin 0.1.0, test the exact notation used by the document, and inspect
large or deeply nested trees for width, branch collisions, label overlap, movement-arrow routing,
and page clipping. The bundled demo proves the basic `tree` path only; it does not promise that every
advanced annotation or arbitrary-size tree will lay out without adjustment.
