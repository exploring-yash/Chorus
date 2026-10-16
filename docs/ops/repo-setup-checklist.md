---
id: docs.ops.repo-setup-checklist
title: "Repository Setup Checklist (GitHub)"
class: runbook
owner_agent: Conductor
authoring_agents: [Conductor, SREEng]
reviewing_agents: [Verifier]
human_signoff: null
version: 0.1.0
status: accepted
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.adr.0006, docs.agents.P0-TODO-LEDGER]
citations:
  - url: https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets
    quote: "Rulesets apply to the branches you target; a ruleset with no targets is not enforced."
signature: unsigned (pending key setup)
---

# Repository Setup Checklist (GitHub)

Live repo: https://github.com/exploring-yash/Chorus

## Status

| Step | Status |
| --- | --- |
| Repo published, public | done |
| Scaffold pushed to `main` | done (force-push over auto-generated stub) |
| Ruleset `branch-rules` created | done — **but not applied (targets nothing)** — fix below |
| `MAINTAINERS.md` filled | done (`exploring-yash`) |
| Labels created | todo — run `tools/gh-labels.sh` |
| Good-first-issues posted | todo — drafts in `docs/issues/` |
| Trademark check ("Chorus") | todo — see ADR-0005 |

## 1. Fix the ruleset (it currently targets nothing)

The warning "This ruleset does not target any resources and will not be
applied" means it has no branch target. Fix:

1. Repo → **Settings → Rules → Rulesets** → open `branch-rules`.
2. Under **Target branches** → **Add target** → select **Default branch**
   (or enter `main` in the include pattern).
3. Set **Enforcement status** → **Active**.
4. Under **Rules**, enable:
   - **Restrict deletions** ✔
   - **Block force pushes** ✔
   - **Require a pull request before merging** → required approvals: **1**.
   - **Require status checks to pass** → add the `ci.yml` jobs
     (`commitlint`, `markdownlint`, `yamllint`, `dco`, `license`,
     `docs-frontmatter`, `links`) — these appear here only **after the
     workflow has run once**, so push first, come back, then tick them.
5. **Save changes.** Verify the ruleset page no longer shows the
   "will not be applied" warning.

## 2. Commit-signing policy (decided: DCO only for now)

- DCO sign-off is enforced by CI (`tools/check-dco.sh`), not by GitHub.
- "Require signed commits" stays **off** — cryptographic signatures would
  raise the bar for first-time contributors. Revisit when the Maintainer
  Council forms (ADR required to change it).

## 3. Labels (one-time)

```bash
gh auth login            # if not already authenticated
bash tools/gh-labels.sh
```

## 4. Post first-good-first-issues

Drafts live in `docs/issues/` (strip the YAML frontmatter when pasting).
Post them with the `good first issue` label, then remove the label URL from
`.lycheeignore` (it 404s only until the label exists).

## 5. Repo polish

- [ ] Repository description + topics: `federation`, `activitypub`,
      `video`, `decentralization`, `p2p`, `typescript`.
- [ ] Enable **Discussions** (design + Q&A venue per CONTRIBUTING.md).
- [ ] Enable **Private vulnerability reporting** (Security tab) — matches
      SECURITY.md.
- [ ] Add `good first issue` / `help wanted` labels via the script above.
- [ ] Confirm CI is green on `main` after first push; fix any gate failures
      in the same PR that introduced them.

## 6. Trademark

- [ ] Check "Chorus" in relevant classes (media software, hosting services)
      before public launch marketing. Record the outcome in ADR-0005.
