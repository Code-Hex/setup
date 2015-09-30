#!/usr/bin/sh

set -eux
CASKLIST=(0xed 1password appcleaner aquaterm coteditor cyberduck dropbox font-source-code-pro google-chrome skype sublime-text3 torbrowser virtualbox vlc wireshark xquartz)

brew tap caskroom/homebrew-versions
brew tap caskroom/fonts
brew tap sanemat/font
brew tap homebrew/science

for item in ${CASKLIST[@]}; do
	brew cask install $item
done

# brew install gnuplot --latex --pdf --qt --with-x --without-emacs
echo "Completed!!"
echo "Run at a later time."
echo "https://www.reddit.com/r/hackintosh_ja/comments/3hytyc/el/"
echo "sudo nvram -d boot-args"
echo "sudo reboot"