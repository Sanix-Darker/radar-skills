---
name: radar-metrics
description: Report Radar's repository context-savings estimate in tokens and money; use when asked about savings or once near the handoff of substantial Radar navigation.
license: MIT
---

1. Require a positive input-token price in USD per million tokens; use an
   argument or a rate the user already supplied, never guess one.
2. At repository root run
   `radar status --input-usd-per-million RATE`.
3. Report the `savings` row once, including its `baseline`, `avoided`,
   `reduction`, `usd`, and `rate` fields.
4. Call it an estimated repository snapshot, not observed session usage,
   money spent, or an invoice. Do not accumulate snapshots.

Cadence: on request, or once near handoff after a substantial navigation task;
skip one-off queries and never emit it after every command.
