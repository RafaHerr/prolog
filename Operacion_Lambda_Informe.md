# Operación Lambda — Informe

**Agente:** Rafael Herrera Del Río  
**Materia:** Programación Lógica / CLISP  
**Actividad:** Operación Lambda  

---

# Introducción

La actividad **Operación Lambda** tiene como objetivo practicar el manejo de listas en GNU CLISP utilizando funciones como `car`, `cdr`, `mapcar`, `lambda`, `reduce` y `funcall`.

Durante las diferentes misiones se trabajó con una lista de agentes que contiene información como nombre, edad, nivel, base y puntos. También se utilizó un mensaje cifrado que fue necesario descifrar mediante una transformación de listas.

La actividad permitió practicar tanto el acceso a elementos de listas como la creación de funciones, filtros y funciones que generan otras funciones.

---

# Material interceptado

Los agentes utilizados durante la práctica fueron:

```lisp
((ana 28 3 morelia 120)
 (beto 35 5 uruapan 340)
 (carla 22 1 morelia 45)
 (diego 41 4 zamora 210)
 (elena 30 2 patzcuaro 90)
 (fausto 26 5 morelia 400))
```

Cada agente contiene cinco campos:

| Posición | Campo | Descripción |
|---:|---|---|
| 1 | nombre | Nombre del agente |
| 2 | edad | Edad del agente |
| 3 | nivel | Nivel del agente |
| 4 | base | Ciudad donde se encuentra |
| 5 | puntos | Puntos acumulados |

También se utilizó el siguiente alfabeto:

```lisp
(a b c d e f g h i j k l m n o p q r s t u v w x y z)
```

---

# Misión 1 — El Expediente Desordenado

## Objetivo

Practicar el acceso a diferentes elementos de las listas utilizando `car` y `cdr`.

En esta misión no se utilizaron `nth`, `second` ni `third`.

---

## 1. Tabla de predicción y resultado

| Clave | Expresión | Predicción | CLISP |
|:---:|---|---|---|
| a | `(car (cdr (car *agentes*)))` | `28` | `28` |
| b | `(car (car (cdr *agentes*)))` | `BETO` | `BETO` |
| c | `(cdr (car (cdr (cdr *agentes*))))` | `(22 1 MORELIA 45)` | `(22 1 MORELIA 45)` |
| d | `(car (cdr (cdr (cdr (car (cdr (cdr (cdr *agentes*))))))))` | `ZAMORA` | `ZAMORA` |
| e | `(caddr (cadr *agentes*))` | `5` | `5` |
| f | `(car (cdr (cdr (car (cdr (cdr (cdr (cdr *agentes*))))))))` | `MORELIA` | `MORELIA` |

### Explicación

En todos los casos la predicción coincidió con el resultado de CLISP.

Para obtener cada resultado fue necesario leer las expresiones desde adentro hacia afuera, identificando primero el agente y posteriormente el campo que se quería obtener.

---

## 2. Funciones de acceso

Se crearon cinco funciones utilizando `car` y `cdr`.

```lisp
(defun nombre (ag)
  (car ag))

(defun edad (ag)
  (car (cdr ag)))

(defun nivel (ag)
  (car (cdr (cdr ag))))

(defun base (ag)
  (car (cdr (cdr (cdr ag)))))

(defun puntos (ag)
  (car (cdr (cdr (cdr (cdr ag))))))
```

Estas funciones permiten obtener cada uno de los cinco campos de un agente.

---

## 3. Puntos de Elena

Para obtener los puntos de Elena se puede utilizar:

```lisp
(puntos (car (cdr (cdr (cdr (cdr *agentes*))))))
```

### Salida de CLISP

```text
90
```

Por lo tanto, Elena tiene:

```text
90 puntos
```

---

## 4. ¿Qué devuelve `(car (cdr '(ana)))`?

La expresión:

```lisp
(car (cdr '(ana)))
```

provoca un error.

Esto sucede porque:

```lisp
(cdr '(ana))
```

devuelve:

```lisp
NIL
```

