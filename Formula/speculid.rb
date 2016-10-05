class Speculid < Formula
  desc "Create Raster Images for Xcode Assets"
  homepage "http://www.speculid.com"
  url "https://github.com/brightdigit/speculid/archive/1.0.0-alpha7.tar.gz"
  version "1.0.0-alpha7"
  sha256 "d8aadd5d633a3c8b62b687edfabe469173fe302d4b90c9c959e958555e08162e"

  depends_on "homebrew/gui/inkscape"
  depends_on "imagemagick"
  depends_on :xcode => :build
  depends_on :macos => :yosemite

  def install
    xcodebuild "-workspace", "speculid.xcworkspace", "-scheme", "Speculid", "-derivedDataPath", buildpath, "build", "-configuration", "Release", "SYMROOT=build", "CODE_SIGNING_REQUIRED=NO"
    prefix.install "#{buildpath}/Build/Products/Release/Speculid.app"
    bin.install_symlink prefix/"Speculid.app/Contents/MacOS/Speculid" => "speculid"
  end

  test do
    system "#{bin}/speculid", "-h"
  end
end
