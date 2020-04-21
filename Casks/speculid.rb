cask 'speculid' do
  version '2.0.0'
  sha256 'a5c65adccc7953cdce4e53bf3b4f6fdad5a7734ebc9c24e5ee3bcf1344eca7b2'

  # github.com/brightdigit/Speculid was verified as official when first introduced to the cask
  url 'https://github.com/brightdigit/Speculid/releases/download/v2.0.0/Speculid.zip'
  appcast 'https://github.com/brightdigit/Speculid/releases.atom'
  name 'Speculid'
  homepage 'https://speculid.com/'

  app 'Speculid.app'
  binary "#{appdir}/Speculid.App/Contents/SharedSupport/speculid"
end
