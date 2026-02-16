# ABOUTME: Template for Homebrew cask definition, rendered by CI with version and SHA values.
# ABOUTME: Placeholders (0.0.3, 7f97925ee3e045c5b3433ee50760b1df98585c8d1745dbf90e3429aa5ef6c853, 4410f467af294081d7c46ead1220c1810a36416839108f44fabf4924755ee86e) are replaced via sed.

cask "steadi" do
  version "0.0.3"

  on_arm do
    sha256 "7f97925ee3e045c5b3433ee50760b1df98585c8d1745dbf90e3429aa5ef6c853"
    url "https://github.com/Siddharth-Khattar/Steadi/releases/download/v#{version}/Steadi_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "4410f467af294081d7c46ead1220c1810a36416839108f44fabf4924755ee86e"
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
