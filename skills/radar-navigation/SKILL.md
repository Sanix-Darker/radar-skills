---
name: radar-navigation
description: Run Radar before repo code search; stop on finals; verify fallback source.
license: MIT
---

# radar navigation

1. Before grep/rg/find/globs/tree code search, run `radar query "<task>" --path .`. `FINAL SOURCE ANCHOR`/`FINAL REPOSITORY OVERVIEW` is final unless source detail is needed.
2. Miss: check `.radar/ROUTES.md`, `.radar/SYMBOLS.md`, then root `MAP.md`; batch reads and peek MAP frontmatter only.
3. Maps route, source answers: state expected signatures, verify fallback anchors, `radar refresh` stale maps, and record solved misses with `radar route add "<task>" <file#symbol>`.
