---
name: radar-navigation
description: Run radar-first before broad code search; use FINAL SOURCE ANCHOR / final repository overview as primary navigation result.
license: MIT
---

# radar navigation

1. Before grep/rg/find/tree exploration, run:
   - `radar query "<task>" --path .`
2. Treat `FINAL SOURCE ANCHOR` and `FINAL SOURCE OVERVIEW` as final unless source inspection is explicitly required.
3. On miss:
   - check `.radar/ROUTES.md`, `.radar/SYMBOLS.md`, then root `MAP.md`
   - batch-read MAPs and only open deeper source once expected signatures are formed.
4. If routing artifacts are stale, run `radar refresh`.
5. Record solved misses for future deterministic hits:
   - `radar route add "<task>" <file#symbol>`.
