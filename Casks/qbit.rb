cask "qbit" do
  version "0.2.30"

  on_arm do
    sha256 "2f4e6671f426fb8f5a99de25f80668fc5fd27f34f12da4c80ffacbb3b81dbc67"
    url "https://github.com/qbit-ai/qbit/releases/download/v#{version}/qbit_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "7f5138c9253d39a88f50cb0f9271f8bae0afce2b503127c1eb3944dcca70bbc8"
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
