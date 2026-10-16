---
id: docs.spec.services.video-pipeline
title: "Video Pipeline Spec"
class: spec
owner_agent: VideoLead
authoring_agents: [VideoLead, TranscodeEng, CASEng, DeliveryEng]
reviewing_agents: [Verifier, SREEng]
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.spec.protocol]
citations: []
signature: unsigned (pending key setup)
---

# Video Pipeline Spec — draft

## Scope

Ingest → transcode → content-addressed storage → delivery. This service is
where the money lives: storage and egress dominate cost, so the design is
CAS + P2P hybrid, not optional.

## Flow

```text
Upload → Ingest API → Transcode farm → CAS → Manifest (signed) → Announce
```

## Components

- **Ingest API** — resumable, chunked (5 MB), SHA-256 per chunk, signed upload intents.
- **Transcode farm** — queue-driven workers; codec ladder: H.264 (reach floor) / VP9 (efficiency) / AV1 (premium, optional); CMAF/fMP4, 2s segments, IDR-aligned.
- **CAS** — content-addressed store (S3-compatible); dedup across users; tiering: hot SSD/edge, warm HDD, cold archival.
- **Manifest** — signed JSON: renditions, thumbnails, captions, chapters, mentions (DIDs of subjects → right-of-reply eligibility).
- **Delivery** — CDN for hot content; P2P assist (WebRTC/WebTorrent) for warm content; client picks by latency/cost/privacy.

## Cost model (P2 deliverable)

Track cost per video-minute and per active user; P2P participation earns
bandwidth credits. Long-tail content remains CDN-only — P2P only works with
concurrent viewers.

## Open questions

1. Lazy vs. eager transcoding for low-view uploads (cost decision).
2. AV1 hardware-encode availability on spot instances.
3. Manifest size limits; chapter/caption schema.
4. Signed URL expiry and cache-busting vs. CDN keying strategy.
