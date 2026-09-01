# Descomposición recursiva de billetes y monedas

El siguiente programa en C recibe un billete o moneda y encuentra **todas las combinaciones posibles** para descomponer su valor utilizando denominaciones menores.

Las denominaciones disponibles son:

* $100
* $50
* $20
* $10
* $5
* $2
* $1

## Código

```c
#include <stdio.h>

int denominaciones[] = {100, 50, 20, 10, 5, 2, 1};
int combinacion[100];
int total = 0;

/* Función recursiva */
void descomponer(int cantidad, int posicion, int nivel) {

    /* Caso base */
    if (cantidad == 0) {
        total++;

        printf("%d. ", total);

        for (int i = 0; i < nivel; i++) {
            printf("%d", combinacion[i]);

            if (i < nivel - 1)
                printf(" + ");
        }

        printf("\n");
        return;
    }

    /* Si ya no hay denominaciones */
    if (posicion >= 7 || cantidad < 0)
        return;

    /* Probar usando la denominación actual */
    if (denominaciones[posicion] <= cantidad) {

        combinacion[nivel] = denominaciones[posicion];

        descomponer(
            cantidad - denominaciones[posicion],
            posicion,
            nivel + 1
        );
    }

    /* Probar sin usar la denominación actual */
    descomponer(
        cantidad,
        posicion + 1,
        nivel
    );
}

int main() {

    int valor;

    printf("Ingresa el billete o moneda: ");
    scanf("%d", &valor);

    printf("\nDescomposiciones posibles de $%d:\n\n", valor);

    /* Solo utilizar denominaciones menores */
    int posicion = 0;

    while (posicion < 7 && denominaciones[posicion] >= valor)
        posicion++;

    descomponer(valor, posicion, 0);

    printf("\nTotal de combinaciones: %d\n", total);

    return 0;
}
```

## Ejemplo de ejecución

Si ingresamos:

```text
Ingresa el billete o moneda: 10
```

El programa genera combinaciones como:

```text
1. 5 + 5
2. 5 + 2 + 2 + 1
3. 5 + 2 + 1 + 1 + 1
4. 5 + 1 + 1 + 1 + 1 + 1
5. 2 + 2 + 2 + 2 + 2
...
```

## Funcionamiento

La función:

```c
void descomponer(int cantidad, int posicion, int nivel)
```

utiliza **recursividad** para probar dos posibilidades:

1. **Utilizar la denominación actual**, restándola de la cantidad.
2. **No utilizarla** y pasar a la siguiente denominación.

El proceso continúa hasta que:

```c
cantidad == 0
```

Cuando esto ocurre, significa que se encontró una combinación válida y se imprime.

Por ejemplo, para `$10`, una combinación válida sería:

```text
5 + 2 + 2 + 1 = 10
```

El programa continúa buscando hasta encontrar **todas las combinaciones posibles**.
