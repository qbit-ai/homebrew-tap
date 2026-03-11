cask "qbit" do
  version "0.2.42"

  on_arm do
    sha256 "3e0f00f4ecd409c7416bcaf7405ccdedfa223dc0a5d19cc96da61466163c05de"
    url "https://github.com/qbit-ai/qbit/releases/download/v#{version}/qbit_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "71534bc36eb2de3d3b4eff95aa271b5da817805454a44c9c6d0fd17ecaba1097"
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
