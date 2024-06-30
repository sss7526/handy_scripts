#!/bin/bash

apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie libreoffice*
apt autoremove -y
apt autoclean
apt update
apt -y upgrade
apt install -y software-properties-common apt-transport-https wget

snap remove --purge firefox
add-apt-repository -y ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | tee /etc/apt/preferences.d/mozilla-firefox


apt update
apt install -y firefox git terminator
apt autoremove -y
apt autoclean -y

wget -O vscode.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
apt install -y ./vscode.deb
rm vscode.deb

wget -O onlyoffice.deb https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
apt install -y ./onlyoffice.deb
rm onlyoffice.deb

apt update
apt upgrade -y
apt autoremove -y
apt autoclean

echo "***"
echo "Snakes removed and firefox is unsnapped"
echo "A superb document management suite has usurped the inferior"
echo "A nifty IDE has entered the chat"
echo "***"
