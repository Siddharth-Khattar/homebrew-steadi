# ABOUTME: Template for Homebrew cask definition, rendered by CI with version and SHA values.
# ABOUTME: Placeholders (0.0.1, f62d035158527f828f92e1217b88b3ce88c5bd76fc788fc7b4da6a1771b672d7, ed093ef3e558c0687b3b82b89c38dedeb5840ecd8583cda3001f03e332192e1f) are replaced via sed.

cask "steadi" do
  version "0.0.1"

  on_arm do
    sha256 "f62d035158527f828f92e1217b88b3ce88c5bd76fc788fc7b4da6a1771b672d7"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "ed093ef3e558c0687b3b82b89c38dedeb5840ecd8583cda3001f03e332192e1f"
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
