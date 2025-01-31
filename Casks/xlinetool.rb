cask "xlinetool" do
  version "1.0.0"
  sha256 "1bd32a2e2878306ee2678e89fc4b356492eec8f549fc77f832794d14e772a1d9"

  url "https://github.com/p3l6/XLineTool/releases/download/v#{version}/XLineTool.zip"
  name "xlinetool"
  desc "Xcode extension providing duplicate line and insert newline after current"
  homepage "https://github.com/p3l6/XLineTool"

  depends_on macos: ">= :ventura"

  app "XLineTool.app"
end
