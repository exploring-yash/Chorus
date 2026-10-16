---
id: docs.status
title: "Chorus Public Status Dashboard"
class: status
owner_agent: Conductor
authoring_agents: [Conductor]
reviewing_agents: []
human_signoff: null
version: 0.1.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0006]
citations: []
signature: unsigned (pending key setup)
---

# Chorus Status Dashboard

Generated snapshot. Live repository: https://github.com/exploring-yash/Chorus.
Auto-generated metrics (merge latency, review depth, escalation rate) will be
wired to the CI pipeline in P1.

## Phase

| Phase | Status |
| --- | --- |
| P0 — foundation | **in progress** |
| P1 — Option A core | not started |
| P2 — amplification + moderation | not started |
| P3 — Option B identity | not started |
| P4 — Option B federation | not started |

## Repository health

| Metric | Target | Current |
| --- | --- | --- |
| Time-to-merge (p50) | ≤ 24h | n/a (not published) |
| Time-to-merge (p95) | ≤ 72h | n/a |
| Signed-commit rate | 100% | n/a |
| Docs-freshness | 100% | n/a |
| Escalation rate | ≤ 10% of tasks | n/a |
| Verifier FAIL rate | ≤ 15% | n/a |

## Open help-wanted (P0)

See issues labeled `good first issue` (label created by `tools/gh-labels.sh`;
issue drafts in `docs/issues/`): docs review, skill vetting, spec review,
test vectors, CI hardening.
