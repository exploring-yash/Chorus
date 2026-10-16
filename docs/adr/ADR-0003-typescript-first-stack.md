---
id: docs.adr.0003
title: "TypeScript-first monorepo; Rust for hot paths later"
class: adr
owner_agent: Conductor
authoring_agents: [Conductor]
reviewing_agents: [Verifier]
human_signoff: null
version: 1.0.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.roadmap]
citations: []
signature: unsigned (pending key setup)
---

# ADR-0003: TypeScript-first monorepo; Rust for hot paths later

## Context

The service design spans identity, federation, video transcode orchestration,
delivery, responses, and amplification. Rust gives performance; Go gives
operational simplicity; TypeScript gives the largest contributor pool and
shares a language with the web/mobile clients the project needs regardless.

## Decision

- **Primary stack: TypeScript/Node (≥20) in a monorepo** (`services/*`,
  `clients/*` as npm workspaces) for the first milestones.
- **Rust is adopted later for hot paths** — relay firehose, P2P tracker,
  signature verification — behind stable service boundaries, not as a
  rewrite.
- Every service exposes a language-neutral interface (signed HTTP + JSON/CBOR
  contracts) so polyglot growth stays possible.

## Consequences

- Fastest onboarding for the largest audience; one language for services and
  clients during P1.
- We accept GC pauses and higher memory in early relay/tracker prototypes,
  mitigated by the Rust path in P3+.
- Crypto primitives must come from audited libraries (e.g., noble/ed25519 or
  WebCrypto), not hand-rolled code — enforced by review.

## Rejected alternatives

- **Rust-everywhere from day one** — highest engineering cost, slowest
  onboarding, best performance. Rejected for P1; kept as the hot-path plan.
- **Go services + TS client** — reasonable, but splits the contributor base
  earlier than necessary.
- **Polyglot per service immediately** — matches the design doc exactly but
  maximizes friction exactly when the project most needs contributors.
