class Speculid < Formula
  desc "Easily Build Xcode Image and App Icon Assets from Graphic Files."
  homepage "http://www.speculid.com"
  url "https://github.com/brightdigit/speculid/archive/1.0.0-beta1.tar.gz"
  version "1.0.0-beta1"
  sha256 "287c36011b597fa73d6a7c250128096be60808f59d1b6affe0150febf4ea8427"
  head "https://github.com/brightdigit/speculid.git", :branch => "release/1.0.0"

  option "with-debug", "Compile Speculid with debug options enabled"

  depends_on "homebrew/gui/inkscape"
  depends_on "imagemagick"
  depends_on :xcode => ["8.0", :build]
  depends_on :macos => :yosemite

  def install
    configuration = "Release"

    if build.with? "debug"
      configuration = "Debug"
    end

    xcodebuild "-workspace", "speculid.xcworkspace", "-scheme", "Speculid Application", "-derivedDataPath", buildpath, "build", "-configuration", configuration, "SYMROOT=#{buildpath}/Build/Products", "CODE_SIGNING_REQUIRED=NO"
    system "zip", "-r", "examples.zip", "examples"
    prefix.install "examples.zip"
    prefix.install "shasum.sh"
    prefix.install "#{buildpath}/Build/Products/#{configuration}/Speculid.app"
    bin.install_symlink prefix/"Speculid.app/Contents/MacOS/Speculid" => "speculid"
  end

  test do
    system "unzip", "#{prefix}/examples.zip", "-d", testpath
    assert_equal shell_output("cat #{testpath}/examples/shasum"), shell_output("#{prefix}/shasum.sh #{bin}/speculid #{testpath}/examples/Assets")
    system "#{bin}/speculid", "--version"
  end
end
