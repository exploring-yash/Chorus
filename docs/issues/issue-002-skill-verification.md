---
id: docs.issues.002
title: "Verify the first skill: FFmpeg (template for all skill vetting)"
class: issue
labels: ["good first issue", "phase:P0", "documentation", "pod:3", "intent:contrib"]
owner_agent: null
authoring_agents: [Conductor]
reviewing_agents: []
human_signoff: null
version: 0.1.0
status: draft
created_at: 2025-01-01T00:00:00Z
updated_at: 2025-01-01T00:00:00Z
supersedes: null
superseded_by: null
related: [docs.agents.P0-TODO-LEDGER]
citations: []
signature: unsigned (pending key setup)
---

# Title: Verify the first skill — FFmpeg (template for all skill vetting)

## Summary

`skills/registry.yaml` is seeded with 18 unverified capability entries. This
issue verifies the first one — `skill.ffmpeg.transcode` — and, in doing so,
produces the reusable vetting procedure for the other 17.

## Why this matters

Agents and humans must not build on dependencies whose license or maturity
is unknown. Every verified entry is a mergeable contribution and makes the
whole registry stronger.

## Task

1. Read `skills/README.md` and the `skill.ffmpeg.transcode` entry in
   `skills/registry.yaml`.
2. Verify, with citations (URL + quote):
   - **License**: exact license of the FFmpeg build we'd use; LGPL vs GPL
     parts; whether the transcode-ladder use can stay LGPL-only.
   - **Maturity**: latest release, activity, maintainers.
   - **Security**: recent CVEs and their fix status.
3. Update the entry: set `status: verified` (or `rejected` with reasons),
   add `citations`, and record `verified_by`.
4. Write the short vetting procedure you followed into `skills/README.md`
   under "How to vet an entry" (so the other 17 entries are mechanical).

## Acceptance criteria

- [ ] Entry flipped to `verified` or `rejected`, with citations.
- [ ] A reusable vetting procedure documented in `skills/README.md`.
- [ ] PR passes all CI gates (including docs-frontmatter and citations).

## Pointers

- FFmpeg licensing: https://ffmpeg.org/legal.html
- CVE feed: https://www.cvedetails.com/vendor/3611/Ffmpeg.html
- DCO sign-off required: `CONTRIBUTING.md`.

## Mentorship

The bootstrap maintainer (`exploring-yash`) reviews the first vetting
carefully — this PR sets the standard for the whole registry, so expect
constructive back-and-forth.
