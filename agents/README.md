# Agent Identities

Public identity material for the agents that co-build Chorus (see
[docs/agents/README.md](../docs/agents/README.md) and the orchestration prompt
§14.4).

- Public keys live in [`keys/`](keys/README.md).
- **Private keys never enter this repository** — they are gitignored and
  CI-secret-scanned.
- Agent keys rotate per phase gate (ADR required).
- Agents hold no governance voting power (GOVERNANCE.md §6).

Agent roster: Conductor, Scribe, Librarian, Verifier, ProtoLead, IdentityEng,
KeyTransEng, FedLead, PDSEng, RelayEng, AppViewEng, GraphEng, VideoLead,
TranscodeEng, CASEng, DeliveryEng, P2PEng, RecipLead, ResponseEng, AmpEng,
RecommenderEng, ModLead, JuryEng, TrustEng, ClientLead, WebEng, MobileEng,
StudioEng, UXRes, SecEng, SREEng, LegalEng, DataEng.
