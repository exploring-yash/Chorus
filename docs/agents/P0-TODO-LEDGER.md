# Chorus P0 Todo Ledger — seed

Seeded by Conductor at repo bootstrap. Refine, assign owners, and mark tasks
`ready` at kickoff (orchestration prompt §12). Schema per orchestration prompt
§7; statuses: backlog | ready | in_progress | blocked | review | done |
escalated.

```yaml
ledger:
  phase: P0
  updated_at: 2025-01-01T00:00:00Z
  tasks:
    # ── Pod 0: meta ─────────────────────────────────────────────────────────
    - id: T-repo-001
      title: "Bootstrap repository scaffold (licenses, governance, CI, ADRs)"
      owner: Conductor
      pod: 0
      phase: P0
      priority: P0
      status: done
      tools_required: [write_file, git_ops]
      skills_required: []
      verification_criteria: ["CI gates pass on main", "Verifier sign-off"]
      artifacts: [README.md, CONTRIBUTING.md, GOVERNANCE.md, SECURITY.md,
                  docs/adr/ADR-0001..0006, .github/workflows/ci.yml]
      created_by: Conductor

    - id: T-repo-002
      title: "Point all references at the live repo and fill bootstrap maintainer"
      owner: Conductor
      pod: 0
      phase: P0
      priority: P0
      status: done
      tools_required: [git_ops, fetch_url]
      skills_required: []
      verification_criteria: ["no chorus-dev references remain", "CI links resolve"]
      artifacts: [CODEOWNERS, MAINTAINERS.md, .github/ISSUE_TEMPLATE/config.yml,
                  .lycheeignore, CONTRIBUTING.md]
      created_by: Conductor

    - id: T-repo-003
      title: "Apply ruleset targets and branch protection on GitHub (human task)"
      owner: USER
      pod: 0
      phase: P0
      priority: P0
      status: in_progress
      depends_on: [T-repo-002]
      tools_required: []
      skills_required: []
      verification_criteria: ["ruleset shows Active, no 'will not be applied' warning",
                             "ci jobs marked required after first green run"]
      artifacts: [docs/ops/repo-setup-checklist.md]
      escalation_triggers: ["UI changed since checklist was written"]
      created_by: Conductor

    - id: T-repo-004
      title: "Create labels and post good-first-issues"
      owner: USER (then Conductor)
      pod: 0
      phase: P0
      priority: P1
      status: ready
      depends_on: [T-repo-003]
      tools_required: [git_ops]
      skills_required: []
      verification_criteria: ["labels exist", "5 issues posted with good first issue label",
                             "label URL removed from .lycheeignore"]
      artifacts: [tools/gh-labels.sh, docs/issues/]
      created_by: Conductor

    # ── Pod 0: librarian ────────────────────────────────────────────────────
    - id: T-skill-001
      title: "Vet skills/registry.yaml entries (license, maturity, CVEs)"
      owner: Librarian
      pod: 0
      phase: P0
      priority: P0
      status: ready
      tools_required: [search_web, fetch_url, license_audit]
      skills_required: []
      verification_criteria: ["every entry verified or rejected with reasons",
                             "GPL/AGPL entries carry legal notes",
                             "Verifier co-sign"]
      artifacts: [skills/registry.yaml]
      created_by: Conductor

    # ── Pod 1: protocol & identity ──────────────────────────────────────────
    - id: T-proto-001
      title: "Decide SignedObject canonicalization (JCS vs CBOR) and write the ADR"
      owner: ProtoLead
      pod: 1
      phase: P0
      priority: P0
      status: ready
      depends_on: [T-skill-001]
      tools_required: [search_web, run_code]
      skills_required: [skill.did.w3c, skill.crypto.ed25519]
      verification_criteria: ["ADR accepted", "reference implementation snippet",
                             "interop-compatible with JSON tooling unless CBOR wins"]
      artifacts: [docs/adr/ADR-0007-canonicalization.md]
      created_by: Conductor

    - id: T-proto-002
      title: "Author the first protocol test vector (video manifest)"
      owner: ProtoLead
      pod: 1
      phase: P0
      priority: P1
      depends_on: [T-proto-001]
      status: backlog
      tools_required: [run_code, sign_artifact]
      skills_required: [skill.crypto.ed25519]
      verification_criteria: ["vector verifies in ≥2 independent implementations",
                             "negative cases fail as expected"]
      artifacts: [protocol/test-vectors/video-manifest-0001/]
      created_by: Conductor

    - id: T-proto-003
      title: "Threat model: identity (key compromise, rotation race, notary collusion)"
      owner: SecEng
      pod: 1
      phase: P0
      priority: P1
      status: backlog
      tools_required: [threat_model]
      skills_required: [skill.did.w3c, skill.kt.tras]
      verification_criteria: ["STRIDE complete", "findings map to SECURITY.md severities"]
      artifacts: [docs/security/tm-identity.md]
      created_by: Conductor

    # ── Pod 2: federation ───────────────────────────────────────────────────
    - id: T-fed-001
      title: "Resolve federation open questions: firehose framing, relay economics, sync interest"
      owner: FedLead
      pod: 2
      phase: P0
      priority: P1
      status: backlog
      tools_required: [search_web, fetch_url, cost_estimate]
      skills_required: [skill.activitypub.spec, skill.atproto]
      verification_criteria: ["each open question gets an ADR or a tracked decision"]
      artifacts: [docs/spec/services/federation.md, docs/adr/]
      created_by: Conductor

    # ── Pod 3: video & delivery ─────────────────────────────────────────────
    - id: T-video-001
      title: "Model transcode cost: lazy vs eager, AV1 hardware availability, CDN/P2P split"
      owner: VideoLead
      pod: 3
      phase: P0
      priority: P1
      status: backlog
      tools_required: [search_web, cost_estimate]
      skills_required: [skill.ffmpeg.transcode, skill.codec.svt-av1]
      verification_criteria: ["cost-per-video-minute model reviewed by SREEng + DataEng"]
      artifacts: [docs/spec/services/video-pipeline.md, docs/costs.md]
      created_by: Conductor

    # ── Pod 4: reciprocity & amplification ──────────────────────────────────
    - id: T-recip-001
      title: "Define right-of-reply eligibility and dispute path"
      owner: RecipLead
      pod: 4
      phase: P0
      priority: P0
      status: ready
      tools_required: [search_web]
      skills_required: [skill.notes.community]
      verification_criteria: ["eligibility rules specified with edge cases",
                             "abuse-resistant (no claim-spam)"]
      artifacts: [docs/spec/services/response.md]
      created_by: Conductor

    - id: T-amp-001
      title: "Choose amplification policy DSL (Rego vs Cedar vs purpose-built)"
      owner: AmpEng
      pod: 4
      phase: P0
      priority: P1
      status: backlog
      depends_on: [T-skill-001]
      tools_required: [run_code, policy_eval]
      skills_required: [skill.policy.opa, skill.policy.cedar]
      verification_criteria: ["DSL can express all three tiers + obligations + expiry"]
      artifacts: [docs/adr/ADR-0008-policy-dsl.md]
      created_by: Conductor

    # ── Pod 5: moderation ───────────────────────────────────────────────────
    - id: T-mod-001
      title: "Dry-run a sortition jury: composition weighting and verdict signing"
      owner: JuryEng
      pod: 5
      phase: P0
      priority: P1
      status: backlog
      tools_required: [jury_simulate]
      skills_required: [skill.moderation.sortition]
      verification_criteria: ["simulation shows cross-community weighting works",
                             "verdict format signed and public"]
      artifacts: [docs/spec/services/moderation.md]
      created_by: Conductor

    # ── Pod 6: client ───────────────────────────────────────────────────────
    - id: T-client-001
      title: "Spec the identity wallet UX for non-technical users"
      owner: UXRes
      pod: 6
      phase: P0
      priority: P1
      status: backlog
      tools_required: [search_web]
      skills_required: []
      verification_criteria: ["wallet flow tested with 5 non-technical users"]
      artifacts: [docs/spec/services/client.md]
      created_by: Conductor

    # ── Pod 7: cross-cutting ────────────────────────────────────────────────
    - id: T-legal-001
      title: "Trademark check for 'Chorus' and jurisdiction matrix draft"
      owner: LegalEng
      pod: 7
      phase: P0
      priority: P1
      status: backlog
      tools_required: [search_web, fetch_url]
      skills_required: []
      verification_criteria: ["trademark outcome recorded in ADR-0005"]
      artifacts: [docs/adr/ADR-0005-project-naming-chorus.md]
      created_by: Conductor
```

## Notes for kickoff

- `T-repo-003` and `T-repo-004` are **human tasks** (GitHub UI); Conductor
  must not block the graph on them — agents continue with `ready` tasks.
- Everything above is P0: no production code. The exit criteria: every
  interface signed off, skills vetted, CI green.
