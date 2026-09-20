cask "xlinetool" do
  version "1.2.0"
  sha256 "9cc870191bb8223cd80733e1b7c22bf36442acb14b5b98db3751bd5da1971419"

  url "https://github.com/p3l6/XLineTool/releases/download/v#{version}/XLineTool.zip"
  name "xlinetool"
  desc "Xcode extension providing duplicate line and insert newline after current"
  homepage "https://github.com/p3l6/XLineTool"

  depends_on macos: :tahoe

  app "XLineTool.app"
end
