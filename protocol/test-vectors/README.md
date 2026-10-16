# Protocol Test Vectors

Canonical examples that every implementation must verify against. Currently
empty — creating the first vectors is a **P0 good-first-issue**.

## What a test vector is

A fixture containing:

1. A SignedObject (per [docs/spec/protocol.md](../../docs/spec/protocol.md) §2)
   with a fixed Ed25519 keypair,
2. the expected `id` (hash of canonicalized content),
3. the expected signature,
4. any negative cases (tampered payload, wrong key, broken `prev` chain).

## Format

One directory per vector:

```text
test-vectors/
  video-manifest-0001/
    keypair.json          # test keypair (public) — never a real key
    object.json           # the SignedObject
    expected.json         # expected id/signature/verification result
    negative-cases.json   # tampered variants and expected failures
```

## Rules

- Canonicalization must be pinned (JCS vs. CBOR — see open question 1 in the
  protocol spec) before vectors are accepted; the first vector decides it, so
  it needs an ADR.
- Vectors are code: reviewed by Verifier + SecEng, and CI runs every
  implementation against them.
