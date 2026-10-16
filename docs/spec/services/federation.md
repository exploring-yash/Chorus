---
id: docs.spec.services.federation
title: "Federation Service Spec (PDS / Relay / AppView)"
class: spec
owner_agent: FedLead
authoring_agents: [FedLead, RelayEng, AppViewEng]
reviewing_agents: [Verifier, SREEng]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.protocol, docs.adr.0002]
citations: []
signature: unsigned (pending key setup)
---

# Federation Service Spec — draft

## Scope

The message plane: how signed objects move between actors without O(n²)
fan-out and without a single chokepoint.

## Layers

| Layer | Option A | Option B |
| --- | --- | --- |
| PDS | Instance-local storage | Dedicated personal data server; hosts signed data only (never video bytes) |
| Relay | Opt-in relay tier aggregating high-volume actors | Plural relays; signed firehose; users choose where to publish |
| AppView | Instance feeds + third-party recommenders | Plural app views; index firehose; serve feeds/search |

## Interfaces

- `publish(pds, SignedObject) -> ack` (idempotency keyed by object id)
- `firehose(relay, cursor) -> stream<SignedObject>` (signed, framed, backpressure-aware)
- `sync(pds, relay, interestSet) -> delta` (selective sync of objects relevant to local users)
- `feed(appView, userDid, algorithmId) -> [VideoId]` (with mandatory explanation)

## Design points

- Delivery is best-effort with idempotency keys; ordering repaired via `prev` chains.
- Relays are plural by design (Option B): if one dominates, we've rebuilt a platform — flagged as the top re-centralization risk to monitor.
- ActivityPub interop (Option A): dual-publish `Note` with `Video` attachment (Mastodon renders media only on Note objects) plus a PeerTube-compatible `Video` activity.

## Open questions

1. Firehose framing: CBOR + WebSocket vs. HTTP/2 streams vs. both.
2. Relay economics: who pays, and how dominance is detected/measured.
3. Selective-sync interest computation (follows? mentions? topics?).
4. Backpressure and lag SLOs (target: p95 delivery < 5s across relays).
