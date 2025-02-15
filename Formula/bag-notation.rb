class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "a203fb58f706fd3408a371536ec9d0a7cc7d9492b5808b7bffde040d03dd1d0a"
  license "MIT"

  bottle do
    root_url "https://github.com/p3l6/homebrew-tap/releases/download/bag-notation-0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c5faa6a3e953875d417beed38801c6b668a335df67533db5c494add4f152551f"
    sha256 cellar: :any_skip_relocation, ventura:       "992289102d4d77956df659e026627c86095a604b1280e3140496c25c42395375"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2f97842c2d9039719d9c44165402b302dc6146c225bcd118b3b4e0291ff68c72"
  end

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
