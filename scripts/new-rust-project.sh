#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <binary-name> <description> [--private]"
  echo ""
  echo "  binary-name   Name of the binary (e.g. mytool)"
  echo "  description   Short description for the Homebrew formula"
  echo "  --private     Create a private repo (default: public)"
  echo ""
  echo "Requires: HOMEBREW_TAP_TOKEN env var to auto-set the secret"
  exit 1
fi

BINARY_NAME="$1"
DESCRIPTION="$2"
VISIBILITY="${3:---public}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATES_DIR="${SCRIPT_DIR}/templates"
GITHUB_USER=$(gh api user --jq '.login')
REPO="${GITHUB_USER}/${BINARY_NAME}"

echo "==> Creating repo ${REPO}..."
gh repo create "${BINARY_NAME}" "${VISIBILITY}" --clone
cd "${BINARY_NAME}"

echo "==> Initializing Cargo project..."
cargo init --name "${BINARY_NAME}"

echo "==> Setting up GitHub Actions workflows..."
mkdir -p .github/workflows
cp "${TEMPLATES_DIR}/cargo-release.yml" .github/workflows/cargo-release.yml
cp "${TEMPLATES_DIR}/Makefile" Makefile

cat > .github/workflows/release.yml << EOF
name: Release

on:
  push:
    tags:
      - 'v*'

permissions:
  contents: write

jobs:
  release:
    uses: ${GITHUB_USER}/homebrew-tap/.github/workflows/release.yml@main
    with:
      binary_name: ${BINARY_NAME}
      description: "${DESCRIPTION}"
    secrets:
      HOMEBREW_TAP_TOKEN: \${{ secrets.HOMEBREW_TAP_TOKEN }}
EOF

if [ -n "${HOMEBREW_TAP_TOKEN:-}" ]; then
  echo "==> Setting HOMEBREW_TAP_TOKEN secret..."
  gh secret set HOMEBREW_TAP_TOKEN --body "${HOMEBREW_TAP_TOKEN}" --repo "${REPO}"
else
  echo ""
  echo "  HOMEBREW_TAP_TOKEN not set in environment."
  echo "  Set it manually after setup:"
  echo "    gh secret set HOMEBREW_TAP_TOKEN --repo ${REPO}"
  echo ""
fi

echo "==> Creating initial commit..."
git add .
git commit -m "Initial commit"
git push

echo ""
echo "Done! ${BINARY_NAME} is ready at https://github.com/${REPO}"
echo ""
echo "Next steps:"
echo "  1. Write your code in src/main.rs"
echo "  2. make build / make test / make run"
echo "  3. When ready to release: make release-patch"
