# Typst Language Modes

Use this compact reference only when an edit crosses a syntax boundary. It is distilled from
Typst's official syntax and scripting references at revision
`2924ba908b7e535ef6166a8b1731d400b694e9d9`.

## Three Modes

- **Markup** is the document default and the body of a content block `[...]`.
- **Math** is delimited by `$...$`. Inline math has no surrounding spaces; display math does.
- **Code** is entered from markup with `#`, and is already active inside function argument lists,
  code blocks, bindings, conditions, loops, and closures.

Derive the current mode from the real parser/provider and surrounding compiled source. Do not
infer it from a bracket character, indentation, visible text, or a function name.

## Crossing Boundaries

From markup to code:

```typ
#figure(image("plot.png"), caption: [Measured response])
#(1 + 2)
#{
  let value = 3
  value * 2
}
```

Use `#expression` for a simple expression, `#(...)` when a compound expression needs a clear
boundary, and `#{...}` for multiple code statements.

From code to markup, use a content block:

```typ
#let title = [*Measured response*]
#let panel(body) = block(inset: 8pt, body)
#panel[Reader-visible content]
```

Once code mode is active, do not insert another `#` unless a nested markup or math region switched
the parser away from code:

```typ
#figure(
  table(columns: 2, [Item], [Value]),
  caption: [A semantic table],
)
```

The nested `table(...)` is already in `figure`'s code-mode argument list. Writing `#table(...)`
there is invalid.

In math mode, math functions do not need `#`; an ordinary code expression does:

```typ
$sqrt(x) + #offset$
```

## Content and Strings

Treat `content` and `str` as different types:

- Prefer `[Reader-visible content]` when an API accepts content. It preserves markup, math,
  citations, styling, and inline elements.
- Use strings for paths, URLs, font names, identifiers, enum/config selectors, serialization, or
  values intentionally processed by string-only operations.
- Verify the real function signature or a compile-verified call. Do not convert a value merely
  because it is short or visually looks like text.

When joining code expressions into reader-visible content, enter markup explicitly:

```typ
[#(qty(1, "kV")) \ #(qty(3, "kV"))]
```

Preserve the original source form when it remains valid. After changing a mode boundary, run a
real Tylina validation before accepting the edit.

## Authoritative Sources

- <https://typst.app/docs/reference/syntax/>
- <https://typst.app/docs/reference/scripting/>
- `_shared/docs/typst/docs/content/reference/language/syntax.typ`
- `_shared/docs/typst/docs/content/reference/language/scripting.typ`
