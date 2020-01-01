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
	msg_menu db "Ingrese la opcion que desea realizar",10,"1. Repetir '*' 9 veces",10,"2. Repetir '@' 8 veces",10,"3. Salir",10
	tam_menu equ $ - msg_menu

	msg_asterisco times 9 db '*'
	tam_asterisco equ $ - msg_asterisco

	msg_arroba times 8 db '@'
	tam_arroba equ $ - msg_arroba

	msg_error db "Opcion No Valida",10
	tam_error equ $ - msg_error


section .bss
	
	opcion resb 1

section .text
	global _start
_start:
	
	;Mostrar por consola el mensaje de menu
	imprimir msg_menu,tam_menu
	leer opcion,2

	;Almacenar en un registro la opcion ingresada
	mov ah,[opcion]
	sub ah,'0'

	;Comparar la opcion y mostrar el mensaje
	cmp ah,1
	je asterisco

	cmp ah,2
	je arroba

	cmp ah,3
	je salir
	jg error


asterisco:
	imprimir msg_asterisco,tam_asterisco
	jmp salir 

arroba: 
	imprimir msg_arroba,tam_arroba
	jmp salir

error: 
	imprimir msg_error,tam_error
	jmp salir

salir: 
	mov eax,1
	int 80h
