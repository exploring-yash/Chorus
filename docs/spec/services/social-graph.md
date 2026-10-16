---
id: docs.spec.services.social-graph
title: "Social Graph Service Spec"
class: spec
owner_agent: GraphEng
authoring_agents: [GraphEng, FedLead]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.protocol]
citations: []
signature: unsigned (pending key setup)
---

# Social Graph Service — draft

## Scope

The follow graph as signed, user-owned data. This is what makes "leave any
instance with your subscribers" true.

## Interfaces

- `follow(actor, target) -> FollowEvent` (signed)
- `unfollow(actor, target) -> FollowEvent` (tombstone)
- `followers(did) / following(did) / mutuals(did)` (eventually consistent reads)
- `circles(did) -> named subsets` (tiered reach: followers/community/public)

## Design points

- Canonical graph = grow-only CRDT of signed follow events per user; instances mirror and reconcile (hourly job), but cannot forge follows.
- Event chain: each FollowEvent links `prevEventHash`, enabling out-of-order reconciliation.
- Graph data is part of the signed-object universe, so PDS migration moves it automatically (P3+).

## Open questions

1. Reconciliation conflict policy when two instances diverge (last-write-wins by timestamp? hash ordering?).
2. Follow-list privacy: public follows vs. private lists — how private is enforced cryptographically vs. conventionally.
3. Circles: where they live (user device, PDS, or instance) and how clients discover them.
4. Sybil/spam follow rate limits without central authority.
