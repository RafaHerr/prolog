# Mini-Akinator en Common Lisp (CLISP)

Este proyecto implementa un juego estilo **Akinator** sencillo en Common Lisp. Utiliza una **estructura de datos en forma de árbol binario de decisión** y se ejecuta mediante **recursión**.

---

## 📋 Descripción del Proyecto

El programa hace una serie de preguntas de opción (Sí/No) para adivinar un personaje o animal. 

* **Nodos internos (Listas):** Contienen una pregunta y dos ramas (`SÍ` y `NO`).
* **Hojas (Cadenas / Strings):** Representan el caso base de la recursión con la respuesta o adivinanza final.

---

## 💻 Código Fuente en Lisp

```lisp
;; ====================================================================
;; MINI-AKINATOR RECURSIVO EN COMMON LISP
;; ====================================================================

;; Definición del árbol de decisión con preguntas y respuestas finales.
;; Estructura: (Pregunta Rama-SI Rama-NO)
(defparameter *arbol-akinator*
  '( "¿Es un animal vertebrado?"
     ;; Rama SÍ (Es vertebrado)
     ( "¿Tiene plumas?"
       ( "¿Puede volar?"
         "un águila"
         "un pingüino" )
       ( "¿Es un mamífero?"
         "un perro"
         "una serpiente" ) )
     ;; Rama NO (No es vertebrado)
     "un insecto o criatura marina sin columna" ))


;; Función recursiva principal del juego
(defun jugar-akinator (nodo)
  (cond
    ;; CASO BASE: Si el nodo es una cadena (string), hemos llegado a una respuesta final.
    ((stringp nodo)
     (format t "~%~%¡Ya sé! ¿Estás pensando en ~A? (s/n): " nodo)
     (let ((respuesta (read)))
       (if (or (eq respuesta 's) (eq respuesta 'si))
           (format t "~%¡Genial! He adivinado correctamente 😎.~%")
           (format t "~%¡Vaya! Me has ganado esta vez. ¡Buen trabajo!~%"))))

    ;; CASO RECURSIVO: Si el nodo es una lista, realizamos la pregunta y descendemos en el árbol.
    (t
     (let ((pregunta (first nodo))
           (rama-si   (second nodo))
           (rama-no   (third nodo)))
       (format t "~%~A (s/n): " pregunta)
       (let ((respuesta (read)))
         (cond
           ;; Si responde 's' o 'si', llamamos a la función recursivamente con la rama izquierda
           ((or (eq respuesta 's) (eq respuesta 'si))
            (jugar-akinator rama-si))
           
           ;; Si responde 'n' o 'no', llamamos a la función recursivamente con la rama derecha
           ((or (eq respuesta 'n) (eq respuesta 'no))
            (jugar-akinator rama-no))
           
           ;; Manejo de entrada inválida: vuelve a llamar al mismo nodo
           (t 
            (format t "Por favor, responde solamente con 's' o 'n'.~%")
            (jugar-akinator nodo))))))))


;; Función de entrada para iniciar el juego
(defun iniciar-juego ()
  (format t "~%==========================================")
  (format t "~%   BIENVENIDO AL MINI-AKINATOR EN CLISP    ")
  (format t "~%==========================================~%")
  (jugar-akinator *arbol-akinator*))
```

---

## 🧠 Explicación del Funcionalidad y Recursión

1. **`stringp` (Evaluación de Caso Base):**
   Comprueba si la variable `nodo` es un texto. Si lo es, la recursión se detiene y la máquina da su respuesta final.
   
2. **Llamadas Recursivas (`jugar-akinator`):**
   Si el nodo no es un texto, extraerá la pregunta y las dos sub-ramas. Según la respuesta digitada (`s` o `n`), se realiza una auto-llamada hacia `rama-si` o `rama-no`.

3. **Manejo de Errores Recursivo:**
   Si el usuario ingresa una opción no válida, el programa vuelve a llamarse a sí mismo pasando el mismo `nodo` actual para repetir la pregunta sin perder el estado del juego.

---

## 🚀 Cómo Ejecutarlo

1. Copia el código en tu archivo `.lisp` o pégalo directamente en la consola interactiva de CLISP/SBCL.
2. Ejecuta la función principal escribiendo:
   ```lisp
   (iniciar-juego)
   ```