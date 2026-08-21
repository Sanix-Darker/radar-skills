# radar-skills

A compact, cross-agent skill pack for using radar in any repository.

## Skills in this repository

- `radar-bootstrap`: installs or refreshes the `radar` binary (from crates.io launcher `rdar`) and activates project-level radar usage.
- `radar-navigation`: enforces `radar`-first navigation before broad code search.

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
