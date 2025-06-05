#!/bin/bash


apt-get clean
apt-get upgrade -y

# == Install OS dependencies ====
apt-get update -y && \
apt-get install -y xvfb && \
apt-get install -y x11-apps && \
apt-get install -y x11-utils && \
apt-get install -y iputils-ping && \
apt-get install -y x11-xserver-utils && \
apt-get install -y xauth && \
apt-get install -y net-tools && \
# apt-get install npm -y && \
apt-get install -y wget && \
apt-get install -y curl && \
apt-get install -y snapd && \
apt-get install -y ssh && \
apt-get install -y rsync && \
apt-get install -y git && \
apt-get install -y xz-utils && \
apt-get install -y gpg && \
apt-get install -y vim && \
apt-get install -y nano && \
apt-get install -y sudo
# apt-get install -y supervisor



# == Install Google Chrome ====
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#apt install ./google-chrome-stable_current_amd64.deb --fix-broken -y



# == Install VSCODE ====
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
apt-get install -y apt-transport-https
apt-get update -y
apt-get install -y code



# == Install SFDX CLI ====
mkdir /root/cli
mkdir /root/cli/sf
wget https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.xz
tar -xvf sf-linux-x64.tar.xz -C ~/cli/sf --strip-components 1
echo "PATH=~/cli/sf/bin:/home/dojo/scripts:$PATH" >> ~/.bashrc



apt update -y

