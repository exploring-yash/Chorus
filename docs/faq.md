---
id: docs.faq
title: "Chorus FAQ"
class: faq
owner_agent: UXRes
authoring_agents: [UXRes, Scribe]
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

# Chorus FAQ

## Is Chorus trying to abolish one-to-many broadcasting?

No. 1→n speech is a right — it's how teachers, journalists, artists, and
ordinary people speak beyond their circle. What Chorus changes is
**1→n-to-millions**: algorithmic reach becomes a separate, transparent,
revocable privilege with obligations (right of reply, public moderation,
correction policy). See [spec/intent.md](spec/intent.md).

## How is this different from YouTube, TikTok, X, or Facebook?

The big platforms bundle identity, hosting, and algorithmic reach into one
corporate account. Chorus separates the three: identity is a keypair you own,
hosting is neutral, and amplification is a conditional layer with public
decisions. You can leave any instance without losing your identity or
subscribers. See [spec/system-overview.md](spec/system-overview.md).

## Is any existing platform already doing this?

Parts of it, yes. PeerTube does federated video hosting; Bluesky's AT Protocol
does portable identity and pluggable feed algorithms; Loops is a federated
short-video client; the Federated Video Co-op Initiative is building co-op
ownership. Nobody has assembled all of it — especially enforced reciprocity
and tiered amplification — which is the gap Chorus targets. Sources are cited
in [spec/system-overview.md](spec/system-overview.md).

## Why TypeScript first instead of Rust?

Lowest contributor barrier for the largest number of people; Rust is adopted
later for hot paths (relay, tracker). Recorded in ADR-0003.

## Why Apache-2.0 instead of AGPL?

Permissive licensing maximizes adoption by instances, clients, and corporate
contributors while the DCO keeps provenance. Copyleft was considered and
rejected for now; it can be revisited — see ADR-0004 for the analysis.

## Do I need to sign a CLA?

No. There is no CLA. Commits require only a DCO sign-off
(`Signed-off-by`). See [CONTRIBUTING.md](../CONTRIBUTING.md).

## Can AI agents contribute?

Yes. Agents follow the same rules as humans — signed commits, DCO, Verifier
review, no self-merge — and hold no governance voting power. See
[docs/agents/README.md](agents/README.md) and [GOVERNANCE.md](../GOVERNANCE.md) §6.

## Why "Chorus"?

A chorus is many voices in one work — the platform's whole point: broadcast
kept as a right, but designed so the many can answer. The name replaces the
earlier working title "NewTube" everywhere (ADR-0005).

## When will there be code?

P0 (now) is the foundation: specs, ADRs, governance, CI. P1 (next) ships the
Option A core: identity, social graph, video pipeline, responses, one relay,
one web client. See [spec/roadmap.md](spec/roadmap.md).

## I found something unclear or wrong

That's a contribution. Open an issue — ideally with a suggested fix. Unclear
docs are bugs, and we treat them that way.
