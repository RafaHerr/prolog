# Fibonacci con ciclos en Java

## Descripción

Este programa genera la secuencia de Fibonacci utilizando un ciclo `for`.

La secuencia de Fibonacci comienza de la siguiente manera:

```text
0, 1, 1, 2, 3, 5, 8, 13, 21, 34...
```

## Código

```java
import java.util.Scanner;

public class FibonacciCiclos {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        int n;
        int a = 0;
        int b = 1;
        int siguiente;

        System.out.print("¿Cuántos números de Fibonacci quieres mostrar? ");
        n = scanner.nextInt();

        System.out.println("Secuencia de Fibonacci:");

        for (int i = 0; i < n; i++) {

            System.out.print(a + " ");

            siguiente = a + b;
            a = b;
            b = siguiente;
        }

        scanner.close();
    }
}
```

## Ejemplo de ejecución

```text
¿Cuántos números de Fibonacci quieres mostrar? 10

Secuencia de Fibonacci:
0 1 1 2 3 5 8 13 21 34
```

## Funcionamiento

El programa utiliza tres variables:

* `a`: almacena el número actual.
* `b`: almacena el siguiente número.
* `siguiente`: almacena la suma de los dos números anteriores.

En cada repetición del ciclo `for` se realiza:

```java
siguiente = a + b;
a = b;
b = siguiente;
```

Esto permite generar la secuencia de Fibonacci utilizando ciclos y sin recurrencia.

## Compilación

Para compilar el programa:

```bash
javac FibonacciCiclos.java
```

Para ejecutarlo:

```bash
java FibonacciCiclos
```

## Autor

Rafael Herrera
