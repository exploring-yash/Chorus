# Chorus Skills Registry

Skills are reusable capability modules: upstream libraries, specs, or
patterns with a known license and maturity. Agents and humans prefer
registered skills over reinventing (see
[docs/agents/ORCHESTRATION_PROMPT.md](../docs/agents/ORCHESTRATION_PROMPT.md) §6).

## Status values

- `unverified` — seeded from the design phase; needs a Librarian vetting pass
  (license, maturity, CVEs) before use.
- `verified` — vetted, cited, and Verifier co-signed.
- `rejected` — vetted and excluded; reason recorded.

## Contributing

Each verified entry is a mergeable PR: add `citations` (URL + quote),
license analysis, and maturity evidence; change `status: verified`; list the
Verifier in `verified_by`. Flag GPL/AGPL dependencies for legal review —
they are not automatically rejected, but they must be justified.

The registry lives in [registry.yaml](registry.yaml).
