cask "qbit" do
  version "0.2.34"

  on_arm do
    sha256 "7a83e166754bcefba70fa38a8fd9bf5a9abae17daa411f2d039e3b209f294aba"
    url "https://github.com/qbit-ai/qbit/releases/download/v#{version}/qbit_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "61edcb3346cdeff81f1861e397e76c38e7dbc20fac8b346662b6a1c71fc47a66"
    url "https://github.com/qbit-ai/qbit/releases/download/v#{version}/qbit_#{version}_x64.dmg"
  end

  name "Qbit"
  desc "AI-powered terminal emulator"
  homepage "https://github.com/qbit-ai/qbit"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Remove quarantine attribute to prevent Gatekeeper warnings
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/qbit.app"],
                   sudo: false
  end

  app "qbit.app"

  zap trash: [
    "~/.qbit",
    "~/Library/Application Support/com.qbit.terminal",
    "~/Library/Caches/com.qbit.terminal",
    "~/Library/Preferences/com.qbit.terminal.plist",
    "~/Library/Saved Application State/com.qbit.terminal.savedState",
  ]
end
