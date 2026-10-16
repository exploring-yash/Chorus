#!/usr/bin/env bash
# Bootstrap Chorus GitHub labels (idempotent).
#
# Usage:
#   gh auth login                       # once
#   bash tools/gh-labels.sh             # default repo exploring-yash/Chorus
#   REPO=other/chorus bash tools/gh-labels.sh
#
# After running, remove the label URL from .lycheeignore (it 404s only until
# the labels exist).
set -euo pipefail

REPO="${REPO:-exploring-yash/Chorus}"

# name:color:description
labels=(
  # contribution friendliness
  "good first issue:5319e7:Good for newcomers; maintainer mentors"
  "help wanted:008672:Extra attention wanted"
  "triage:d4c5f9:Needs triage by a maintainer"
  "dependencies:0366d6:Pull requests that update a dependency"
  # kind
  "bug:d73a4a:Something isn't working"
  "enhancement:a2eeef:New feature or improvement"
  "documentation:0075ca:Improvements or additions to documentation"
  "spec:0e8a16:Protocol or service spec change"
  "needs-adr:b60205:Requires an Architecture Decision Record"
  "security:8b0000:Security-relevant change or report"
  "cost:fbca04:Touches storage/egress/transcode cost"
  "legal:f9d0c4:Content policy or jurisdiction questions"
  "breaking:d93f0b:Breaks protocol, schema, or API compatibility"
  # pods
  "pod:0:bfd4f2:Meta pod (Conductor, Scribe, Librarian, Verifier)"
  "pod:1:bfd4f2:Protocol & identity"
  "pod:2:bfd4f2:Federation & data"
  "pod:3:bfd4f2:Video & delivery"
  "pod:4:bfd4f2:Reciprocity & amplification"
  "pod:5:bfd4f2:Moderation & governance"
  "pod:6:bfd4f2:Client & UX"
  "pod:7:bfd4f2:Cross-cutting (security, SRE, legal, data)"
  # phases
  "phase:P0:c5def5:Foundation — specs, ADRs, skills, CI"
  "phase:P1:c5def5:Option A core (identity, graph, video, responses, client)"
  "phase:P2:c5def5:Amplification + moderation"
  "phase:P3:c5def5:Option B identity + data model"
  "phase:P4:c5def5:Option B federation + amplification"
  # priorities
  "priority:P0:fef2c0:Blocks everything else"
  "priority:P1:fef2c0:High — this phase's critical path"
  "priority:P2:fef2c0:Medium"
  "priority:P3:fef2c0:Low / nice-to-have"
  # status (mirrors the todo ledger)
  "status:backlog:e4e669:Not yet ready"
  "status:ready:e4e669:Ready to pick up"
  "status:in-progress:e4e669:Someone is working on it"
  "status:blocked:e4e669:Waiting on a dependency or decision"
  "status:review:e4e669:In Verifier review"
  "status:escalated:e4e669:Waiting on a user decision"
  # intent trace (which Chorus principle this serves)
  "intent:speech:ffffff:Separation of speech/hosting/amplification"
  "intent:identity:ffffff:Portable identity"
  "intent:reciprocity:ffffff:First-class reciprocity"
  "intent:algorithms:ffffff:Pluggable algorithms"
  "intent:deamplify:ffffff:Deamplify, don't erase"
  "intent:transparency:ffffff:Transparency"
  "intent:contrib:ffffff:Contribution friendliness"
)

count=0
for spec in "${labels[@]}"; do
  IFS=':' read -r name color desc <<<"$spec"
  if gh label view "$name" --repo "$REPO" &>/dev/null; then
    gh label edit "$name" --repo "$REPO" --color "$color" --description "$desc"
  else
    gh label create "$name" --repo "$REPO" --color "$color" --description "$desc"
  fi
  count=$((count + 1))
done

echo "Labels ensured: $count (repo: $REPO)"
