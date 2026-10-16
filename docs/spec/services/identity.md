---
id: docs.spec.services.identity
title: "Identity Service Spec"
class: spec
owner_agent: IdentityEng
authoring_agents: [IdentityEng, ProtoLead]
reviewing_agents: [Verifier, SecEng]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.protocol, docs.adr.0002]
citations: []
signature: unsigned (pending key setup)
---

# Identity Service — draft

## Scope

DID resolution, key management, rotation, and recovery. The one service whose
failure modes are existential: identity is the thing a ban cannot erase.

## Interfaces

- `resolve(did) -> DIDDocument` (cached; TTL per rotation window)
- `rotate(did, rotationKey, newKeys) -> KeyRotation` (signed, cross-signed to key transparency log in P3+)
- `delegate(did, scope, key) -> Delegation` (e.g., editor can upload for a channel)
- `recover(did, m-of-n notary signatures) -> RecoveryRecord` (P3+)

## Design points

- Option A: `did:plc` + WebFinger `@user@instance → DID`; actors generated from DID documents.
- Option B: `did:chorus`; root/signing/rotation key hierarchy; M-of-N social recovery; no central authority.
- Signing Ed25519, encryption X25519, audited libraries only (no hand-rolled crypto).
- Key material never leaves the user's device or wallet; the service handles public material only.

## Open questions

1. Rotation replay window: how long are superseded keys honored for verification?
2. Recovery UX without a central authority (what does a non-technical user do?).
3. Delegation revocation semantics.
4. DID document size budget and fetch fan-out.

## Threat model

See `docs/security/` (P1): key compromise, rotation race, notary collusion,
sybil attacks on recovery.
