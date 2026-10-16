# Chorus

**A federated video platform where speech, hosting, and reach are separate systems — so the audience gets real reciprocity, not a comment box.**

> Status: **P0 — pre-alpha foundation.** This repository currently contains the
> protocol design, architecture decision records, governance, and contribution
> infrastructure. Production code lands in P1. See [docs/spec/roadmap.md](docs/spec/roadmap.md).

---

## Why Chorus exists

Today's major video platforms bundle three things that should be separate:

| What they do | What Chorus does |
| --- | --- |
| Your account is their database record. A ban erases you. | Identity is a keypair you control; your followers are signed data you can take anywhere. |
| Uploading enters you in an opaque recommendation lottery. | Hosting is neutral. **Amplification is a separate, revocable privilege** with obligations attached. |
| One opaque algorithm decides what millions see. | Algorithms are pluggable and user-chosen; the default is chronological subscriptions. |
| A comment box is called "engagement." | Structured reciprocity: right of reply, claim-level corrections, Q&A, community notes. |
| One company writes the rules. | A protocol — anyone can run an instance, and you can leave without losing your identity or audience. |

Chorus does not abolish one-to-many speech. It makes **1→n a right**, and
**1→n-to-millions a privilege with accountability**. Read the design intent in
[docs/spec/intent.md](docs/spec/intent.md).

## Principles

1. **Speech, hosting, and amplification are separate layers.** Conflating them is a bug, not a feature.
2. **Identity is portable.** DID-based, keypair-signed, with social recovery and no central authority.
3. **Reciprocity is a first-class data type.** Responses are signed objects — not a text field under a video.
4. **Algorithms are a choice.** No global default recommender. Every recommendation explains itself.
5. **Deamplify, don't erase.** Illegal content is removed; bad-but-legal content loses reach, not hosting.
6. **Transparency is a feature.** Moderation logs, amplification decisions, and governance records are public and signed.

## Architecture at a glance

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
                │  delivery            │
                └─────────────────────┘
```

Two-stage strategy, documented in the ADRs: **Option A** ships a working
ActivityPub-based federation in ~18 months; **Option B** migrates to a
protocol-native design (plural relays, plural app views, protocol-level
amplification decisions) in ~36 months. Interfaces are designed so A→B is a
bolt-on, not a rewrite.

## Repository map

| Path | What's there |
| --- | --- |
| [`docs/adr/`](docs/adr/) | Architecture Decision Records |
| [`docs/spec/`](docs/spec/) | Design intent, system overview, protocol and service specs, roadmap |
| [`docs/agents/`](docs/agents/) | The agent-orchestration build system (human- and agent-readable) |
| [`docs/glossary.md`](docs/glossary.md) | Shared vocabulary |
| [`skills/`](skills/) | Registry of reusable capability modules (libraries, protocols, patterns) |
| [`protocol/`](protocol/) | Chorus protocol spec, schemas, test vectors |
| [`services/`](services/) | One directory per service (P1+) |
| [`clients/`](clients/) | Web, mobile, studio clients (P1+) |
| [`infra/`](infra/) | Deployment, SLOs, cost model |
| [`tools/`](tools/) | Repo tooling and CI helper scripts |
| [`agents/`](agents/) | Agent identities and public keys |

## Getting started

- First time here? Start with [CONTRIBUTING.md](CONTRIBUTING.md).
- Want to understand the design? Read [docs/spec/intent.md](docs/spec/intent.md), then the [ADRs](docs/adr/).
- Want to help now, before there's code? See the **P0 help-wanted list** in CONTRIBUTING.md — docs review, skill vetting, spec review, and test vectors are all real, mergeable contributions.
- Found a bug or have an idea? Open an issue using the templates.

## License

- Code: [Apache License 2.0](LICENSE)
- Documentation: [CC BY 4.0](LICENSE-docs)
- Contributions require a [Developer Certificate of Origin](DCO.txt) sign-off — no CLA.

## Naming conventions

- Repository/slug: `chorus`
- Domain placeholder: `chorus.dev`
- npm scope: `@chorus/*`
- Container image prefix: `chorus-*`
- Identity namespaces: `did:chorus` (Option B) / `did:plc` with Chorus service context (Option A)
