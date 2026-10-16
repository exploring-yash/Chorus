# Contributing to Chorus

Chorus is built to be contributed to. This file is the front door. Everything
you need to go from "I want to help" to "my first PR is merged" is here, and
every rule below exists so your time is respected and your work counts.

## Code of Conduct

All participants follow the [Contributor Covenant 2.1](CODE_OF_CONDUCT.md).
Be kind, be specific, be curious. Harassment of any kind ends contribution.

## There is no code yet — and that's a feature

Chorus is in **P0: foundation**. You can make real, merged, high-value
contributions before any production code exists:

- **Docs review** — read [`docs/spec/`](docs/spec/) and the [ADRs](docs/adr/); file issues where anything is unclear, contradictory, or unfriendly to newcomers.
- **Skill vetting** — [`skills/registry.yaml`](skills/registry.yaml) lists capability modules (libraries, specs, patterns) that need license and maturity verification. Each verified entry is a mergeable PR. See [skills/README.md](skills/README.md).
- **Spec review** — the service specs and protocol skeleton need adversarial review: edge cases, threat models, cost analysis.
- **Test vectors** — [`protocol/test-vectors/`](protocol/test-vectors/) needs canonical signed-object examples that every implementation can test against.
- **CI hardening** — the gate scripts in [`tools/`](tools/) are stubs that grow as code lands.

Look for issues labeled [`good first issue`](https://github.com/chorus-dev/chorus/labels/good%20first%20issue) (URL goes live when the repo is published).

## Ways to contribute without code

- Triage issues, reproduce reports, improve titles and labels.
- Write tutorials in [`docs/tutorials/`](docs/tutorials/) (video is the domain; beginner docs matter).
- Translate docs — public docs are English-first but structured for i18n.
- Design: accessibility audits, UX critique of the client specs.
- Spread the word to federated-video communities (PeerTube, Loops, Bluesky) — cross-community perspective is a first-class input.

## Getting started (development)

```bash
git clone https://github.com/chorus-dev/chorus.git   # URL goes live when published
cd chorus
nvm use        # Node 20 (see .nvmrc)
npm install
npm run docs:lint    # markdown lint
npm run lint:commits # commit message lint
```

All CI gates are documented in [`.github/workflows/ci.yml`](.github/workflows/ci.yml)
and run on every PR. You can run the repo-level checks locally with the scripts
in [`tools/`](tools/) before pushing.

## Legal requirements: DCO sign-off (no CLA)

Every commit must carry a Developer Certificate of Origin sign-off
(`Signed-off-by: Your Name <you@example.com>`) certifying you have the right to
submit the work under [Apache-2.0](LICENSE) (code) or [CC BY 4.0](LICENSE-docs)
(docs). Full DCO text: [DCO.txt](DCO.txt). There is no CLA — we don't ask you to
sign your rights away.

```bash
git commit -s -m "docs(spec): clarify right-of-reply precedence"
```

CI rejects commits without the sign-off (`tools/check-dco.sh`).

## Commit messages

Conventional Commits: `<type>(<scope>): <subject>`.

- `type`: feat, fix, docs, spec, refactor, perf, test, build, ci, chore, security, revert
- `scope`: identity, social-graph, pds, relay, appview, video, delivery, response, amplify, moderation, client, infra, protocol, docs, tools, repo
- `subject`: imperative, ≤ 72 chars

Example: `feat(identity): add DID resolution cache with TTL`. CI lints every
commit message.

## Branching and pull requests

- Trunk-based: short-lived branches off `main` (`feat/<scope>-<issue>`, `fix/<scope>-<issue>`).
- Rebase on latest `main` before opening a PR; no merge commits.
- One logical change per PR. If it touches a spec or contract, update the doc in the same PR (docs-freshness is enforced).
- Fill the PR template completely — the checklist is there to get you merged, not to slow you down.

### Review requirements

| Change touches | Required approvals |
| --- | --- |
| Anything | Verifier (independent review) + 1 CODEOWNER |
| Keys, crypto, auth | + Security |
| Storage/egress/transcode cost | + SRE/Data |
| Content policy, jurisdictions | + Legal |

First-time contributors: mention it in the PR — maintainers will mentor
instead of just reviewing.

## Documentation rules

Docs are first-class artifacts, updated in the same PR as the code they
describe. Docs under `docs/`, plus `GOVERNANCE.md` and `SECURITY.md`, carry
YAML frontmatter (`id`, `title`, `class`, `status`, `signature`, …). Claims
sourced from the web must carry a citation. See
[docs/agents/README.md](docs/agents/README.md) for the full protocol (it
applies to humans and agents alike).

## Skills (for humans and agents)

A **skill** is a reusable capability module: an upstream library, spec, or
pattern with a known license and maturity, registered in
[`skills/registry.yaml`](skills/registry.yaml). Prefer registered skills over
reinventing; to add one, open a PR with the vetting info
(source URL, license, maturity, integration notes) and it gets a security and
license review.

## Mentorship

- `good first issue` label = designed for newcomers, with a pointer to the right doc and a maintainer who has committed to answering questions.
- Ask in the issue itself. There are no stupid questions; there is only an unhelpful spec, and we want to fix that too.
- The agent build system ([docs/agents/](docs/agents/)) is open: if you want to understand how the project is orchestrated, it's all public.

## Communication

- Issues and PRs: primary venue.
- GitHub Discussions (enabled at publish) for design and Q&A.
- `chorus.dev` and the co-op/fediverse presence come with P1; until then, everything happens in the repo.

## CI gates (every PR)

commitlint · markdownlint · yamllint · secret scan (gitleaks) · license
presence · DCO sign-off · docs frontmatter · link check · (build/test jobs
activate when `services/` code lands).

---

*This file follows the same rules it describes. If you find it unclear, that's
a bug: open a PR fixing it.*
