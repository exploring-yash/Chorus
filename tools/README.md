# Repo Tooling

Helper scripts wired into the CI gate set (`.github/workflows/ci.yml`).

| Script | Gate | Notes |
| --- | --- | --- |
| `check-docs-frontmatter.sh` | docs frontmatter | Required fields: id, title, class, status, signature. Exempts indexes and `docs/agents/`. |
| `check-license-headers.sh` | license presence | Verifies LICENSE/LICENSE-docs; SPDX Apache-2.0 headers on `services/`/`clients/` `.ts` files once they exist. |
| `check-dco.sh` | DCO sign-off | Range auto-detected in CI; pass `origin/main..HEAD` locally. |

## Local use

```bash
bash tools/check-docs-frontmatter.sh
bash tools/check-license-headers.sh
bash tools/check-dco.sh origin/main..HEAD
```

These scripts are intentionally dependency-free (bash + coreutils) so they
run anywhere. Improving them is a `good first issue`: better messages,
Windows support (Git Bash), and caching are all welcome.
