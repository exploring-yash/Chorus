---
id: docs.adr.0002
title: "Two-stage strategy: Option A (ActivityPub) then Option B (protocol-native)"
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
related: [docs.spec.system-overview, docs.spec.roadmap, docs.spec.protocol]
citations:
  - url: https://joinpeertube.org/
    quote: "PeerTube is a federated (ActivityPub) video platform."
  - url: https://atproto.com/
    quote: "AT Protocol provides portable identity and pluggable feed algorithms."
signature: unsigned (pending key setup)
---

# ADR-0002: Two-stage strategy — Option A then Option B

## Context

Two candidate architectures were designed:

- **Option A** — build on ActivityPub with DID-based identity, a relay tier,
  and an instance-level amplification policy engine. Ships in ~18 months,
  interoperates with the existing Fediverse (PeerTube, Mastodon, Pixelfed).
- **Option B** — a new protocol ("Chorus protocol") with plural PDSes, plural
  relays, plural app views, and protocol-level amplification decisions and
  juries. Architecturally correct for long-term sovereignty, but bootstraps a
  protocol from zero (~36 months, highest-risk problem in decentralized
  systems).

## Decision

**Build Option A first; design every interface so Option B is a bolt-on, not
a rewrite.** Migrate in phases P3–P4. Concrete commitments:

- Identity uses `did:plc` with Chorus service context in Option A, migrating
  to `did:chorus` in Option B.
- All data is signed and content-addressed from day one, even inside
  ActivityPub envelopes, so no data migration is needed later.
- The amplification policy engine is a standalone service from P2, so
  promoting it to a protocol primitive in P4 is a deployment change, not a
  redesign.

## Consequences

- We accept ActivityPub's structural limits (instance-bound actors, relay
  chokepoints) for 18–24 months.
- We must dual-publish Mastodon-compatible notes with video attachments, since
  Mastodon renders media only on `Note` objects, not standalone `Video`
  objects.
- Interop pressure is real but contained: the signed-object core is immune to
  envelope changes.

## Rejected alternatives

- **Option B first** — too slow, no users, no interop; the classic protocol
  adoption trap.
- **Option A forever** — permanently inherits relay centralization and
  instance-bound identity; fails the sovereignty goal.
- **Fork PeerTube and stay a fork** — couples us to upstream's roadmap and
  keeps instance-bound identity.
