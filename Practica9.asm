;Practica que consiste en un menu que pregunta que area se desea calcular y realiza los calculos para obtener la respuesta
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
	
	mensajeInicio db 'Ingresa la opcion que desea realizar:',10,'1. Area cuadrado',10,'2. Area circulo',10,'3. Area rectangulo',10
	tam equ $ - mensajeInicio

	lado db 'Ingrese el lado del cuadrado:' 
	tamLado equ $ - lado

	radio db 10,'Ingrese el radio del circulo:' 
	tamRadio equ $ - radio

	base db 10,'Ingrese la base del rectangulo: '
	tamBase equ $ - base

	altura db 10,'Ingrese la base de la altura del rectangulo '
	tamAltura equ $ - altura

	mensajeCuadrado db 10,'El resultado del area del cuadrado es: '
	tamAreaCuadrado equ $ - mensajeCuadrado

	mensajeCirculo db 10,'El resultado del area del circulo es: '
	tamAreaCirculo equ $ - mensajeCirculo

	mensajeRectangulo db 10,"El resultado del area del rectangulo es: "
	tamAreaRectangulo equ $ - mensajeRectangulo 

	new_line db 10," "


section .bss ;Para variables
	
	opcion resb 1
	lado_cuadrado resb 1 
	radio_circulo resb 1	
	base_rectangulo resb 1
	altura_rectangulo resb 1
	areaCuadrado resb 1
	areaCirculo resb 1
	areaRectangulo resb 1

section .text
	global _start
_start:

;Lectura de la opcion 
	escribir mensajeInicio,tam
	leer opcion,2
	mov ah,[opcion]
	sub ah,'0'

;Para las comparaciones

	cmp ah,1 ;Para area del cuadrado
		je area_cuadrado

	cmp ah,2 ;Si hay igualdad entre ambos se va a restar
		je area_circulo

	cmp ah,3 ;Si hay igualdad entre ambos se va a multiplicar
		je area_rectangulo

	jmp salir

area_cuadrado:
	escribir lado,tamLado
	leer lado_cuadrado,2
	mov ax,[lado_cuadrado]
	mov bl,[lado_cuadrado]
	sub ax,'0'
	sub bl,'0'
	mul bl
	add ax,'0'
	mov [areaCuadrado],ax	
	escribir mensajeCuadrado,tamAreaCuadrado
	escribir areaCuadrado,1
	jmp salir  

area_circulo:
	escribir radio,tamRadio
	leer radio_circulo,2
	mov ax,[radio_circulo]
	mov bl,[radio_circulo]
	sub ax,'0'
	sub bl,'0'
	mul bl
	mov bl,3
	mul bl
	add ax,'0'
	mov [areaCirculo],ax
	escribir mensajeCirculo,tamAreaCirculo
	escribir areaCirculo,1
	jmp salir  

area_rectangulo:
	escribir base,tamBase
	leer base_rectangulo,2
	escribir altura,tamAltura
	leer altura_rectangulo,2
	mov ax,[base_rectangulo]
	mov bl,[altura_rectangulo]
	sub ax,'0'
	sub bl,'0'
	mul bl
	add ax,'0'
	mov [areaRectangulo],ax	
	escribir mensajeRectangulo,tamAreaRectangulo
	escribir areaRectangulo,1
	jmp salir  



salir:
	;***********************final*******************
	;escribir new_line,1
	mov eax,1
	int 80h
