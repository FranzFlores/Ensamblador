;Practica que consiste en mostrar la funcionalidad saltos y las etiquetas.
;La practica muestra cual de dos números ingresados es el mayor.
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro


section .data

	num1 db "Ingrese el primer numero",10
	len1 equ $ - num1

	num2 db "Ingrese el segundo numero",10
	len2 equ $ - num2

	msg1 db "El numero es mayor",10
	msg_len1 equ $ - msg1

	msg2 db "El numero es menor",10
	msg_len2 equ $ - msg2

section .bss
	n1 resb 1
	n2 resb 1

section .text
	global _start
_start:
	
	escribir num1,len1
	leer n1,2
	mov al,[n1]
	sub al,'0'

	escribir num2,len2
	leer n2,2
	mov bl,[n2]
	sub bl,'0'

	cmp al,bl ;Realiza una comparacion. 
	jg mayor
	jng menor
	
mayor: 
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,msg_len1
	int 80h
	jmp salir

menor: 
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,msg_len2
	int 80h

salir:
	mov eax,1
	int 80h
