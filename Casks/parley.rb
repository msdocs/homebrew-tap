cask "parley" do
  version "0.1.0"
  sha256 "92839607a55caa82f4be4ed8cf758c31852f21065cee750b68ad4e52625518c5"

  url "https://mahmoud.sh/parley/downloads/Parley-#{version}.dmg"
  name "Parley"
  desc "Chat with open models from Kaggle, locally with MLX or on Kaggle GPUs"
  homepage "https://mahmoud.sh/parley/"

  livecheck do
    url :homepage
    regex(/Parley[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Parley.app"

  zap trash: [
    "~/Library/Application Support/com.msdocs.parley",
    "~/Library/Caches/com.msdocs.parley",
    "~/Library/WebKit/com.msdocs.parley",
  ]

  caveats <<~EOS
    Parley is not notarized by Apple yet. The first time you open it,
    macOS blocks it: open System Settings → Privacy & Security and click "Open Anyway".

    Parley runs models through kaggle-llm. Set it up once:
      git clone https://github.com/msdocs/kaggle-llm ~/kaggle-llm
      cd ~/kaggle-llm && python3 -m venv .venv && .venv/bin/pip install -r requirements.txt
    then save your Kaggle API token to ~/.kaggle/access_token.
    Details: https://mahmoud.sh/parley/#install
  EOS
end
