# Migration Guides

One guide per breaking protocol/schema change: `docs/migrations/<version>.md`.

Rules (orchestration prompt §14.8):

- A migration guide is written **before** the breaking change merges.
- Deprecation window ≥ 2 minor versions.
- Announced in CHANGELOG and the instance-operator mailing list.
- Written by ProtoLead + Scribe; reviewed by SREEng (operators are the
  audience).

Empty during P0 — the first migration will be the Option A → B data-model
transition (P3).
