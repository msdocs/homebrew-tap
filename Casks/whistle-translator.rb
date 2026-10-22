cask "whistle-translator" do
  version "0.3.0"
  sha256 "58376e1d8900cd3871eb149f4f67060400001f4901536f21e3f2b4c83198b13b"

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
