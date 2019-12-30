%macro imprimir 2
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
	
	msg_num1 db "Ingrese el primer factor",10
	tam_num1 equ $ - msg_num1

	msg_num2 db "Ingrese el segundo factor",10
	tam_num2 equ $ - msg_num2

	msg_coc db "El resultado es: "
	tam_coc equ $ - msg_coc

section .bss

 	num1 resb 1
 	num2 resb 1
 	coc resb 1

section .text
	global _start
_start:

	imprimir msg_num1,tam_num1
	leer num1,2

	imprimir msg_num2,tam_num2
	leer num2,2

	mov al,[num1]
	mov bl,[num2]

	mov cl,1
	sub al,'0'
	sub bl,'0'


sumaSucesiva:
	add al,al
	inc cl
	cmp bl,cl
	jg sumaSucesiva
	jng resultado
	je resultado


resultado:
	add al,'0'
	mov [coc],al

	imprimir msg_coc,tam_coc
	imprimir coc,1


salir:
	mov eax,1
	int 80h
	


