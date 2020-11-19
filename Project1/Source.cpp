#include <iostream>

using namespace std;

int main()
{

	int seleccion = 0;
	short numero1 = 0;
	short numero2 = 0;
	short resultado = 0;


	cout << "Ingrese una seleccion\n";
	cout << "Suma \n"; cin >> seleccion;

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

	}
	return 0;
}