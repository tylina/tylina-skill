# Cuti — Fake Bold for CJK Fonts

**Package**: `@preview/cuti:0.4.0`
**Category**: Font

## Description

Simulates fake bold / fake italic / fake small capitals, especially useful for CJK fonts (e.g., SimSun / 宋体) that lack bold weight.

## Usage in Touying Slides

```typst
#import "@preview/cuti:0.4.0": show-cn-fakebold
#show: show-cn-fakebold

// Now *bold* works for CJK fonts without bold weight
*这是伪粗体文本*
```

## Key Functions

| Function | Description |
|----------|-------------|
| `show-cn-fakebold` | Show rule for Chinese fake bold |
| `fakebold[...]` | Manual fake bold |
| `fakeitalic[...]` | Manual fake italic |
| `fakesc[...]` | Manual fake small caps |
