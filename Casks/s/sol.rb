cask "sol" do
  version "2.1.170"
  sha256 "93076f285440310d344473067233a2640371e583b093a4ec5faf397b7e6a8185"

  url "https://github.com/ospfranco/sol/releases/download/#{version}/#{version}.zip"
  name "Sol"
  desc "Launcher & command palette"
  homepage "https://github.com/ospfranco/sol"

  livecheck do
    url "https://raw.githubusercontent.com/ospfranco/sol/main/releases/appcast.xml"
    strategy :sparkle, &:short_version
  end

  depends_on macos: ">= :big_sur"

  app "Sol.app"

  uninstall launchctl: "com.ospfranco.sol-LaunchAtLoginHelper",
            quit:      "com.ospfranco.sol"

  zap trash: [
    "~/Library/Application Scripts/com.ospfranco.sol-LaunchAtLoginHelper",
    "~/Library/Application Support/com.ospfranco.sol",
    "~/Library/Containers/com.ospfranco.sol-LaunchAtLoginHelper",
    "~/Library/HTTPStorages/com.ospfranco.sol",
    "~/Library/Preferences/com.ospfranco.sol.plist",
  ]
end
