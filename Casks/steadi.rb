# ABOUTME: Homebrew cask definition for Steadi, a teleprompter app for macOS.
# ABOUTME: Strips quarantine attribute on install to bypass Gatekeeper for unsigned builds.

cask "steadi" do
  version "0.1.0"

  on_arm do
    sha256 "9ac4449081cc68d292d20be052b966c507d333b77d9dd0f26b5fe26cce6df9ec"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "19ec15c438bdfa0ed7d3444de9447984c3ccbfd3b2e446794fd5ced5f4d256e1"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_x64.dmg"
  end

  name "Steadi"
  desc "Teleprompter app"
  homepage "https://github.com/Siddharth-Khattar/Steadi"

  livecheck do
    url "https://github.com/Siddharth-Khattar/Steadi/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Steadi.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Steadi.app"],
                   sudo: false
  end
end
