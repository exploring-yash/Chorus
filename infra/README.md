# Infrastructure

Deployment, SLOs, cost model, and observability. Empty during P0; first
artifact lands with P1 (the CI/CD environment for the identity service).

Planned contents:

- `deploy/` — IaC for instances (target: boring, portable, single-binary- or
  container-friendly services)
- `slo/` — SLO definitions (p95 delivery < 5s across relays, etc.)
- `cost/` — cost-per-video-minute and cost-per-active-user tooling
- `observability/` — OpenTelemetry configs

Runbook stub conventions: see docs/runbooks/README.md.
