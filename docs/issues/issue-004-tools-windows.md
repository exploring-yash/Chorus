---
id: docs.issues.004
title: "Make the tools/ gate scripts portable (Git Bash / Windows)"
class: issue
labels: ["good first issue", "phase:P0", "bug", "pod:7", "intent:contrib"]
owner_agent: null
authoring_agents: [Conductor]
reviewing_agents: []
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0006]
citations: []
signature: unsigned (pending key setup)
---

# Title: Make the tools/ gate scripts portable (Git Bash / Windows)

## Summary

The CI gate scripts (`tools/check-docs-frontmatter.sh`,
`tools/check-license-headers.sh`, `tools/check-dco.sh`) run in Ubuntu CI but
were written for bash on POSIX paths. Windows contributors (Git Bash) and
shellcheck purists will hit friction.

## Why this matters

Contribution-friendliness means the gates run locally everywhere. If a
contributor can't run the checks before pushing, they'll see CI failures
instead of fast local feedback.

## Task

1. Run the scripts on Git Bash (or at least audit them for POSIX-isms):
   - `find ... -print0` / `read -d ''` portability
   - `<<<` herestrings (Bash-only — fine in Git Bash, but flag it)
   - path handling (`dirname`, `cd`, `$PWD`)
2. Fix portability issues without adding dependencies.
3. Make the scripts **shellcheck-clean** (`shellcheck` is an optional local
   tool; CI stays on Ubuntu).
4. Update `tools/README.md` with the supported environments.

## Acceptance criteria

- [ ] Scripts pass shellcheck (no errors).
- [ ] Scripts run on Git Bash (if you can test it) or POSIX-sh portability is
      documented as the baseline.
- [ ] CI gates still green.

## Pointers

- The scripts must stay dependency-free (bash + coreutils).
- CI wiring: `.github/workflows/ci.yml`.
- DCO sign-off required: `CONTRIBUTING.md`.

## Mentorship

The bootstrap maintainer reviews. Windows-specific knowledge is especially
valuable here — if you daily-drive Windows, this one is yours.
