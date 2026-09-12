# Numbly — Heading Numbering

**Package**: `@preview/numbly:0.1.0`
**Category**: Heading formatting

## Description

Specify different numbering formats for different heading levels with a simple `{level:format}` syntax.

## Usage in Touying Slides

```typst
#import "@preview/numbly:0.1.0": numbly

#set heading(numbering: numbly(
  "{1}.",        // Level 1: "1."
  "{1}.{2}.",    // Level 2: "1.1."
  "{1}.{2}.{3}", // Level 3: "1.1.1"
))
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| Positional args | Format strings for each heading level (level 1, level 2, ...) |
| `default` | Fallback format for levels beyond those explicitly specified |

### `default` Parameter

Use `default` to handle deeper heading levels without listing every format:

```typst
#set heading(numbering: numbly(
  "{1}.",           // Level 1: "1."
  "{1}.{2}.",       // Level 2: "1.1."
  default: "1.1",  // Level 3+: fallback
))
```

## Format Specifiers

| Format | Output | Example |
|--------|--------|---------|
| `{1}` | Arabic | 1, 2, 3 |
| `{1:A}` | Uppercase letter | A, B, C |
| `{1:a}` | Lowercase letter | a, b, c |
| `{1:I}` | Roman numeral | I, II, III |
| `{1:i}` | Lowercase roman | i, ii, iii |

## Example

```typst
#set heading(numbering: numbly(
  "Appendix {1:A}.",
  "{1:A}.{2}.",
  "Step {3}.",
))
// Appendix A. → A.1. → Step 1.
```
