#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/booticons:0.0.1": bsicon

#show: simple-theme.with(aspect-ratio: "16-9")
#set text(size: 18pt)

== Bootstrap Icons Demo — 2000+ Icons

=== Basic Usage

```typst
#import "@preview/booticons:0.0.1": bsicon

#bsicon("house-fill")
#bsicon("person-fill", color: blue)
#bsicon("gear-fill", height: 2em)
```

=== Custom Color

#bsicon("heart-fill", color: red)
#bsicon("star-fill", color: orange)
#bsicon("check-circle-fill", color: green)

=== Custom Size

#bsicon("house-fill", height: 1em) 1em
#h(1em)
#bsicon("house-fill", height: 2em) 2em
#h(1em)
#bsicon("house-fill", height: 3em) 3em

=== Inline with Text

Use `baseline` and `height` for proper vertical alignment in running text:

Click #bsicon("gear-fill", baseline: .1em, height: .9em) Settings to configure.
Press #bsicon("check-circle-fill", color: green, baseline: .1em, height: .9em) to confirm.

=== Context Usage (matching text color)

When using `text.fill` as the color, wrap in `#context`:

#context bsicon("house-fill", color: text.fill)
#context bsicon("info-circle-fill", color: text.fill)

=== Icon Grid

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
  [#bsicon("house-fill", height: 1.5em) Home],
  [#bsicon("person-fill", height: 1.5em) User],
  [#bsicon("gear-fill", height: 1.5em) Settings],
  [#bsicon("bell-fill", height: 1.5em) Alerts],
  [#bsicon("envelope-fill", height: 1.5em) Mail],
  [#bsicon("search", height: 1.5em) Search],
  [#bsicon("star-fill", height: 1.5em) Favorites],
  [#bsicon("heart-fill", height: 1.5em) Likes],
)
