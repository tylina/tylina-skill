# Physica — Scientific and Engineering Math Notation

**Package**: `@preview/physica:0.9.8`

**Category**: Science / mathematics

**Typst Universe**: <https://typst.app/universe/package/physica>

**Repository**: <https://github.com/Leedehai/typst-physics>

**Versioned source**: <https://github.com/Leedehai/typst-physics/tree/v0.9.8>

**Manual**: <https://github.com/Leedehai/typst-physics/blob/v0.9.8/physica-manual.pdf>

**License**: MIT

## Verified Boundary

Physica 0.9.8 provides semantic helpers for vectors, vector operators, matrices, derivatives,
Dirac notation, tensors, isotopes, and related scientific mathematics. It requires Typst 0.14.0
or newer and compiles with Typst 0.15.

This package formats notation; it does not check a derivation, dimension, tensor convention,
coordinate system, physical model, or experimental result. Use `unify` for measured values,
uncertainties, and units. Use a diagram or circuit package for geometry and connectivity rather
than imitating either with formulas.

Useful verified 0.9.8 entrypoints include:

- `vectorbold(symbol)`, `vectorunit(symbol)`, and `vectorarrow(symbol)`;
- `grad`, `div`, `curl`, and `laplacian` as mathematical operator content;
- `differential(..args)`, `derivative(f, ..args)`, and
  `partialderivative(f, ..args, total: none)`, with aliases `dd`, `dv`, and `pdv`;
- `bra(content)`, `ket(content)`, `braket(..args)`, and `ketbra(..args)`;
- `tensor(symbol, ..args)` with negative and positive math attachments for lower and upper
  indices;
- matrix helpers including `matrixdet`, `diagonalmatrix`, `identitymatrix`, `jacobianmatrix`,
  and `hessianmatrix`;
- `hbar` and `isotope(element, a: none, z: none)`.

Import only the names needed by the document, or import the package as a namespace when a short
name such as `div`, `curl`, or `rank` would collide with an existing definition.

## Minimal Usage

```typst
#import "@preview/physica:0.9.8": vectorbold, grad, div, curl, laplacian
#import "@preview/physica:0.9.8": bra, ket, braket, dd, dv, pdv, tensor, hbar

$ vectorbold(v), grad f, div vectorbold(E), curl vectorbold(A), laplacian phi $

$ dd(x), dv(f, x), pdv(u, x, y, [1, 2]) $

$ bra(psi), ket(phi), braket(psi, phi), tensor(T, -mu, +nu), hbar $
```

The variable arguments in `dv` and `pdv` determine the denominator and order. Preserve the
author's supplied derivative convention and inspect the exact 0.9.8 manual before using mixed
orders, custom differential symbols, evaluation bars, or generated matrices.

## Semantic and Layout Checks

- Do not apply the package's document-wide transpose or dagger show rules merely because they are
  convenient. They reinterpret superscript `T` or `+` throughout their scope; use them only when
  that convention is explicit and inspect unrelated formulas in the same scope.
- Preserve vector style, index variance and order, derivative order, operator meaning, matrix
  dimensions, state order, isotope numbers, and upright versus italic conventions.
- Do not repair a formula because the formatted result looks unfamiliar. Compare with the source
  or requested derivation and keep unresolved mathematical or physical questions visible.
- Validate with the real compiler, then inspect fractions, tall delimiters, tensor indices,
  matrices, and line breaks at final size. Compilation proves the API call is accepted, not that
  the scientific notation is correct.
