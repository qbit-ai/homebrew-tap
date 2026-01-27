cask "qbit" do
  version "0.2.13"

  on_arm do
    sha256 "187c2841d85f088dbf941a987759edc03d9632387c96866c6815c6142847b41e"
    url "https://github.com/qbit-ai/qbit/releases/download/v#{version}/qbit_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "144fb4ebfb21a2904f1677702a70057b87cb3d75758824e5ef169f2ebc70af69"
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
