---
name: radar-navigation
description: Query Radar before code search; stop on finals; verify fallbacks.
license: MIT
---

1. Before grep/rg/find/globs/tree, run `radar query "<task>" --path .`.
2. `FINAL SOURCE ANCHOR`/`FINAL REPOSITORY OVERVIEW` stops unless source is needed.
3. Miss: `.radar/ROUTES.md` -> `.radar/SYMBOLS.md` -> root `MAP.md`. Batch reads; peek MAP frontmatter only. State expected signatures, verify anchors, refresh stale maps, and record with `radar route add "<task>" <file#symbol>`.
