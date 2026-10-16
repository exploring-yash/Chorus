---
id: docs.adr.0001
title: "Speech, hosting, and amplification are separate layers"
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
related: [docs.spec.intent]
citations: []
signature: unsigned (pending key setup)
---

# ADR-0001: Speech, hosting, and amplification are separate layers

## Context

Major platforms bundle three things: identity/account records, content
hosting, and algorithmic distribution. The bundle produces every pathology
Chorus exists to fix: bans that erase people, opaque recommendation lotteries,
comment boxes mistaken for reciprocity, and one company writing all rules.

## Decision

Chorus treats **speech, hosting, and amplification as three independent
layers** with three independent lifecycles:

1. **Speech** (publishing) — a right. Signed, portable, attributable.
2. **Hosting** — neutral infrastructure. Cheap, content-addressed, interchangeable.
3. **Amplification** — a separate, revocable, conditional privilege with
   obligations attached (right of reply, public moderation log, correction
   policy), granted by a policy engine and recorded as a signed decision.

## Consequences

- Every service boundary must be auditable against this split; a feature that
  blurs layers is a bug (Verifier checks this on every PR).
- "Deamplify, don't erase" becomes implementable: illegal content is removed,
  legal-but-harmful content loses reach without losing existence.
- The design inherits extra complexity: an amplification service, tier
  definitions, and obligation tracking that a monolith would not need. This is
  the price of the intent.

## Rejected alternatives

- **Monolithic platform with internal policy** — rejects the core problem;
  keeps the chokepoint.
- **Fully unmoderated hosting** — fails safety obligations and makes the
  project uninhabitable for most instances.
- **Ban-centered moderation** — recreates erasure; rejected in favor of
  deamplification tiers.
