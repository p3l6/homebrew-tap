class Abcm2ps < Formula
  desc "ABC music notation software (bagpipe modifications)"
  homepage "http://moinejf.free.fr"
  url "https://github.com/p3l6/abcm2ps/archive/refs/tags/p3l6-v8.15.0.tar.gz"
  sha256 "c6daa476cf0f8aa07ab6cd3630ba4e5be795dd46ccd21579046f162a82600702"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/p3l6/homebrew-tap/releases/download/abcm2ps-8.15.0"
    rebuild 2
    sha256 arm64_tahoe:  "9e9d2eba510b53bd6abaeac03d39e15e4b674e3b6bac89e797579e72ab87acfc"
    sha256 x86_64_linux: "fc6efbe445f36d306539853b5eda3c54986803aa558341654670766b41791753"
  end

  depends_on "pkgconf" => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"voices.abc").write <<~ABC
      X:8
      T:Qui Tolis (Trio)
      C:Andre Raison
      M:3/4
      L:1/4
      Q:1/4=92
      %%staves {(Pos1 Pos2) Trompette}
      K:F
      %
      V:Pos1
      %%MIDI program 78
      "Positif"x3 |x3|c'>ba|Pga/g/f|:g2a |ba2 |g2c- |c2P=B  |c>de  |fga |
      V:Pos2
      %%MIDI program 78
              Mf>ed|cd/c/B|PA2d |ef/e/d |:e2f |ef2 |c>BA |GA/G/F |E>FG |ABc- |
      V:Trompette
      %%MIDI program 56
      "Trompette"z3|z3 |z3 |z3 |:Mc>BA|PGA/G/F|PE>EF|PEF/E/D|C>CPB,|A,G,F,-|
    ABC

    system bin/"abcm2ps", testpath/"voices"
    assert_path_exists testpath/"Out.ps"
  end
end
