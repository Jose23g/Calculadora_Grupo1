#include <iostream>

using namespace std;

int main()
{

	int seleccion = 0;
	short numero1 = 0;
	short numero2 = 0;
	short resultado = 0; 
	short resulta;
	int seguir;

	do {
		cout << "Ingrese una seleccion\n";
		cout << " 1---- Suma \n";
		cout << " 2---- Resta \n";
		cout << " 3---- Multiplicacion \n";
		cout << " 4---- Division \n"; 
		cout << " 5---- Factorial \n"; cin >> seleccion;

		switch (seleccion)
		{
		case 1:
			cout << "\nUsted ha seleccionado suma: 'Suma'\n";
			cout << " Primer digito de suma "; cin >> numero1;
			cout << "Segundo digito de suma"; cin >> numero2;

			_asm
			{
				mov ax, numero1;
				mov bx, numero2;
				add ax, bx;
				mov resultado, ax;
			}

			printf("El resultado es: %d", resultado);

			break; 

		case 2:
			cout << "\nUsted ha seleccionado Restar : 'Resta'\n";
			cout << " Primer digito de resta: "; cin >> numero1;
			cout << "Segundo digito de resta: "; cin >> numero2;

			_asm
			{
				mov ax, numero1;
				mov bx, numero2;
				sub ax, bx;
				mov resultado, ax;
			}

			printf("El resultado es: %d", resultado);

			break;

		case 3:
			cout << "\nUsted ha seleccionado Multiplicacion : 'Multiplicacion'\n";
			cout << " Primer digito de multiplicacion: "; cin >> numero1;
			cout << "Segundo digito de multiplicacion: "; cin >> numero2;

			_asm
			{
				mov ax, numero1;
				mov bx, numero2;
				mul  bx;
				mov resultado, ax;
			}

			printf("El resultado es: %d", resultado);

			break;

		case 4:
			cout << "\nUsted ha seleccionado División : 'Division'\n";
			cout << " Primer digito de Division: "; cin >> numero1;
			cout << "Segundo digito de Division: "; cin >> numero2;

			_asm
			{
				xor dx, dx;
				mov ax, numero1;
				mov bx, numero2;

				div bx; 

				mov resultado, ax;
			}

			printf("El resultado es: %d", resultado);

			break;

		case 5:
			_asm
			{   
				

				.data; Directiva de Inicio de Variables.

				Msg1	byte		"FACTORIAL DE UN NUMERO", 0
				Msg2	byte		"Inserte un Numero N : ", 0
				Msg3	byte		"Resultado ---> ", 0
				Msg4	byte		"! = ", 0
				Msg5	byte		"OVERFLOW - Numero muy grande", 0

				Num		sdword		0; Número.
				Con		sdword		2; Contador.
				Fac		sdword		0; Factorial de Número.

				.code

				main	PROC

				mov			edx, OFFSET Msg1; Muestra Pantalla Inicial.
				call		WriteString
				call		Crlf
				call		Crlf

				mov			edx, OFFSET Msg2; Lectura de N(Num).
				call		WriteString
				call		ReadDec
				call		Crlf
				mov			Num, eax
				cmp			eax, 1
				jne			Ciclo
				mov			Fac, eax
				jmp			Resul

				Ciclo : mov			ebx, Con; Inicia el Cálculo del Factorial.
				mov			eax, 1
				Repet:	imul		ebx
				jo			Error; Si hay overflow, salta a Error.
				cmp			ebx, Num; Revisa si Con = Num.
				je			Resul
				inc			ebx; Incrementa Contador.
				jmp			Repet; Siguiente repetición.

				Error:	mov			edx, OFFSET Msg5; Mensaje de Error.
				call		WriteString
				jmp			Salida

				Resul : mov			Fac, eax; Guarda Factorial.
				mov			edx, OFFSET Msg3; Pantalla de Resultado.
				call		WriteString
				mov			eax, Num
				call		WriteDec
				mov			edx, OFFSET Msg4
				call		WriteString
				mov			eax, Fac
				call		WriteDec

				Salida : call		Crlf
				call		Crlf

				exit

				main	ENDP

				END		main
				
				
			}

			printf("El resultado es: %d", resultado);

			break;

		
			
		}   

		cout << "\nDesea seguir realizando Operaciones \n";
		cout << "1: Si\n"; cin >> seguir;

	    } while (seguir);

		return 0;
}