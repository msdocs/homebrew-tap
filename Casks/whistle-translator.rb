cask "whistle-translator" do
  version "0.4.0"
  sha256 "29202f0e1254474599de60d56bef24c95e06e42dc5b6c3b76b4491a5db070918"

  url "https://mahmoud.sh/whistle-translator/downloads/Whistle-Translator-#{version}.dmg"
  name "Whistle Translator"
  desc "Offline speech-to-text, translation and dictation"
  homepage "https://mahmoud.sh/whistle-translator/"

  livecheck do
    url :homepage
    regex(/Whistle[._-]Translator[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Whistle Translator.app"

  zap trash: [
    "~/Library/Application Support/com.msdocs.whistletranslator",
    "~/Library/Caches/com.msdocs.whistletranslator",
    "~/Library/WebKit/com.msdocs.whistletranslator",
  ]

  caveats <<~EOS
    Whistle Translator is not notarized by Apple yet. The first time you open it,
    macOS blocks it: open System Settings → Privacy & Security and click "Open Anyway".

    To dictate into other apps, allow it in
    System Settings → Privacy & Security → Accessibility.
  EOS
end
