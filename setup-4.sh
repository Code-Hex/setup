#!/usr/bin/sh

set -eux

cpanm -nq git://github.com/miyagawa/cpanminus.git@menlo
cpanm -nq git://github.com/shoichikaji/cpm.git

PLMLIST=(LWP::UserAgent Mojolicious Carton Caroline Reply Term::ReadLine::EditLine)

for item in ${PLMLIST[@]}; do
	cpm install --global $item
done

CASKLIST=(0xed 1password appcleaner aquaterm coteditor cyberduck dropbox font-source-code-pro google-chrome skype sublime-text3 torbrowser virtualbox vlc xquartz wireshark)

for item in ${CASKLIST[@]}; do
	brew cask install $item
done

# brew install gnuplot --latex --pdf --qt --with-x --without-emacs
echo "Completed!!"
echo "Run at a later time."
echo "sudo nvram -d boot-args"
echo "sudo reboot"
echo "https://www.reddit.com/r/hackintosh_ja/comments/3hytyc/el/"
