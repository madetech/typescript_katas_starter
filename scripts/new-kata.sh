#!/usr/bin/env bash
# Scaffold a kata: a solution file and a failing test, so you start red.
set -euo pipefail

name="${1:-${usage_name:-}}"
[ -n "$name" ] || { echo "usage: mise run new <kata-name>" >&2; exit 1; }

slug=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-*//;s/-*$//')
camel=$(printf '%s' "$slug" | awk -F- '{for (i=1;i<=NF;i++) printf (i==1 ? $i : toupper(substr($i,1,1)) substr($i,2))}')

solution="app/${slug}.ts"
test="tests/${slug}.spec.ts"

for f in "$solution" "$test"; do
  [ -e "$f" ] && { echo "$f already exists" >&2; exit 1; }
done

cat > "$solution" <<EOF
export const ${camel} = (): void => {
};
EOF

cat > "$test" <<EOF
import { ${camel} } from '@/${slug}';

describe('${camel}', () => {
  it('does the simplest useful thing', () => {
    throw new Error('Write the first test, then make it pass.');
  });
});
EOF

printf 'created %s\ncreated %s\n' "$solution" "$test"
