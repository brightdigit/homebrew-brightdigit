# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class Speculid < Formula
  desc "Create Raster Images for Xcode Assets"
  homepage "http://www.speculid.com"
  url "https://github.com/brightdigit/speculid/archive/1.0.0-alpha6.tar.gz"
  version "1.0.0-alpha6"
  sha256 "7402c76f832fa9427fe5474b87d3858452b49f3702c3cb529c56511522d1f252"

  depends_on "homebrew/gui/inkscape"
  depends_on "imagemagick"
  depends_on :xcode => :build
  depends_on :macos => :yosemite

  def install
    xcodebuild "-workspace", "speculid.xcworkspace", "-scheme", "Speculid", "-derivedDataPath", buildpath, "build", "-configuration", "Release", "CODE_SIGNING_REQUIRED=NO"
    prefix.install "#{buildpath}/Build/Products/Release/Speculid.app"
    bin.install_symlink prefix/"Speculid.app/Contents/MacOS/Speculid" => "speculid"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test speculid`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    xcodebuild "-workspace", "speculid.xcworkspace", "-scheme", "Speculid", "test"
  end
end
