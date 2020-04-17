cask 'speculid' do
  version '2.0.0-beta.4'
  sha256 'a9fce27930d1fef76d01f4f90880d3b822c8082f853379179785f5afe24e9df4'

  # github.com/brightdigit/Speculid was verified as official when first introduced to the cask
  url 'https://github.com/brightdigit/Speculid/releases/download/v2.0.0-beta.4/Speculid.zip'
  appcast 'https://github.com/brightdigit/Speculid/releases.atom'
  name 'Speculid'
  homepage 'https://speculid.com/'

  app 'Speculid.app'
  binary "#{appdir}/Speculid.App/Contents/SharedSupport/speculid"
end
