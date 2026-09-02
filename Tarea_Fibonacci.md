# Fibonacci Recursivo en Java

## Descripción

Este programa calcula el número correspondiente a una posición de la **secuencia de Fibonacci** utilizando un método **recursivo** en Java.

La secuencia de Fibonacci comienza de la siguiente manera:

```text
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55...
```

Cada número se obtiene sumando los dos números anteriores:

```text
F(n) = F(n-1) + F(n-2)
```

## Código

```java
import java.util.Scanner;

public class Fibonacci {

    public static int fibonacci(int n) {
        if (n == 0) {
            return 0;
        }

        if (n == 1) {
            return 1;
        }

        return fibonacci(n - 1) + fibonacci(n - 2);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingresa la posicion de Fibonacci: ");
        int n = scanner.nextInt();

        if (n < 0) {
            System.out.println("La posicion debe ser mayor o igual a 0.");
        } else {
            System.out.println("Fibonacci(" + n + ") = " + fibonacci(n));
        }

        scanner.close();
    }
}
```

## Funcionamiento

El método `fibonacci()` utiliza recursividad para calcular el resultado.

Los casos base son:

```java
if (n == 0) {
    return 0;
}

if (n == 1) {
    return 1;
}
```

Cuando `n` es mayor que 1, la función se llama nuevamente:

```java
return fibonacci(n - 1) + fibonacci(n - 2);
```

Por ejemplo, para calcular `Fibonacci(5)`:

```text
Fibonacci(5)
= Fibonacci(4) + Fibonacci(3)
= 3 + 2
= 5
```

## Ejemplo de ejecución

```text
Ingresa la posicion de Fibonacci: 10
Fibonacci(10) = 55
```

## Requisitos

* Java JDK 19 o superior.
* Un editor de código como Visual Studio Code, NetBeans o IntelliJ IDEA.

## Autor

Rafael Herrera
