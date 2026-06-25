#!/bin/bash
# Script para borrar los archivos para la prueba

rm -f boot.bin disk.img
echo "[+] Archivos eliminados"
[ -f boot.asm ] && echo "[!] boot.asm preservado por si se quieren hacer futuras pruebas"
