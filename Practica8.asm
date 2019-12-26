;Practica que consiste en realizar las 4 operaciones basicas y en el flujo de ejecucion
;se usa la instruccion jmp

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
	
	mensaje1 db 'Ingrese el primer numero:' 
	tam1 equ $ - mensaje1 

	mensaje2 db 10,'Ingrese el segundo numero:' 
	tam2 equ $ - mensaje2 

	mensajeSuma db 10,'El resultado de la suma es: '
	tamSuma equ $ - mensajeSuma

	mensajeResta db 10,'El resultado de la resta es: '
	tamResta equ $ - mensajeResta

	mensajeMultiplicacion db 10,'El resultado de la multiplicacion es: '
	tamMultiplicacion equ $ - mensajeMultiplicacion

	mensajeDivision db 10,'El resultado de la division es: '
	tamDivision equ $ - mensajeDivision

	mensajeResiduo db 10,"El residuo es: "
	tamResiduo equ $ - mensajeResiduo

	new_line db 10," "


section .bss ;Para variables
	
	n1 resb 1 
	n2 resb 1	
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	division resb 1 
	residuo resb 1

section .text
	global _start
_start:


;Ingreso del numero 1
	
	escribir mensaje1,tam1
	leer n1,2

;Ingreso del numero 2

	escribir mensaje2,tam2
	leer n2,2

jmp dividir

sumar:
;Proceso de suma
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	add al,bl
	add ax,'0'
	mov [suma],ax
	escribir mensajeSuma,tamSuma
	escribir suma,1  
	jmp multiplicar

	
restar:
;Proceso de resta

	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	sub al,bl
	add ax,'0'
	mov [resta],ax
	escribir mensajeResta,tamResta
	escribir resta,1 
	jmp sumar

multiplicar:
;Proceso de multiplicacion

	mov ax,[n1]
	mov bl,[n2]
	sub ax,'0'
	sub bl,'0'
	mul bl
	add ax,'0'
	mov [multiplicacion],ax	
	escribir mensajeMultiplicacion,tamMultiplicacion
	escribir multiplicacion,1
	jmp salir

dividir:
;Proceso de division
	mov al,[n1]
	mov bl,[n2]
	sub ax,'0'
	sub bl,'0'
	div bl

	add al,'0'
	mov [division],al

	add ah,'0'
	mov [residuo],ah

	escribir mensajeDivision,tamDivision
	escribir division,1
	
	escribir mensajeResiduo,tamResiduo
	escribir residuo,1
	jmp restar


salir:
	;***********************final*******************
	;escribir new_line,1
	mov eax,1
	int 80h
