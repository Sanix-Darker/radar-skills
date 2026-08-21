---
name: radar-bootstrap
description: Install/refresh `radar` from the `rdar` launcher and enforce deterministic, anchor-first setup for repository navigation tasks in code-search workflows.
license: MIT
---

# radar bootstrap

Use this skill when a repository is onboarding for coding-agent navigation or when
workflow quality requires deterministic source retrieval before broad scan.

## What this skill guarantees

- `radar` is available in the current environment.
- `radar map` has been run for the current repository (or an actionable failure is raised).
- search follows a strict anchor-first contract in subsequent agent steps.
- fallback routes are refreshed when stale symbols/maps/routes are detected.

## Activation steps

1. Ensure `cargo` is available in your environment.
2. Validate the `radar` binary:
   - run `radar --version`.
3. If unavailable or broken:
   - install from crates.io launcher:
     - `cargo install --locked --force rdar`
   - re-run `radar --version`.
4. If this repository has not been mapped, run:
   - `./scripts/bootstrap-radar.sh`
   - this wrapper runs `radar map` and keeps output deterministic.
5. For environments without Rust toolchain access:
   - use the official release artifact for your platform from
     `https://radar.sanixdk.xyz/downloads/`.
   - then run `radar --version` and `radar map`.

## Runtime policy

- Do not start broad repository scans before this skill has run.
- Do not edit skill-owned artifacts (`.radar/`, `.map`, `.symbols`) outside the
  expected workflow.
- Keep commands deterministic and reproducible across invocations.

## Ongoing usage (after bootstrap)

- For concrete code-retrieval asks:
  - `radar query "<task>"`
- If you get `FINAL SOURCE ANCHOR`, treat it as the preferred result.
- On misses, use scoped fallback order:
  1. `.radar/ROUTES.md`
  2. `.radar/SYMBOLS.md`
  3. root `MAP.md`
- When a miss gets fixed, preserve it with:
  - `radar route add "<task>" <file#symbol>`

## Verify end state

- `radar --version`
- `radar query "how does verify_token work?"`
