---
name: radar-bootstrap
description: Map or refresh a repository when radar is installed. Use radar-install for machine setup.
license: MIT
---

Prepare the current repository for Radar navigation.

1. Run `radar --version`; if missing or broken, stop and use `radar-install`. Never install software here.
2. At the repository root, run `radar map`.
3. Run `radar check` and report violations. Finish only when it passes.

No code search or route maintenance; use `radar-navigation`.
