---
id: docs.spec.protocol
title: "Chorus Protocol Skeleton"
class: spec
owner_agent: ProtoLead
authoring_agents: [ProtoLead, Conductor]
reviewing_agents: [Verifier, SecEng]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0002, docs.adr.0005]
citations:
  - url: https://www.w3.org/TR/did-core/
    quote: "W3C Decentralized Identifiers (DIDs) v1.0."
  - url: https://www.w3.org/TR/activitypub/
    quote: "ActivityPub: actor-based federation protocol."
signature: unsigned (pending key setup)
---

# Chorus Protocol Skeleton

Working draft for P0 review. Option A runs on ActivityPub envelopes; Option B
moves these objects into the native Chorus protocol. Because the objects below
are signed and content-addressed from day one, the envelope can change without
migrating data.

## 1. Identity

- **Option A:** `did:plc` with Chorus service context; WebFinger maps
  `@user@instance` to the DID; ActivityPub actor documents generated from the
  DID document. Rotation key hierarchy so users can migrate instances without
  host cooperation.
- **Option B:** `did:chorus`. Root key (cold), signing keys (device), rotation
  keys (priority-ordered), M-of-N social recovery via notary DIDs. No central
  recovery authority. Key transparency log for revocation propagation.
- Signing: Ed25519 (signatures), X25519 (encryption), both from audited
  libraries only.

## 2. SignedObject (the base unit)

```ts
interface SignedObject {
  id: string;              // hash(content) — content-addressed
  type: 'Video' | 'Response' | 'Follow' | 'AmplifyDecision' | 'Moderation' | ...;
  author: string;          // DID
  content: unknown;        // type-specific payload
  prev: string | null;     // previous object hash (auditability chain)
  timestamp: string;       // ISO 8601
  signature: string;       // Ed25519 over content + prev + author + timestamp
}
```

Invariants (test vectors required for each):

1. Signature verifies against the author DID's current or rotated signing key.
2. `id` equals the hash of canonicalized `content`.
3. `prev` chains to a previously seen object by the same author or is `null`.
4. Replay/forgery attempts fail signature verification.

## 3. Object types (P0 skeleton)

- **Video** — manifest: title, description, renditions (content-addressed:
  hash, codec, bitrate, resolution), thumbnails, captions, chapters, mentions
  (DIDs of subjects → enables right of reply).
- **Response** — typed: `TextResponse | VideoResponse | Correction |
  RightOfReply | CommunityNote | Question | Answer`. Target: video id,
  optional timestamp, optional claim id. RightOfReply pinned with equal
  prominence by conforming clients.
- **Follow** — CRDT grow-only set entry for the social graph.
- **AmplifyDecision** — `{ videoId, tier, obligations, expiresAt, issuer }`,
  signed by an amplification service.
- **Moderation** — every moderation action, signed and public (appealable).

## 4. Federation layers (Option B target)

| Layer | Role |
| --- | --- |
| **PDS** | Hosts a user's signed data; interchangeable like an email provider; never serves video bytes |
| **Relay** | Aggregates signed objects into a firehose; **plural** — users choose which to publish to |
| **AppView** | Indexes the firehose, serves feeds/search/recommenders; **plural**, user-chosen |
| **Amplification Service** | Evaluates reach requests against policy bundles; issues signed AmplifyDecisions; multiple services compete on policy quality |
| **Juries** | Sortition-based, cross-community weighted; 7 members standard, 12 high-reach; verdicts signed and public |

Option A maps these to: instance-local storage (PDS), relay tier (Relay),
instance feeds + third-party recommenders (AppView), instance policy engine
(Amplification Service), manual juries (Juries).

## 5. Delivery (protocol-agnostic)

Renditions are content-addressed chunks with a Merkle root in the manifest.
Delivery is CDN, P2P (WebRTC/WebTorrent), or IPFS — the client chooses by
latency, cost, and privacy. P2P seeding earns bandwidth credits (Option B).

## 6. Open questions (review targets)

1. Canonicalization format for `id` hashing (JCS? CBOR?) — needs a decision + test vectors.
2. `prev`-chain length limits and compaction strategy.
3. DID document size limits and rotation replay windows.
4. Firehose framing and backpressure semantics.
5. Cross-instance reply availability when the author's instance is down.
