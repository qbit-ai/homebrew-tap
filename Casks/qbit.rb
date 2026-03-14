cask "qbit" do
  version "0.2.43"

  on_arm do
    sha256 "c429f1094b96ddef4e2c9bf7d46d6eac955021c445394188a69f65dc9afaf7d9"
    url "https://github.com/qbit-ai/qbit/releases/download/v#{version}/qbit_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "14e1a3a88f557eb05f10b0fe87f52e15ac083980f3471368724076c529f97561"
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
