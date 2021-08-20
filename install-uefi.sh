#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Argentina/Cordoba /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=es_AR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf
echo "lgb" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 lgb.localdomain lgb" >> /etc/hosts
echo root:20421846619Lg | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S networkmanager network-manager-applet dialog wpa_supplicant base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack openssh rsync reflector acpi acpi_call virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid ntfs-3g terminus-font

pacman -S xorg xorg-server xf86-video-intel mesa nvidia nvidia-utils nvidia-settings

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m lucasgarciabertaina
echo lucasgarciabertaina:20421846619Lg | chpasswd
usermod -aG libvirt lucasgarciabertaina

echo "lucasgarciabertaina ALL=(ALL) ALL" >> /etc/sudoers.d/lucasgarciabertaina


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




