;Programa que decrementa hasta uno el numero que se ingresa por consola

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
	msg_n1 db "Ingrese el numero: "
	tam_n1 equ $ - msg_n1

	msg_enter db 10," "
	tam_enter equ $ - msg_enter

section .bss
	n1 resb 1

section .text
	global _start
_start:

	imprimir msg_n1,tam_n1
	leer n1,1
	
	mov cx,[n1] 
	sub cx,'0'

principal:
	cmp cx,0
	jz salir
	jmp escribir

escribir:

	push cx

	add cx,'0'
	mov [n1],cx
	
	imprimir n1,2
	imprimir msg_enter,tam_enter
	
	pop cx
	dec cx

	jmp principal

salir:
	mov eax,1
	int 80h
