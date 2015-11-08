#!/usr/bin/sh

set -eux
xcode-select --install
sudo xcodebuild -license #agree
#change login window
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Tommorow will be a better day."

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor >> brew-doctor.txt
brew update

brew install caskroom/cask/brew-cask
brew cask doctor >> brew-cask-doctor.txt

brew tap caskroom/homebrew-versions
brew tap caskroom/fonts
brew tap sanemat/font
brew tap homebrew/science

brew install automake cmake cowsay dpkg ffmpeg fortune
brew install ghostscript git imagemagick sqlite
brew install toilet tree wget zsh zsh-completions
brew install mercurial node lua openssl readline ricty
brew install coreutils nkf sl libtool postgresql

git clone https://github.com/Code-Hex/zshrc.git
cp zshrc/.zshrc zshrc/coin.wav zshrc/jump.wav zshrc/exit.wav ./

current="$(cd $(dirname $0) && pwd)"

git clone https://github.com/Code-Hex/vimrc.git
cp vimrc/.vimrc ./
cp -r ${current}/Terminal/.vim/colors ./.vim/

# git clone https://github.com/tomasr/molokai ./.vim/
# git clone git://github.com/blueshirts/darcula.git
# mv vim-colors-solarized/colors .vim/
# rm -rf vim-colors-solarized

chsh -s /bin/zsh

# clean
rm ./.vim/README.md
rm -rf zshrc
rm -rf vimrc
rm -rf molokai

echo "Cleaned"

exec $SHELL -l
