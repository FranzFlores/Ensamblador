;Programa que consiste en mostrar la funcionalidad de dword
;numero de caracteres que se puede Modificar
;byte 1
;word 2
;dword 4
;qword 8
;tbyte 10

section .data

	mensaje db 'Desplegar los asteriscos 9 veces',10
	tam equ $ - mensaje


section .text
	global _start
_start:

	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,tam
	int 80h

	;Modificar la estructura de una constante
	mov [mensaje], dword 'HOLA'

	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,tam
	int 80h

	mov eax,1
	int 80h
