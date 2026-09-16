# Evidence Escalation

Read this only when the current workspace, one focused packaged reference, and real diagnostics do
not establish a safe Typst or package implementation. Do not browse these sources for every Agent
turn or preload them into session instructions.

## Escalate When

- a language, standard-library, export, or compiler behavior remains ambiguous after reading the
  relevant focused packaged official page;
- an exact package's README, manifest, entrypoint, and nearby source still do not establish the
  needed call shape or content/string boundary;
- the minimal implementation continues to fail real `document.validate` after applying the
  structured diagnostics; or
- the task needs a non-obvious layout recipe and neither the current workspace nor the official
  reference provides one.

Do not escalate merely to collect alternatives, improve confidence in already compiling ordinary
syntax, rank packages, or replace inspection of the selected package version.

## Evidence Order

1. Reuse a relevant pattern that already compiles in the current workspace.
2. Read one page selected from `_shared/docs/index.json` or one pinned recipe selected from
   `_shared/packages/index.json`.
3. For language and standard-library behavior, open the matching page in the
   [official Typst documentation](https://typst.app/docs/). Check the documented Typst version.
4. For a package, use `package.list` and `package.inspect` on the exact `spec`; inspect one explicit
   source path only after its documentation, manifest, entrypoint, or file list identifies it.
5. Use the [Typst Examples Book](https://sitandr.github.io/typst-examples-book/book/) for one focused
   explanatory example when official material does not make the pattern clear. It is unofficial
   and warns that examples may lag the latest version, so adapt rather than copy and validate the
   result against Tylina's actual compiler.
6. Follow the exact package's upstream release/tag documentation or source when the package archive
   remains insufficient. Repository HEAD is secondary context, not the installed API.
7. Use [Best of Typst](https://ydx-2147483647.github.io/best-of-typst/) only to discover a project,
   package name, documentation site, or better search term. Its categories and scores are not
   compatibility, quality, trust, license, or maintenance evidence.

Stop as soon as one source answers the concrete question. Read the smallest relevant page or file,
record the exact version or revision when it affects the implementation, then return to the real
workspace and validate. If sources disagree, prefer the current official reference or exact
package version and report the uncertainty rather than merging examples speculatively.
