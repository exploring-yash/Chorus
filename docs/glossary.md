---
id: docs.glossary
title: "Chorus Glossary"
class: glossary
owner_agent: Scribe
authoring_agents: [Scribe]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.intent]
citations: []
signature: unsigned (pending key setup)
---

# Chorus Glossary

Shared vocabulary. If you coin a term, add it here in the same PR.

| Term | Definition |
| --- | --- |
| **Speech** | The act of publishing: a video, a response, a profile. A right. |
| **Hosting** | Storing and serving bytes. Neutral infrastructure. |
| **Amplification** | Pushing content beyond its author's existing audience. A separate, revocable, conditional privilege. |
| **1→n / 1→n-to-millions** | The distinction between broadcasting to your chosen audience and algorithmic reach to the public. Chorus keeps the first as a right and makes the second accountable. |
| **Reciprocity** | The audience's ability to respond with consequence: right of reply, corrections, Q&A — not just a comment box. |
| **DID** | Decentralized Identifier — a portable, keypair-backed identity (e.g., `did:chorus:…`). |
| **SignedObject** | The protocol's base unit: content, author DID, previous-object hash, Ed25519 signature. |
| **PDS** | Personal Data Server — hosts a user's signed data; interchangeable like an email provider. |
| **Relay** | Aggregates signed objects into a firehose; plural by design. |
| **AppView** | Indexes the firehose and serves feeds/search; plural and user-chosen. |
| **AmplifyDecision** | A signed grant/denial of reach at a tier, with obligations and expiry. |
| **Reach tiers** | `followers` → `community` → `public`; each tier carries more obligations. |
| **RightOfReply** | A response object the subject of a video can pin with equal prominence. |
| **CommunityNote** | Claim-level, time-stamped crowd context, ranked for cross-perspective helpfulness. |
| **Deamplify** | Remove reach, not existence: the alternative to bans for legal-but-harmful content. |
| **CAS** | Content-Addressed Store — data named by its hash; enables dedup and integrity. |
| **CRDT** | Conflict-free Replicated Data Type — merges concurrent edits (used for the social graph). |
| **Firehose** | A relay's stream of all signed objects. |
| **Sortition** | Random selection of decision-makers (juries, community council), weighted for cross-community participation. |
| **Skill** | A registered, vetted capability module (upstream library, spec, or pattern). |
| **ADR** | Architecture Decision Record — a short, dated, signed record of an irreversible decision. |
| **Option A / Option B** | The two-stage strategy: ActivityPub-based federation first (A), protocol-native redesign second (B). |
| **Instance** | A server running Chorus services; federation makes instances interchangeable. |
| **Deamplification** | See Deamplify. |
