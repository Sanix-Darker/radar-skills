# radar-skills

A compact, cross-agent skill pack for using radar as the default repository
navigation layer in any repository.

The pack is purpose-built for teams that want deterministic, source-verifiable
search workflows across both **Codex** and **Claude Code**, while keeping setup
simple:

- install or refresh the official `rdar` launcher (`cargo install --locked --force rdar`),
- activate radar maps for the current project,
- enforce radar-first query behavior for code-search tasks,
- keep recurring setup reproducible by rerunning one skill-triggered command.

## What the skills do

- `radar-bootstrap`: installs the `rdar` package (when missing) so the `radar`
  binary is available on developer/agent machines, then runs repository
  bootstrap (`radar map`) so project navigation is ready.
- `radar-navigation`: turns the active workflow into radar-first search and route
  checks (`radar query`, `radar refresh`, route adds).

## Install this pack in a project

Install all radar-related skills from this repo:

```bash
npx skills add Sanix-Darker/radar-skills
```

Install only for the two target agents:

```bash
npx skills add Sanix-Darker/radar-skills -a codex -a claude-code
```

Install globally (all projects, all configured agents):

```bash
npx skills add Sanix-Darker/radar-skills -g -a '*' -y
```

After install, each target agent should execute `radar-bootstrap` and verify that
`radar` runs in the repository before code search begins.

## Confirmed binary workflow

Installing this skill pack is explicitly tied to radar binary availability.
If the command is available after skill install, you can run it directly:

```bash
radar --version
```

If not available, `radar-bootstrap` triggers install of the launcher from crates.io:

```bash
cargo install --locked --force rdar
```

Once installed, use the binary normally:

```bash
radar map
radar query "where is the auth boundary?"
```

If crates.io is not reachable in an environment, install from the release artifacts
on the website first, then continue with the same `radar map` + `radar query`
workflow.

## Why this pack exists

1. Make radar install easy from crates.io (`rdar`) in any environment.
2. Keep search behavior consistent across Codex and Claude Code:
   - run `radar query` before grep/rg/find/locate-style exploration.
   - use source anchors as the default decision source.
   - refresh MAP/symbols/route artifacts when stale.
3. Keep the setup idempotent and reusable by copying only this repository.

## Manual installation fallback

If a project cannot use skills, this command sequence is still valid:

```bash
cargo install --locked --force rdar
cd your-project
radar map
radar query "where is the auth boundary?"
```

## Versioning and distribution

- Keep `README.md` + skills in this repository as source of truth.
- Tag skill-pack releases before sharing across teams.
- To improve discoverability on `skills.sh`, keep this repo public and skills valid under the `skills/` convention.
- Radar website and release evidence: https://radar.sanixdk.xyz
