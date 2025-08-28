class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3583a51e42fadfcf8ffd2ab30a630aefe1fc60b7bb71485337560f6ac2a94db2"
  license "MIT"

  bottle do
    root_url "https://github.com/p3l6/homebrew-tap/releases/download/bag-notation-1.0.0"
    sha256 arm64_sequoia: "bd53c6a00ec71f82aa608048431c624b4e8d25e7abb690c2c4b6c9be3d1cd69e"
    sha256 x86_64_linux:  "36c3dd45a68308a63ef608307c1324dea7e5184f18a07e19939f2d46edc286dd"
  end

  depends_on xcode: "16.0"

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
