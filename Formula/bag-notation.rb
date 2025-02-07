class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a91b05c7fb9c7d84d3f5c05f1877e3c432cda4c88fd1dc37fecfc94768148471"
  license "MIT"

  uses_from_macos "swift" => [:build, :test]

  def install
    if OS.linux?
      system "swift", "build", "--configuration", "release", "--disable-sandbox", "--static-swift-stdlib"
    else
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
    end
    bin.install ".build/release/bag"
  end

  test do
    system bin/"bag", "--help"
  end
end
