#!/usr/bin/env bash
# Chorus CI gate: docs frontmatter.
# Verifies required YAML frontmatter fields on project documentation.
# Exemptions: indexes (README.md files) and the agent build-system files.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

REQUIRED_FIELDS=(id title class status signature)

files=()
while IFS= read -r -d '' f; do
  case "$f" in
    */README.md) continue ;;
    docs/agents/*) continue ;;
    docs/INDEX.md) continue ;;
  esac
  files+=("$f")
done < <(find docs -name '*.md' -print0)
files+=(GOVERNANCE.md SECURITY.md)

status=0
for f in "${files[@]}"; do
  first_line="$(head -n 1 "$f")"
  if [ "$first_line" != "---" ]; then
    echo "FAIL $f: missing YAML frontmatter (first line must be '---')"
    status=1
    continue
  fi
  block="$(awk 'NR==1 { next } /^---$/ { exit } { print }' "$f")"
  for field in "${REQUIRED_FIELDS[@]}"; do
    if ! grep -qE "^${field}:" <<<"$block"; then
      echo "FAIL $f: missing required frontmatter field '$field'"
      status=1
    fi
  done
done

if [ "$status" -eq 0 ]; then
  echo "PASS: frontmatter present on ${#files[@]} checked files"
fi
exit "$status"
