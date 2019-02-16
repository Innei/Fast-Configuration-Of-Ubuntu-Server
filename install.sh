#!/bin/sh
cd
apt update && apt upgrde
apt install wget python-dev curl zsh python git htop screen vim -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &
sleep 10
wget -O .zshrc https://raw.githubusercontent.com/SorashitaInnei/zshconfig.zshrc/master/linux.zshrc
source ./.zshrc 
echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config

# install thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

