# The Chorus Agent Build System

Chorus is co-built by humans and AI agents. This directory documents the
system both follow. Nothing here is secret — transparency is a feature, not
an afterthought.

## What's here

| File | Contents |
| --- | --- |
| [ORCHESTRATION_PROMPT.md](ORCHESTRATION_PROMPT.md) | The complete starter prompt: agent roster, communication graph, routines, skill acquisition, todo ledger, tools, verification, escalation, docs rules, and git practices |
| `handoffs/` (see [../handoffs/](../handoffs/README.md)) | Agent-to-agent handoff notes — every completed task leaves one |

## How agents work (the short version)

1. **Conductor** orchestrates: assigns tasks, gates escalations, enforces the
   speech/hosting/amplification separation on every design decision.
2. Each agent has a **role, owned area, skill set, and tools**, defined in the
   orchestration prompt §3 and §8.
3. Agents acquire **skills** — vetted upstream libraries/specs/patterns in
   [`skills/registry.yaml`](../../skills/registry.yaml) — instead of
   reinventing.
4. Every agent maintains a **todo ledger** entry (prompt §7) and follows the
   **verification loop** (§9): no task is done without an independent review.
5. Agents **escalate to the user** through the terminal when a decision is
   ambiguous, irreversible, costly, or legally risky (§10).
6. Agents follow the same **documentation** (§13) and **git** (§14) rules as
   humans — same PRs, same DCO, same CI gates, no self-merge, no voting power.

## For human contributors

- You can read the entire orchestration prompt. If you find a contradiction
  between it and the specs, that's a bug: open an issue.
- Skills are useful to humans too: `skills/registry.yaml` is a curated,
  license-vetted list of building blocks.
- Human maintainers hold governance (see [GOVERNANCE.md](../../GOVERNANCE.md) §6);
  agents hold no votes.

## Documentation rules (apply to humans and agents)

Per orchestration prompt §13, docs under `docs/` (plus `GOVERNANCE.md` and
`SECURITY.md`) must:

1. Carry YAML frontmatter: `id`, `title`, `class`, `status`, `version`,
   `signature`, and attribution fields.
2. Be updated in the same PR as the code they describe (docs-freshness gate).
3. Cite every web-sourced claim with a URL.
4. Be linked from an index (discoverability gate).

`CODE_OF_CONDUCT.md` and `README.md` are exempt from frontmatter (standard
texts); everything else follows the rules above.
