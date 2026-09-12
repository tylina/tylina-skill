# Scenario Templates

These examples are ready-to-copy `.typ` starting points for non-deck scenario workflows. CV and
poster leaves normally contain `demo.typ` plus a README. Social-cover leaves deliberately add
`template.typ` so reusable visual systems stay separate from audience-facing demo content. None
uses a local `typst.toml`, YAML content layer, or copied upstream license file.

| Scenario | Catalog | What it contains |
|---|---|---|
| CV | [cv/README.md](cv/README.md) | Seven pinned Typst-native résumé/CV routes, from byte-identical chicv and heading-resume starters to technical, CJK, visual, and academic package examples |
| Social cover | [social-cover/README.md](social-cover/README.md) | Eight fixed-canvas systems spanning magazine, Swiss, RISO, editorial-grid, architecture, newspaper, photo-journal, and marginalia treatments |
| Poster | [poster/README.md](poster/README.md) | Eight runnable entries across five Universe packages, including three `peace-of-posters` compositions and two `placard` variants |

The child README for an upstream-based example records its package, reviewed version, license,
source link, dependency notes, and local adaptation. Review that information and the current
upstream release before upgrading an import.

## Use an example

1. Read the scenario reference first.
2. Select the closest example by document contract, not only by preview style.
3. Copy the complete leaf directory when it contains `template.typ`; otherwise copy `demo.typ`.
4. Replace every sample fact, name, link, date, claim, metric, and asset.
5. Compile early with the real fonts and longest content.
6. Inspect every page and run the scenario's quality gates.

Direct compilation from an example directory is also supported:

```bash
typst compile demo.typ output.pdf
```

For a multi-page social example:

```bash
typst compile demo.typ 'output-{p}.png' --ppi 72
```

The examples are implementation references, not immutable themes. Preserve source truth and the
scenario contract when adapting them.
