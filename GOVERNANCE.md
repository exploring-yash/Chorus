---
id: governance
title: "Chorus Governance"
class: governance
owner_agent: Conductor
authoring_agents: [Conductor]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0006]
citations: []
signature: unsigned (pending key setup)
---

# Chorus Governance

Chorus is a **protocol and an ecosystem**, not a company. Governance exists so
that the project stays inviting to contributors, neutral to instances, and
honest about who decides what. This document is deliberately short; every
mechanism below grows with the community, and every change to it is a public,
recorded decision (an ADR).

## 1. Goals of governance

1. **Low barrier to contribute.** Any person (or agent) can propose, patch, and review.
2. **No single point of rule.** Decisions are public, recorded, and reversible where possible.
3. **Scale brings accountability.** The more reach a decision has, the more scrutiny it gets — the same principle the platform itself applies to amplification.
4. **Forkability is the ultimate check.** Anyone may fork the repo under [Apache-2.0](LICENSE) / [CC BY 4.0](LICENSE-docs). Governance works because it is earned, not enforced.

## 2. Roles

| Role | Who | Powers |
| --- | --- | --- |
| Contributor | Anyone | Open issues, comment, submit PRs |
| Reviewer | Trusted contributors | Approve PRs in their area (per CODEOWNERS) |
| Maintainer | Sustained contributors, nominated and confirmed by the council | Merge PRs, manage issues/releases, shepherd areas |
| Maintainer Council | Maintainers | Decide policy, ADR acceptance, CoC enforcement, funding posture |
| Community Council | Contributors selected by **sortition** (random selection, weighted for cross-community participation) once active contributors exceed 20 | Veto protocol-level changes, ratify governance changes, run CoC appeals |
| Bootstrap maintainer | The repository founder | Acts as council-of-one until the council forms; commits to this timeline |

The Maintainer Council is the default decision body. The Community Council
activates at the 20-active-contributor threshold (P2 milestone) so that
protocol changes can't be captured by a small group.

## 3. Decision classes

| Class | Example | Process | Record |
| --- | --- | --- | --- |
| Trivial | Typo, formatting, link fix | Any maintainer merges | PR only |
| Minor | Bug fix, doc clarification, skill registration | 1 reviewer + 1 maintainer approval | PR + changelog |
| Major | New feature, spec change to one service | Consensus of maintainers involved (lazy consensus: 72h comment period, no unresolved objection) | ADR |
| Protocol | Wire format, federation behavior, DID method | Maintainer Council consensus **+** Community Council ratification once it exists; breaking changes need a deprecation window ≥ 2 minor versions | ADR + migration guide |
| Governance | This document, CoC changes | Maintainer Council + Community Council ratification | ADR |

**Lazy consensus**: a proposal is accepted if, after a 72-hour public comment
period, no maintainer raises an unresolved objection. Silence is consent, and
the clock is public.

## 4. Conflict resolution

1. Disagreement on a PR: the issue moves to the relevant ADR channel; Verifier writes a neutral summary.
2. Disagreement among maintainers: a recorded vote; the losing position is documented in the ADR as a rejected alternative (this is mandatory, not courtesy).
3. CoC violations: handled per [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) by maintainers, with appeal to the Community Council once it exists.
4. Deadlock: an independent mediator selected by sortition from trusted cross-project contributors.

## 5. Becoming a maintainer

- Sustained, high-quality contributions over ≥ 3 months, plus nomination by an existing maintainer and confirmation by the council.
- Maintainers are listed in [MAINTAINERS.md](MAINTAINERS.md), generated from this process.
- Maintainers can step down or be removed by council consensus for sustained inactivity or CoC violations. All changes are public.

## 6. Agents as participants

Chorus is co-built by humans and AI agents. Agents follow the same rules:
signed commits, DCO-equivalent identity, no self-merge, Verifier review.
Agent keys are public in [`agents/keys/`](agents/keys/) and rotate per phase
gate. Humans hold the council; agents hold no voting power. See
[docs/agents/README.md](docs/agents/README.md).

## 7. Funding posture

- The project may accept neutral funding (donations, grants, co-op membership).
- Funders get **no governance rights**. Sponsorship is public in `FUNDING.md` when it exists.
- The long-term home is a member-owned cooperative; this document will be amended to match when that forms (ADR required).

## 8. Transparency obligations

- All ADRs, moderation decisions, amplification policy changes, and governance actions are public and dated.
- The public dashboard ([docs/status.md](docs/status.md)) reports merge latency, review depth, and escalation rate.
- If a decision cannot be made public (security, safety), the *existence* of the decision is logged with a disclosure date.

## 9. Amending this document

Changes require an ADR and ratification per the table above. The version in
this file's frontmatter increments on every change.
