cask 'speculid' do
  version '2.0.0-alpha.4'
  sha256 'b81bda9932c290549b510ed01ae5eba59b4eca501e2060b46b3fe35fc221f1ed'

  # github.com/brightdigit/Speculid was verified as official when first introduced to the cask
  url 'https://github.com/brightdigit/Speculid/releases/download/v2.0.0-alpha.4/Speculid.zip'
  appcast 'https://github.com/brightdigit/Speculid/releases.atom'
  name 'Speculid'
  homepage 'https://speculid.com/'

  app 'Speculid.App'
  binary "#{appdir}/Speculid.App/Contents/SharedSupport/speculid"
end
