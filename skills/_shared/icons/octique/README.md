# Octicons — GitHub Icons

**Package**: `@preview/octique:0.1.1`
**Icon count**: 378
**Source**: [GitHub Octicons](https://primer.style/octicons/)

## Description

GitHub's official icon set (Octicons) for Typst. Includes icons for GitHub UI, development workflows, AI/Copilot, file management, communication, and more.

## Usage

```typst
#import "@preview/octique:0.1.1": *

#octique("mark-github")                              // image
#octique-inline("mark-github")                       // inline (boxed)
#octique("mark-github", color: blue, width: 2em)     // custom
#octique-svg("mark-github")                          // raw SVG text
```

## Functions

| Function | Description |
|----------|-------------|
| `octique(name, color:, width:, height:)` | Render icon as image |
| `octique-inline(name, color:, width:, height:, baseline:)` | Render inline (boxed) |
| `octique-svg(name)` | Get raw SVG text |

## Complete Icon List (378 icons)

### GitHub & Git (27)
`codespaces`, `feed-repo`, `git-branch`, `git-branch-check`, `git-commit`, `git-compare`, `git-merge`, `git-merge-queue`, `git-pull-request`, `git-pull-request-closed`, `git-pull-request-draft`, `git-pull-request-locked`, `lockup-github`, `logo-gist`, `logo-github`, `mark-github`, `repo`, `repo-clone`, `repo-delete`, `repo-deleted`, `repo-forked`, `repo-forked-locked`, `repo-locked`, `repo-pull`, `repo-push`, `repo-template`, `report`

### AI & Copilot (10)
`agent`, `ai-model`, `comment-ai`, `copilot`, `copilot-error`, `copilot-warning`, `pencil-ai`, `sparkle`, `sparkle-fill`, `sparkles-fill`

### Code & Development (14)
`beaker`, `bug`, `code`, `code-of-conduct`, `code-review`, `code-square`, `codescan`, `codescan-checkmark`, `file-code`, `mcp`, `sandbox`, `terminal`, `vscode`, `webhook`

### Files & Directories (17)
`file`, `file-added`, `file-badge`, `file-binary`, `file-check`, `file-code`, `file-diff`, `file-directory`, `file-directory-fill`, `file-directory-open-fill`, `file-directory-symlink`, `file-media`, `file-moved`, `file-removed`, `file-submodule`, `file-symlink-file`, `file-zip`

### Navigation & Arrows (28)
`arrow-both`, `arrow-down`, `arrow-down-left`, `arrow-down-right`, `arrow-left`, `arrow-right`, `arrow-switch`, `arrow-up`, `arrow-up-left`, `arrow-up-right`, `chevron-down`, `chevron-left`, `chevron-right`, `chevron-up`, `fold`, `fold-down`, `fold-up`, `move-to-bottom`, `move-to-end`, `move-to-start`, `move-to-top`, `sidebar-collapse`, `sidebar-expand`, `triangle-down`, `triangle-left`, `triangle-right`, `triangle-up`, `unfold`

### Communication (36)
`bell`, `bell-fill`, `bell-slash`, `broadcast`, `comment`, `comment-discussion`, `comment-locked`, `discussion-closed`, `discussion-duplicate`, `discussion-outdated`, `feed-discussion`, `feed-forked`, `feed-heart`, `feed-issue-closed`, `feed-issue-draft`, `feed-issue-open`, `feed-issue-reopen`, `feed-merged`, `feed-person`, `feed-plus`, `feed-public`, `feed-pull-request-closed`, `feed-pull-request-draft`, `feed-pull-request-open`, `feed-rocket`, `feed-star`, `feed-tag`, `feed-trophy`, `inbox`, `inbox-fill`, `mail`, `megaphone`, `mention`, `mute`, `rss`, `unmute`

### People & Organizations (6)
`organization`, `people`, `person`, `person-add`, `person-fill`, `sponsor-tiers`

### Status & Alerts (31)
`alert`, `alert-fill`, `blocked`, `check`, `check-circle`, `check-circle-fill`, `checkbox`, `checkbox-fill`, `checklist`, `info`, `issue-closed`, `issue-draft`, `issue-locked`, `issue-opened`, `issue-reopened`, `issue-tracked-by`, `issue-tracks`, `no-entry`, `no-entry-fill`, `shield`, `shield-check`, `shield-lock`, `shield-slash`, `shield-x`, `stack-check`, `stop`, `stopwatch`, `unverified`, `verified`, `x-circle`, `x-circle-fill`

### Actions & Operations (39)
`bookmark`, `bookmark-fill`, `bookmark-filled`, `bookmark-slash`, `bookmark-slash-fill`, `clock`, `clock-fill`, `copy`, `dash`, `desktop-download`, `download`, `filter`, `filter-remove`, `grabber`, `link`, `link-external`, `lock`, `paste`, `pencil`, `pin`, `pin-slash`, `plus`, `plus-circle`, `redo`, `search`, `share`, `share-android`, `sign-in`, `sign-out`, `sort-asc`, `sort-desc`, `sync`, `trash`, `undo`, `unlink`, `unlock`, `upload`, `x`, `zoom-in`, `zoom-out`

### Shapes & Symbols (15)
`boolean-off`, `boolean-on`, `circle`, `circle-slash`, `diamond`, `dot`, `dot-fill`, `ellipsis`, `hash`, `kebab-horizontal`, `number`, `square`, `square-circle`, `square-fill`, `three-bars`

### Media & Devices (14)
`browser`, `device-camera`, `device-camera-video`, `device-desktop`, `device-mobile`, `devices`, `image`, `pause`, `play`, `screen-full`, `screen-normal`, `skip`, `skip-fill`, `video`

### Objects (29)
`book`, `book-locked`, `calendar`, `cloud`, `cloud-offline`, `database`, `flame`, `gear`, `globe`, `heart`, `heart-fill`, `home`, `home-fill`, `key`, `key-asterisk`, `law`, `light-bulb`, `north-star`, `package`, `package-dependencies`, `package-dependents`, `passkey-fill`, `plug`, `rocket`, `server`, `star`, `star-fill`, `tag`, `trophy`, `zap`

### Text Formatting (12)
`bold`, `heading`, `horizontal-rule`, `italic`, `list-ordered`, `list-unordered`, `markdown`, `quote`, `strikethrough`, `typography`, `unwrap`, `wrap`

### Diff & Version Control (6)
`diff`, `diff-added`, `diff-ignored`, `diff-modified`, `diff-removed`, `diff-renamed`

### Project Management (9)
`iterations`, `milestone`, `project`, `project-roadmap`, `project-symlink`, `project-template`, `tasklist`, `workflow`, `goal`

### Other (104)
`accessibility`, `accessibility-inset`, `apps`, `archive`, `briefcase`, `cache`, `columns`, `command-palette`, `compose`, `container`, `cpu`, `credit-card`, `cross-reference`, `crosshairs`, `dependabot`, `dice`, `duplicate`, `exclamation`, `eye`, `eye-closed`, `fiscal-host`, `flag`, `flowchart`, `focus-center`, `gift`, `graph`, `graph-bar-horizontal`, `graph-bar-vertical`, `history`, `hourglass`, `hubot`, `id-badge`, `infinity`, `location`, `log`, `loop`, `maximize`, `meter`, `minimize`, `mirror`, `moon`, `mortar-board`, `multi-select`, `node`, `note`, `paintbrush`, `paper-airplane`, `paperclip`, `pivot-column`, `pulse`, `question`, `read`, `rel-file-path`, `reply`, `rows`, `ruby`, `single-select`, `sliders`, `smiley`, `smiley-frown`, `smiley-frustrated`, `smiley-grin`, `smiley-neutral`, `space`, `spacing-large`, `spacing-medium`, `spacing-small`, `split-view`, `squirrel`, `stack`, `stack-remove`, `sun`, `tab`, `tab-external`, `table`, `telescope`, `telescope-fill`, `thumbsdown`, `thumbsup`, `tools`, `tracked-by-closed-completed`, `tracked-by-closed-not-planned`, `unread`, `versions`


## Size Variants

Most icons are available in multiple sizes: 16px and 24px. Some icons also have 12px or 48px variants. The `octique` package handles size selection automatically.

## Tips

- Use `mark-github` for the GitHub logo (not `logo-github` which is the wordmark)
- Fill variants (e.g., `star-fill`, `heart-fill`) provide solid versions of outline icons
- Feed icons (`feed-*`) are designed for activity feeds and timelines
- The `copilot`, `agent`, and `ai-model` icons are recent additions for AI features

Browse all icons visually: https://primer.style/octicons/
