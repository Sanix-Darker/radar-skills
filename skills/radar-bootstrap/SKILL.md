---
name: radar-bootstrap
description: Install or refresh radar and activate repository-level radar usage for deterministic code-search workflows.
license: MIT
---

# radar bootstrap

Use this skill whenever repository setup includes code search, navigation, or anchor retrieval tasks.

## Activation

1. Ensure `radar` is installed and working.

   - If `radar --version` fails:
     - If `cargo` is available, run:
       - `cargo install --locked --force rdar`
     - If no Rust toolchain exists, install radar via release artifacts from the radar website first.

2. Run repository activation once:

   - `./scripts/bootstrap-radar.sh`
   - This installs radar when missing and runs `radar map`.

3. For this project, require radar-first search:

   - For direct code-discovery asks, run:
     - `radar query "<task>"`
   - If the query returns `FINAL SOURCE ANCHOR`, treat it as the preferred output.
   - If the query misses, inspect:
     - `.radar/ROUTES.md`
     - `.radar/SYMBOLS.md`
     - root `MAP.md`
   - After map updates or stale anchors, run `radar refresh`.

4. If this project already uses `radar` locally and stale artifacts are expected, run:
   - `radar route add "<task>" <file#symbol>`
   - when you resolved a miss.

## Safety and scope

- Do not run broad directory grep/rg/find before querying radar.
- Prefer one precise route per request.
- Keep commands deterministic and avoid manual file guessing.
