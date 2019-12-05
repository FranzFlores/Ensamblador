;Practica 3
;Programa que consiste en imprimir 9 veces un asterisco, tiene como objetivo mostrar la funcionalidad de times

section .data

	mensaje db 'Desplegar los asteriscos 9 veces',10
	tam equ $ - mensaje
	asterisco times 9 db 10,'*' ;Es similar a un bucle
	len_asterisco  equ $ - asterisco

section .text
	global _start
_start:

	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,tam
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,asterisco
	mov edx,len_asterisco
	int 80h

	mov eax,1
	int 80h
