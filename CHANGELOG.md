# Changelog

All notable changes to this plugin are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
