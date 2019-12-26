;Programa que obtiene el valor del cociente y residuo mediante restas sucesivas
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

	msg1 db "El cociente es "
	msg_len1 equ $ - msg1

	msg2 db 10, "El residuo es "
	msg_len2 equ $ - msg2


section .bss
	n1 resb 1
	n2 resb 1
	cociente resb 1
	residuo resb 1


section .text
	global _start
_start:
	
	;Lectura del primer numero 
	escribir num1,len1
	leer n1,2

	;Lectura del segundo numero 
	escribir num2,len2
	leer n2,2

	mov al,[n1]
	mov bl,[n2]

	
	mov cx,0 ;Inicializar el contador
	sub al,'0'
	sub bl,'0'


restaSucesiva:
        sub al, bl
	    inc cx
	    cmp al,bl
	    jg restaSucesiva
        je restaSucesiva
	    jmp imprimir

imprimir:
	
	 add al,'0'
	 add cx,'0'
	 mov [cociente], cx
	 mov [residuo], al

     escribir msg1, msg_len1
     escribir cociente,1

     escribir msg2, msg_len2
     escribir residuo,1

     jmp salir

salir:
	mov eax,1
	int 80h





