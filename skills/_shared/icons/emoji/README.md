# Emoji & Symbols — Built-in Icons (Recommended)

**Type**: Typst built-in (no package needed)
**Icon count**: 1000+ emoji + 900+ symbols

## Description

Typst has excellent built-in Unicode support. **This is the recommended default** — no dependencies, no font installation, works everywhere.

**Three ways to use:**

1. **Direct Unicode** (simplest, recommended for LLM): Just type emoji/symbols directly — `🚀 ⭐ ✅ → ●`
2. **`#emoji.xxx`** syntax: Named emoji access — [full reference](https://typst.app/docs/reference/symbols/emoji/)
3. **`#sym.xxx`** syntax: Named symbol access (arrows, Greek, math) — [full reference](https://typst.app/docs/reference/symbols/sym/)

> **Tip for LLMs**: Directly outputting Unicode characters (🚀, →, ✓) is simpler and more portable than using `#emoji.xxx` or `#sym.xxx` syntax. Both approaches work in Typst.

## Usage

```typst
// Option 1: Direct Unicode (recommended)
🚀 Launch    ⭐ Star    ✅ Done    → Next

// Option 2: Named emoji
#emoji.rocket    #emoji.star    #emoji.checkmark.box

// Option 3: Named symbols
#sym.arrow.r    #sym.checkmark    #sym.bullet    #sym.alpha
```

## Common Presentation Emojis

### Status & Indicators

| Code | Emoji | Usage |
|------|-------|-------|
| `#emoji.checkmark.box` | ☑️ | Done, completed |
| `#emoji.crossmark` | ❌ | Failed, error |
| `#emoji.warning` | ⚠️ | Warning, caution |
| `#emoji.lightbulb` | 💡 | Idea, tip |
| `#emoji.star` | ⭐ | Important, highlight |
| `#emoji.fire` | 🔥 | Hot, trending |

### Actions & Objects

| Code | Emoji | Usage |
|------|-------|-------|
| `#emoji.rocket` | 🚀 | Launch, fast, deploy |
| `#emoji.gear` | ⚙️ | Settings, config |
| `#emoji.magnify.l` | 🔍 | Search, analyze |
| `#emoji.clock` | 🕐 | Time, schedule |
| `#emoji.calendar` | 📅 | Date, planning |
| `#emoji.chain` | 🔗 | Link, reference |
| `#emoji.lock` | 🔒 | Security, locked |
| `#emoji.key` | 🔑 | Key, access |

### Charts & Data

| Code | Emoji | Usage |
|------|-------|-------|
| `#emoji.chart.up` | 📈 | Growth, trend up |
| `#emoji.chart.down` | 📉 | Decline, trend down |
| `#emoji.bar.chart` | 📊 | Data, statistics |
| `#emoji.clipboard` | 📋 | List, report |

### People & Communication

| Code | Emoji | Usage |
|------|-------|-------|
| `#emoji.person` | 🧑 | User, person |
| `#emoji.face.beam` | 😁 | Happy, success |
| `#emoji.face.think` | 🤔 | Thinking, question |
| `#emoji.speech` | 💬 | Comment, discussion |
| `#emoji.envelope` | ✉️ | Email, message |

### Symbols

| Code | Emoji | Usage |
|------|-------|-------|
| `#emoji.globe` | 🌐 | Global, international |
| `#emoji.house` | 🏠 | Home |
| `#emoji.school` | 🏫 | Education, institution |
| `#emoji.city` | 🏙️ | City, organization |
| `#emoji.trophy` | 🏆 | Achievement, winner |
| `#emoji.medal` | 🏅 | Award, recognition |

## Tips

- Emoji renders as text, so you can style it: `#text(size: 24pt)[#emoji.star]`
- Use in headers: `== #emoji.rocket Launch Plan`
- Use in lists: `- #emoji.checkmark.box Task completed`
