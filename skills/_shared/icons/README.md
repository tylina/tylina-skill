# Icon Packages for Touying Slides

Curated collection of icon packages for use in Touying presentations. **Emoji (built-in) is recommended as the default choice** — no dependencies needed.

> **For AI**: Use `index.json` for programmatic lookup. This README is for human browsing.

---

## Recommendation

**Use Unicode characters directly whenever possible.** Typst supports Unicode natively, so LLMs can directly output emoji (🚀 ⭐ ✅) and symbols (→ ← ● ■ △) as literal characters in source code — no special syntax needed. This is the simplest and most portable approach.

Alternatively, Typst provides two built-in modules for named access:
- **`#emoji.xxx`** — named emoji ([reference](https://typst.app/docs/reference/symbols/emoji/))
- **`#sym.xxx`** — math/text symbols like arrows, Greek letters, operators ([reference](https://typst.app/docs/reference/symbols/sym/))

Only use icon packages when you need:
- Brand logos (e.g., Sicons for Python, Typst, etc.)
- A specific icon set (e.g., GitHub Octicons for dev talks)
- License icons (Creative Commons)
- Social media links with icons (for CV/contact slides)

---

## Available Icon Sources

| Source | Icons | Import | Best For |
|--------|-------|--------|----------|
| **Emoji** (built-in) | 1000+ | `#emoji.rocket` | Default, universal, no deps |
| **[Sicons](./sicons/)** | 3000+ | `@preview/sicons:16.0.0` | Brand logos (Typst, GitHub, etc.) |
| **[CC Icons](./ccicons/)** | 20+ | `@preview/ccicons:1.0.1` | License attribution (CC BY, CC SA, etc.) |
| **[Octicons](./octique/)** | 378 | `@preview/octique:0.1.1` | GitHub, developer, AI/Copilot |
| **[Iconic Salmon](./iconic-salmon-svg/)** | 30+ | `@preview/iconic-salmon-svg:3.0.0` | Social media links, CV |
| **[Bootstrap Icons](./booticons/)** | 2000+ | `@preview/booticons:0.0.1` | Web/UI, general purpose |

---

## Quick Decision Tree

```
Need icons?
├── General emoji (✅ ⭐ 🚀 📊) → emoji (built-in, recommended)
├── Brand logos (GitHub, Python, etc.) → Sicons
├── GitHub/dev icons → Octicons
├── License icons (CC BY, CC SA) → CC Icons
├── Social media links with clickable URLs → Iconic Salmon SVG
└── Large general icon set (UI, weather, etc.) → Bootstrap Icons
```

---

## Emoji & Symbol Quick Reference

### Option 1: Direct Unicode (Recommended for LLM)

LLMs can directly output Unicode characters — no syntax needed:

```typst
// Just type the characters directly!
✅ Done    ❌ Failed    ⚠️ Warning    💡 Idea
⭐ Important    🚀 Launch    📈 Growth    📉 Decline
→ Arrow    ● Bullet    ■ Square    △ Triangle
```

### Option 2: Named Emoji (`#emoji.xxx`)

[Full reference](https://typst.app/docs/reference/symbols/emoji/)

```typst
#emoji.checkmark.box  // ☑️
#emoji.star           // ⭐
#emoji.rocket         // 🚀
#emoji.chart.up       // 📈
#emoji.gear           // ⚙️
```

### Option 3: Named Symbols (`#sym.xxx`)

[Full reference](https://typst.app/docs/reference/symbols/sym/)

```typst
#sym.arrow.r          // →
#sym.arrow.l          // ←
#sym.bullet           // •
#sym.checkmark        // ✓
#sym.times            // ×
#sym.alpha, #sym.beta // α, β
```
