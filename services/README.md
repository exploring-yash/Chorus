# Services

One directory per service. Empty during P0; each service lands in P1/P2 as an
npm workspace (`@chorus/<service>`).

| Service | Spec | Phase |
| --- | --- | --- |
| `identity/` | [docs/spec/services/identity.md](../docs/spec/services/identity.md) | P1 |
| `social-graph/` | [docs/spec/services/social-graph.md](../docs/spec/services/social-graph.md) | P1 |
| `federation/` (pds, relay, appview) | [docs/spec/services/federation.md](../docs/spec/services/federation.md) | P1/P4 |
| `video-pipeline/` | [docs/spec/services/video-pipeline.md](../docs/spec/services/video-pipeline.md) | P1 |
| `response/` | [docs/spec/services/response.md](../docs/spec/services/response.md) | P1 |
| `amplification/` | [docs/spec/services/amplification.md](../docs/spec/services/amplification.md) | P2 |
| `moderation/` | [docs/spec/services/moderation.md](../docs/spec/services/moderation.md) | P2 |

Stack: TypeScript/Node ≥ 20 (ADR-0003). Every service exposes a
language-neutral interface (signed HTTP + JSON/CBOR contracts); Rust is
adopted later for hot paths (relay, tracker) behind stable boundaries.
