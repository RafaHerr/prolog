# Funciones de Áreas y Volúmenes en CLISP

## Descripción

Este programa contiene **10 funciones para calcular áreas** de diferentes figuras geométricas y **10 funciones para calcular volúmenes** de diferentes cuerpos geométricos utilizando el lenguaje **CLISP**.

---

## 10 Funciones de Áreas

1. Área de un cuadrado
2. Área de un rectángulo
3. Área de un triángulo
4. Área de un círculo
5. Área de un trapecio
6. Área de un rombo
7. Área de un paralelogramo
8. Área de una elipse
9. Área de un pentágono regular
10. Área de un hexágono regular

```lisp
;;; ============================================
;;; 10 FUNCIONES DE AREAS
;;; ============================================

;;; 1. Área de un cuadrado
(defun area-cuadrado (lado)
  (* lado lado))

;;; 2. Área de un rectángulo
(defun area-rectangulo (base altura)
  (* base altura))

;;; 3. Área de un triángulo
(defun area-triangulo (base altura)
  (/ (* base altura) 2))

;;; 4. Área de un círculo
(defun area-circulo (radio)
  (* pi radio radio))

;;; 5. Área de un trapecio
(defun area-trapecio (base-mayor base-menor altura)
  (/ (* (+ base-mayor base-menor) altura) 2))

;;; 6. Área de un rombo
(defun area-rombo (diagonal-mayor diagonal-menor)
  (/ (* diagonal-mayor diagonal-menor) 2))

;;; 7. Área de un paralelogramo
(defun area-paralelogramo (base altura)
  (* base altura))

;;; 8. Área de una elipse
(defun area-elipse (radio-mayor radio-menor)
  (* pi radio-mayor radio-menor))

;;; 9. Área de un pentágono regular
(defun area-pentagono (perimetro apotema)
  (/ (* perimetro apotema) 2))

;;; 10. Área de un hexágono regular
(defun area-hexagono (lado)
  (* (/ (* 3 (sqrt 3)) 2)
     (* lado lado)))
```

---

## 10 Funciones de Volúmenes

1. Volumen de un cubo
2. Volumen de un prisma rectangular
3. Volumen de un cilindro
4. Volumen de una esfera
5. Volumen de un cono
6. Volumen de una pirámide cuadrangular
7. Volumen de un prisma triangular
8. Volumen de un tetraedro regular
9. Volumen de un elipsoide
10. Volumen de un tronco de cono

```lisp
;;; ============================================
;;; 10 FUNCIONES DE VOLUMENES
;;; ============================================

;;; 1. Volumen de un cubo
(defun volumen-cubo (lado)
  (* lado lado lado))

;;; 2. Volumen de un prisma rectangular
(defun volumen-prisma-rectangular (largo ancho altura)
  (* largo ancho altura))

;;; 3. Volumen de un cilindro
(defun volumen-cilindro (radio altura)
  (* pi radio radio altura))

;;; 4. Volumen de una esfera
(defun volumen-esfera (radio)
  (* (/ 4 3) pi radio radio radio))

;;; 5. Volumen de un cono
(defun volumen-cono (radio altura)
  (* (/ 1 3) pi radio radio altura))

;;; 6. Volumen de una pirámide cuadrangular
(defun volumen-piramide-cuadrangular (lado altura)
  (/ (* lado lado altura) 3))

;;; 7. Volumen de un prisma triangular
(defun volumen-prisma-triangular (base-triangulo altura-triangulo longitud)
  (* (/ (* base-triangulo altura-triangulo) 2)
     longitud))

;;; 8. Volumen de un tetraedro regular
(defun volumen-tetraedro (lado)
  (* (/ (sqrt 2) 12)
     (* lado lado lado)))

;;; 9. Volumen de un elipsoide
(defun volumen-elipsoide (radio-a radio-b radio-c)
  (* (/ 4 3) pi radio-a radio-b radio-c))

;;; 10. Volumen de un tronco de cono
(defun volumen-tronco-cono (radio-mayor radio-menor altura)
  (* (/ pi 3)
     altura
     (+ (* radio-mayor radio-mayor)
        (* radio-mayor radio-menor)
        (* radio-menor radio-menor))))
```

---

## Ejemplos de uso

### Área de un cuadrado

```lisp
(area-cuadrado 5)
```

**Resultado:**

```text
25
```

### Área de un círculo

```lisp
(area-circulo 3)
```

**Resultado aproximado:**

```text
28.274334
```

### Volumen de un cubo

```lisp
(volumen-cubo 4)
```

**Resultado:**

```text
64
```

### Volumen de un cilindro

```lisp
(volumen-cilindro 3 10)
```

**Resultado aproximado:**

```text
282.74335
```

### Volumen de una esfera

```lisp
(volumen-esfera 5)
```

**Resultado aproximado:**

```text
523.59875
```

## Conclusión

El programa permite realizar cálculos geométricos mediante **funciones definidas en CLISP**. Cada función recibe los valores necesarios como parámetros y devuelve directamente el resultado del área o volumen correspondiente.
