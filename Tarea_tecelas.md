# Cubrir una cuadrícula 8x8 usando recursividad

## Descripción del problema

Se tiene una cuadrícula de **8x8**, es decir, un total de **64 cuadros**.

Se debe llenar la cuadrícula utilizando piezas en forma de **L**, donde cada pieza está formada por **3 cuadros**, dejando únicamente **un cuadro sin llenar**.

Como:

```text
64 - 1 = 63
```

Y cada pieza ocupa 3 cuadros:

```text
63 / 3 = 21
```

Se necesitan **21 piezas** para cubrir toda la cuadrícula excepto un cuadro.

## Funcionamiento mediante recursividad

El problema se resuelve dividiendo la cuadrícula en cuatro partes iguales.

La cuadrícula de 8x8 se divide de la siguiente manera:

```text
+--------+--------+
|        |        |
|  4x4   |  4x4   |
|        |        |
+--------+--------+
|        |        |
|  4x4   |  4x4   |
|        |        |
+--------+--------+
```

El cuadro vacío se encuentra dentro de uno de los cuatro cuadrantes.

Después se coloca una pieza en forma de `L` en el centro de la cuadrícula, ocupando un cuadro de los otros tres cuadrantes.

De esta forma, cada cuadrante queda con un cuadro que se considera vacío.

Después se aplica nuevamente el mismo procedimiento de manera recursiva.

La división queda:

```text
8x8
 ↓
4 cuadrantes de 4x4
 ↓
cada 4x4 se divide en cuadrantes de 2x2
 ↓
se resuelven las cuadrículas de 2x2
```

Por lo tanto, el tamaño de la cuadrícula va disminuyendo mediante:

```text
8 → 4 → 2
```

Cuando se llega a una cuadrícula de **2x2**, se alcanza el caso base de la recursividad.

## Pseudocódigo

```text
resolver(tablero, tamaño, filaVacia, columnaVacia)

    si tamaño == 2
        colocar una pieza
        terminar

    dividir la cuadrícula en cuatro partes

    determinar en qué cuadrante está el cuadro vacío

    colocar una pieza L en el centro
    ocupando los otros tres cuadrantes

    resolver(cuadrante superior izquierdo)

    resolver(cuadrante superior derecho)

    resolver(cuadrante inferior izquierdo)

    resolver(cuadrante inferior derecho)
```

## Resultado esperado

El resultado será una cuadrícula donde cada número representa una pieza en forma de `L`.

Por ejemplo:

```text
 1  1  2  2  3  3  4  4
 1  5  5  2  3  6  6  4
 7  5  8  8  9  6 10 10
 7  7  8  0  9  9 10 10
11 11 12 12 13 13 14 14
11 15 15 12 13 16 16 14
17 15 18 18 19 16 20 20
17 17 18 18 19 19 20 21
```

El `0` representa el único cuadro que queda vacío.

Cada número corresponde a una pieza formada por **3 cuadros**.

---

# Programa en Java

