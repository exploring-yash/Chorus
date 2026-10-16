---
id: docs.spec.services.client
title: "Client Spec (web / mobile / studio)"
class: spec
owner_agent: ClientLead
authoring_agents: [ClientLead, WebEng, MobileEng, UXRes]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.intent]
citations: []
signature: unsigned (pending key setup)
---

# Client Spec — draft

## Scope

Web, mobile, and studio clients. Clients are thin and interchangeable; the
protocol is the product. Anyone may build a client.

## Required surfaces

- **Identity wallet** — keys, DIDs, rotation, recovery; never ships keys to servers.
- **Feed engine** — chronological subscriptions by default; algorithm picker
  with visible explanations ("Why am I seeing this?").
- **Watch page** — video + reciprocity panel: RightOfReply pinned, corrections
  at claim level, community notes time-stamped, Q&A queue.
- **Moderation dashboard** — what's hidden, why, appeal path.
- **Offline** — local cache, queued actions, CRDT sync when back online.

## Design principles

- No infinite autoplay; no public engagement metrics by default (opt-in).
- Minor-safety defaults on.
- Every reach-related UI element shows tier and obligations.

## Open questions

1. Wallet UX for non-technical users (the single hardest onboarding problem).
2. Web vs. native for P2P delivery (WebRTC limits on mobile).
3. Studio workflow: manifest editing, transcode monitoring, right-of-reply
   notifications.
4. Accessibility baseline (WCAG level) and RTL/i18n plan.
