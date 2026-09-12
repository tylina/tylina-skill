#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/octique:0.1.1": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Octicons Demo — GitHub Icons

=== Usage

```typst
#import "@preview/octique:0.1.1": *

#octique-inline("mark-github")
#octique-inline("repo")
#octique-inline("git-branch")
```

=== Example Icons

#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt,
  [#octique-inline("mark-github") GitHub],
  [#octique-inline("repo") Repository],
  [#octique-inline("git-branch") Branch],
)

Browse all icons: https://primer.style/foundations/icons/
