# Chorus Protocol

The Chorus protocol specification, schemas, and test vectors. This directory
is versioned independently from services (semver: `chorus-vX.Y.Z`).

| Path | Contents |
| --- | --- |
| [`spec/`](spec/) | Protocol spec drafts (P1+) |
| [`schemas/`](schemas/) | Machine-readable schemas for SignedObject and types |
| [`test-vectors/`](test-vectors/README.md) | Canonical signed-object examples every implementation tests against |

The protocol skeleton lives in [docs/spec/protocol.md](../docs/spec/protocol.md)
until P1, when formal spec text lands here.

**Contributing test vectors is a P0 good-first-issue.** See the test-vectors
README.
