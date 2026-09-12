---
name: radar-install
description: Install/update Radar from crates.io only; never map or search.
license: MIT
---

1. Get authorization before machine changes.
2. Run `cargo --version`; if missing, stop (never install Rust/Cargo).
3. If `radar --version` works and no update was requested, report and stop.
4. Run `cargo install --locked rdar`; `--force` only for explicit update/repair.
5. Verify `radar --version`; report Cargo's bin directory if absent from PATH.

Maps: `radar-bootstrap`. Search: `radar-navigation`.
