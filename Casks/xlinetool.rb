cask "xlinetool" do
  version "1.1.0"
  sha256 "2ae664c57e3f77446ee015eaa7a762486e34d5a5c285b57f7c058449e33922c9"

  url "https://github.com/p3l6/XLineTool/releases/download/v#{version}/XLineTool.zip"
  name "xlinetool"
  desc "Xcode extension providing duplicate line and insert newline after current"
  homepage "https://github.com/p3l6/XLineTool"

  depends_on macos: ">= :sequoia"

  app "XLineTool.app"
end
