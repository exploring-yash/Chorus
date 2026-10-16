---
id: docs.spec.system-overview
title: "Chorus System Overview"
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
related: [docs.adr.0002, docs.spec.intent, docs.spec.roadmap]
citations:
  - url: https://joinpeertube.org/
    quote: "PeerTube: federated (ActivityPub) video platform; instances follow each other asymmetrically."
  - url: https://atproto.com/
    quote: "AT Protocol: portable identity, self-authenticating data, open feed algorithms."
  - url: https://blueskyweb.xyz/blog
    quote: "Bluesky users can select or build the algorithms that determine their feed."
signature: unsigned (pending key setup)
---

# Chorus System Overview

## Two options, one bet

| Dimension | Option A (ship first, ~18 mo) | Option B (migrate, ~36 mo) |
| --- | --- | --- |
| Protocol | ActivityPub + DID (`did:plc`, Chorus context) | Chorus protocol (`did:chorus`) |
| Identity | DID, instance-bound actor docs | DID + PDS; fully portable |
| Federation | Server-to-server + relay tier | Plural relays + plural app views |
| Amplification | Instance-level policy engine | Protocol-level signed decisions |
| Moderation | Instance-level + manual juries | Protocol-level juries + reputation |
| Interop | High (PeerTube, Mastodon, Pixelfed) | Low (bridge required) |
| Re-centralization risk | Medium (relay chokepoint) | Low (plurality by design) |

The bet: **Option A gets users; Option B keeps them sovereign.** All data is
signed and content-addressed from day one, so the A→B migration is a
deployment change, not a data migration.

## Service topology

```text
┌────────────────────────────────────────────────────────────┐
│                    FEDERATION PROTOCOL                      │
│   signed objects · DIDs · relays · pluggable app views      │
└──┬──────────┬──────────┬──────────┬──────────┬─────────────┘
   │          │          │          │          │
┌──▼────┐ ┌───▼────┐ ┌───▼─────┐ ┌──▼───────┐ ┌─▼──────────┐
│Identity│ │Social  │ │Video    │ │Response  │ │Amplification│
│Service │ │Graph   │ │Pipeline │ │Service   │ │Service      │
└────────┘ └────────┘ └────┬────┘ └──────────┘ └─────────────┘
                           │
                ┌──────────▼──────────┐
                │  CAS + CDN + P2P     │
                └─────────────────────┘
```

Per-service specs: [services/README.md](services/README.md).

## How Chorus differs from major platforms (plain English)

- **YouTube/TikTok/X/Facebook:** one account record, one algorithm, one
  company. A ban erases you; the algorithm is opaque; comments are the only
  response and they don't bind anyone.
- **Chorus:** identity is yours (a keypair); hosting is neutral; reaching
  millions is a separate, conditional privilege with public decisions;
  responses are structured and enforceable (right of reply, corrections, Q&A);
  you can leave any instance with your identity and subscribers intact; and
  the rules are written in public, by a recorded governance process.

## What already exists nearby

- **PeerTube** — closest on federated video hosting (instances, asymmetric
  follows), but instance-bound identity and no amplification/reciprocity
  layer.
- **Bluesky (AT Protocol)** — closest on portable identity and pluggable feed
  algorithms; text-first, single-relay/single-appview re-centralization risk.
- **Loops** — federated short-form video (ActivityPub/Pixelfed ecosystem);
  no hosting/amplification separation, no right-of-reply obligations.
- **Mastodon** — proved instance federation and migration; text-first, posts
  don't migrate with you.
- **Federated Video Co-op Initiative** — closest on co-op ownership and
  governance; still a framework, not a running network.

Chorus is the synthesis of these pieces plus the piece nobody has shipped:
**enforced reciprocity + tiered amplification as protocol-level obligations.**
