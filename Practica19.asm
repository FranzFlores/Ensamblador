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
	
	archivo db "/home/franzflores/Escritorio/notas.txt",0

	msg_error db "Error. No se ha encontrado el archivo",10
	len_error equ $ - msg_error

section .bss

	idArchivo resb 1
	texto resb 35

section .text
	global _start
_start:

	;Lectura del texto por teclado
	leer texto,35

	;Creacion y Acceso del archivo
	mov eax,8 
	mov ebx,archivo
	mov ecx,1
	mov edx,177h ;Permisos
	int 80h

	test eax,eax 
	jz error

	;************Asignar el archivo ***********
	mov dword [idArchivo],eax


	;************Escribir lo que se ingreso el archivo ***********
	mov eax,4
	mov ebx,[idArchivo]
	mov ecx,texto
	mov edx,35
	int 80h

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






