#!/usr/bin/env bash
# Chorus CI gate: license presence.
# Verifies LICENSE and LICENSE-docs exist; once TypeScript code exists in
# services/ or clients/, every .ts file must carry an SPDX Apache-2.0 header.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

status=0

[ -f LICENSE ] || { echo "FAIL: LICENSE missing"; status=1; }
[ -f LICENSE-docs ] || { echo "FAIL: LICENSE-docs missing"; status=1; }

if find services clients -name '*.ts' -print -quit 2>/dev/null | grep -q .; then
  while IFS= read -r f; do
    if ! head -n 10 "$f" | grep -q "SPDX-License-Identifier: Apache-2.0"; then
      echo "FAIL $f: missing SPDX Apache-2.0 header"
      status=1
    fi
  done < <(find services clients -name '*.ts')
fi

if [ "$status" -eq 0 ]; then
  echo "PASS: licenses present"
fi
exit "$status"
