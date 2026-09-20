# radar-skills

A compact skill pack for deterministic, source-verifiable repository navigation
with Codex and Claude Code.

## Skills

| Skill | Scope |
| --- | --- |
| [`radar-install`](https://www.skills.sh/sanix-darker/radar-skills/radar-install) | Machine setup only: install, repair, or update the `rdar` crate and verify the resulting `radar` command. It does not map repositories. |
| [`radar-bootstrap`](https://www.skills.sh/sanix-darker/radar-skills/radar-bootstrap) | Repository setup only: with `radar` already installed, run `radar map` and `radar check`. It does not install software or handle code search. |
| [`radar-navigation`](https://www.skills.sh/sanix-darker/radar-skills/radar-navigation) | Daily code navigation: run `radar query` before broad search and verify fallback answers in source. |
| [`radar-metrics`](https://www.skills.sh/sanix-darker/radar-skills/radar-metrics) | On-request or end-of-task repository context-savings snapshot in estimated tokens and money. |

Installation and repository setup are separate on purpose: install once per
machine, bootstrap once per repository, then use navigation for daily work and
metrics at occasional handoffs.

## Install the pack

For Codex and Claude Code in the current project:

```bash
npx skills add Sanix-Darker/radar-skills -a codex -a claude-code
```

For every supported agent in the current project:

```bash
npx skills add Sanix-Darker/radar-skills
```

Globally, for all configured agents:

```bash
npx skills add Sanix-Darker/radar-skills -g -a '*' -y
```

After installing the pack, run `radar-install` once on the machine and
`radar-bootstrap` in each repository.

## Manual equivalent

```bash
cargo install --locked rdar
radar --version
cd your-project
radar map
radar query "where is the auth boundary?"
radar status --input-usd-per-million 1.75
```

`rdar` is the crates.io source package; it installs the `radar` binary. If
Cargo is unavailable, install Rust/Cargo, then rerun `radar-install`.

## Docs

- [Guide and announcement copy](docs/guide.md)

## Versioning and distribution

- Keep this README and the skills as the source of truth.
- Tag skill-pack releases before sharing across teams.
- Keep the repository public and skill directories valid for skills.sh.
