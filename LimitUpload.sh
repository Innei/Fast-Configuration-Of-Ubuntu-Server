#!/bin/bash
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
rm /etc/conf.d/wondershaper.conf

touch /etc/conf.d/wondershaper.conf
echo "wondershaper]
# Adapter
#
IFACE="eth0"

# Download rate in Kbps
#
#DSPEED="2048"

# Upload rate in Kbps
#
USPEED="512"" >> /etc/conf.d/wondershaper.conf
systemctl enable wondershaper.service
systemctl start wondershaper.service