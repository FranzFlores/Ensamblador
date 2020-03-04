%macro escribir 2
	mov eax,4  
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	
	archivo db "/home/franzflores/Escritorio/codigo.txt",0

	msg_error db "Error. No se ha encontrado el archivo",10
	len_error equ $ - msg_error

section .bss

	idArchivo resb 1
	texto resb 35

section .text
	global _start
_start:

	mov eax,5 ;Se convoca una subrutina de lectura al SO
	mov ebx,archivo
	mov ecx,0
	mov edx,0 
	int 80h

	test eax,eax ;Verificar si existe la subrutina
	jz error

	;************Asignar el archivo ***********
	mov dword [idArchivo],eax

	;************Leer el archivo ***********
	mov eax,3
	mov ebx,[idArchivo]
	mov ecx,texto
	mov edx,25
	int 80h

	escribir texto,25

	;************Cerrar el archivo ***********

	mov eax,6
	mov ebx,[idArchivo]
	mov ecx,0
	mov edx,0
	int 80h

	jmp salir

error:
	escribir msg_error,len_error

salir:
	mov eax,1
	int 80h






