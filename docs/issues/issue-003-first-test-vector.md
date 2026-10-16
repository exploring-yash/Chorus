---
id: docs.issues.003
title: "First protocol test vector: canonicalization decision + video manifest"
class: issue
labels: ["good first issue", "phase:P0", "spec", "pod:1", "needs-adr"]
owner_agent: null
authoring_agents: [Conductor]
reviewing_agents: []
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

# Title: First protocol test vector — canonicalization decision + video manifest

## Summary

The protocol skeleton (`docs/spec/protocol.md` §2) defines a `SignedObject`
but leaves canonicalization open (open question 1: JCS vs CBOR). This issue
decides it and produces the first test vector.

## Why this matters

Every implementation will verify against test vectors. The first vector pins
the canonicalization, which decides how signatures interoperate forever. It
must be right, and it must be adversarial.

## Task

1. Read `docs/spec/protocol.md` and `protocol/test-vectors/README.md`.
2. Evaluate canonicalization options with citations:
   - **JCS** (RFC 8785): JSON-friendly, human-debuggable, but sorting rules
     matter.
   - **CBOR** (RFC 8949, CTAP2-style deterministic): compact, but opaque to
     JSON tooling.
   - Recommendation: JCS unless the size argument wins — justify either way.
3. Write `docs/adr/ADR-0007-canonicalization.md` (context, decision,
   consequences, rejected alternatives).
4. Create `protocol/test-vectors/video-manifest-0001/` with:
   - `keypair.json` (test keypair, clearly non-production)
   - `object.json` (a minimal signed Video manifest)
   - `expected.json` (expected id + signature + verification result)
   - `negative-cases.json` (tampered payload, wrong key, broken `prev` chain)
5. Verify the vector in at least two independent snippets (any language).

## Acceptance criteria

- [ ] ADR-0007 accepted (lazy consensus, 72h).
- [ ] Vector verifies in two independent implementations.
- [ ] Negative cases fail as expected.
- [ ] SecEng + Verifier co-sign.

## Pointers

- ADR format: `docs/adr/ADR-0001-speech-hosting-amplification-separation.md`.
- The decision is protocol-class per GOVERNANCE.md §3 — expect deeper review.
- DCO sign-off required: `CONTRIBUTING.md`.

## Mentorship

The bootstrap maintainer and (at kickoff) ProtoLead review this. This is the
most consequential `good first issue` in P0 — take your time, ask anything.
