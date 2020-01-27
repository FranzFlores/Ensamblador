;Programa que imprime un cubo con caracteres

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
	msg_asterisco db "*"
	tam_asterisco equ $ - msg_asterisco

	msg_enter db 10,""
	tam_enter equ $ - msg_enter

section .bss
	aux resb 1

section .text
	global _start
_start:

	mov ax,5
	mov bx,5

ciclo:
	cmp ax,0
	jg escribir
	je comprobar 


escribir:
	push ax
	push bx
	imprimir msg_asterisco,tam_asterisco
	pop bx
	pop ax

	dec ax
	jmp ciclo
	

comprobar:
	dec bx

	push bx
	imprimir msg_enter,tam_enter
	pop bx

	mov ax,5

	cmp bx,0
	jg ciclo
	je salir

salir:
	mov eax,1
	int 80h
