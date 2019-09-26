cask 'speculid' do
  version '2.0.0-alpha.5'
  sha256 '9ce9da244caf28e4871de3c138ae61956d362de5d916ee52e24e5844766ddfe4'

  # github.com/brightdigit/Speculid was verified as official when first introduced to the cask
  url 'https://github.com/brightdigit/Speculid/releases/download/v2.0.0-alpha.5/Speculid_2.0_alpha_5.zip'
  appcast 'https://github.com/brightdigit/Speculid/releases.atom'
  name 'Speculid'
  homepage 'https://speculid.com/'

  app 'Speculid.App'
  binary "#{appdir}/Speculid.App/Contents/SharedSupport/speculid"
end
