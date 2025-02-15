class BagNotation < Formula
  desc "Compiler for .bag music files"
  homepage "https://github.com/p3l6/bag-notation"
  url "https://github.com/p3l6/bag-notation/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "da74be69c05ee3416c3142d7df7ba33e6cb5320e5cb1037d13b8775d030eca63"
  license "MIT"

  bottle do
    root_url "https://github.com/p3l6/homebrew-tap/releases/download/bag-notation-0.2.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d35311ff7e7fb0516c4d60bdd4847d9ae3d4a27fd0165f65fd84f1a5741f09d4"
    sha256 cellar: :any_skip_relocation, ventura:       "f17d57feddb7972937a322f475cdd43bb33a0280e4557ee4da985c09af3a3fe7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "05cfd40f796c04b3742d8004eda80ddc3686f0f54eec42c453eb8dad8fdc881d"
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
