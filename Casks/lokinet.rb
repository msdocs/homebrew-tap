cask "lokinet" do
  version "0.9.11"
  sha256 "a796134d3af1cfa2d3718166aede6a09155c63617ffb7de932a9c804bb3a68c7"

  url "https://github.com/oxen-io/lokinet/releases/download/v#{version}/lokinet-macOS.#{version}.dmg"
  name "Lokinet"
  desc "Anonymous, decentralised, IP-based overlay network"
  homepage "https://lokinet.org/"

  # Newer upstream releases only ship Linux binaries, so only count releases with a macOS DMG.
  livecheck do
    url "https://github.com/oxen-io/lokinet"
    regex(/lokinet[._-]macOS[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
    strategy :github_releases do |json, regex|
      json.flat_map do |release|
        next [] if release["draft"] || release["prerelease"]

        release["assets"]&.map { |asset| asset["name"][regex, 1] }
      end.compact
    end
  end

  depends_on :macos

  app "Lokinet.app"

  uninstall quit: "org.lokinet"

  caveats do
    requires_rosetta
    <<~EOS
      Lokinet uses a network system extension. The first time you start it, allow it in
      System Settings → General → Login Items & Extensions → Network Extensions.
    EOS
  end
end
