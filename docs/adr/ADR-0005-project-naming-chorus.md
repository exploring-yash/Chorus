---
id: docs.adr.0005
title: "Project name: Chorus"
class: adr
owner_agent: Conductor
authoring_agents: [Conductor]
reviewing_agents: [Verifier]
human_signoff: null
version: 1.0.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.protocol]
citations: []
signature: unsigned (pending key setup)
---

# ADR-0005: Project name — Chorus

## Context

The design was developed under the working title "NewTube". A canonical name
was required before publishing anything, since names infect artifacts:
repository slug, npm scope, container prefixes, DID methods, skill IDs, and
doc frontmatter.

## Decision

- **Project name: Chorus** — many voices in one work, which is the platform's
  point: broadcast kept as a right, designed so the many can answer.
- Canonical namespace mapping:
  - Repository/slug: `chorus`
  - Domain placeholder: `chorus.dev`
  - npm scope: `@chorus/*`
  - Container image prefix: `chorus-*`
  - Identity namespaces: `did:chorus` (Option B) / `did:plc` with Chorus
    service context (Option A)
- The earlier working title "NewTube" is retired everywhere; the protocol
  working name "OpenCast" is replaced by "Chorus protocol".

## Consequences

- All artifacts created from the design doc map the old names to the new ones.
- Trademark status of "Chorus" in relevant classes is unverified at this time;
  legal review is required before public launch (tracked in P0).

## Rejected alternatives

- **Keep "NewTube"** — derivative of a trademark and reads as a clone, not a
  protocol.
- **OpenCast** — generic and collides with existing projects.
