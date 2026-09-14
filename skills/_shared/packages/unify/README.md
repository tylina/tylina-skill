# Unify — Numbers, Quantities, and Ranges

**Package**: `@preview/unify:0.8.1`  
**Category**: Scientific notation  
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
#import "@preview/unify:0.8.1": num, qty, numrange, qtyrange

$ num("-1.32865+-0.50273e-6") $
$ qty("12.50+-0.08", "g") $
$ numrange("1.20", "1.80") $
$ qtyrange("1e3", "2e3", "meter per second squared", per: "/") $
```

Use strings when precision and notation must remain exact. Verify the active decimal marker,
thousands separator, exponent multiplier, range delimiter, unit spacing, and `per` convention.

## Selection and Safety

- Read the exact 0.8.1 package documentation before using advanced unit or customization APIs.
- English and Russian unit names are bundled. Do not assume surrounding language localizes the unit
  database; symbolic units may be more appropriate for another locale.
- `u` is the package shorthand for micro. Check the rendered unit rather than substituting a lookalike.
- Unify evaluates unit expressions in math mode. Never pass untrusted text as a raw unit expression.
- Keep calculations outside the display helper, with source values and rounding rules visible.
- Read `typst-science/references/scientific-notation.md` for measurement and provenance checks.
