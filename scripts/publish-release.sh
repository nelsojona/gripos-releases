#!/usr/bin/env bash
set -euo pipefail

# publish-release.sh — Create a GitHub Release on gripos-releases with DMG + ZIP artifacts.
#
# Usage:
#   ./scripts/publish-release.sh <version> <dmg-path> [zip-path]
#
# Example:
#   ./scripts/publish-release.sh 2026.4.2 ~/Desktop/GripOS-2026.4.2.dmg ~/Desktop/GripStation-2026.4.2.zip
#
# The script:
#   1. Creates a GitHub Release tag (v<version>)
#   2. Uploads the DMG (and optional ZIP for Sparkle) as release assets
#   3. Reminds you to update appcast.xml for Sparkle

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VERSION="${1:?"Usage: $0 <version> <dmg-path> [zip-path]"}"
DMG_PATH="${2:?"Usage: $0 <version> <dmg-path> [zip-path]"}"
ZIP_PATH="${3:-}"

TAG="v${VERSION}"

if [[ ! -f "$DMG_PATH" ]]; then
  echo "DMG not found: $DMG_PATH" >&2
  exit 1
fi

if [[ -n "$ZIP_PATH" && ! -f "$ZIP_PATH" ]]; then
  echo "ZIP not found: $ZIP_PATH" >&2
  exit 1
fi

echo "Creating release $TAG on nelsojona/gripos-releases..."

# Build asset list
ASSETS=("$DMG_PATH")
if [[ -n "$ZIP_PATH" ]]; then
  ASSETS+=("$ZIP_PATH")
fi

# Create the release with assets
gh release create "$TAG" \
  --repo nelsojona/gripos-releases \
  --title "Grip Station $VERSION" \
  --notes "$(cat <<EOF
## Grip Station $VERSION

Download the DMG below and drag Grip Station to your Applications folder.

**Requirements:** macOS 15.0+ (Sequoia), Apple Silicon

**Signed by:** Woven Retail Inc (RRPVP8ZFB4)

See [gripos.dev](https://gripos.dev) for documentation.
EOF
)" \
  "${ASSETS[@]}"

echo ""
echo "Release $TAG created successfully."
echo "Download URL: https://github.com/nelsojona/gripos-releases/releases/download/$TAG/$(basename "$DMG_PATH")"
echo ""
echo "NEXT STEPS:"
echo "  1. Update appcast.xml with the new release entry"
echo "  2. Run: cd $ROOT && git add appcast.xml && git commit -m 'chore: update appcast for $VERSION' && git push"
echo "  3. Update gripos-station SUFeedURL to point to gripos-releases appcast (if not already done)"
