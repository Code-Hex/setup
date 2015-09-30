#!/usr/bin/sh

set -eux
git clone git://github.com/tokuhirom/plenv.git ~/.plenv
git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
plenv install 5.20.2
plenv rehash
plenv global 5.20.2
plenv rehash
plenv install-cpanm

# install cpm <- fastest installer
cpanm -nq git://github.com/miyagawa/cpanminus.git@menlo
cpanm -nq git://github.com/shoichikaji/cpm.git

PLMLIST=(LWP::UserAgent Mojolicious Carton Caroline Reply Term::ReadLine::EditLine)

for item in ${PLMLIST[@]}; do
	cpm install --global $item
done

# clean
rm ./.vim/README.md
rm -rf zshrc
rm -rf vimrc
rm -rf molokai

echo "Cleaned"
echo "Next: sh setup-4.sh"
echo "Try when you have many time."