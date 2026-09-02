# Factorial de un número en C

**Autor:** Rafael Herrera

Este programa en C solicita un número al usuario y calcula su factorial utilizando un ciclo `for`.

## Código

```c
#include <stdio.h>

int main() {
    int numero;
    long long factorial = 1;

    printf("Ingresa un numero: ");
    scanf("%d", &numero);

    if (numero < 0) {
        printf("El factorial no existe para numeros negativos.\n");
    } else {
        for (int i = 1; i <= numero; i++) {
            factorial *= i;
        }

        printf("El factorial de %d es: %lld\n", numero, factorial);
    }

    return 0;
}
```

## Instrucciones para compilar

Si estás utilizando **GCC**, abre una terminal en la carpeta donde se encuentra el archivo y ejecuta:

```bash
gcc factorial.c -o factorial
```

Esto generará un archivo ejecutable llamado `factorial`.

### Ejecutar en Windows

```bash
factorial.exe
```

### Ejecutar en Linux / macOS

```bash
./factorial
```

## Ejemplo de ejecución

```text
Ingresa un numero: 5
El factorial de 5 es: 120
```

## Funcionamiento

El factorial de un número se obtiene multiplicando todos los números enteros positivos desde `1` hasta el número indicado.

Por ejemplo:

```text
5! = 5 × 4 × 3 × 2 × 1
5! = 120
```

El programa también verifica que el número ingresado no sea negativo, ya que el factorial no está definido para números enteros negativos.
