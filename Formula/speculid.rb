class Speculid < Formula
  desc "Create Raster Images for Xcode Assets"
  homepage "http://www.speculid.com"
  url "https://github.com/brightdigit/speculid/archive/1.0.0-alpha12.tar.gz"
  version "1.0.0-alpha12"
  sha256 "ee09a145abb627f05b982db3e00eeb75792874f417ce401a45a1249bb2473596"

  depends_on "homebrew/gui/inkscape"
  depends_on "imagemagick"
  depends_on :xcode => :build
  depends_on :macos => :yosemite

  def install
    xcodebuild "-workspace", "speculid.xcworkspace", "-scheme", "Speculid Application", "-derivedDataPath", buildpath, "build", "-configuration", "Release", "SYMROOT=#{buildpath}/Build/Products", "CODE_SIGNING_REQUIRED=NO"
    system "zip", "-r", "examples.zip", "examples"
    prefix.install "examples.zip"
    prefix.install "shasum.sh"
    prefix.install "#{buildpath}/Build/Products/Release/Speculid.app"
    bin.install_symlink prefix/"Speculid.app/Contents/MacOS/Speculid" => "speculid"
  end

  test do
    system "unzip", "#{prefix}/examples.zip", "-d", testpath
    assert_equal shell_output("cat #{testpath}/examples/shasum"), shell_output("#{prefix}/shasum.sh #{bin}/speculid #{testpath}/examples/Assets")
    system "#{bin}/speculid", "--version"
  end
end
