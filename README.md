# Bootloader x86 (16 bits) con NASM

> [!TIP]
> Recomendado emular o hacerlo en VirtualBox para evitar futuros problemas

![Lenguaje](https://img.shields.io/badge/Ensamblador-16--bits-purple?style=for-the-badge&logo=assembly)
![Estado](https://img.shields.io/badge/Estado-Funcional-brightgreen?style=for-the-badge)

--- 
## Archivos Necesarios


- [Archivo Principal](/src/boot.asm)

- [Emular con qemu](/src/deploy.sh)

- [Limpieza archivos generados](/src/clean.sh)

## Modo de uso 

```Java
git clone https://github.com/wvverez/Bootloader.git
cd Bootloader
cd src
chmod +x deploy.sh && chmod +x clean.sh
bash deploy.sh
```
