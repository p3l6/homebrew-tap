class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "f866fbe264b81a9528214631a9e519fc6af0e5a761742267f5cfbbc8d7ce001f"
  license "MIT"

  bottle do
    root_url "https://github.com/p3l6/homebrew-tap/releases/download/bag-notation-1.0.1"
    sha256 arm64_tahoe:  "183c6e4dce47dce292cbbe7a64e2d1ad8e287933dc99a4294b3012a6e9b30a46"
    sha256 x86_64_linux: "51a2a2c5dd4147b99181caa56914e7d290016a1c0c043e37faed971c92f40563"
  end

  depends_on xcode: "26.0"

  depends_on "ghostscript" => :recommended
  depends_on "p3l6/tap/abcm2ps" => :recommended

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
