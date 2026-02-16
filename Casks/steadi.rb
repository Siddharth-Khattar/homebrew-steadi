# ABOUTME: Template for Homebrew cask definition, rendered by CI with version and SHA values.
# ABOUTME: Placeholders (0.0.2, 75d52a899373474de50e2b46021cf783a561527e96590ee32d0156de36d2f276, fae027cfda709c5cd75bd2cef917934348153a2fb99eca02a1f692e57b925905) are replaced via sed.

cask "steadi" do
  version "0.0.2"

  on_arm do
    sha256 "75d52a899373474de50e2b46021cf783a561527e96590ee32d0156de36d2f276"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "fae027cfda709c5cd75bd2cef917934348153a2fb99eca02a1f692e57b925905"
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
