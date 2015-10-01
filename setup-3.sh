#!/usr/bin/sh

set -eux
git clone git://github.com/tokuhirom/plenv.git ~/.plenv
git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
plenv install 5.20.2
plenv rehash
plenv global 5.20.2
plenv rehash
plenv install-cpanm

# clean
rm ./.vim/README.md
rm -rf zshrc
rm -rf vimrc
rm -rf molokai

echo "Cleaned"
echo "Next: sh setup-4.sh"
echo "Try when you have many time."

exec $SHELL -l
