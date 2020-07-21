#!/bin/bash
#author: marvel gulane
# run this in sudo $!(every_commandline_is_landmines)
# make sure to edit /etc/default/ufw if you dont like ipv6

# system info
lsb_release -a

# stateless ufw firewall configuration 
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 4443/tcp
ufw allow 10000:20000/udp
ufw status numbered

# setup prosody
echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list
wget https://prosody.im/files/prosody-debian-packages.key -O- | sudo apt-key add -
apt-get -y update
apt-get install -y prosody-0.11

# setup jitsi-meet
apt install apt-transport-https
apt-add-repository universe
curl https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null
apt-get -y update
apt-get -y install jitsi-meet
