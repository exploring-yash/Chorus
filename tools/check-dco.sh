#!/usr/bin/env bash
# Chorus CI gate: DCO sign-off.
# Every commit in the checked range must carry a Signed-off-by trailer.
# Works in GitHub Actions (PR or push); local runs pass a range explicitly,
# e.g.: bash tools/check-dco.sh origin/main..HEAD
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

RANGE="${1:-}"

if [ -z "$RANGE" ]; then
  if [ -n "${GITHUB_BASE_REF:-}" ]; then
    RANGE="origin/${GITHUB_BASE_REF}..HEAD"
  elif [ -n "${GITHUB_EVENT_BEFORE:-}" ] && git cat-file -e "${GITHUB_EVENT_BEFORE}^{commit}" 2>/dev/null; then
    RANGE="${GITHUB_EVENT_BEFORE}..HEAD"
  else
    echo "SKIP: cannot determine commit range (bootstrap or local single-commit repo)"
    exit 0
  fi
fi

status=0
commits="$(git rev-list "$RANGE" 2>/dev/null || true)"
if [ -z "$commits" ]; then
  echo "SKIP: no commits in range $RANGE"
  exit 0
fi

while IFS= read -r commit; do
  if ! git log -1 --format=%B "$commit" | grep -qi "^Signed-off-by:"; then
    echo "FAIL $commit: missing Signed-off-by trailer"
    status=1
  fi
done <<<"$commits"

if [ "$status" -eq 0 ]; then
  echo "PASS: all commits in range carry DCO sign-off"
fi
exit "$status"
