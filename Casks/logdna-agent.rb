cask 'logdna-agent' do
  version '1.6.2'
  sha256 '350956cbeddf0f0b1cf991a58d659e2a4c2344b621370e10c8adb950f9c6bc47'

  # github.com/logdna/logdna-agent was verified as official when first introduced to the cask
  url "https://github.com/logdna/logdna-agent/releases/download/#{version}/logdna-agent-#{version}.pkg"
  appcast 'https://github.com/logdna/logdna-agent/releases.atom'
  name 'LogDNA Agent'
  homepage 'https://logdna.com/'

  pkg "logdna-agent-#{version}.pkg"

  uninstall pkgutil:   'com.logdna.logdna-agent',
            launchctl: 'com.logdna.logdna-agentd'

  caveats <<~EOS
    When you first start logdna-agent, you must set your LogDNA API key with the command:
      sudo logdna-agent -k <api-key>

    To always run logdna-agent in the background, use the command:
      sudo launchctl load -w /Library/LaunchDaemons/com.logdna.logdna-agent.plist
  EOS
end
