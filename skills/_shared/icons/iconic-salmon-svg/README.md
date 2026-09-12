# Iconic Salmon SVG — Social Media Icons

**Package**: `@preview/iconic-salmon-svg:3.0.0`
**Icon count**: 30+ platforms

## Description

Social media reference icons with clickable links. Designed for CV/resume slides and contact information pages. Each function generates an icon + link combination.

## Usage

```typst
#import "@preview/iconic-salmon-svg:3.0.0": *

#github-info("username")
#linkedin-info("Display Name", url: "https://linkedin.com/in/username")
```

## Available Platform Functions

| Function | Platform |
|----------|----------|
| `github-info(username)` | GitHub |
| `gitlab-info(name, url:)` | GitLab |
| `linkedin-info(name, url:)` | LinkedIn |
| `twitter-info(handle)` | Twitter |
| `mastodon-info(handle, url:)` | Mastodon |
| `bluesky-info(handle)` | Bluesky |
| `orcid-info(id)` | ORCID |
| `google-scholar-info(name, url:)` | Google Scholar |
| `researchgate-info(name, url:)` | ResearchGate |
| `stackoverflow-info(name, url:)` | Stack Overflow |
| `reddit-info(username)` | Reddit |
| `youtube-info(name, url:)` | YouTube |
| `twitch-info(username)` | Twitch |
| `discord-info(name)` | Discord |
| `telegram-info(username)` | Telegram |
| `signal-info(name)` | Signal |
| `whatsapp-info(name)` | WhatsApp |
| `email-info(address)` | Email |
| `website-info(url)` | Website |
| `phone-info(number)` | Phone |
| `address-info(text)` | Address |
| `xing-info(name, url:)` | Xing |
| `hackernews-info(username)` | Hacker News |
| `medium-info(username)` | Medium |
| `dev-info(username)` | DEV Community |
| `kaggle-info(username)` | Kaggle |
| `docker-info(username)` | Docker Hub |
| `npm-info(username)` | npm |
| `crates-info(username)` | crates.io |
| `pypi-info(username)` | PyPI |

## Customization

Extra arguments are passed to `text()`:

```typst
#github-info("user", fill: blue, size: 14pt)
```
