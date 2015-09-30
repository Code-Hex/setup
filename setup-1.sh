#!/usr/bin/sh

xcode-select --install
sudo xcodebuild -license #agree
#change login window
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Tommorow will be a better day."

sudo nvram boot-args="rootless=0" # bootmode rootless turn off
sudo reboot