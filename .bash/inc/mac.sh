mac_finder_show_hidden() {
    defaults write com.apple.Finder AppleShowAllFiles true
    killall Finder
}

mac_setup() {
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
    defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
    defaults delete -g ApplePressAndHoldEnabled                                      # If necessary, reset global default
}