# Unify — Numbers, Quantities, and Ranges

**Package**: `@preview/unify:0.8.1`  
**Category**: Scientific notation  
**Typst Universe**: <https://typst.app/universe/package/unify>
**Repository**: <https://github.com/ChHecker/unify>  
**License**: MIT

## Verified Boundary

Unify formats supplied numbers, uncertainties, quantities, and ranges. Version 0.8.1 exports
`num`, `unit`, `qty`, `numrange`, and `qtyrange`. Its string grammar supports scientific notation,
symmetric uncertainty with `+-` or `±`, asymmetric uncertainty with `+...-...`, and physical,
monetary, or binary units.

The package typesets values; it does not measure, convert, round, validate dimensions, or establish
the scientific correctness of a value. Preserve significant zeros and the source string unless the
user supplies a transformation rule.

## Minimal Usage

```typst
#import "@preview/unify:0.8.1": num, qty, numrange, qtyrange, unit

$ num("-1.32865+-0.50273e-6") $
$ qty("12.50+-0.08", "g") $
$ numrange("1.20", "1.80") $
$ qtyrange("1e3", "2e3", "meter per second squared", per: "/") $
```

Those compact helpers own their display conventions. In 0.8.1, `qty` can add grouping
parentheses around an uncertainty and the range helpers can add spacing around a delimiter.
That is appropriate for ordinary scientific formatting, but it does not preserve a supplied
string such as `12.50 ± 0.08 g` or `1.20–1.80 mL` character-for-character.

When exact presentation is part of the evidence, compose the same semantic number and unit
primitives explicitly. Do not inspect package source looking for an option that 0.8.1 does not
provide:

```typst
#let exact-quantity(value, unit-name) = [
  #num(value)#h(0.166667em)#unit(unit-name)
]

#let exact-uncertainty(value, uncertainty, unit-name) = [
  #num(value)#h(0.166667em)#sym.plus.minus#h(0.166667em)
  #num(uncertainty)#h(0.166667em)#unit(unit-name)
]

#let exact-range(lower, upper, unit-name, delimiter: [–]) = [
  #num(lower)#delimiter#num(upper)#h(0.166667em)#unit(unit-name)
]

#exact-uncertainty("12.50", "0.08", "g")
#exact-quantity("23.4", "celsius")
#exact-range("1.20", "1.80", "mL")
```

The package evaluates its helpers in math mode, so ordinary spaces inside generated math strings
do not provide controllable visual spacing. Use an explicit Typst `h(...)` at the composition
boundary. See `demo.typ` for compile-verified uncertainty, temperature, and tight-range examples.

Use strings when precision and notation must remain exact. Verify the active decimal marker,
thousands separator, exponent multiplier, range delimiter, unit spacing, and `per` convention.

## Selection and Safety

- The examples above and `demo.typ` are sufficient for ordinary uncertainty, temperature,
  source-exact uncertainty, and tight-range output. Inspect the exact 0.8.1 documentation only
  for an API not covered here; do not read package source merely to reconfirm these patterns.
- English and Russian unit names are bundled. Do not assume surrounding language localizes the unit
  database; symbolic units may be more appropriate for another locale.
- `u` is the package shorthand for micro. Check the rendered unit rather than substituting a lookalike.
- Unify evaluates unit expressions in math mode. Never pass untrusted text as a raw unit expression.
- Keep calculations outside the display helper, with source values and rounding rules visible.
- Read `typst-science/references/scientific-notation.md` for measurement and provenance checks.
