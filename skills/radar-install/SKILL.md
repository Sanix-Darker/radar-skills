---
name: radar-install
description: Install, repair, or update the Radar CLI on a machine from the crates.io rdar package. Use for missing or broken radar commands, not repository mapping or code search.
license: MIT
---

# radar install

Install the crates.io package `rdar`, which provides the `radar` command.

1. If the user did not explicitly request an install or update, obtain their
   authorization before downloading packages or changing the machine.
2. Run `cargo --version`. If Cargo is unavailable, stop with an actionable
   prerequisite; do not install a Rust toolchain implicitly.
3. If `radar --version` already succeeds and no update was requested, report
   the installed version and stop.
4. Run `cargo install --locked rdar`. Use `--force` only for an explicit update
   or repair of an existing installation.
5. Run `radar --version` and report the installed version.

If Cargo succeeds but `radar` is not on `PATH`, check Cargo's bin directory and
report the PATH change needed. Do not map a repository from this skill; use
`radar-bootstrap` next.
