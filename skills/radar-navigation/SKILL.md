name: radar-navigation
description: Enforce radar-first source discovery for code search by using exact anchors from `radar query` before any broad scan.
license: MIT
---

# radar navigation

Use this skill for code-search, symbol discovery, and task-to-anchor execution in any
agent workflow (Codex or Claude).

## Primary flow

1. Ask radar first for every repository discovery request:
   - `radar query "<task>" --path .`
2. Accept `FINAL SOURCE ANCHOR` and `FINAL SOURCE OVERVIEW` as the authoritative
   source answer, unless the user explicitly requests broader code reading.
3. Inspect only the returned anchor path and definition body unless the result is
   stale or clearly wrong.
4. If radar misses:
   - check `.radar/ROUTES.md`
   - check `.radar/SYMBOLS.md`
   - then read root `MAP.md` (or route map for the target unit)
5. If route/mappa artifacts are outdated, run:
   - `radar refresh`
6. Record successful misses for future reuse:
   - `radar route add "<task>" <file#symbol>`

## Why this matters

- Prevents broad recursive searching from consuming unnecessary model context.
- Keeps all teams aligned on a deterministic source-of-truth path.
- Improves repeatability: the same query should land on the same anchor in
  repeated sessions.

## Operational constraints

- Do not run `grep`, `rg`, or full-tree exploration before this skill completes a
  radar query.
- Keep the query scope tight and specific; one query per user intent.
- Prefer exact routes or symbols over generic text exploration.
