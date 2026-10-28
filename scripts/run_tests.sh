#!/usr/bin/env sh
set -e

echo "==> Running Auqqua Formal Reduction & Test Suite..."
cd "$(dirname "$0")/.."

if command -v lake >/dev/null 2>&1; then
    lake build
    echo "✓ Lean 4 build check passed."
else
    echo "⚠ Lake tool not found in current PATH. Skipping formal proof check."
fi

if command -v ghc >/dev/null 2>&1; then
    if [ -f "sources/AuqquaCode.hs" ]; then
        ghc -fno-code sources/AuqquaCode.hs
        echo "✓ Haskell engine syntax check passed."
    fi
else
    echo "⚠ GHC not found in current PATH. Skipping Haskell compilation check."
fi

echo "==> All validation checks completed successfully."
