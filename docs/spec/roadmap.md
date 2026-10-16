---
id: docs.spec.roadmap
title: "Chorus Roadmap"
class: spec
owner_agent: Conductor
authoring_agents: [Conductor]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0002, docs.adr.0003]
citations: []
signature: unsigned (pending key setup)
---

# Chorus Roadmap

Phases are gated. A phase closes only when its exit criteria are verifiably
met (docs/status.md tracks the current phase).

| Phase | Months | Deliverable | Exit criteria |
| --- | --- | --- | --- |
| **P0 — Foundation** | 0–2 | Specs, ADRs, governance, skills registry, CI, agent build system | All interfaces signed off; every contribution path documented; CI gates green on this scaffold |
| **P1 — Option A core** | 2–12 | Identity (did:plc), social graph (CRDT follows), video pipeline (CAS + CDN + P2P), response service, one relay, one web client | A user can upload, watch, respond, and move instances without data loss |
| **P2 — Amplification + moderation** | 12–18 | Amplification policy engine, recommender API, public moderation logs, first community juries | A creator can request public reach; policy grants/denies with obligations; log is public |
| **P3 — Option B identity + data model** | 18–24 | `did:chorus`, signed-object data model, PDS | Dual-stack identity works; migration proven on 100 test users |
| **P4 — Option B federation + amplification** | 24–36 | Plural relays, plural app views, protocol-level amplification, protocol-level juries | AmplifyDecision signed at protocol level; jury verdicts signed and public |

## P0 help-wanted (contribute before there's code)

1. **Docs review** — find anything unclear in `docs/spec/` and the ADRs.
2. **Skill vetting** — verify license/maturity of entries in `skills/registry.yaml`.
3. **Spec review** — adversarial passes over the service stubs: edge cases, threat models, cost.
4. **Test vectors** — canonical signed-object examples in `protocol/test-vectors/`.
5. **CI hardening** — improve the gate scripts in `tools/`.

## Effort estimates (from the design phase)

- Option A: ~21 engineers × 18 months.
- Option B: ~40 engineers × 24–30 months.
- Community contributions directly reduce these; the scaffold exists to make
  that reduction real.
