---
name: radar-metrics
description: Resolve current model input pricing and report Radar's repository context-savings estimate in tokens and money; use when asked about savings or once near the handoff of substantial Radar navigation.
license: MIT
---

1. Identify the active provider/model from session or runtime context. If the
   exact model is unavailable, select the provider's current general coding
   model as a clearly labeled reference; never ask the user for a rate.
2. Read its current standard, uncached input price in USD per million tokens
   from the provider's official pricing page. Do not use search snippets or
   cached memory. If official pricing is unreachable, say pricing is
   unavailable and report no money estimate rather than guessing.
3. At repository root run
   `radar status --input-usd-per-million RATE`.
4. Report the model/rate/source and the `savings` row once, including its
   `baseline`, `avoided`, `reduction`, `usd`, and `rate` fields.
5. Call it an estimated repository snapshot, not observed session usage,
   money spent, or an invoice. Do not accumulate snapshots.

Cadence: on request, or once near handoff after a substantial navigation task;
skip one-off queries and never emit it after every command.
