cask "xlinetool" do
  version "1.1.1"
  sha256 "4293673a1145b955082b0372e8bb3026e6cf3526ba95f0600613376114fe2c18"

  url "https://github.com/p3l6/XLineTool/releases/download/v#{version}/XLineTool.zip"
  name "xlinetool"
  desc "Xcode extension providing duplicate line and insert newline after current"
  homepage "https://github.com/p3l6/XLineTool"

  depends_on macos: ">= :sequoia"

  app "XLineTool.app"
end
