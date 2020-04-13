cask 'speculid' do
  version '2.0.0-beta.3'
  sha256 '3939b46ce41b6bb38ee77ac0cfa68b346aa854eecd8f0e1b87436795f04b969d'

  # github.com/brightdigit/Speculid was verified as official when first introduced to the cask
  url 'https://github.com/brightdigit/Speculid/releases/download/v2.0.0-beta.3/Speculid.zip'
  appcast 'https://github.com/brightdigit/Speculid/releases.atom'
  name 'Speculid'
  homepage 'https://speculid.com/'

  app 'Speculid.App'
  binary "#{appdir}/Speculid.App/Contents/SharedSupport/speculid"
end
