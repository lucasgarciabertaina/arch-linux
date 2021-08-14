#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Chile -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload
# sudo virsh net-autostart default


sudo pacman -S firefox

sudo flatpak install -y spotify
# sudo flatpak install -y kdenlive

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
