# Grip OS Releases

Official release artifacts for [Grip OS](https://gripos.dev) — the free, MIT-licensed AI command center for macOS.

## Download

**Latest:** [Grip Station v2026.4.1](https://github.com/nelsojona/gripos-releases/releases/latest)

| Product | Status | License |
|---------|--------|---------|
| Grip Station | Available | MIT |
| Grip Tray | Coming 2026 | MIT |
| Grip Sentinel | Available | MIT |
| Grip Kernel | Coming 2026 | MIT |
| Grip Mail | Coming 2026 | Paid add-on |

## Sparkle Updates

The Sparkle appcast feed for automatic updates is hosted at:

```
https://raw.githubusercontent.com/nelsojona/gripos-releases/main/appcast.xml
```

## Requirements

- macOS 15.0+ (Sequoia)
- Apple Silicon (arm64)
- Bring your own API keys (Anthropic, OpenAI, Google, xAI, Mistral, Ollama, MLX)

## Verify Downloads

All DMGs are notarized by Apple and signed by **Woven Retail Inc (RRPVP8ZFB4)**.

```bash
# Verify notarization
spctl --assess --type open --context context:primary-signature "Grip Station.app"

# Verify code signature
codesign --verify --deep --strict "Grip Station.app"
```

## Links

- [Website](https://gripos.dev)
- [Download](https://gripos.dev/download)
- [Privacy Policy](https://gripos.dev/privacy)
- [Terms of Service](https://gripos.dev/terms)
