class Abcm2ps < Formula
  desc "ABC music notation software (bagpipe modifications)"
  homepage "http://moinejf.free.fr"
  url "https://github.com/p3l6/abcm2ps/archive/refs/tags/p3l6-v8.15.0.tar.gz"
  sha256 "c6daa476cf0f8aa07ab6cd3630ba4e5be795dd46ccd21579046f162a82600702"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/p3l6/homebrew-tap/releases/download/abcm2ps-8.15.0"
    rebuild 1
    sha256 arm64_sequoia: "65e94a059ddef3c9261b1c16e5bdb1fa9410b236834724303080d0a21d562799"
    sha256 arm64_sonoma:  "15ec1ebbf580a23bca77a68cd6304e40b0dd47338c810f2669e8fc466df00ced"
    sha256 x86_64_linux:  "80764bad853cf8f5e9d97116fcd1a0ebcd151d402de649fa02f213bce1e46685"
  end

  depends_on "pkgconf" => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"voices.abc").write <<~ABC
      X:7
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
