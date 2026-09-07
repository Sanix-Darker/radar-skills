---
name: radar-install
description: Install, repair, or update the Radar CLI on a machine from the crates.io rdar package. Use for missing or broken radar commands, not repository mapping or code search.
license: MIT
---

Install `rdar`, which provides `radar`.

1. Require explicit user authorization before machine changes.
2. Run `cargo --version`; if missing, stop with the Rust/Cargo prerequisite. Never install a toolchain implicitly.
3. If `radar --version` works and no update was requested, report it and stop.
4. Run `cargo install --locked rdar`; add `--force` only for an explicit update or repair.
5. Run `radar --version`. If it is not on `PATH`, report Cargo's bin directory.

Do not map repositories; use `radar-bootstrap`.