Después se intenta hacer:

```lisp
(car NIL)
```

y `NIL` no contiene ningún elemento que pueda obtenerse mediante `car`.

Esto es peligroso cuando un registro está incompleto porque una función de acceso puede intentar obtener un elemento que no existe y provocar un error.

---

# Misión 2 — El Pase de Lista

## Objetivo

Utilizar `mapcar` para transformar todos los elementos de una lista.

---

## 1. `pase-de-lista`

La función utilizada fue:

```lisp
(defun pase-de-lista (agentes)
  (mapcar #'nombre agentes))
```

### Resultado

```text
(ANA BETO CARLA DIEGO ELENA FAUSTO)
```

La función aplica `nombre` a cada uno de los agentes.

---

## 2. `nombre-y-nivel`

Código:

```lisp
(defun nombre-y-nivel (agentes)
  (mapcar
   (lambda (ag)
     (cons (nombre ag)
           (nivel ag)))
   agentes))
```

### Resultado

```text
((ANA . 3)
 (BETO . 5)
 (CARLA . 1)
 (DIEGO . 4)
 (ELENA . 2)
 (FAUSTO . 5))
```

Se utilizó `cons` para crear pares punteados con el nombre y el nivel.

---

## 3. `cumpleanios`

Código:

```lisp
(defun cumpleanios (agentes)
  (mapcar
   (lambda (ag)
     (list (nombre ag)
           (+ (edad ag) 1)))
   agentes))
```

### Resultado

```text
((ANA 29)
 (BETO 36)
 (CARLA 23)
 (DIEGO 42)
 (ELENA 31)
 (FAUSTO 27))
```

Los datos originales de `*agentes*` no se modificaron.

---

## 4. `aplicar-bonos`

Código:

```lisp
(defun aplicar-bonos (agentes bonos)
  (mapcar
   (lambda (ag bono)
     (+ (puntos ag) bono))
   agentes
   bonos))
```

### Resultado

Los puntos originales y bonos son:

| Agente | Puntos | Bono | Nuevos puntos |
|---|---:|---:|---:|
| ANA | 120 | 10 | 130 |
| BETO | 340 | 0 | 340 |
| CARLA | 45 | 5 | 50 |
| DIEGO | 210 | 20 | 230 |
| ELENA | 90 | 15 | 105 |
| FAUSTO | 400 | 0 | 400 |

Salida:

```text
(130 340 50 230 105 400)
```

---

## 5. ¿Por qué se escribe `#'car` y no solamente `car`?

Se utiliza:

```lisp
#'car
```

para indicar que `car` se está pasando como una función a `mapcar`.

El operador `#'` obtiene el objeto función correspondiente al símbolo.

Por ejemplo:

```lisp
(mapcar #'car '((1 2) (3 4) (5 6)))
```

devuelve:

```text
(1 3 5)
```

---

# Misión 3 — El Mensaje Interceptado

## Objetivo

Descifrar el mensaje utilizando el desplazamiento inverso de César y dos niveles de `mapcar`.

El desplazamiento utilizado para cifrar fue de `+3`, por lo que para descifrar se utiliza:

```lisp
(mod (- n 3) 26)
```

---

## 1. `descifrar-codigo`

Código:

```lisp
(defun descifrar-codigo (n)
  (nth (mod (- n 3) 26)
       *alfabeto*))
```

Esta función recibe un número y devuelve la letra correspondiente.

Por ejemplo:

```lisp
(descifrar-codigo 22)
```

devuelve:

```text
T
```

---

## 2. `descifrar-palabra`

Código:

```lisp
(defun descifrar-palabra (palabra)
  (mapcar #'descifrar-codigo palabra))
```

Esta función aplica `descifrar-codigo` a todos los números de una palabra.

---

## 3. `descifrar-mensaje`

Código:

```lisp
(defun descifrar-mensaje (mensaje)
  (mapcar #'descifrar-palabra mensaje))
```

Aquí se utiliza un `mapcar` para recorrer las palabras del mensaje.

