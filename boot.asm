BITS 16 ; Kernel de 16
ORG 0x0000          ; el segmento base ya es 07C0h, offset desde 0

; Punto de entrada del bootloader
start:
    ; Configurar el segmento de pila
    mov ax, 07C0h
    add ax, 228         ; SS apuntará justo después del código (07C0h + 228 párrafos)
    mov ss, ax          ; asignar segmento de pila
    mov sp, 4096        ; puntero de pila: 4 KB desde la base de SS

    ; Configurar el segmento de datos al mismo segmento donde cargó el BIOS
    mov ax, 07C0h
    mov ds, ax

    ; Imprimir cadena terminada en nulo
    mov si, text_string
    call print_string

    jmp $               ; bucle infinito 

; Los Datos de la variable para ver por pantalla
text_string db 'Kernel de prueba creado por wvverez :)', 0

; Subrutinas

; print_string: imprime la cadena en DS:SI usando BIOS INT 10h (modo teletype)
print_string:
    mov ah, 0Eh         ; función: escribé carácter en modo teletype

.loop:
    lodsb               ; AL = byte en DS:SI, avanza SI
    cmp al, 0
    je  .done           ; si es nulo, finalizamos la cadena
    int 10h             ; imprimir carácter en AL
    jmp .loop

.done:
    ret

; Relleno y firma de arranque
times 510 - ($ - $$) db 0   ; rellena con ceros hasta el byte 510
dw 0xAA55                    ; firma MBR: la BIOS verifica estos dos bytes
