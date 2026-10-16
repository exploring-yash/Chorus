---
id: docs.spec.services.moderation
title: "Moderation & Governance Service Spec"
class: spec
owner_agent: ModLead
authoring_agents: [ModLead, JuryEng, TrustEng]
reviewing_agents: [Verifier, LegalEng]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.intent, docs.adr.0001]
citations: []
signature: unsigned (pending key setup)
---

# Moderation & Governance Service Spec — draft

## Scope

Safety at instance level (Option A) and protocol level (Option B). The
governing rule: **deamplify, don't erase.**

## Decision matrix

| Content | Action |
| --- | --- |
| Illegal (CSAM, etc.) | Remove; report to authorities |
| Legal but harmful | Deamplify, label, add friction |
| Disputed | Community notes + jury |
| False-positive moderation | Appeal pipeline with SLAs |

## Components

- **Moderation log** — every action signed and public; appealable; the log
  itself is a first-class object stream.
- **Juries** — sortition from active users, weighted for cross-community
  participation; 7 members standard, 12 for high-reach cases; appeals go to a
  second jury; verdicts signed and public.
- **Federated safety floor** — shared minimum standards across instances
  (illegal-content pipeline), with instance discretion above the floor.
- **Oversight** — independent board binds on policy, not on individual posts.

## Open questions

1. Jury scalability: sortition logistics beyond thousands of cases/month.
2. Reputation for jurors without creating a permanent elite class.
3. Jurisdiction matrix (instance operator vs. content author vs. viewer).
4. Coordination of blocklists across instances without a central authority.
