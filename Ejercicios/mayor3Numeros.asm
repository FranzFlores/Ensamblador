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

	msg_n1 db "Ingrese el primer numero: "
	tam_n1 equ $ - msg_n1

	msg_n2 db "Ingrese el segundo numero: "
	tam_n2 equ $ - msg_n2

	msg_n3 db "Ingrese el tercer numero: "
	tam_n3 equ $ - msg_n3

	msg_res db "El mayor numero ingresado es: "
	tam_res equ $ - msg_res

section .bss
	
	n1 resb 1
	n2 resb 1
	n3 resb 1
	res resb 1

section .text
	global _start
_start:

	;Pedir los numeros por consola
	imprimir msg_n1,tam_n1
	leer n1,2

	imprimir msg_n2,tam_n2
	leer n2,2

	imprimir msg_n3,tam_n3
	leer n3,2

	;Mover los numeros a registros 
	mov al,[n1]
	mov bl,[n2]
	mov cl,[n3]

	;Convertir los valores ingresados a numeros enteros
	sub al,'0'
	sub bl,'0'
	sub cl,'0'

	;Comparacion del primer y segundo numero 
	cmp al,bl
	jg n1Mayor
	je n1Mayor
	jng n2Mayor

n1Mayor:
	cmp al,cl
	jg n1MayorTodos
	je n1MayorTodos
	jng n3MayorTodos

n2Mayor:
	cmp bl,cl
	jg n2MayorTodos
	je n2MayorTodos
	jng n3MayorTodos

n1MayorTodos:
	add al,'0'
	mov [n1],al
	imprimir msg_res,tam_res
	imprimir n1,1
	jmp salir 

n2MayorTodos:
	add bl,'0'
	mov [n2],bl
	imprimir msg_res,tam_res
	imprimir n2,1
	jmp salir 

n3MayorTodos:
	add cl,'0'
	mov [n3],cl
	imprimir msg_res,tam_res
	imprimir n3,1
	jmp salir 

salir: 
	mov eax,1
	int 80h