```java
public class TrominoRecursivo {

    static int[][] tablero = new int[8][8];
    static int pieza = 1;

    public static void main(String[] args) {

        // Cuadro que quedará vacío
        int filaVacia = 3;
        int columnaVacia = 3;

        // Marcar el cuadro vacío
        tablero[filaVacia][columnaVacia] = -1;

        // Resolver la cuadrícula
        cubrir(0, 0, filaVacia, columnaVacia, 8);

        // Mostrar resultado
        mostrarTablero();
    }

    /*
     * fila: fila inicial de la región
     * columna: columna inicial de la región
     * filaVacia: fila del cuadro vacío
     * columnaVacia: columna del cuadro vacío
     * tamano: tamaño de la región
     */
    static void cubrir(int fila, int columna,
                       int filaVacia, int columnaVacia,
                       int tamano) {

        // Caso base: cuadrícula 2x2
        if (tamano == 2) {

            int numeroPieza = pieza++;

            for (int i = fila; i < fila + 2; i++) {
                for (int j = columna; j < columna + 2; j++) {

                    // No llenar el cuadro vacío
                    if (tablero[i][j] == 0) {
                        tablero[i][j] = numeroPieza;
                    }
                }
            }

            return;
        }

        // Mitad de la cuadrícula
        int mitad = tamano / 2;

        /*
         * Determinar en qué cuadrante está
         * el cuadro vacío.
         *
         * 0 = superior izquierdo
         * 1 = superior derecho
         * 2 = inferior izquierdo
         * 3 = inferior derecho
         */
        int cuadrante;

        if (filaVacia < fila + mitad) {

            if (columnaVacia < columna + mitad) {
                cuadrante = 0;
            } else {
                cuadrante = 1;
            }

        } else {

            if (columnaVacia < columna + mitad) {
                cuadrante = 2;
            } else {
                cuadrante = 3;
            }
        }

        // Centro de la región
        int centroFila = fila + mitad;
        int centroColumna = columna + mitad;

        // Número de la nueva pieza
        int numeroPieza = pieza++;

        /*
         * Colocar una pieza L en el centro.
         */

        // Cuadrante superior izquierdo
        if (cuadrante != 0) {
            tablero[centroFila - 1][centroColumna - 1] = numeroPieza;
        }

        // Cuadrante superior derecho
        if (cuadrante != 1) {
            tablero[centroFila - 1][centroColumna] = numeroPieza;
        }

        // Cuadrante inferior izquierdo
        if (cuadrante != 2) {
            tablero[centroFila][centroColumna - 1] = numeroPieza;
        }

        // Cuadrante inferior derecho
        if (cuadrante != 3) {
            tablero[centroFila][centroColumna] = numeroPieza;
        }

        /*
         * Resolver cuadrante superior izquierdo
         */
        int nuevaFila;
        int nuevaColumna;

        if (cuadrante == 0) {
            nuevaFila = filaVacia;
            nuevaColumna = columnaVacia;
        } else {
            nuevaFila = centroFila - 1;
            nuevaColumna = centroColumna - 1;
        }

        cubrir(
            fila,
            columna,
            nuevaFila,
            nuevaColumna,
            mitad
        );

        /*
         * Resolver cuadrante superior derecho
         */
        if (cuadrante == 1) {
            nuevaFila = filaVacia;
            nuevaColumna = columnaVacia;
        } else {
            nuevaFila = centroFila - 1;
            nuevaColumna = centroColumna;
        }

        cubrir(
            fila,
            columna + mitad,
            nuevaFila,
            nuevaColumna,
            mitad
        );

        /*
         * Resolver cuadrante inferior izquierdo
         */
        if (cuadrante == 2) {
            nuevaFila = filaVacia;
            nuevaColumna = columnaVacia;
        } else {
            nuevaFila = centroFila;
            nuevaColumna = centroColumna - 1;
        }

        cubrir(
            fila + mitad,
            columna,
            nuevaFila,
            nuevaColumna,
            mitad
        );

        /*
         * Resolver cuadrante inferior derecho
         */
        if (cuadrante == 3) {
            nuevaFila = filaVacia;
            nuevaColumna = columnaVacia;
        } else {
            nuevaFila = centroFila;
            nuevaColumna = centroColumna;
        }

        cubrir(
            fila + mitad,
            columna + mitad,
            nuevaFila,
            nuevaColumna,
            mitad
        );
    }

    // Mostrar la cuadrícula
    static void mostrarTablero() {

        System.out.println("\nCuadricula 8x8:\n");

        for (int i = 0; i < 8; i++) {

            for (int j = 0; j < 8; j++) {

                if (tablero[i][j] == -1) {
                    System.out.print("  0 ");
                } else {
                    System.out.printf("%3d ", tablero[i][j]);
                }
            }

            System.out.println();
        }
    }
}
```

## Explicación del código

La matriz se crea con:

```java
static int[][] tablero = new int[8][8];
```

El cuadro que permanecerá vacío se determina mediante:

```java
int filaVacia = 3;
int columnaVacia = 3;
```

Después se llama a la función recursiva:

```java
cubrir(0, 0, filaVacia, columnaVacia, 8);
```

La función `cubrir()` divide el problema en cuatro partes y vuelve a llamarse a sí misma:

```java
cubrir(..., mitad);
```

La recursividad termina cuando el tamaño llega a `2x2`:

```java
if (tamano == 2) {
    ...
    return;
}
```

Finalmente, el método:

```java
mostrarTablero();
```

imprime la cuadrícula completa en la consola.

## Conceptos utilizados

* Recursividad
* Matrices bidimensionales
* División de problemas
* Cuadrantes
* Caso base
* Piezas en forma de L
* Algoritmo de cobertura de tablero
* Java

