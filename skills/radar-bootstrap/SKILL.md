---
name: radar-bootstrap
description: Map or refresh a repository for Radar navigation when the radar CLI is already installed. Use radar-install instead for machine-level installation or updates.
license: MIT
---

# radar bootstrap

Prepare the current repository for deterministic Radar navigation.

1. Run `radar --version`.
2. If the command is unavailable or broken, stop and use `radar-install`; do
   not install Rust, Cargo, or Radar from this skill.
3. Run `radar map` in the repository root.
4. Run `radar check` and report any violations.

The result must be a mapped repository that passes `radar check`. Leave code
search and route maintenance to `radar-navigation`.
