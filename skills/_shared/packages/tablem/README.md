# Tablem — Markdown-like Tables

**Package**: `@preview/tablem:0.3.0`
**Category**: Table

## Description

Write markdown-like tables in Typst — copy-paste markdown tables directly. Includes `three-line-table` preset for academic style.

## Usage in Touying Slides

```typst
#import "@preview/tablem:0.3.0": tablem, three-line-table

#tablem[
  | *Name* | *Score* |
  | ------ | ------- |
  | Alice  | 95      |
  | Bob    | 87      |
]

// Academic three-line table
#three-line-table[
  | *Method* | *Accuracy* |
  | :------: | :--------: |
  | Ours     | **95.2%**  |
]
```

## Key Features

- Markdown table syntax
- Column alignment (`:---:`, `:---`, `---:`)
- Built-in `three-line-table` preset
- Custom render function support
