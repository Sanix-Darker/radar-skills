---
name: radar-navigation
description: Query Radar before search; stop on finals; verify fallbacks.
license: MIT
---

1. Before grep/rg/find/globs/tree, run `radar query "<task>" --path .`; strict `In NAME,` behavior questions return verified source when unique.
2. Stop on `FINAL SOURCE ANCHOR`/`FINAL REPOSITORY OVERVIEW`.
3. Root miss: `radar route find "<task>"` (`ok`/`auto` verify; `stale` hints) -> exact `.radar/SYMBOLS.md` tab row -> `./MAP.md`. Batch reads; peek frontmatter. Expect signatures; verify anchors; refresh stale maps; record via `radar route add "<task>" <file#symbol>`.
4. Use `radar-metrics` once near handoff after substantial navigation; it resolves current official pricing itself. Never run it after each query.