A su vez, `descifrar-palabra` utiliza otro `mapcar` para recorrer los números de cada palabra.

---

## 4. Mensaje descifrado

El resultado obtenido es:

```text
((TRAIDOR)
 (NIVEL)
 (CINCO)
 (FUERA)
 (DE)
 (MORELIA))
```

El mensaje completo se interpreta como:

```text
TRAIDOR NIVEL CINCO FUERA DE MORELIA
```

Por lo tanto, el mensaje indica que el traidor:

- Tiene nivel 5.
- Se encuentra fuera de Morelia.

---

## 5. Versión en una sola expresión

Código:

```lisp
(mapcar
 (lambda (palabra)
   (mapcar
    (lambda (n)
      (nth (mod (- n 3) 26)
           *alfabeto*))
    palabra))
 *interceptado*)
```

Esta expresión utiliza dos `mapcar` anidados:

- El `mapcar` externo recorre las palabras.
- El `mapcar` interno recorre los números de cada palabra.

---

## 6. Comprobación de cifrado

Para comprobar que el mensaje descifrado puede volver a convertirse en el mensaje original se utilizaron:

```lisp
(defun cifrar-codigo (letra)
  (mod (+ (position letra *alfabeto*) 3)
       26))

(defun cifrar-palabra (palabra)
  (mapcar #'cifrar-codigo palabra))

(defun cifrar-mensaje (mensaje)
  (mapcar #'cifrar-palabra mensaje))
```

La comprobación:

```lisp
(equal
 (cifrar-mensaje
  (descifrar-mensaje *interceptado*))
 *interceptado*)
```

devuelve:

```text
T
```

Esto confirma que el cifrado y descifrado son inversos.

---

# Misión 4 — El Traidor

## Objetivo

Encontrar al traidor utilizando un filtro escrito con código.

El mensaje descifrado indica:

```text
NIVEL CINCO FUERA DE MORELIA
```

Por lo tanto, se buscan agentes que cumplan:

```text
Nivel = 5
Base diferente de MORELIA
```

---

## 1. `sospechosos`

Código:

```lisp
(defun sospechosos (agentes)
  (remove nil
          (mapcar
           (lambda (ag)
             (if (and (= (nivel ag) 5)
                      (not (eq (base ag) 'morelia)))
                 (nombre ag)
                 nil))
           agentes)))
```

### Resultado

```text
(BETO)
```

Por lo tanto:

```text
El traidor es BETO.
```

---

## 2. ¿Por qué Beto?

Los agentes con nivel 5 son:

| Agente | Nivel | Base |
|---|---:|---|
| BETO | 5 | URUAPAN |
| FAUSTO | 5 | MORELIA |

El mensaje indica que el traidor está **fuera de Morelia**.

Por lo tanto:

- Beto → Nivel 5 + Uruapan → **Sospechoso**
- Fausto → Nivel 5 + Morelia → No es el traidor

Así, el filtro deja únicamente a:

```text
BETO
```

---

## 3. `leales`

Código:

```lisp
(defun leales (agentes traidor)
  (remove nil
          (mapcar
           (lambda (ag)
             (if (not (eq (nombre ag) traidor))
                 ag
                 nil))
           agentes)))
```

### Resultado

Los agentes leales son:

```text
((ANA 28 3 MORELIA 120)
 (CARLA 22 1 MORELIA 45)
 (DIEGO 41 4 ZAMORA 210)
 (ELENA 30 2 PATZCUARO 90)
 (FAUSTO 26 5 MORELIA 400))
```

---

## 4. `total-puntos`

Código:

```lisp
(defun total-puntos (agentes)
  (reduce #'+
          (mapcar #'puntos agentes)))
```

Los puntos de los leales son:

```text
120 + 45 + 210 + 90 + 400
```

Resultado:

```text
865
```

### Total de puntos de los leales

```text
865 puntos
```

---

## 5. `promedio-edad`

Código:

```lisp
(defun promedio-edad (agentes)
  (/ (reduce #'+
             (mapcar #'edad agentes))
     (length agentes)))
```

