---
id: docs.adr.0004
title: "Apache-2.0 code + CC-BY-4.0 docs + DCO, no CLA"
class: adr
owner_agent: Conductor
authoring_agents: [Conductor, LegalEng]
reviewing_agents: [Verifier]
human_signoff: null
version: 1.0.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0006]
citations:
  - url: https://www.apache.org/licenses/LICENSE-2.0
    quote: "Apache License 2.0 grants patent rights and allows sublicensing."
  - url: https://developercertificate.org/
    quote: "Developer Certificate of Origin version 1.1."
signature: unsigned (pending key setup)
---

# ADR-0004: Apache-2.0 code + CC-BY-4.0 docs + DCO, no CLA

## Context

License choice is the single biggest contribution-friendliness lever for an
open-source protocol. The alternatives trade adoption against protection from
proprietary capture.

## Decision

- **Code: Apache License 2.0** — permissive, patent-granting, compatible with
  the ecosystems we interoperate with (ActivityPub, AT Protocol tooling).
- **Documentation: CC BY 4.0** — shareable and remixable with attribution.
- **Contributions: DCO 1.1 sign-off, no CLA.** Provenance is certified per
  commit; contributors keep their rights and sign nothing beyond the DCO.
- This decision may be revisited by ADR if the funding model (co-op) or
  capture risk changes.

## Consequences

- Lowest friction for individual volunteers, instances, and corporate
  contributors; DCO is enforceable in CI (`tools/check-dco.sh`).
- Apache-2.0 does not stop a third party from running a proprietary Chorus
  instance or client. Accepted: the value is in the protocol, federation, and
  portability, not in lock-in.

## Rejected alternatives

- **AGPL-3.0 + CC-BY-SA** — strongest copyleft, but deters corporate
  contributors and complicates P2P/CDN integration; can be reintroduced for
  specific services later.
- **MIT + CC0** — maximally permissive but no patent grant and weak
  documentation protection.
- **CLA** — adds legal friction for every contributor and a corporate
  bottleneck; rejected in favor of DCO.
