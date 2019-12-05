;Practica 1
;Consiste en imprimir una cadena de texto almacena en una variable

section .data
    mensaje db "Hola ensamblador"

    tamano equ $-mensaje // equ calcula el tamaño del mensaje

section .text
    global _start
    _start:
        mov eax,4 ; muevo el valor de 4 al registro eax
        mov ebx,1 ; mueve el valor de 1 al registro ebx
        mov ecx,mensaje ;mueve el valor de mensaje al registro ecx
        mov edx,tamano ;mueve el valor del tam al registro edx
        int 80  ;interrupcion=>EL SO toma el control del ensamblado. Envia una señal al SO para ejecutar una subrutina(operacion o funcion)

        mov eax,1
        int 80

//Comandos para compilar el programa de ensamblador

;nasm -f elf hola.asm //genera un programa.o que es el compilable
;ld -m elf_i386 -s -o primer hola.o  //genera el linker MUCHO CUIDADO -s es el ejecutable

//elf especifica el tipo de arquitectura


section .data
    nombre db "Franz Andrés"
    apellido db "Flores Gallardo"

    tamano equ $-nombre // equ calcula el tamaño del mensaje
    tam equ $-apellido

section .text
    global _start

_start:
        mov eax,4
        mov ebx,1
        mov ecx,nombre
        mov edx,tamano
        int 80h

        mov eax,4
        mov ebx,1
        mov ecx,apellido
        mov edx,tam
        int 80H

        mov eax,1
        int 80H
