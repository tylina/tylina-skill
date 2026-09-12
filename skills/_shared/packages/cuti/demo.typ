#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/cuti:0.4.0": show-cn-fakebold

#show: show-cn-fakebold
#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt, font: ("Noto Sans", "Noto Sans SC"))

== Cuti Demo — Fake Bold for CJK Fonts

=== Normal vs Fake Bold

Regular text: 这是普通文本

*Bold text*: *这是伪粗体文本*（通过 cuti 实现）

=== Use Case

When using fonts without bold weight (e.g., SimSun / 宋体):

- Without cuti: bold text looks the same as regular
- With cuti: `show-cn-fakebold` simulates bold by stroking

=== Quick Setup

```typst
#import "@preview/cuti:0.4.0": show-cn-fakebold
#show: show-cn-fakebold
// Now *bold* works for CJK fonts!
```
