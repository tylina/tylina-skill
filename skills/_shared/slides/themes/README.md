# Touying Themes — Dispatch

> This directory contains all available themes organized by complexity tier. Each sub-directory has its own `index.json` (programmatic lookup) and `README.md` (human-readable catalog).

## Directory Structure

```
themes/
├── custom-rich/      → Structured components, cards, metrics
├── custom-canvas/    → Full editorial/SVG compositions
├── custom-plain/     → Lightweight color/typography schemes
├── builtin/          → Touying built-in (no local files needed)
├── universe/         → Community packages (institutional)
└── user/             → Upstream-maintainer area; not an Agent-writable Tylina library
```

## Capability-Aware Routing

| Task and execution capability | Recommended path | Read this |
|---|---|---|
| Dependable component-based authoring | Rich | `custom-rich/README.md` |
| Bespoke composition is useful and content/code modes, theme APIs, and a compile probe are reliable | Canvas | `custom-canvas/README.md` |
| User explicitly requests minimal/undecorated output | Plain | `custom-plain/README.md` |

> **Plain themes** (`custom-plain/`): Only use when the user **explicitly** requests minimal/plain/undecorated style (e.g., "朴素一些", "不要太多装饰", "简约风格") or names a specific plain theme. Never default to Plain.

## Quick Selection Rules

1. **Honor the current workspace or a host-managed user theme first** — do not scan or write a
   private packaged-resource directory
2. **Never default to builtin** unless user explicitly names one
3. **Diversify** — don't always pick the same theme for a topic
4. **Match the feeling** — choose by visual atmosphere, not rigid topic category
5. **Prefer the simplest sufficient tier** — use Canvas only when bespoke composition materially helps

## Index Files

Each sub-directory contains its own `index.json` for programmatic lookup:
- `custom-rich/index.json`
- `custom-canvas/index.json`
- `custom-plain/index.json`
- `builtin/index.json`
- `universe/index.json`

## Import Patterns

| Theme Type | Import Statement |
|-----------|-----------------|
| Custom (all tiers) | `#import "template.typ": *` |
| Builtin | `#import themes.<name>: *` |
| Universe | `#import "@preview/<package>:<version>": *` |

## Theme Discovery and Materialization

Use the tier indexes to choose a bundled theme, resolve the exact entry with `template.list`,
inspect it, and materialize it with `template.create`. Use the returned destination and
entrypoint. A host-managed user theme is available only when the host catalog exposes it.

Selection order: current scaffold or host-managed selection → relevant bundled tier → builtin or
Universe theme only when the user names it or its documented capability is needed.
