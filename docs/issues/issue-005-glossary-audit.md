---
id: docs.issues.005
title: "Audit the glossary against the specs"
class: issue
labels: ["good first issue", "phase:P0", "documentation", "pod:0", "intent:contrib"]
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
related: [docs.spec.intent]
citations: []
signature: unsigned (pending key setup)
---

# Title: Audit the glossary against the specs

## Summary

`docs/glossary.md` was written at bootstrap. The specs have grown around it.
Any term used in `docs/spec/` or the ADRs that is missing, vague, or
inconsistent with the glossary is a bug.

## Why this matters

A glossary is the cheapest trust-building artifact an open-source project
has: it says "we care whether newcomers understand us." Stale glossaries say
the opposite.

## Task

1. Extract every capitalized/defined term from `docs/spec/**` and
   `docs/adr/**`.
2. Cross-check against `docs/glossary.md`.
3. For each gap: add the term with a one-line definition **in the same PR as
   the doc that uses it** (docs-freshness gate enforces this).
4. Flag inconsistencies (e.g., a spec says "tier" where the glossary says
   "reach tier") and fix either the spec or the glossary — never both
   silently.

## Acceptance criteria

- [ ] Zero terms in `docs/spec/` missing from the glossary.
- [ ] Glossary definitions agree with spec usage.
- [ ] PR passes all CI gates.

## Pointers

- The glossary itself carries frontmatter — follow `docs/agents/README.md`.
- `docs/INDEX.md` must still link everything you touch (discoverability).
- DCO sign-off required: `CONTRIBUTING.md`.

## Mentorship

The bootstrap maintainer reviews. This is the safest possible first PR —
if you've never contributed to open source before, start here.
