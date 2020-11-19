; UNIVERSIDAD DE COSTA RICA - SEDE GUANACASTE2 profesorews
; IF-4000 ARQUITECTURA DE COMPUTADORES
; EJEMPLO 02: Entrada / Salida con Funciones de la Librería Irvine32
; FECHA: 29/10/2015

INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

		.listall

		.data		;Directiva de Inicio de Variables.

Msg1	byte		"Digite un Numero : ",0
Msg2	byte		"El Numero Ingresado es : ",0
Msg3	byte		"El Cuadrado del Numero es : ",0

Num		sdword		0	;Número Ingresado por Usuario.
Pot		sdword		0	;Cuadrado del Número Ingresado.

		.code

main	PROC

		mov		edx, OFFSET	Msg1	;Se pasa a EDX dirección de inicio de Msg1.
		call	WriteString			;Escribe mensaje en consola.

		call	ReadDec				;Lee un número decimal del teclado.
		mov		Num, eax			;Pasa número leído a variable Num.

		call	Crlf				;Pasa cursor a siguiente línea.
		mov		edx, OFFSET	Msg2	;Se pasa a EDX dirección de inicio de Msg2.
		call	WriteString			;Escribe mansaje en consola.
		call	WriteDec			;Escribe contenido de EAX (NUM) en consola.

		imul	Num					;EAX = EAX*NUM = NUM*NUM.
		mov		Pot, eax			;Envia resultado a la variable Pot.

		call	Crlf				;Pasa cursor a siguiente línea.
		mov		edx, OFFSET	Msg3	;Se pasa a EDX dirección de inicio de Msg2.
		call	WriteString			;Escribe mansaje en consola.
		call	WriteDec			;Escribe contenido de EAX (POT) en consola.
		call	Crlf				;Pasa cursor a siguiente línea.

		exit

main	ENDP

END		main
