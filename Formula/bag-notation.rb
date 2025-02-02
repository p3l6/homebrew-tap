class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2aff0851b06d3ecb23f1a1f827dd18b98a9ebbdac96067d4c91cb04b79287a3a"
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
