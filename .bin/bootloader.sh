#!/bin/bash

mount /dev/sda1 /mnt

grub-mkconfig -o /boot/grub/grub.cfg

grub-mkstandalone -o boot.efi -d /usr/lib/grub/x86_64-efi -O x86_64-efi --compress=xz /boot/grub/grub.cfg

rm /mnt/EFI/arch/arch.efi

mv boot.efi /mnt/EFI/arch/arch.efi

umount /dev/sda1

exit 0
