#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/iconic-salmon-svg:3.0.0": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Iconic Salmon SVG Demo — Social Media Icons

Social media reference icons with clickable links.

=== Usage

```typst
#import "@preview/iconic-salmon-svg:3.0.0": github-info, linkedin-info

#github-info("username")
#linkedin-info("Your Name", url: "https://linkedin.com/in/username")
```

=== Example

- #github-info("touying-typ")
- #text(size: 14pt)[Great for CV slides and contact information pages]

=== Supported Platforms

GitHub, GitLab, LinkedIn, Twitter/X, Mastodon, ORCID, Google Scholar, ResearchGate, Stack Overflow, and more.
