# Cambio usando ciclos `for` en C

Este programa recibe una cantidad de dinero y la descompone utilizando las denominaciones disponibles:

* Billetes de $100
* Billetes de $50
* Billetes de $20
* Monedas de $10
* Monedas de $5
* Monedas de $2
* Monedas de $1

Se utilizan ciclos `for` para recorrer las denominaciones.

## Código

```c
#include <stdio.h>

int main() {

    int denominaciones[] = {100, 50, 20, 10, 5, 2, 1};
    int cantidad;
    int cantidadUsada;
    int restante;

    printf("Ingresa la cantidad: $");
    scanf("%d", &cantidad);

    restante = cantidad;

    printf("\nDescomposicion de $%d:\n\n", cantidad);

    for (int i = 0; i < 7; i++) {

        cantidadUsada = restante / denominaciones[i];

        if (cantidadUsada > 0) {

            printf("$%d: %d\n",
                   denominaciones[i],
                   cantidadUsada);

            restante = restante % denominaciones[i];
        }
    }

    printf("\nCambio restante: $%d\n", restante);

    return 0;
}
```

## Ejemplo de ejecución

Si ingresamos:

```text
Ingresa la cantidad: $287
```

El resultado será:

```text
Descomposicion de $287:

$100: 2
$50: 1
$20: 1
$10: 1
$5: 1
$2: 1

Cambio restante: $0
```

## Funcionamiento del `for`

El arreglo contiene las denominaciones ordenadas de mayor a menor:

```c
int denominaciones[] = {100, 50, 20, 10, 5, 2, 1};
```

El ciclo:

```c
for (int i = 0; i < 7; i++)
```

recorre cada denominación.

Por ejemplo, para `$287`:

```text
287 / 100 = 2
287 % 100 = 87

87 / 50 = 1
87 % 50 = 37

37 / 20 = 1
37 % 20 = 17

17 / 10 = 1
17 % 10 = 7

7 / 5 = 1
7 % 5 = 2

2 / 2 = 1
2 % 2 = 0
```

Por lo tanto:

```text
2 × $100
1 × $50
1 × $20
1 × $10
1 × $5
1 × $2
```

Esto representa el **máximo posible de cada denominación**, utilizando la menor cantidad de billetes y monedas.
