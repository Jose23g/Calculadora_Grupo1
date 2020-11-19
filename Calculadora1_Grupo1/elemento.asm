; UNIVERSIDAD DE COSTA RICA - SEDE GUANACASTE2
; IF-4000 ARQUITECTURA DE COMPUTADORES
; EJEMPLO: Dado de 6 Dígitos.1
; FECHA: 29/10/2015
; Holis solo estoy probando

INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

		.listall

		.data		;Directiva de Inicio de Variables. 

Msg1	byte		"DADO EN ENSAMBLADOR : ",0
Msg2	byte		"Numero : ",0
Msg3	byte		"Tirar otra Vez (Y/N)? : ",0

Num		sdword		0		; Número Aleatorio.

		.code

;***********************************************************************
; Función MAIN
;***********************************************************************
		
main	PROC

; Inicializa Generador Aleatorio ***************************************

		call	Randomize

; Despliega Mensaje de Inicial *****************************************

Inicio:	mov		edx, OFFSET Msg1	; EDX apunta a inicio de Msg1.
		call	WriteString
		call	Crlf
		call	CrlF

; Proceso de Tirar el Dado *********************************************

Dado:	mov		edx, OFFSET Msg2	; Escribe Número.
		call	WriteString
					
		call	RanPro				; Genera Número Aleatorio en Tema
		mov		eax,Num
		call	WriteDec
		call	Crlf
		call	Crlf

		mov		edx, OFFSET Msg3	; Despliega Mensaje de Continuar.
		call	WriteString

		call	ReadChar			; Revisa si Continúa.
		cmp		al,'y'
		jne		Final
		call	Clrscr
		jmp		Inicio

Final:	exit

main	ENDP

;***********************************************************************
; Cálculo del Número Aleatorio entre 1 y 6
;***********************************************************************

RanPro	PROC

		mov		eax,6			; Rango Aleatorio de 0 a 5.
		call	RandomRange
		inc		eax				; Pasa Rango Aleatorio de 1 a 6.
		cmp		eax,Num			; Compara si Número no igual a anterior.
		je		RanPro
		mov		Num,eax

		RET
		
RanPro ENDP

;***********************************************************************

END