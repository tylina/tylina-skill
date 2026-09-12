# Lovelace — Pseudocode

**Package**: `@preview/lovelace:0.3.1`
**Category**: Code / Algorithm

## Description

Write pseudocode with arbitrary keywords, optional line numbering, and line labels. Named after Ada Lovelace.

## Usage in Touying Slides

```typst
#import "@preview/lovelace:0.3.1": *

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(booktabs: true, numbered-title: smallcaps[My Algorithm])[
    + do something
    + do something else
    + *while* still something to do
      + do even more
      + *if* not done yet *then*
        + wait a bit
        + resume working
      + *else*
        + go home
      + *end*
    + *end*
  ]
) <my-algo>

See @my-algo for details.
```

## Key Features

- Arbitrary keywords (no predefined syntax)
- Nested lists become indented blocks
- `booktabs: true` for horizontal rules
- `numbered-title` for algorithm title with line numbering
- Wrap in `#figure(kind: "algorithm")` for cross-references
- Customizable indentation and styling
