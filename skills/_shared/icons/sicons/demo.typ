#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/sicons:16.0.0": *

#show: simple-theme.with(aspect-ratio: "16-9")
#set text(size: 18pt)

== Sicons Demo — Simple Icons (Brand SVGs)

Access 3000+ high quality Simple Icons SVGs for popular brands.

=== Basic `sicon()` — Icon Only

#sicon(slug: "typst", size: 2em)
#h(1em)
#sicon(slug: "github", size: 2em)
#h(1em)
#sicon(slug: "python", size: 2em, icon-color: "default")
#h(1em)
#sicon(slug: "rust", size: 2em, icon-color: "#DEA584")

=== `stitle()` — Brand Name Text Only

#stitle(slug: "github", size: 1.2em)
#h(2em)
#stitle(slug: "python", size: 1.2em, text-color: blue)
#h(2em)
#stitle(slug: "docker", size: 1.2em, text-color: eastern)

=== `sicon-label()` — Icon + Brand Name

#sicon-label(slug: "github", size: 1.2em)
#h(2em)
#sicon-label(slug: "python", size: 1.2em, icon-color: "default")
#h(2em)
#sicon-label(slug: "docker", size: 1.2em, icon-color: "default", text-color: eastern)

=== Inline Usage with `box(baseline: .1em, ...)`

This project uses #box(baseline: .1em, sicon(slug: "typst", size: 1em)) Typst for typesetting,
#box(baseline: .1em, sicon(slug: "github", size: 1em)) GitHub for hosting, and
#box(baseline: .1em, sicon(slug: "python", size: 1em)) Python for scripting.

=== Grid of Icons

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 16pt,
  align(center)[#sicon(slug: "typst", size: 2em) \ Typst],
  align(center)[#sicon(slug: "github", size: 2em) \ GitHub],
  align(center)[#sicon(slug: "python", size: 2em) \ Python],
  align(center)[#sicon(slug: "rust", size: 2em) \ Rust],
  align(center)[#sicon(slug: "docker", size: 2em) \ Docker],
  align(center)[#sicon(slug: "linux", size: 2em) \ Linux],
  align(center)[#sicon(slug: "react", size: 2em) \ React],
  align(center)[#sicon(slug: "tensorflow", size: 2em) \ TensorFlow],
)
