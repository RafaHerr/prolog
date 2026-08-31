# Validador de Paréntesis

## Objetivo

Crear un programa que permita validar si una cadena de paréntesis de entrada y salida está correctamente balanceada, sin importar la cantidad de paréntesis que se ingresen.

## Código en C

```c
#include <stdio.h>

int main() {
    char entrada[1000];
    int contador = 0;
    int correcto = 1;

    printf("Ingresa los parentesis: ");
    scanf("%s", entrada);

    for (int i = 0; entrada[i] != '\0'; i++) {

        if (entrada[i] == '(') {
            contador++;
        }
        else if (entrada[i] == ')') {
            contador--;

            // Si aparece un parentesis de cierre sin apertura
            if (contador < 0) {
                correcto = 0;
                break;
            }
        }
    }

    // Al terminar deben estar balanceados
    if (contador != 0) {
        correcto = 0;
    }

    if (correcto) {
        printf("Los parentesis estan correctamente balanceados.\n");
    } else {
        printf("Los parentesis NO estan correctamente balanceados.\n");
    }

    return 0;
}