---
id: docs.spec.services.response
title: "Response Service Spec"
class: spec
owner_agent: RecipLead
authoring_agents: [RecipLead, ResponseEng]
reviewing_agents: [Verifier, ModLead]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.intent, docs.spec.protocol]
citations: []
signature: unsigned (pending key setup)
---

# Response Service Spec — draft

## Scope

The reciprocity layer. Comments are replaced by typed, signed response
objects. This is Chorus's load-bearing differentiator — see intent.md.

## Response types

| Type | Purpose |
| --- | --- |
| TextResponse | Plain reply |
| VideoResponse | Video reply (quote-video) |
| Correction | Claim-level correction with citations |
| RightOfReply | Posted by the subject of a video; pinned with equal prominence |
| CommunityNote | Crowd context, ranked for cross-perspective helpfulness |
| Question / Answer | Q&A pair; unanswered questions stay visible |

## Design points

- Responses live on the author's instance, are mirrored to the video's
  instance and subscribers' instances; all copies are signed, so a host
  cannot silently delete them. Hiding is logged publicly.
- Ranking default is **not** engagement-optimized: citation quality,
  cross-community agreement, author track record, recency; RightOfReply
  always on top.
- Community notes: cross-perspective ranking (bridging-based), not simple
  upvotes — notes helpful to only one side rank low.

## Interfaces

- `post(response) -> SignedObject`
- `list(videoId, filter) -> [Response]` (mirrored, eventually consistent)
- `rank(videoId, algorithmId) -> [Response]` (pluggable)

## Open questions

1. Right-of-reply eligibility: how mentions become claims to a response slot (dispute path?).
2. Mirror availability when the author's instance is down (cross-instance read-through).
3. Anti-brigading for notes and Q&A (cost to post? reputation weighting?).
4. Response size limits (text length, video reply duration).
