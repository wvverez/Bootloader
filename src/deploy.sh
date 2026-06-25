#!/bin/bash
[ ! -f boot.asm ] && echo "[!] boot.asm no existe" && exit 1
command -v nasm >/dev/null || sudo apt-get install -y nasm
command -v qemu-system-x86_64 >/dev/null || sudo apt-get install -y qemu-system-x86
nasm -f bin boot.asm -o boot.bin || exit 1
[ "$1" = "debug" ] && qemu-system-x86_64 -s -S boot.bin && exit 0
[ "$1" = "vbox" ] && dd if=/dev/zero of=disk.img bs=1024 count=1440 && dd if=boot.bin of=disk.img bs=512 count=1 conv=notrunc && echo "[+] Imagen creada para VirtualBox" && exit 0
qemu-system-x86_64 boot.bin
