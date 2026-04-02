# Grip OS Releases — Claude Code Rules

## Repo Purpose

Public-facing release distribution for Grip OS. Contains **no source code** —
only release artifacts (DMGs, signed ZIPs), Sparkle appcast, and publish tooling.

This repo is **PUBLIC** on GitHub. Everything committed here is world-readable.

## Key Rules

1. **Never commit source code, secrets, API keys, or internal paths** — this is a public repo
2. **Never reference private repo URLs** in README, appcast, or release notes
3. Sparkle `edSignature` values are safe to commit (they verify integrity, not secrets)
4. Download URLs must point to `nelsojona/gripos-releases` GitHub Releases, not private repos
5. Appcast `<link>` must point to `https://raw.githubusercontent.com/nelsojona/gripos-releases/main/appcast.xml`

## Structure

```
README.md                     — Public-facing download instructions
appcast.xml                   — Sparkle auto-update feed
scripts/publish-release.sh    — Release automation (creates GitHub Release + uploads artifacts)
```

## Release Workflow

```bash
# 1. Build + notarize DMG in gripos-station (private)
cd ~/Development/Personal/gripos-station
./scripts/build.sh
./scripts/notarize.sh

# 2. Publish to this repo
cd ~/Development/Personal/gripos-releases
./scripts/publish-release.sh <version> <path-to-dmg> [path-to-zip]

# 3. Update appcast.xml with new entry
# 4. Commit and push appcast.xml
```

## Git

- **Push target:** `origin main` (nelsojona/gripos-releases — PUBLIC)
- **Commit email:** `5314369+nelsojona@users.noreply.github.com`
- **Signing:** Woven Retail Inc (RRPVP8ZFB4)
