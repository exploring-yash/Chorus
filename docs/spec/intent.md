---
id: docs.spec.intent
title: "Chorus Design Intent"
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
related: [docs.adr.0001, docs.spec.system-overview]
citations: []
signature: unsigned (pending key setup)
---

# Chorus Design Intent

Every engineering decision in Chorus traces back to this table. If a proposed
feature serves none of these rows, it does not belong in the project.

## What Chorus is designed to combat

| What major platforms do | The harm | What Chorus does instead |
| --- | --- | --- |
| Account = platform database record | A ban erases identity, channel, subscribers, and history | Identity is a keypair-backed DID the user controls; the social graph is signed, portable data |
| Upload = automatic entry into the recommendation lottery | Opaque, engagement-optimized distribution nobody chose | Hosting is neutral; **amplification is a separate, revocable, conditional privilege** |
| One corporate algorithm decides what millions see | Centralized editorial power without accountability | Pluggable, user-chosen recommenders; chronological subscriptions by default; every recommendation explains itself |
| A comment box stands in for reciprocity | Audience response has no consequence; broadcaster ignores, buries, or weaponizes it | Typed, signed response objects: right of reply, claim-level corrections, Q&A, community notes |
| The platform owns your followers and content | Lock-in; leaving means losing your audience | Graph and content are signed and exportable; instances are interchangeable |
| One company writes all the rules | Rule changes are unilateral and opaque | A federation protocol; anyone can run an instance; governance is public and recorded |

## The one-line principle

> Chorus does not abolish one-to-many speech. It makes **1→n a right**, and
> **1→n-to-millions a privilege with accountability**.

## Non-negotiable constraints (architecture must satisfy all)

1. **Video is expensive.** Storage and egress dominate cost. Content-addressed
   storage + P2P hybrid delivery is mandatory, not optional.
2. **Federation fan-out must avoid O(n²).** Naive full-mesh delivery does not
   scale; a relay tier is required.
3. **Identity recovery must work without a central authority.** M-of-N social
   recovery or rotation-key hierarchy; no "forgot password" back door.
4. **Moderation cannot be fully automated or fully centralized.** Community
   juries, transparent signed logs, and deamplification-not-erasure.

## The reciprocity contract

Reciprocity is not a feature; it is the platform's load-bearing wall:

- The **subject** of a video can pin a right-of-reply with equal prominence.
- Claims can be **corrected at claim level**, not video level.
- Audience questions are **first-class objects**; unanswered ones stay visible.
- Channels above a reach threshold must operate at least one working
  reciprocity mechanism (Q&A, response videos, community notes, or a public
  moderation log) — or they do not get amplified.
