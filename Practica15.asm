;Programa que imprime un mensaje 20 veces mediante el uso de loop 

%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro 

section .data
	msg db " Ella",10
	tam equ $ - msg


section .bss
	n1 resb 2

section .text
	global _start
_start:

	mov ecx,20

ciclo:
	push ecx
	
	mov al,cl 
	mov cl,10
	div cl
	add ax,'00'
	mov [n1],eax

	imprimir n1,2
	imprimir msg,tam
	
	pop ecx

	loop ciclo

salir:
	mov eax,1
	int 80h