Edades de los leales:

```text
28 + 22 + 41 + 30 + 26 = 147
```

Cantidad de leales:

```text
5
```

Por lo tanto:

```text
147 / 5
```

CLISP devuelve:

```text
147/5
```

Esto es un **número racional**.

---

## 6. Promedio en decimal

Para obtener la versión decimal:

```lisp
(float (promedio-edad leales-lista))
```

Resultado:

```text
29.4
```

Por lo tanto:

| Tipo | Resultado |
|---|---:|
| Racional | `147/5` |
| Decimal | `29.4` |

CLISP no devuelve directamente `29.4` porque al dividir dos números enteros conserva el resultado como un número racional exacto.

---

## 7. Deducción de los dos agentes de nivel 5

Los dos agentes de nivel 5 son:

```text
BETO
FAUSTO
```

Si solamente se revisara el nivel, ambos serían sospechosos.

Sin embargo, el mensaje agrega la condición:

```text
FUERA DE MORELIA
```

Beto está en Uruapan y Fausto está en Morelia.

Por lo tanto, la condición de la ubicación permite descartar a Fausto.

### Conclusión

El nivel 5 por sí solo no es suficiente para identificar al traidor. La ubicación es la condición que permite distinguir entre los dos agentes.

---

# Misión 5 — Código Saboteado

## Objetivo

Analizar errores comunes relacionados con `mapcar` y `lambda`.

---

## Tabla de análisis

| ID | ¿Truena? | Resultado / problema | Causa | Corrección |
|---|---|---|---|---|
| S1 | No | `(ANA BETO CARLA DIEGO ELENA FAUSTO)` | `car` es una función válida para `mapcar` | `(mapcar #'car *agentes*)` |
| S2 | Sí | Error de lista lambda | La lista de parámetros de `lambda` está mal formada | `(mapcar (lambda (ag) (nombre ag)) *agentes*)` |
| S3 | Sí | Error de cantidad de argumentos | `mapcar` pasa dos argumentos pero la lambda solamente recibe uno | `(mapcar (lambda (ag bono) (+ (puntos ag) bono)) *agentes* *bonos*)` |
| S4 | No | `(130 340 50)` | `mapcar` termina cuando se acaba la lista más corta | Usar `*bonos*` para procesar todos los agentes |
| S5 | Sí | Error porque no se recibe una función | Se utilizó `quote` en lugar de una función | `(mapcar (lambda (ag) (nombre ag)) *agentes*)` |

---

## S1

Código original:

```lisp
(mapcar car *agentes*)
```

Este fragmento funciona.

Resultado:

```text
(ANA BETO CARLA DIEGO ELENA FAUSTO)
```

Una forma más explícita de escribirlo es:

```lisp
(mapcar #'car *agentes*)
```

---

## S2

Código original:

```lisp
(mapcar (lambda ag (nombre ag)) *agentes*)
```

### Problema

La sintaxis de `lambda` requiere que sus parámetros estén dentro de una lista.

La forma correcta es:

```lisp
(mapcar
 (lambda (ag)
   (nombre ag))
 *agentes*)
```

---

## S3

Código original:

```lisp
(mapcar
 (lambda (ag)
   (puntos ag))
 *agentes*
 *bonos*)
```

### Problema

Se proporcionan dos listas a `mapcar`:

```text
*agentes*
*bonos*
```

Por lo tanto, la función recibe dos argumentos.

La lambda solamente recibe uno:

```lisp
(lambda (ag) ...)
```

La corrección es:

```lisp
(mapcar
 (lambda (ag bono)
   (+ (puntos ag) bono))
 *agentes*
 *bonos*)
```

---

## S4 — Sabotaje silencioso

Código:

```lisp
(mapcar
 (lambda (ag b)
   (+ (puntos ag) b))
 *agentes*
 '(10 0 5))
```

Este código **no genera un error**.

Sin embargo, solamente procesa tres agentes porque la segunda lista solamente contiene tres bonos.

Resultado:

