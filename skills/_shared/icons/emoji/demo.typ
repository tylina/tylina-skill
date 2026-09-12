#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Emoji Demo — Built-in Icons (Recommended)

Typst has built-in emoji support — no package needed!

=== Common Presentation Emojis

#grid(columns: (1fr, 1fr), gutter: 16pt,
  [
    - #emoji.checkmark.box *Done* / Completed
    - #emoji.crossmark *Failed* / Error
    - #emoji.warning *Warning* / Caution
    - #emoji.lightbulb *Idea* / Tip
    - #emoji.star *Important* / Highlight
    - #emoji.rocket *Launch* / Fast
    - #emoji.chart.up *Growth* / Trend up
    - #emoji.chart.down *Decline* / Trend down
  ],
  [
    - #emoji.checkmark *Goal* / Target
    - #emoji.clock *Time* / Schedule
    - #emoji.calendar *Date* / Planning
    - #emoji.magnify.l *Search* / Analyze
    - #emoji.gear *Settings* / Config
    - #emoji.chain *Link* / Reference
    - #emoji.person *Team* / Users
    - #emoji.globe *Global* / International
  ],
)

=== Usage

```typst
#emoji.checkmark.box  // ☑️
#emoji.rocket         // 🚀
#emoji.star           // ⭐
```
