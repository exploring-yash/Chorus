---
id: docs.spec.services.amplification
title: "Amplification Service Spec"
class: spec
owner_agent: AmpEng
authoring_agents: [AmpEng, RecommenderEng]
reviewing_agents: [Verifier, LegalEng]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0001, docs.spec.protocol]
citations: []
signature: unsigned (pending key setup)
---

# Amplification Service Spec — draft

## Scope

The line between "you spoke" and "we pushed you to millions". Reach tiers,
obligations, signed decisions, and the recommender interface.

## Reach tiers and obligations

| Tier | Obligations |
| --- | --- |
| followers | none |
| community | public moderation log; community notes enabled |
| public | all of the above + right-of-reply enabled + correction policy + one active reciprocity mechanism (Q&A / response videos / notes) |

## Flow

```text
AmplifyRequest {videoId, tier, creatorDid}
    → policy engine (obligation check, budget, expiry)
    → AmplifyDecision {tier, obligations, expiresAt, issuer, signature}
```

Recommenders only distribute content with a valid, unexpired
AmplifyDecision for public reach. No decision = no public reach.

## Recommender interface

- `POST /recommend {userDid, context, limit} → [{videoId, score, explanation}]`
- Explanation is **mandatory**: why this video, which signals, who paid.
- Default client feed = chronological subscriptions; recommenders are opt-in.
- Third-party recommenders register in an instance directory; users can
  block, rate, and audit them.

## Design points

- Friction mechanisms: share rate limits, no infinite autoplay, shares beyond
  a threshold require added context; viral velocity caps with human review at
  thresholds.
- Multiple amplification services may coexist (community orgs, co-ops,
  instances) and compete on policy quality — in Option B this becomes a
  protocol-level primitive.

## Open questions

1. Policy DSL: OPA/Rego vs. Cedar vs. a minimal purpose-built DSL.
2. Obligation verification: how does the service *prove* a channel runs its
   reciprocity mechanism (self-attestation + spot checks?).
3. Expiry and renewal cadence.
4. Appeals against denial (signed, logged, jury-eligible).
