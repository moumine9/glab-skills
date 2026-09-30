# Changelog

All notable changes to this plugin are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2026-09-30

### Added

- Documented `glab govern` (EXPERIMENTAL): `setup`, `doctor`, and `audit sync`, added upstream since glab 1.113.0.
- Documented the `glab mr note` subcommands (`create`, `list`, `update`, `delete`, `resolve`, `reopen`) and the new `publish` subcommand, with the `--draft` pending-review flag (glab 1.119.0) and `--internal` notes (glab 1.120.0).
- Documented `glab artifact-registry login` for Docker, Maven, Gradle, npm, and sbt, new in glab 1.114.0–1.115.0.
- Documented `glab dependency-firewall package` and the package manager wrappers (`npm`, `pnpm`, `yarn`, `pip`, `pipenv`, `poetry`, `uv`, `twine`, `maven`, `gradle`, `gem`, `bundle`), new in glab 1.117.0–1.120.0.
- Documented `glab config path`, `glab skills get`, `glab stack delete`, and the `--continue`/`--abort` flags of `glab stack reorder`.
- Documented the `--description-file` and `--attach` flags on issue, MR, and work item commands, and `--attach` on issue, incident, and MR notes.
- Documented the `glab runner-controller scope` and `token` subcommands.
- Documented the per-host configuration keys (`api_host`, `ca_cert`, `client_id`, `custom_headers`, `proxy`, `skip_tls_verify`, `use_keyring`, and others) and the `GLAB_`-prefixed environment variable names added in glab 1.118.0.
- Documented the `--web`, `--device`, `--ssh-hostname`, and `--container-registry-domains` flags of `glab auth login`.
- `mr` skill: commenting on an MR and reviewing with pending comments (`glab mr note create --draft`, `glab mr note publish`).
- `mr` and `issue` skills: `--description-file`, `--attach`, and `--yes`.
- `auth` skill: `--web`, `--device`, and `--insecure-storage`, plus keyring storage and self-managed OAuth notes.

### Changed

- Refreshed `docs/reference.md` and `docs/commands.md` against `glab 1.120.0` (previously generated against 1.113.0).
- Updated the documented command count in README from 224 to 247. `docs/commands.md` now lists every leaf command of the glab 1.120.0 command tree.
- Rewrote the `glab orbit` section: since glab 1.115.0 every command and flag is forwarded to the managed Orbit binary.
- `glab dependency-firewall` is now marked EXPERIMENTAL instead of BETA, matching upstream.
- Renamed `glab cluster agent check_manifest_usage` to `check-manifest-usage` (glab 1.116.0).
- Renamed the `orbit_local_auto_download` and `orbit_local_auto_run` config keys to `orbit_cli_auto_download` and `orbit_cli_auto_run` (glab 1.119.0).

### Removed

- Dropped `glab dependency-firewall configure` (removed upstream).
- Dropped the individual `glab orbit local`, `glab orbit setup`, and `glab orbit remote` entries; they are no longer glab subcommands.
- Dropped the `visual` config key; it is now an alias of `editor`.

### Fixed

- `mr` skill: replaced flags that do not exist (`--state`, `--mine`, `--when-pipeline-succeeds`, `--remove-label`) with `--closed`/`--merged`/`--all`, `--assignee=@me`, `--auto-merge`, and `--unlabel`.
- `issue` skill: replaced `--state`, `--mine`, and `--remove-label` with `--closed`/`--all`, `--assignee=@me`, and `--unlabel`.
- `ci` skill: `glab ci retry` takes a job, not a pipeline; cancelling a pipeline is `glab ci cancel pipeline <id>`; `glab ci list` filters with `--ref` and `--per-page` (not `--branch` and `--limit`); `glab ci view` takes `--pipelineid`; `--variables-env` uses `KEY:value`.
- `docs/reference.md`: `glab auth login` listed `--use-keyring`, which no longer exists; the keyring is the default and `--insecure-storage` opts out.

## [1.1.0] - 2026-08-18

### Added

- Documented `glab artifact-registry` (EXPERIMENTAL): `get-token` and `status`, new in glab 1.113.0.
- Documented `glab dependency-firewall` / `glab df` (BETA): `configure` and `ci-summary`, new in glab 1.112.0.

### Changed

- Refreshed `docs/reference.md` and `docs/commands.md` against `glab 1.113.0` (previously generated against 1.109.0).
- Updated the documented command count in README from 220 to 224.

## [1.0.0] - 2026-07-21

### Changed

- Renamed the plugin from `glab` to `glab-skills`.
- Fixed `marketplace.json` schema and location; added `LICENSE`.
- Refreshed CLI reference for `glab 1.109.0`: added `container-registry`, `orbit`, `packages`, `search`, `security`, `skills`, `todo`, and `whatsnew` command groups; added subcommands added since the reference was last generated; dropped `glab duo ask` (removed upstream).

### Added

- Initial versioned release: skills for `auth`, `mr`, `issue`, and `ci`; `glab-auth-guard.sh` PostToolUse hook; CLI reference docs (`docs/commands.md`, `docs/reference.md`).

[unreleased]: https://github.com/moumine9/glab-skills/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/moumine9/glab-skills/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/moumine9/glab-skills/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/moumine9/glab-skills/releases/tag/v1.0.0
