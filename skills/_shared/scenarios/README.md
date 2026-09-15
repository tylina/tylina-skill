# Scenario Templates

These examples are ready-to-copy `.typ` starting points for non-deck scenario workflows. The
academic, education, long-form, and theorem/proof leaves are Tylina-owned offline workspaces with
one explicit `main.typ`. CV and poster leaves normally contain `demo.typ`; social-cover leaves add
`template.typ` so reusable visual systems stay separate from audience-facing demo content.

| Scenario | Catalog | What it contains |
|---|---|---|
| Academic | [academic/README.md](academic/README.md) | An evidence-aligned paper scaffold with stable labels, bibliography, equation, table, and appendix |
| CV | [cv/README.md](cv/README.md) | Seven pinned Typst-native résumé/CV routes, from byte-identical chicv and heading-resume starters to technical, CJK, visual, and academic package examples |
| Education | [education/README.md](education/README.md) | Homework and exam workspaces that generate learner and answer editions from one canonical source |
| Long-form | [longform/README.md](longform/README.md) | Multi-file report and course-note workspaces with reusable layout modules and stable authored units |
| Social cover | [social-cover/README.md](social-cover/README.md) | Eight fixed-canvas systems spanning magazine, Swiss, RISO, editorial-grid, architecture, newspaper, photo-journal, and marginalia treatments |
| Poster | [poster/README.md](poster/README.md) | Eight runnable entries across five Universe packages, including three `peace-of-posters` compositions and two `placard` variants |
| Theorem/proof | [theorem-proof/README.md](theorem-proof/README.md) | A package-free proof note with semantic statements, shared numbering, references, and review checks |

The child README for an upstream-based example records its package, reviewed version, license,
source link, dependency notes, and local adaptation. Tylina-owned leaves record their content
contract and replacement gates. Review provenance before upgrading any imported dependency.

## Use an example

1. Read the scenario reference first.
2. Select the closest example by document contract, not only by preview style.
3. Materialize the complete leaf directory through the template tool; do not copy only its entrypoint.
4. Replace every sample fact, name, link, date, claim, metric, and asset.
5. Compile early with the real fonts and longest content.
6. Inspect every page and run the scenario's quality gates.

Direct compilation from an example directory is also supported. Use the entrypoint named by its
scenario index (`main.typ` for Tylina-owned workspaces and usually `demo.typ` for upstream examples):

```bash
typst compile demo.typ output.pdf
```

For a multi-page social example:

```bash
typst compile demo.typ 'output-{p}.png' --ppi 72
```

The examples are implementation references, not immutable themes. Preserve source truth and the
scenario contract when adapting them.
