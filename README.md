# msdocs Homebrew tap

## Whistle Translator

Offline speech-to-text, translation and dictation for Apple Silicon Macs. See
[mahmoud.sh/whistle-translator](https://mahmoud.sh/whistle-translator/).

```bash
brew install --cask msdocs/tap/whistle-translator
```

The app isn't notarized by Apple yet, so the first time you open it, click **Open Anyway** in
System Settings → Privacy & Security.

## Lokinet

Packages the upstream [Lokinet](https://lokinet.org/) macOS app from
[oxen-io/lokinet](https://github.com/oxen-io/lokinet/releases). Upstream's last macOS build is
0.9.11 (later releases are Linux-only). It's an Intel build, so it needs Rosetta on Apple Silicon.

```bash
brew install --cask msdocs/tap/lokinet
```
