# Changelog

All notable changes to this project are documented in this file.
Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Chorus uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html) for the
protocol and services, and calendar versioning (`YYYY.MM`) for clients.

## [Unreleased]

### Added (P0 — repository foundation)

- Repository scaffold: README, CONTRIBUTING, GOVERNANCE, SECURITY, CODE_OF_CONDUCT, MAINTAINERS, CHANGELOG.
- Licenses: Apache-2.0 (code), CC-BY-4.0 (docs), DCO 1.1 (no CLA).
- Architecture Decision Records ADR-0001 … ADR-0006.
- Design intent, system overview, protocol skeleton, and service spec stubs under `docs/spec/`.
- Agent orchestration build system under `docs/agents/`, including the full starter prompt.
- Skills registry seed (`skills/registry.yaml`) awaiting verification.
- CI gate set: commitlint, markdownlint, yamllint, gitleaks, DCO check, license check, docs-frontmatter check, link check.
- Issue templates (bug, feature, spec change) and PR template.
- Placeholders for `protocol/`, `services/`, `clients/`, `infra/`, `agents/`.

### Security

- Nothing to report yet. See [SECURITY.md](SECURITY.md) for how to report.

## [0.1.0] — unreleased placeholder

No tagged release yet. The first tag ships with P1.
