#!/usr/bin/sh

set -eux

git clone git://github.com/tokuhirom/plenv.git ~/.plenv
git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
plenv install 5.20.2
plenv rehash
plenv global 5.20.2
plenv rehash
plenv install-cpanm

cpanm -nq git://github.com/miyagawa/cpanminus.git@menlo
cpanm -nq git://github.com/shoichikaji/cpm.git

PLMLIST=(LWP::UserAgent Mojolicious Carton Caroline Reply Term::ReadLine::EditLine)

for item in ${PLMLIST[@]}; do
	cpm install --global $item
done

CASKLIST=(0xed appcleaner aquaterm cyberduck dropbox font-source-code-pro google-chrome sublime-text3 xquartz)

for item in ${CASKLIST[@]}; do
	brew cask install $item
done

dir=`ls /usr/local/Cellar/ricty | egrep '\d\.\d\.\d'`
cp -f /usr/local/Cellar/ricty/${dir}/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# brew install gnuplot --latex --pdf --qt --with-x --without-emacs
echo "Completed!!"

echo "https://www.reddit.com/r/hackintosh_ja/comments/3hytyc/el/"
