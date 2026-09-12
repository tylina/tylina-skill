#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/ccicons:1.0.1": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== CC Icons Demo — Creative Commons Icons

=== License Icons

#grid(columns: (1fr, 1fr), gutter: 16pt,
  [#text(size: 24pt)[#cc-by] CC BY],
  [#text(size: 24pt)[#cc-by-sa] CC BY-SA],
  [#text(size: 24pt)[#cc-by-nc] CC BY-NC],
  [#text(size: 24pt)[#cc-by-nd] CC BY-ND],
  [#text(size: 24pt)[#cc-by-nc-sa] CC BY-NC-SA],
  [#text(size: 24pt)[#cc-by-nc-nd] CC BY-NC-ND],
)

=== Usage

```typst
#import "@preview/ccicons:1.0.1": *

This work is licensed under #cc-by-sa
```
