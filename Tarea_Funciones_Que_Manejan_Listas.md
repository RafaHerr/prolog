# Manejo de Listas en CLISP (`car`, `cdr` y Funciones Compuestas)

## Descripción

Este documento muestra cómo extraer elementos específicos de listas anidadas utilizando combinaciones de las funciones `car` y `cdr` en **CLISP**.

---

## Conceptos Básicos

* **`car`**: Devuelve el primer elemento de una lista.
* **`cdr`**: Devuelve el resto de la lista (todos los elementos excepto el primero).

> **Nota importante:** CLISP admite combinaciones compuestas de hasta 4 letras entre `a` y `d` (por ejemplo, `caddr`, `cdddr`). Para acceder a niveles más profundos o realizar recorridos más largos, es necesario anidar las funciones.

---

## Definición de Listas

```lisp
;;; ============================================
;;; DEFINICIÓN DE LISTAS DE EJEMPLO
;;; ============================================

(setq L1 '(1 2 3 4 5 6 7 8 9 10))
(setq L2 '(1 2 (3 4) (A B C D)))
(setq L3 '((A B C) (R (T X) (Z W))))
(setq L4 '((((a b) (c d) (f g)))))
```

---

## Solución de los Ejercicios

### a) Lista `(1 2 3 4 5 6 7 8 9 10)`

Para extraer los elementos **6**, **8** y **10**:

```lisp
;;; Sacar el 6
(cadr (cddddr L1))

;;; Sacar el 8
(cadr (cddr (cddddr L1)))

;;; Sacar el 10
(cadr (cddddr (cddddr L1)))
```

---

### b) Lista `(1 2 (3 4) (A B C D))`

Para extraer los elementos **D**, **C**, **4**, **2** y **A**:

```lisp
;;; Sacar D
(cadddr (cadddr L2))

;;; Sacar C
(caddr (cadddr L2))

;;; Sacar 4
(cadr (caddr L2))

;;; Sacar 2
(cadr L2)

;;; Sacar A
(caar (cadddr L2))
```

---

### c) Lista `((A B C) (R (T X) (Z W)))`

Para extraer los elementos **W**, **Z**, **T**, **R**, **X** y **A**:

```lisp
;;; Sacar W
(cadr (caddr (cadr L3)))

;;; Sacar Z
(caar (cddr (cadr L3)))

;;; Sacar T
(caar (cadr (cadr L3)))

;;; Sacar R
(caadr L3)

;;; Sacar X
(cadar (cddr (cadr L3)))

;;; Sacar A
(caar L3)
```

---

### d) Lista `((((a b) (c d) (f g))))`

Para extraer los elementos **a**, **b**, **c**, **d**, **f** y **g**:

```lisp
;;; Sacar a
(caaar (car L4))

;;; Sacar b
(cadar (caar L4))

;;; Sacar c
(caar (cadar (car L4)))

;;; Sacar d
(cadar (cadar (car L4)))

;;; Sacar f
(caar (caddar (car L4)))

;;; Sacar g
(cadar (caddar (car L4)))
```

---

## Ejemplos de Uso en la Consola REPL

### Ejemplo 1: Extracción del elemento 6 de L1

```lisp
(cadr (cddddr '(1 2 3 4 5 6 7 8 9 10)))
```

**Resultado:**

```text
6
```

### Ejemplo 2: Extracción del elemento 'D' de L2

```lisp
(cadddr (cadddr '(1 2 (3 4) (A B C D))))
```

**Resultado:**

```text
D
```

### Ejemplo 3: Extracción del elemento 'W' de L3

```lisp
(cadr (caddr (cadr '((A B C) (R (T X) (Z W))))))
```

**Resultado:**

```text
W
```

### Ejemplo 4: Extracción del elemento 'a' de L4

```lisp
(caaar (car '((((a b) (c d) (f g))))))
```

**Resultado:**

```text
A
```

---

## Conclusión

El uso combinado y la anidación adecuada de `car` y `cdr` permite navegar por cualquier estructura de listas en **CLISP**, extrayendo elementos individuales sin importar el nivel de profundidad de los paréntesis.