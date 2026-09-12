# Cheq — Markdown-like Checklists

**Package**: `@preview/cheq:0.4.0`
**Category**: List

## Description

Write markdown-like checklists with GitHub Flavored Markdown syntax. Supports [x], [ ], [/], [-] and custom symbols.

## Usage in Touying Slides

```typst
#import "@preview/cheq:0.4.0": checklist
#show: checklist

- [x] Completed task
- [ ] Pending task
- [/] In progress
- [-] Cancelled
```

## Predefined Symbols

| Syntax | Meaning |
|--------|---------|
| `[ ]` | Unchecked |
| `[x]` | Checked |
| `[/]` | In progress |
| `[-]` | Cancelled |
| `[!]` | Important (custom) |
| `[?]` | Question (custom) |
