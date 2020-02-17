;Programa que permite determinar el funcionamiento de un arreglo

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

	msg db "Ingrese 6 numeros",10
	tam equ $ - msg

	msg_mayor db "El número mayor es "
	tam_mayor equ $ - msg_mayor

	msg_menor db 10,"El número menor es "
	tam_menor equ $ - msg_menor

	msg_salto db 10,""
	tam_salto equ $ - msg_salto

	;Definicion del Arreglo
	arreglo db 0,0,0,0,0,0
	tam_arreglo equ $ - arreglo

section .bss
	num resb 2
	may resb 2
	men resb 2

section .text
	global _start
_start:
	
	imprimir msg,tam

	;Asignacion del Arreglo en posiciones efectivas
	mov esi,arreglo
	mov edi,0

ciclo:
	leer num,2

	;Asignacion de un numero en el arreglo
	mov al,[num]
	sub al,'0'
	mov [esi],al

	;incremento una posicion en el arreglo
	add esi,1
	add edi,1

	;Comparar para el salto
	cmp edi,tam_arreglo
	jb ciclo ;Salta a ciclo cuando el num1 es menor a num2

	imprimir msg_salto,tam_salto
	;Volver las posiciones al inicio
	sub esi,tam_arreglo
	mov edi,0

escribir:
	
	mov al,[esi]
	add al,'0'

	mov [num],al
	imprimir num,2

	add esi,1
	add edi,1

	cmp edi,tam_arreglo
	jb escribir

	;Volver las posiciones al inicio
	sub esi,tam_arreglo
	mov edi,0

	mov ebx,0

mayor: 
	cmp [esi],ebx
	jg numMayor
	je continuar
	jng continuar

numMayor:
	mov ebx,[esi]
	jmp continuar

continuar:
	add esi,1
	add edi,1

	cmp edi,tam_arreglo
	jb mayor

	add ebx,'0'
	mov [may],ebx

	imprimir msg_mayor,tam_mayor
	imprimir may,2

	sub esi,tam_arreglo
	mov edi,0
	mov ebx,9

menor:
	cmp [esi],ebx
	jg continuar1
	je continuar1
	jng numMenor

numMenor:
	mov ebx,[esi]
	jmp continuar1

continuar1:
	add esi,1
	add edi,1

	cmp edi,tam_arreglo
	jb menor

	add ebx,'0'
	mov [men],ebx

	imprimir msg_menor,tam_menor
	imprimir men,2


salir:
	mov eax,1
	int 80h