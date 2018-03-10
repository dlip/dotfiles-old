function mac_finder_show_hidden() {
  defaults write com.apple.Finder AppleShowAllFiles true
  killall Finder
}