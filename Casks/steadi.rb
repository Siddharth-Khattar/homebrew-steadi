# ABOUTME: Template for Homebrew cask definition, rendered by CI with version and SHA values.
# ABOUTME: Placeholders (0.1.0, 6d110cf444cb4a42333475a2e655182f93bb2eae70efe73e87c2de37eb7d06fe, a84dfe32397184eae802532afcd5cf3c966e1d315fa65b1376dd238eddb24add) are replaced via sed.

cask "steadi" do
  version "0.1.0"

  on_arm do
    sha256 "6d110cf444cb4a42333475a2e655182f93bb2eae70efe73e87c2de37eb7d06fe"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "a84dfe32397184eae802532afcd5cf3c966e1d315fa65b1376dd238eddb24add"
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
