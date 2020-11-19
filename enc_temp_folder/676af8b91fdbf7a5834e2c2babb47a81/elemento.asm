; UNIVERSIDAD DE COSTA RICA - SEDE GUANACASTE2
; IF-4000 ARQUITECTURA DE COMPUTADORES
; EJEMPLO: Dado de 6 Dígitos.1
; FECHA: 29/10/2015
; Holis solo estoy probando

INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

Menu: ;esta es una etiqueta se llama menu que sera donde mostraremos las opciones al usuario
     mov ah,0
     mov al,3h ;modo texto
     int 10h ; interrupcion de video

     mov ax,0600h ;limpiar pantalla
     mov bh,0fh ;0 color de fondo negro, f color de letra blanco
     mov cx,0000h
     mov dx,184Fh
     int 10h

     mov ah,02h
     mov bh,00
     mov dh,00
     mov dl,00
     int 10h
     mov dx, mostrarMenu ;nombre del mensaje
     mov ah,09 ; mov ah,09 sirve para presentar el msj en pantalla
     int 21h ;interrupcion de video

     mov ah,08 ;pausa y captura de datos 08 espera que el usuario presione una tecla
     int 21h

     cmp al,49 ; ascii 49 = numero 1 compara lo que tiene el registro ah con el ascii 49 en el reg al
     je op1 ; salto condicional jump equals opcion 1 saltar si es igual a la opcion 1

     cmp al,50 ;compara con opcion 2 apellido
     je op2

     cmp al,51 ;compara con opcion 3 carne
     je op3

     cmp al,52 ;compara con opcion 4 salir
     je op4

     mostrarMenu db 'Universidad San Carlos de Guatemala',13,10 ; 13 es un 'enter' 10 un espacio
                 db 'Facultad de Ingenieria',13,10
                 db 'Escuela de Ciencias y Sistemas',13,10
                 db 'Arquitectura de Computadoras y Ensambladores 1',13,10,13,10
                 db '-.-.MENU.-.-',13,10,13,10
                 db '1. Ver Nombre',13,10
                 db '2. Ver Apellido',13,10
                 db '3. Ver Carne',13,10
                 db '4. Salir',13,10,13,10
                 db 'Seleccione una Opcion$',13,10

END