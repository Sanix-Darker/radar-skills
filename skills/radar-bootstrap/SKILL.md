---
name: radar-bootstrap
description: Initialize or refresh Radar repository maps with an existing radar command. Never installs or updates software.
license: MIT
---

Set up Radar maps in the current repository. The `radar` command must already work.

1. At the repository root, run `radar map`.
2. Run `radar check` and report violations. Finish only when it passes.

Never install, repair, or update software here; use `radar-install`. No code search or route maintenance; use `radar-navigation`.
