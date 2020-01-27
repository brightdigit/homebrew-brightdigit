cask 'speculid' do
  version '2.0.0-beta.2'
  sha256 '68c5f84a49d977e0b6cb7889eaf49b3db8ab6975869fb4ace8b893b6d778d0fb'

  # github.com/brightdigit/Speculid was verified as official when first introduced to the cask
  url 'https://github.com/brightdigit/Speculid/releases/download/v2.0.0-beta.2/Speculid.zip'
  appcast 'https://github.com/brightdigit/Speculid/releases.atom'
  name 'Speculid'
  homepage 'https://speculid.com/'

  app 'Speculid.App'
  binary "#{appdir}/Speculid.App/Contents/SharedSupport/speculid"
end
