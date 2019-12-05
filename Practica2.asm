;Practica 2
;Programa que consiste en realizar una lectura de texto mediante teclado

section .bss

    nombre resb 5

section .text
    global _start
    _start:

    mov eax,3   ;operacion de lectura
    mov ebx,2   ; operacion standar(teclado)
    mov ecx,nombre ;se almacena lo que se leyo en nombre
    mov edx,5  ; numero de caracteres que permite almacenar
    int 80H

    mov eax,1
    int 80
