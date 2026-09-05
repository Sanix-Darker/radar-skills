# radar-skills

A compact skill pack for deterministic, source-verifiable repository navigation
with Codex and Claude Code.

## Skills

- `radar-install`: installs or updates the `rdar` crate and verifies the
  resulting `radar` command.
- `radar-bootstrap`: maps the current repository with an already-installed
  `radar` command.
- `radar-navigation`: runs `radar query` before broad code search and verifies
  fallback answers in source.

Installation and repository setup are separate on purpose: install once per
machine, bootstrap once per repository, then use navigation for daily work.

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
```

`rdar` is the crates.io source package; it installs the `radar` binary. If
Cargo is unavailable, install Rust/Cargo or use a checksummed prebuilt artifact
documented at <https://radar.sanixdk.xyz>.

## Docs

- [Guide and announcement copy](docs/guide.md)

## Versioning and distribution

- Keep this README and the skills as the source of truth.
- Tag skill-pack releases before sharing across teams.
- Keep the repository public and skill directories valid for skills.sh.
