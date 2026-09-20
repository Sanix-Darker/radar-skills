# radar-skills: deterministic code search for Codex and Claude Code

Two documents in one place:

1. A short announcement you can post to X, LinkedIn, or a newsletter.
2. A full guide to installing and using the pack.

Both describe `Sanix-Darker/radar-skills`, a skill pack for [skills.sh](https://www.skills.sh/sanix-darker/radar-skills).

---

## Short announcement

**Your agent greps the whole repo. Radar asks the map first.**

`radar-skills` is a four-skill pack that makes Codex and Claude Code resolve
code-search questions from a source-verifiable map before they fall back to
broad search. One install per project:

```bash
npx skills add Sanix-Darker/radar-skills -a codex -a claude-code
```

What you get:

- `radar-install` installs or updates the `radar` binary from the `rdar` crate.
- `radar-bootstrap` maps the repository with `radar map` and validates it with
  `radar check`.
- `radar-navigation` makes every code-search task start with
  `radar query "..."`, which returns answers anchored to a file and symbol.
- `radar-metrics` reports an occasional repository context-savings estimate in
  tokens and money without pretending it is session billing.

Same question, same anchor, on both agents, in every session. Radar site:
<https://radar.sanixdk.xyz>. Repo: <https://github.com/Sanix-Darker/radar-skills>.

---

## Long-form guide

### What this pack is for

Code agents are good at writing code. Finding the code to change is where
sessions drift. An agent that falls back to `grep`/`rg`/`find` explores the
tree differently on every run, and a chat model holding a fuzzy picture of the
repo reasons from context that can be stale.

`radar-skills` replaces that default with a deterministic layer: the repository
is compiled once into a MAP of routes, symbols, and anchors. Code-search
questions go to that map first (`radar query`). The answer carries a
source anchor you can open. The same question lands on the same anchor on
every machine and in every session.

The pack targets Codex and Claude Code, and anything else that reads the
skills convention. It contains four skills:

| Skill | What it does |
| --- | --- |
| `radar-install` | Installs, repairs, or updates the `radar` binary from the crates.io `rdar` source package, then verifies `radar --version`. |
| `radar-bootstrap` | Requires an installed `radar`, maps the current repository with `radar map`, and validates it with `radar check`. |
| `radar-navigation` | Enforces radar-first discovery: run `radar query` before any broad scan, treat the returned source anchor as authoritative, refresh stale artifacts with `radar refresh`, and record new routes with `radar route add`. |
| `radar-metrics` | Resolves current official model input pricing, runs the opt-in status snapshot, then reports estimated avoided context tokens and money with its baseline and rate. |

Run installation once per machine and bootstrap once per repository. Rerun
bootstrap after a re-clone or when the map needs rebuilding.

### Install

Install into the current project for Codex and Claude Code only:

```bash
npx skills add Sanix-Darker/radar-skills -a codex -a claude-code
```

Install every skill in the pack into the current project:

```bash
npx skills add Sanix-Darker/radar-skills
```

Install globally, for all configured agents:

```bash
npx skills add Sanix-Darker/radar-skills -g -a '*' -y
```

### First run: install, then bootstrap

Have either agent run `radar-install` once on the machine, then run
`radar-bootstrap` in the repository:

```bash
radar --version          # runnable binary present
radar map                # build the repository map
radar check              # validate generated navigation artifacts
```

For an explicit update or repair, reinstall the current source package:

```bash
cargo install --locked --force rdar
```

If Cargo is unavailable, `radar-install` stops instead of silently installing
a toolchain. Install Rust/Cargo, rerun `radar-install`, then bootstrap the
repository.

Verify the flow end to end with the checks the skill itself uses:

```bash
radar query "what is the canonical symbol map entrypoint?"
radar query "how does verify_token work?"
```

### The daily workflow

After bootstrap, `radar-navigation` holds this order on both agents:

1. Ask radar first. For any repository discovery request, run
   `radar query "<task>" --path .` before grep, rg, find, or tree walks.
2. Treat the answer as the source. `FINAL SOURCE ANCHOR` and
   `FINAL REPOSITORY OVERVIEW` are the authoritative result. Open the returned
   anchor and read the definition body. Do not broaden the scan unless the
   result is stale or clearly wrong.
3. Refresh when artifacts go stale. After a large refactor or a branch
   switch, rebuild instead of searching an old index:

   ```bash
   radar refresh
   ```

4. On a miss, walk the fallback order, then record the fix:

   ```bash
   # fallback order
   .radar/ROUTES.md
   .radar/SYMBOLS.md
   MAP.md
   # after the miss is resolved
   radar route add "<task>" <file#symbol>
   ```
5. Near handoff after substantial navigation, run `radar-metrics` once. It
   resolves current official model input pricing itself. Skip one-off queries
   and never report it after every command.

An illustrative session in either agent:

```text
You: how does verify_token work?

Agent: radar query "how does verify_token work?"
       FINAL SOURCE ANCHOR: <file#verify_token>
```

The anchor names in your session come from your repository's MAP. The point of
the format is that the answer is a path you can open, not a paraphrase.

### Savings checkpoint

Invoke `radar-metrics` without a price. The skill identifies the active model
when available, reads its current standard uncached input price from the
provider's official pricing page, then runs:

```bash
radar status --input-usd-per-million RATE
```

The `savings` row compares the supported source corpus with generated map
bodies. It is a current repository snapshot, not observed chat usage, money
spent, cumulative savings, or an invoice. If the exact model is unavailable,
the skill labels its current provider coding-model reference. It never asks the
user for a rate or guesses when official pricing cannot be reached. Use
provider usage logs for billing.

The handoff is rendered as a terminal-style `RADAR // CONTEXT DELTA` panel with
a 20-cell reduction bar, source/map/avoided token rows, estimated value, and
model rate. Every count uses up to three significant digits plus `k`, `M`,
`B`, or `T`; values roll over instead of displaying forms such as `1000k`.

### Why teams keep it

- Deterministic. The same query resolves the same way for every engineer and
  in every session, so behavior stops drifting.
- Verifiable. Every answer points at a file and symbol. You can read the
  source the agent relied on.
- Cheaper sessions. Radar answers resolve against a local map and index, so
  the agent does not burn model context on broad recursive search.
- One contract across agents. The same skill pack governs Codex and Claude
  Code, so the two agents no longer discover code in different ways.

### Troubleshooting

| Symptom | Fix |
| --- | --- |
| `radar: command not found` | Run `radar-install`. |
| Update or repair requested | Run `cargo install --locked --force rdar`, then `radar --version`. |
| Cargo unavailable | Install Rust/Cargo, then rerun `radar-install`. |
| Stale or wrong anchors | Run `radar refresh`, then `radar query` again. |
| Skills not picked up by an agent | Re-run the install in the project: `npx skills add Sanix-Darker/radar-skills -a codex -a claude-code`. |

### Links

- Skill pack: <https://www.skills.sh/sanix-darker/radar-skills>
- Repo: <https://github.com/Sanix-Darker/radar-skills>
- Radar site and release artifacts: <https://radar.sanixdk.xyz>
