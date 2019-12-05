;Programa que suma dos valores fijos y muestra el resultado por consola
section .data

	mensaje db 'El resultado es ',10 ;  0xa como establecer un 10
	tam equ $ - mensaje

section .bss ;Para variables

	suma resb 1 ;resb es una directiva de datos

section .text
	global _start
_start:

	mov eax,2
	mov ebx,4
	add eax,ebx  ;realiza la suma y lo almacena en eax
	add eax,'0'  ;transforma de numero a cadena

	mov [suma],eax ;es un movimiento de direccionamiento

	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,tam
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1
	int 80h


	mov eax,1
	int 80h
