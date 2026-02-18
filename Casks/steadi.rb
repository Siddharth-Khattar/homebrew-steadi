# ABOUTME: Template for Homebrew cask definition, rendered by CI with version and SHA values.
# ABOUTME: Placeholders (0.0.4, ebcb98eb892d881130833e8d3588c5f107f72b3265f28b22d910cd3954df6319, ee71549bff5270b2244dad33b94e3de6d90b432911c1e4d85b5a3bbb90b8543e) are replaced via sed.

cask "steadi" do
  version "0.0.4"

  on_arm do
    sha256 "ebcb98eb892d881130833e8d3588c5f107f72b3265f28b22d910cd3954df6319"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "ee71549bff5270b2244dad33b94e3de6d90b432911c1e4d85b5a3bbb90b8543e"
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
