---
name: radar-install
description: Install, repair, or update Radar from crates.io package rdar. Use when radar is missing or broken; not for mapping or search.
license: MIT
---

Install `rdar` (`radar`).

1. Get explicit authorization before machine changes.
2. Run `cargo --version`. If missing, stop: require Rust/Cargo; never install it.
3. If `radar --version` works and no update was requested, report it and stop.
4. Run `cargo install --locked rdar`; use `--force` only for an explicit update or repair.
5. Verify `radar --version`. If absent from `PATH`, report Cargo's bin directory.

Do not map repositories; use `radar-bootstrap`.
