# Threat Models

One threat model per service boundary: `docs/security/tm-<service>.md`,
owned by SecEng, updated with every service-boundary change, and co-reviewed
by the Verifier and LegalEng.

Empty during P0. The first threat models ship with P1, starting with:

1. `tm-identity.md` — key compromise, rotation race, notary collusion, sybil
   recovery attacks.
2. `tm-federation.md` — firehose poisoning, relay dominance, forgery,
   selective-sync denial.
3. `tm-video-pipeline.md` — content poisoning via CAS hash collision,
   transcode escapes.
4. `tm-amplification.md` — obligation gaming, tier bypass, decision forgery.

Methodology: STRIDE; findings map to SECURITY.md severities.