```text
(130 340 50)
```

### ¿Por qué ocurre?

Cuando `mapcar` recibe varias listas, avanza simultáneamente por ellas y termina cuando se acaba la lista más corta.

En este caso:

```text
*agentes* → 6 elementos
bonos → 3 elementos
```

Por lo tanto, solamente se procesan:

```text
3 elementos
```

Este es el **sabotaje silencioso**, porque el programa funciona aparentemente de forma correcta, pero entrega un resultado incompleto.

---

## S5

Código original:

```lisp
(mapcar
 '(lambda (ag)
    (nombre ag))
 *agentes*)
```

### Problema

Se utilizó:

```lisp
'(lambda ...)
```

El apóstrofo convierte la expresión en una lista de datos.

`mapcar` necesita recibir una función.

La forma correcta es:

```lisp
(mapcar
 (lambda (ag)
   (nombre ag))
 *agentes*)
```

o utilizando una función existente:

```lisp
(mapcar #'nombre *agentes*)
```

---

## Sabotaje silencioso

El sabotaje silencioso es:

```text
S4
```

La regla de `mapcar` que explica el resultado es que cuando se proporcionan varias listas, el recorrido termina cuando se termina la lista más corta.

---

# Misión 6 — La Fábrica de Filtros

## Objetivo

Crear funciones que regresan otras funciones mediante `lambda`.

---

## 1. `filtro-nivel`

Código:

```lisp
(defun filtro-nivel (minimo)
  (lambda (ag)
    (>= (nivel ag) minimo)))
```

Esta función recibe un nivel mínimo y devuelve una lambda que permite comprobar si un agente cumple ese nivel.

Ejemplo:

```lisp
(filtro-nivel 4)
```

crea un filtro que busca agentes de nivel 4 o superior.

---

## 2. `filtro-base`

Código:

```lisp
(defun filtro-base (ciudad)
  (lambda (ag)
    (eq (base ag) ciudad)))
```

Ejemplo:

```lisp
(filtro-base 'morelia)
```

crea un filtro que selecciona agentes cuya base sea Morelia.

---

## 3. `y-filtros`

Código:

```lisp
(defun y-filtros (filtro1 filtro2)
  (lambda (ag)
    (and
     (funcall filtro1 ag)
     (funcall filtro2 ag))))
```

Esta función permite combinar dos filtros.

El agente solamente pasa si cumple ambos filtros.

---

## 4. `aplicar-filtro`

Código:

```lisp
(defun aplicar-filtro (filtro agentes)
  (remove nil
          (mapcar
           (lambda (ag)
             (if (funcall filtro ag)
                 ag
                 nil))
           agentes)))
```

Se utiliza la combinación:

```text
mapcar + lambda + remove nil
```

para obtener solamente los agentes que cumplen la condición.

---

# Resultados de los filtros

## 1. Agentes de nivel 4 o más

Filtro:

```lisp
(filtro-nivel 4)
```

Aplicación:

```lisp
(aplicar-filtro
 (filtro-nivel 4)
 *agentes*)
```

Resultado:

```text
((BETO 35 5 URUAPAN 340)
 (DIEGO 41 4 ZAMORA 210)
 (FAUSTO 26 5 MORELIA 400))
```

---

## 2. Agentes de Morelia

Filtro:

```lisp
(filtro-base 'morelia)
```

Resultado:

```text
((ANA 28 3 MORELIA 120)
 (CARLA 22 1 MORELIA 45)
 (FAUSTO 26 5 MORELIA 400))
```

---

## 3. Agentes de Morelia y nivel 3 o más

Filtros:

```lisp
(y-filtros
 (filtro-base 'morelia)
 (filtro-nivel 3))
```

Resultado:

```text
((ANA 28 3 MORELIA 120)
 (FAUSTO 26 5 MORELIA 400))
```

---

# Informe de agentes

La función utilizada es:

```lisp
(defun informe (agentes)
  (mapcar
   (lambda (ag)
     (format t
             "~A (~A) nivel ~A -> ~A pts~%"
             (nombre ag)
             (base ag)
             (nivel ag)
             (puntos ag)))
   agentes)
  (length agentes))
```

