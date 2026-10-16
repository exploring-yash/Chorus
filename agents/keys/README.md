# Agent Public Keys

One `.pub` file per agent (Ed25519), plus a `humans/` subdirectory for human
maintainer keys once provisioned.

**Rules**

- Private keys (`*.key`, `*.pem`) are gitignored and must never be committed.
- Each key registration is a PR reviewed by SecEng and the Verifier.
- Key rotation = phase gate event, recorded as an ADR.
- `git verify-commit` must succeed for every agent commit (CI `sign check`).

Currently empty: keys are provisioned at the first agent kickoff
(orchestration prompt §12).
