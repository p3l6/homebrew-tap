class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5a85e9372d6819769668fcfa43aa1087d1e4cf7fffe8ac0533924d2e7a7cb0b6"
  license "MIT"

  uses_from_macos "swift" => [:build, :test]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/bag"
  end

  test do
    system bin/"bag", "--help"
  end
end
