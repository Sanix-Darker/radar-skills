---
name: radar-navigation
description: Query Radar before code search; stop on finals; verify fallbacks.
license: MIT
---

1. Before grep/rg/find/globs/tree, run `radar query "<task>" --path .`.
2. `FINAL SOURCE ANCHOR`/`FINAL REPOSITORY OVERVIEW` stops unless source is needed.
3. Miss at root: `radar route find "<task>"` (`ok`/`auto` verify; `stale` hints) -> exact `.radar/SYMBOLS.md` tab row (not whole file) -> root `MAP.md`. Batch reads; peek MAP frontmatter. Expect signatures; verify anchors; refresh stale maps; record via `radar route add "<task>" <file#symbol>`.
