---
id: security
title: "Chorus Security Policy"
class: security
owner_agent: SecEng
authoring_agents: [SecEng]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0006]
citations: []
signature: unsigned (pending key setup)
---

# Chorus Security Policy

## Scope

- The Chorus protocol specification (`protocol/`) — design flaws, signature
  forgery, DID resolution attacks, federation abuse.
- Reference services and clients under `services/` and `clients/` once they
  contain code.
- The CI/build pipeline and the `tools/` scripts.

Not in scope: third-party instances, third-party clients, and dependencies
(those report upstream; we track them in `skills/registry.yaml`).

## Report a vulnerability

**Do not open a public issue.** Use GitHub Security Advisories
(**Security → Report a vulnerability**) once the repository is published; until
then, contact the bootstrap maintainer privately (see [MAINTAINERS.md](MAINTAINERS.md)).

Include:

1. Affected component and version/commit.
2. Steps to reproduce (or a minimal test case).
3. Impact and any mitigation you've already applied.

## What you can expect

| Step | Commitment |
| --- | --- |
| Acknowledgment | Within 3 working days |
| Triage | Within 7 working days |
| Fix or coordinated disclosure plan | Within 90 days (default) |
| Credit | In the advisory, unless you ask otherwise |

We practice **coordinated disclosure** with a 90-day default deadline, and we
will not threaten reporters. Good-faith security research is welcome and
protected by the Code of Conduct.

## Severity guidance

| Severity | Examples | Response |
| --- | --- | --- |
| Critical | Signature forgery, key theft, arbitrary video/content injection at scale | Emergency fix, hotfix label (2 maintainer approvals), advisory + CVE if applicable |
| High | Amplification bypass, identity takeover without key compromise | Fix within 30 days |
| Medium | DoS on one instance, metadata leaks | Next release |
| Low | Hardening, unclear docs | Tracked issue |

## Security principles for contributors

1. All identities and artifacts are **cryptographically signed**; never merge code that treats signatures as optional.
2. **No secrets in the repo** — CI secret scanning blocks merges; report leaks privately, don't open PRs about them.
3. Keys (agent, maintainer) rotate per phase gate and on suspected compromise, recorded as ADRs.
4. Threat models live in `docs/security/` and are updated with every service-boundary change.

## Reporting a compromise

If you believe an account, key, or the repository itself is compromised,
contact maintainers privately **and** open a blank private security advisory.
We will rotate keys, publish a blameless postmortem within 5 days, and disclose
impact honestly.
