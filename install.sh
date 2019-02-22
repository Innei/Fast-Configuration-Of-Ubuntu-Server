#!/bin/sh
cd
apt update && apt upgrde
apt install wget python-dev curl zsh python git htop screen vim -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &

seconds_left=4
    echo "请等待${seconds_left}秒……"
    while [ $seconds_left -gt 0 ];do
      echo -n $seconds_left
      sleep 1
      seconds_left=$(($seconds_left - 1))
      echo -ne "\r     \r" 
    done

wget -O .zshrc https://raw.githubusercontent.com/SorashitaInnei/zshconfig.zshrc/master/linux.zshrc
source ./.zshrc 
echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config

# install thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools -y
sudo pip3 install thefuck
echo "eval $(thefuck --alias)" >> ./.zshrc
source ./.zshrc
zsh
sed '/PasswordAuth/sPasswordAuth no' -i /etc/ssh/sshd_config
#install bt
wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh

