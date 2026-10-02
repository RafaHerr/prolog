# Áreas y Volúmenes utilizando funciones Lambda en CLISP

## Introducción

Las funciones `lambda` permiten crear operaciones de manera rápida sin tener que definir una función independiente para cada cálculo.

En este ejercicio se utiliza una función general llamada `aplicar-operacion`, que recibe una función `lambda` y una lista de valores. Después, mediante `mapcar`, aplica la operación a cada elemento de la lista.

## 1. Función general

La función que se utilizará como base es:

```lisp
(defun aplicar-operacion (operacion lista)
  (mapcar operacion lista))

Esta función recibe:
- operacion: una función que indica qué cálculo se realizará.
- lista: los valores sobre los cuales se aplicará la operación.
- mapcar: aplica la función a cada elemento de la lista.
2. Áreas
2.1 Área de un cuadrado
Fórmula
Área = lado × lado

Código
(aplicar-operacion
  (lambda (lado) (* lado lado))
  '(2 4 6 8))

Resultado
(4 16 36 64)

2.2 Área de un rectángulo
Fórmula
Área = base × altura

Código
(mapcar
  (lambda (datos)
    (* (first datos) (second datos)))
  '((2 5) (4 6) (3 8) (5 10)))

Resultado
(10 24 24 50)

2.3 Área de un triángulo
Fórmula
Área = (base × altura) / 2

Código
(mapcar
  (lambda (datos)
    (/ (* (first datos) (second datos)) 2))
  '((4 5) (6 8) (10 4) (12 6)))

Resultado
(10 24 20 36)

2.4 Área de un círculo
Fórmula
Área = π × radio²

Código
(mapcar
  (lambda (radio)
    (* pi radio radio))
  '(2 3 4 5))

Resultado aproximado
(12.56637 28.274334 50.26548 78.53982)

2.5 Área de un trapecio
Fórmula
Área = ((base mayor + base menor) × altura) / 2

Código
(mapcar
  (lambda (datos)
    (/ (* (+ (first datos) (second datos))
          (third datos))
       2))
  '((8 4 5) (10 6 4) (12 8 6) (15 9 5)))

Resultado
(30 32 60 60)

2.6 Área de un rombo
Fórmula
Área = (diagonal mayor × diagonal menor) / 2

Código
(mapcar
  (lambda (datos)
    (/ (* (first datos) (second datos)) 2))
  '((8 4) (10 6) (12 8) (14 10)))

Resultado
(16 30 48 70)

2.7 Área de un paralelogramo
Fórmula
Área = base × altura

Código
(mapcar
  (lambda (datos)
    (* (first datos) (second datos)))
  '((5 4) (8 6) (10 7) (12 9)))

Resultado
(20 48 70 108)

2.8 Área de un pentágono regular
Fórmula
Área = (perímetro × apotema) / 2

Como el pentágono tiene 5 lados:
Perímetro = 5 × lado

Código
(mapcar
  (lambda (datos)
    (/ (* (* 5 (first datos)) (second datos)) 2))
  '((4 3) (6 4) (8 5) (10 6)))

Resultado
(30 60 100 150)

2.9 Área de un hexágono regular
Fórmula
Área = (perímetro × apotema) / 2

Como el hexágono tiene 6 lados:
Perímetro = 6 × lado

Código
(mapcar
  (lambda (datos)
    (/ (* (* 6 (first datos)) (second datos)) 2))
  '((4 3) (5 4) (6 5) (8 6)))

Resultado
(36 60 90 144)

2.10 Área de un sector circular
Fórmula
Área = (π × radio² × ángulo) / 360

Código
(mapcar
  (lambda (datos)
    (/ (* pi
          (first datos)
          (first datos)
          (second datos))
       360))
  '((4 90) (5 180) (6 60) (8 45)))

Resultado aproximado
(12.56637 39.26991 18.849556 25.13274)

3. Volúmenes
3.1 Volumen de un cubo
Fórmula
Volumen = lado³

Código
(aplicar-operacion
  (lambda (lado)
    (* lado lado lado))
  '(2 3 4 5))

Resultado
(8 27 64 125)

3.2 Volumen de un prisma rectangular
Fórmula
Volumen = largo × ancho × alto

Código
(mapcar
  (lambda (datos)
    (* (first datos)
       (second datos)
       (third datos)))
  '((2 3 4) (4 5 6) (3 6 8) (5 7 10)))

Resultado
(24 120 144 350)

3.3 Volumen de un cilindro
Fórmula
Volumen = π × radio² × altura

Código
(mapcar
  (lambda (datos)
    (* pi
       (first datos)
       (first datos)
       (second datos)))
  '((2 5) (3 6) (4 8) (5 10)))

Resultado aproximado
(62.83185 169.646 402.12386 785.3982)

3.4 Volumen de un cono
Fórmula
Volumen = (π × radio² × altura) / 3

Código
(mapcar
  (lambda (datos)
    (/ (* pi
          (first datos)
          (first datos)
          (second datos))
       3))
  '((2 5) (3 6) (4 8) (5 10)))

Resultado aproximado
(20.94395 56.548668 134.04129 261.7994)

3.5 Volumen de una esfera
Fórmula
Volumen = (4 × π × radio³) / 3

Código
(mapcar
  (lambda (radio)
    (/ (* 4 pi radio radio radio) 3))
  '(2 3 4 5))

Resultado aproximado
(33.51032 113.09734 268.08258 523.59875)

3.6 Volumen de una pirámide cuadrangular
Fórmula
Volumen = (base × base × altura) / 3

Código
(mapcar
  (lambda (datos)
    (/ (* (first datos)
          (first datos)
          (second datos))
       3))
  '((3 6) (4 9) (5 12) (6 15)))

Resultado
(18 48 100 180)

3.7 Volumen de un prisma triangular
Fórmula
Primero se obtiene el área de la base triangular:
Área de la base = (base × altura) / 2

Después:
Volumen = Área de la base × longitud

Por lo tanto:
Volumen = ((base × altura) / 2) × longitud

Código
(mapcar
  (lambda (datos)
    (* (/ (* (first datos)
             (second datos))
          2)
       (third datos)))
  '((4 5 6) (6 8 10) (8 10 12) (10 12 15)))

Resultado
(60 240 480 900)

3.8 Volumen de un tronco de cono
Fórmula
Volumen = (π × h × (R² + Rr + r²)) / 3

Donde:
R = radio mayor
r = radio menor
h = altura

Código
(mapcar
  (lambda (datos)
    (/ (* pi
          (third datos)
          (+ (* (first datos) (first datos))
             (* (first datos) (second datos))
             (* (second datos) (second datos))))
       3))
  '((5 3 6) (6 4 8) (8 5 10)))

Resultado aproximado
(349.602 653.451 1335.177)

3.9 Volumen de un elipsoide
Fórmula
Volumen = (4 × π × a × b × c) / 3

Código
(mapcar
  (lambda (datos)
    (/ (* 4 pi
          (first datos)
          (second datos)
          (third datos))
       3))
  '((2 3 4) (3 4 5) (4 5 6) (5 6 7)))

Resultado aproximado
(100.53096 251.32741 502.6548 879.64594)

3.10 Volumen de un tetraedro regular
Fórmula
Volumen = lado³ / (6 × √2)

Código
(mapcar
  (lambda (lado)
    (/ (* lado lado lado)
       (* 6 (sqrt 2))))
  '(2 3 4 5))

Resultado aproximado
(0.94280905 3.1819806 7.5424724 14.731391)

4. Programa completo
(defun aplicar-operacion (operacion lista)
  (mapcar operacion lista))

; ==========================================
; AREAS
; ==========================================

; Área de cuadrados
(print
 (aplicar-operacion
  (lambda (lado)
    (* lado lado))
  '(2 4 6 8)))

; Área de rectángulos
(print
 (mapcar
  (lambda (datos)
    (* (first datos) (second datos)))
  '((2 5) (4 6) (3 8) (5 10))))

; Área de triángulos
(print
 (mapcar
  (lambda (datos)
    (/ (* (first datos) (second datos)) 2))
  '((4 5) (6 8) (10 4) (12 6))))

; Área de círculos
(print
 (aplicar-operacion
  (lambda (radio)
    (* pi radio radio))
  '(2 3 4 5)))

; Área de trapecios
(print
 (mapcar
  (lambda (datos)
    (/ (* (+ (first datos) (second datos))
          (third datos))
       2))
  '((8 4 5) (10 6 4) (12 8 6) (15 9 5))))

; Área de rombos
(print
 (mapcar
  (lambda (datos)
    (/ (* (first datos) (second datos)) 2))
  '((8 4) (10 6) (12 8) (14 10))))

; Área de paralelogramos
(print
 (mapcar
  (lambda (datos)
    (* (first datos) (second datos)))
  '((5 4) (8 6) (10 7) (12 9))))

; Área de pentágonos regulares
(print
 (mapcar
  (lambda (datos)
    (/ (* (* 5 (first datos)) (second datos)) 2))
  '((4 3) (6 4) (8 5) (10 6))))

; Área de hexágonos regulares
(print
 (mapcar
  (lambda (datos)
    (/ (* (* 6 (first datos)) (second datos)) 2))
  '((4 3) (5 4) (6 5) (8 6))))

; Área de sectores circulares
(print
 (mapcar
  (lambda (datos)
    (/ (* pi
          (first datos)
          (first datos)
          (second datos))
       360))
  '((4 90) (5 180) (6 60) (8 45))))


; ==========================================
; VOLUMENES
; ==========================================

; Volumen de cubos
(print
 (aplicar-operacion
  (lambda (lado)
    (* lado lado lado))
  '(2 3 4 5)))

; Volumen de prismas rectangulares
(print
 (mapcar
  (lambda (datos)
    (* (first datos)
       (second datos)
       (third datos)))
  '((2 3 4) (4 5 6) (3 6 8) (5 7 10))))

; Volumen de cilindros
(print
 (mapcar
  (lambda (datos)
    (* pi
       (first datos)
       (first datos)
       (second datos)))
  '((2 5) (3 6) (4 8) (5 10))))

; Volumen de conos
(print
 (mapcar
  (lambda (datos)
    (/ (* pi
          (first datos)
          (first datos)
          (second datos))
       3))
  '((2 5) (3 6) (4 8) (5 10))))

; Volumen de esferas
(print
 (mapcar
  (lambda (radio)
    (/ (* 4 pi radio radio radio) 3))
  '(2 3 4 5)))

; Volumen de pirámides cuadrangulares
(print
 (mapcar
  (lambda (datos)
    (/ (* (first datos)
          (first datos)
          (second datos))
       3))
  '((3 6) (4 9) (5 12) (6 15))))

; Volumen de prismas triangulares
(print
 (mapcar
  (lambda (datos)
    (* (/ (* (first datos)
             (second datos))
          2)
       (third datos)))
  '((4 5 6) (6 8 10) (8 10 12) (10 12 15))))

; Volumen de troncos de cono
(print
 (mapcar
  (lambda (datos)
    (/ (* pi
          (third datos)
          (+ (* (first datos) (first datos))
             (* (first datos) (second datos))
             (* (second datos) (second datos))))
       3))
  '((5 3 6) (6 4 8) (8 5 10))))

; Volumen de elipsoides
(print
 (mapcar
  (lambda (datos)
    (/ (* 4 pi
          (first datos)
          (second datos)
          (third datos))
       3))
  '((2 3 4) (3 4 5) (4 5 6) (5 6 7))))

; Volumen de tetraedros regulares
(print
 (mapcar
  (lambda (lado)
    (/ (* lado lado lado)
       (* 6 (sqrt 2))))
  '(2 3 4 5)))

5. Resumen de fórmulas
Áreas
Figura	Fórmula
Cuadrado	lado × lado
Rectángulo	base × altura
Triángulo	(base × altura) / 2
Círculo	π × radio²
Trapecio	((B + b) × h) / 2
Rombo	(D × d) / 2
Paralelogramo	base × altura
Pentágono regular	(perímetro × apotema) / 2
Hexágono regular	(perímetro × apotema) / 2
Sector circular	(π × radio² × ángulo) / 360


Volúmenes
Figura	Fórmula
Cubo	lado³
Prisma rectangular	largo × ancho × alto
Cilindro	π × radio² × altura
Cono	(π × radio² × altura) / 3
Esfera	(4 × π × radio³) / 3
Pirámide cuadrangular	(base × base × altura) / 3
Prisma triangular	((base × altura) / 2) × longitud
Tronco de cono	(π × h × (R² + Rr + r²)) / 3
Elipsoide	(4 × π × a × b × c) / 3
Tetraedro regular	lado³ / (6 × √2)


6. Conclusión
Las funciones lambda permiten realizar diferentes cálculos matemáticos sin necesidad de crear una función independiente para cada fórmula.
La función:
(defun aplicar-operacion (operacion lista)
  (mapcar operacion lista))

puede recibir diferentes funciones lambda.
Por ejemplo, para calcular el área de un cuadrado:
(lambda (lado)
  (* lado lado))

Para calcular el volumen de un cubo:
(lambda (lado)
  (* lado lado lado))

Para calcular el área de un círculo:
(lambda (radio)
  (* pi radio radio))

Y para calcular el volumen de una esfera:
(lambda (radio)
  (/ (* 4 pi radio radio radio) 3))