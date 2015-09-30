#!/usr/bin/sh

set -eux
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor >> brew-doctor.txt
brew update

brew install caskroom/cask/brew-cask
brew cask doctor >> brew-cask-doctor.txt

brew install automake cmake cowsay dpkg ffmpeg fish fortune ghostscript git highlight imagemagick
brew install libtool lua nkf openssl readline ricty sl sqlite toilet tree wget zsh

git clone git@github.com:Code-Hex/zshrc.git
cp zshrc/.zshrc zshrc/coin.wav zshrc/jump.wav zshrc/exit.wav ./

git clone git@github.com:Code-Hex/vimrc.git
cp vimrc/.vimrc ./

git clone https://github.com/tomasr/molokai ./.vim/

chsh -s /bin/zsh

exec $SHELL -l