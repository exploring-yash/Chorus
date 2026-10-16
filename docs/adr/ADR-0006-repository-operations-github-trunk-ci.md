---
id: docs.adr.0006
title: "Repository operations: GitHub, trunk-based development, signed commits, full CI gates"
class: adr
owner_agent: Conductor
authoring_agents: [Conductor, SREEng]
reviewing_agents: [Verifier, SecEng]
human_signoff: null
version: 1.0.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0004, docs.status]
citations: []
signature: unsigned (pending key setup)
---

# ADR-0006: Repository operations — GitHub, trunk-based, signed commits, full CI gates

## Context

Contribution-friendliness and integrity goals conflict unless operational
norms are fixed up front: short review latency, reproducible checks, and
provable attribution (agents and humans both commit).

## Decision

- **Hosting: public GitHub** (`chorus-dev/chorus`), with a Codeberg mirror
  evaluated at P2 (not required now).
- **Trunk-based development**: short-lived branches off `main`, rebase before
  PR, squash-merge only, no long-lived feature branches.
- **Signed commits mandatory**: every commit carries a DCO sign-off and, once
  keys are provisioned, a cryptographic signature. CI rejects unsigned commits.
- **Full CI gate set from day one** (`.github/workflows/ci.yml`): commitlint,
  markdownlint, yamllint, gitleaks, DCO check, license check, docs-frontmatter
  check, link check; build/test jobs activate when `services/` code lands.
- Branch protection on `main`: no direct pushes, no force-push, required
  status checks, required pull-request reviews (enabled on publish).

## Consequences

- Review latency and doc freshness are measured publicly (docs/status.md
  targets: p50 ≤ 24h, p95 ≤ 72h, 100% docs freshness).
- Agents and humans share one rule set; agents hold no merge privilege
  (GOVERNANCE.md §6).
- The strict gate set costs contributor patience early; mitigated by
  first-timer mentoring and runnable local checks.

## Rejected alternatives

- **GitLab/Codeberg only** — smaller discoverability and weaker CI ecosystem
  at P0; Codeberg remains a mirror option.
- **Git-flow with release branches** — overhead unjustified pre-1.0.
- **Minimal CI first** — standards retrofits are expensive and invite
  grandfathered drift; rejected.