Para Morelia y nivel 3 o más, la salida es:

```text
ANA (MORELIA) nivel 3 -> 120 pts
FAUSTO (MORELIA) nivel 5 -> 400 pts
```

Cantidad de agentes reportados:

```text
2
```

---

# Ensamble final

El objetivo es imprimir el informe de los agentes **leales** que tengan nivel 3 o superior.

Primero se identifica al traidor:

```text
BETO
```

Después se obtiene la lista de leales:

```text
ANA
CARLA
DIEGO
ELENA
FAUSTO
```

Finalmente se aplica:

```text
nivel >= 3
```

Los agentes que cumplen son:

```text
ANA
DIEGO
FAUSTO
```

---

## Código del ensamble

```lisp
(let* ((traidor (car (sospechosos *agentes*)))
       (lista-leales (leales *agentes* traidor))
       (filtro (filtro-nivel 3)))

  (informe
   (aplicar-filtro filtro lista-leales)))
```

### Salida

```text
ANA (MORELIA) nivel 3 -> 120 pts
DIEGO (ZAMORA) nivel 4 -> 210 pts
FAUSTO (MORELIA) nivel 5 -> 400 pts
```

Cantidad de agentes:

```text
3
```

---

# Pregunta: ventaja de la fábrica de filtros

La ventaja de:

```lisp
(filtro-nivel 4)
```

es que permite crear filtros de manera dinámica sin tener que escribir una función diferente para cada nivel.

Por ejemplo, se pueden crear:

```lisp
(filtro-nivel 2)
(filtro-nivel 3)
(filtro-nivel 4)
(filtro-nivel 5)
```

utilizando la misma función.

Esto hace que el código sea más reutilizable y flexible.

---

# Autochequeo del agente

| # | Pregunta | Respuesta |
|---:|---|:---:|
| 1 | ¿Mi tabla de la Misión 1 tiene predicción y resultado real? | SÍ |
| 2 | ¿Usé `mapcar` con una función existente y con `lambda`, y con dos listas? | SÍ |
| 3 | ¿Mi descifrado usa dos `mapcar` anidados y obtuve un mensaje legible? | SÍ |
| 4 | ¿El traidor salió de un filtro escrito con código? | SÍ |
| 5 | ¿Distinguí el sabotaje silencioso de los que truenan? | SÍ |
| 6 | ¿Mis filtros de la Misión 6 son funciones que regresan lambdas? | SÍ |
| 7 | ¿`clisp -i mision_lambda.lisp` carga sin errores? | SÍ |

---

# Conclusión

Durante esta actividad se practicó el manejo de listas en CLISP mediante diferentes funciones y técnicas de programación funcional.

En la primera misión se aprendió a navegar registros utilizando `car` y `cdr`. Posteriormente se utilizó `mapcar` para transformar listas completas mediante funciones existentes y funciones `lambda`.

En la tercera misión se aplicó el concepto de listas anidadas para descifrar un mensaje utilizando dos `mapcar`. El mensaje obtenido fue:

```text
TRAIDOR NIVEL CINCO FUERA DE MORELIA
```

A partir de este mensaje se pudo identificar mediante código que el traidor era **Beto**, ya que tenía nivel 5 y su base era Uruapan.

También se utilizaron `remove`, `reduce`, `funcall` y `length` para realizar filtros, sumas y promedios.

En la Misión 5 se analizaron errores comunes de `mapcar` y `lambda`, destacando el sabotaje silencioso producido cuando se utilizan listas de diferentes tamaños.

Finalmente, en la Misión 6 se construyó una fábrica de filtros mediante funciones que regresan `lambda`, demostrando que este método permite reutilizar el código y crear diferentes condiciones de búsqueda de manera sencilla.

La actividad permitió comprender que las listas pueden ser tratadas como datos y transformadas mediante funciones, haciendo que los programas sean más reutilizables y flexibles.