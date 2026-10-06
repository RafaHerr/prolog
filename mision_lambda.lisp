;;; ============================================================
;;; OPERACION LAMBDA - CLISP
;;; Archivo: mision_lambda.lisp
;;; ============================================================

;;; ============================================================
;;; MATERIAL INTERCEPTADO
;;; ============================================================

;;; Cada agente:
;;; (nombre edad nivel base puntos)

(setq *agentes*
      '((ana    28 3 morelia   120)
        (beto   35 5 uruapan   340)
        (carla  22 1 morelia    45)
        (diego  41 4 zamora    210)
        (elena  30 2 patzcuaro  90)
        (fausto 26 5 morelia   400)))

(setq *alfabeto*
      '(a b c d e f g h i j k l m n o p q r s t u v w x y z))

;;; Mensaje cifrado: una sublista por palabra

(setq *interceptado*
      '((22 20 3 11 6 17 20)
        (16 11 24 7 14)
        (5 11 16 5 17)
        (8 23 7 20 3)
        (6 7)
        (15 17 20 7 14 11 3)))

(setq *bonos* '(10 0 5 20 15 0))


;;; ============================================================
;;; MISION 1 - EL EXPEDIENTE DESORDENADO
;;; ============================================================

;;; ------------------------------------------------------------
;;; Funciones de acceso usando solamente CAR y CDR
;;; ------------------------------------------------------------

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


;;; ------------------------------------------------------------
;;; Predicciones / comprobaciones
;;; ------------------------------------------------------------

(defun mision1-comprobaciones ()
  (format t "~%============================================~%")
  (format t "MISION 1 - COMPROBACIONES~%")
  (format t "============================================~%")

  (format t "a) ~A~%"
          (car (cdr (car *agentes*))))

  (format t "b) ~A~%"
          (car (car (cdr *agentes*))))

  (format t "c) ~A~%"
          (cdr (car (cdr (cdr *agentes*)))))

  (format t "d) ~A~%"
          (car
           (cdr
            (cdr
             (cdr
              (car
               (cdr
                (cdr
                 (cdr *agentes*))))))))

  (format t "e) ~A~%"
          (caddr (cadr *agentes*)))

  (format t "f) ~A~%"
          (car
           (cdr
            (cdr
             (car
              (cdr
               (cdr
                (cdr
                 (cdr *agentes*)))))))))

  (format t "Puntos de Elena: ~A~%"
          (puntos (car (cdr (cdr (cdr (cdr *agentes*)))))))

  (format t "(car (cdr '(ana))) => ")

  ;; Se utiliza HANDLER-CASE porque la expresión genera un error.
  (handler-case
      (format t "~A~%" (car (cdr '(ana))))
    (error (e)
      (format t "ERROR: ~A~%" e)))

  (values))


;;; ============================================================
;;; MISION 2 - EL PASE DE LISTA
;;; ============================================================

;;; ------------------------------------------------------------
;;; 1. Pase de lista
;;; Usa MAPCAR con una función existente, sin LAMBDA.
;;; ------------------------------------------------------------

(defun pase-de-lista (agentes)
  (mapcar #'nombre agentes))


;;; ------------------------------------------------------------
;;; 2. Nombre y nivel
;;; ------------------------------------------------------------

(defun nombre-y-nivel (agentes)
  (mapcar
   (lambda (ag)
     (cons (nombre ag)
           (nivel ag)))
   agentes))


;;; ------------------------------------------------------------
;;; 3. Cumpleaños
;;; ------------------------------------------------------------

(defun cumpleanios (agentes)
  (mapcar
   (lambda (ag)
     (list (nombre ag)
           (+ (edad ag) 1)))
   agentes))


;;; ------------------------------------------------------------
;;; 4. Aplicar bonos
;;; ------------------------------------------------------------

(defun aplicar-bonos (agentes bonos)
  (mapcar
   (lambda (ag bono)
     (+ (puntos ag) bono))
   agentes
   bonos))


;;; ------------------------------------------------------------
;;; Comprobaciones de la Misión 2
;;; ------------------------------------------------------------

(defun mision2-comprobaciones ()
  (format t "~%============================================~%")
  (format t "MISION 2 - COMPROBACIONES~%")
  (format t "============================================~%")

  (format t "Pase de lista:~%~A~%"
          (pase-de-lista *agentes*))

  (format t "Nombre y nivel:~%~A~%"
          (nombre-y-nivel *agentes*))

  (format t "Cumpleanios:~%~A~%"
          (cumpleanios *agentes*))

  (format t "Aplicar bonos:~%~A~%"
          (aplicar-bonos *agentes* *bonos*))

  (values))


;;; ============================================================
;;; MISION 3 - EL MENSAJE INTERCEPTADO
;;; ============================================================

;;; ------------------------------------------------------------
;;; 1. Descifrar un código
;;; ------------------------------------------------------------

(defun descifrar-codigo (n)
  (nth (mod (- n 3) 26)
       *alfabeto*))


;;; ------------------------------------------------------------
;;; 2. Descifrar una palabra
;;; ------------------------------------------------------------

(defun descifrar-palabra (palabra)
  (mapcar #'descifrar-codigo palabra))


;;; ------------------------------------------------------------
;;; 3. Descifrar mensaje
;;; ------------------------------------------------------------

(defun descifrar-mensaje (mensaje)
  (mapcar #'descifrar-palabra mensaje))


;;; ------------------------------------------------------------
;;; 4. Descifrar mensaje en una sola expresión
;;; ------------------------------------------------------------

(defun descifrar-mensaje-directo (mensaje)
  (mapcar
   (lambda (palabra)
     (mapcar
      (lambda (n)
        (nth (mod (- n 3) 26)
             *alfabeto*))
      palabra))
   mensaje))


;;; ------------------------------------------------------------
;;; 5. Cifrar una letra
;;; ------------------------------------------------------------

(defun cifrar-codigo (letra)
  (mod (+ (position letra *alfabeto*) 3)
       26))


;;; ------------------------------------------------------------
;;; 6. Cifrar una palabra
;;; ------------------------------------------------------------

(defun cifrar-palabra (palabra)
  (mapcar #'cifrar-codigo palabra))


;;; ------------------------------------------------------------
;;; 7. Cifrar mensaje completo
;;; ------------------------------------------------------------

(defun cifrar-mensaje (mensaje)
  (mapcar #'cifrar-palabra mensaje))


;;; ------------------------------------------------------------
;;; Comprobaciones de la Misión 3
;;; ------------------------------------------------------------

(defun mision3-comprobaciones ()
  (format t "~%============================================~%")
  (format t "MISION 3 - MENSAJE INTERCEPTADO~%")
  (format t "============================================~%")

  (format t "Mensaje descifrado:~%~A~%"
          (descifrar-mensaje *interceptado*))

  (format t "Mensaje descifrado con una sola expresion:~%~A~%"
          (descifrar-mensaje-directo *interceptado*))

  (format t "Comprobacion de cifrado:~%~A~%"
          (equal
           (cifrar-mensaje
            (descifrar-mensaje *interceptado*))
           *interceptado*))

  (values))


;;; ============================================================
;;; MISION 4 - EL TRAIDOR
;;; ============================================================

;;; El mensaje descifrado indica:
;;;
;;; TRAIDOR
;;; NIVEL CINCO
;;; FUERA DE MORELIA
;;;
;;; Por lo tanto buscamos:
;;; - nivel = 5
;;; - base diferente de MORELIA


;;; ------------------------------------------------------------
;;; 1. Sospechosos
;;; ------------------------------------------------------------

(defun sospechosos (agentes)
  (remove nil
          (mapcar
           (lambda (ag)
             (if (and (= (nivel ag) 5)
                      (not (eq (base ag) 'morelia)))
                 (nombre ag)
                 nil))
           agentes)))


;;; ------------------------------------------------------------
;;; 2. Leales
;;; ------------------------------------------------------------

(defun leales (agentes traidor)
  (remove nil
          (mapcar
           (lambda (ag)
             (if (not (eq (nombre ag) traidor))
                 ag
                 nil))
           agentes)))


;;; ------------------------------------------------------------
;;; 3. Total de puntos
;;; ------------------------------------------------------------

(defun total-puntos (agentes)
  (reduce #'+
          (mapcar #'puntos agentes)))


;;; ------------------------------------------------------------
;;; 4. Promedio de edad
;;; ------------------------------------------------------------

(defun promedio-edad (agentes)
  (/ (reduce #'+
             (mapcar #'edad agentes))
     (length agentes)))


;;; ------------------------------------------------------------
;;; Promedio decimal
;;; ------------------------------------------------------------

(defun promedio-edad-decimal (agentes)
  (float
   (promedio-edad agentes)))


;;; ------------------------------------------------------------
;;; Comprobaciones de la Misión 4
;;; ------------------------------------------------------------

(defun mision4-comprobaciones ()
  (let* ((sosps (sospechosos *agentes*))
         (traidor (car sosps))
         (leales-lista (leales *agentes* traidor)))

    (format t "~%============================================~%")
    (format t "MISION 4 - EL TRAIDOR~%")
    (format t "============================================~%")

    (format t "Sospechosos: ~A~%"
            sosps)

    (format t "Traidor: ~A~%"
            traidor)

    (format t "Leales:~%~A~%"
            leales-lista)

    (format t "Total de puntos de los leales: ~A~%"
            (total-puntos leales-lista))

    (format t "Promedio de edad racional: ~A~%"
            (promedio-edad leales-lista))

    (format t "Promedio de edad decimal: ~A~%"
            (promedio-edad-decimal leales-lista))

    (values)))


;;; ============================================================
;;; MISION 5 - CODIGO SABOTEADO
;;; ============================================================

;;; Los fragmentos originales de la actividad son:
;;;
;;; S1:
;;; (mapcar car *agentes*)
;;;
;;; S2:
;;; (mapcar (lambda ag (nombre ag)) *agentes*)
;;;
;;; S3:
;;; (mapcar (lambda (ag) (puntos ag)) *agentes* *bonos*)
;;;
;;; S4:
;;; (mapcar (lambda (ag b) (+ (puntos ag) b))
;;;         *agentes* '(10 0 5))
;;;
;;; S5:
;;; (mapcar '(lambda (ag) (nombre ag)) *agentes*)


;;; ------------------------------------------------------------
;;; S1 - Funciona correctamente
;;; ------------------------------------------------------------

(defun sabotaje-s1 ()
  (mapcar car *agentes*))


;;; ------------------------------------------------------------
;;; S2 - Error por lista lambda incorrecta
;;; ------------------------------------------------------------

(defun sabotaje-s2 ()
  (handler-case
      (eval
       '(mapcar
         (lambda ag
           (nombre ag))
         *agentes*))
    (error (e)
      (format nil "ERROR: ~A" e))))


;;; ------------------------------------------------------------
;;; S3 - Error porque MAPCAR pasa dos argumentos
;;; y la lambda solamente recibe uno.
;;; ------------------------------------------------------------

(defun sabotaje-s3 ()
  (handler-case
      (mapcar
       (lambda (ag)
         (puntos ag))
       *agentes*
       *bonos*)
    (error (e)
      (format nil "ERROR: ~A" e))))


;;; ------------------------------------------------------------
;;; S4 - Sabotaje silencioso
;;; Solo utiliza los primeros tres agentes porque MAPCAR
;;; termina cuando se acaba la lista mas corta.
;;; ------------------------------------------------------------

(defun sabotaje-s4 ()
  (mapcar
   (lambda (ag b)
     (+ (puntos ag) b))
   *agentes*
   '(10 0 5)))


;;; ------------------------------------------------------------
;;; S5 - Error porque se usa QUOTE en lugar de #' .
;;; ------------------------------------------------------------

(defun sabotaje-s5 ()
  (handler-case
      (mapcar
       '(lambda (ag)
          (nombre ag))
       *agentes*)
    (error (e)
      (format nil "ERROR: ~A" e))))


;;; ------------------------------------------------------------
;;; Versiones corregidas
;;; ------------------------------------------------------------

(defun corregido-s1 ()
  (mapcar #'car *agentes*))


(defun corregido-s2 ()
  (mapcar
   (lambda (ag)
     (nombre ag))
   *agentes*))


(defun corregido-s3 ()
  (mapcar
   (lambda (ag bono)
     (+ (puntos ag) bono))
   *agentes*
   *bonos*))


(defun corregido-s4 ()
  (mapcar
   (lambda (ag bono)
     (+ (puntos ag) bono))
   *agentes*
   *bonos*))


(defun corregido-s5 ()
  (mapcar
   (lambda (ag)
     (nombre ag))
   *agentes*))


;;; ------------------------------------------------------------
;;; Comprobaciones de la Misión 5
;;; ------------------------------------------------------------

(defun mision5-comprobaciones ()
  (format t "~%============================================~%")
  (format t "MISION 5 - CODIGO SABOTEADO~%")
  (format t "============================================~%")

  (format t "S1 resultado: ~A~%"
          (sabotaje-s1))

  (format t "S2 resultado/error: ~A~%"
          (sabotaje-s2))

  (format t "S3 resultado/error: ~A~%"
          (sabotaje-s3))

  (format t "S4 resultado: ~A~%"
          (sabotaje-s4))

  (format t "S5 resultado/error: ~A~%"
          (sabotaje-s5))

  (format t "~%Correcciones:~%")

  (format t "S1 corregido: ~A~%"
          (corregido-s1))

  (format t "S2 corregido: ~A~%"
          (corregido-s2))

  (format t "S3 corregido: ~A~%"
          (corregido-s3))

  (format t "S4 corregido: ~A~%"
          (corregido-s4))

  (format t "S5 corregido: ~A~%"
          (corregido-s5))

  (values))


;;; ============================================================
;;; MISION 6 - LA FABRICA DE FILTROS
;;; ============================================================

;;; ------------------------------------------------------------
;;; 1. Filtro por nivel
;;; ------------------------------------------------------------

(defun filtro-nivel (minimo)
  (lambda (ag)
    (>= (nivel ag) minimo)))


;;; ------------------------------------------------------------
;;; 2. Filtro por base
;;; ------------------------------------------------------------

(defun filtro-base (ciudad)
  (lambda (ag)
    (eq (base ag) ciudad)))


;;; ------------------------------------------------------------
;;; 3. Combinar dos filtros
;;; ------------------------------------------------------------

(defun y-filtros (filtro1 filtro2)
  (lambda (ag)
    (and
     (funcall filtro1 ag)
     (funcall filtro2 ag))))


;;; ------------------------------------------------------------
;;; 4. Aplicar filtro
;;; ------------------------------------------------------------

(defun aplicar-filtro (filtro agentes)
  (remove nil
          (mapcar
           (lambda (ag)
             (if (funcall filtro ag)
                 ag
                 nil))
           agentes)))


;;; ------------------------------------------------------------
;;; 5. Informe
;;; ------------------------------------------------------------

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


;;; ------------------------------------------------------------
;;; Comprobaciones de la Misión 6
;;; ------------------------------------------------------------

(defun mision6-comprobaciones ()
  (let ((filtro-nivel-4 (filtro-nivel 4))
        (filtro-morelia (filtro-base 'morelia))
        (filtro-morelia-nivel
          (y-filtros
           (filtro-base 'morelia)
           (filtro-nivel 3))))

    (format t "~%============================================~%")
    (format t "MISION 6 - FABRICA DE FILTROS~%")
    (format t "============================================~%")

    (format t "~%Agentes de nivel 4 o mas:~%")
    (format t "~A~%"
            (aplicar-filtro
             filtro-nivel-4
             *agentes*))

    (format t "~%Agentes de Morelia:~%")
    (format t "~A~%"
            (aplicar-filtro
             filtro-morelia
             *agentes*))

    (format t "~%Agentes de Morelia y nivel 3 o mas:~%")
    (format t "~A~%"
            (aplicar-filtro
             filtro-morelia-nivel
             *agentes*))

    (format t "~%Informe de Morelia y nivel 3 o mas:~%")
    (informe
     (aplicar-filtro
      filtro-morelia-nivel
      *agentes*))

    (values)))


;;; ============================================================
;;; ENSAMBLE FINAL
;;; ============================================================

;;; Esta expresion:
;;; 1. Encuentra al traidor.
;;; 2. Obtiene los leales.
;;; 3. Crea un filtro de nivel 3 o mas.
;;; 4. Aplica el filtro a los leales.
;;; 5. Imprime el informe.

(defun ensamble-final ()
  (let* ((traidor (car (sospechosos *agentes*)))
         (lista-leales (leales *agentes* traidor))
         (filtro (filtro-nivel 3)))

    (informe
     (aplicar-filtro filtro lista-leales))))


;;; ============================================================
;;; PRUEBA GENERAL
;;; ============================================================

(defun ejecutar-todo ()
  (mision1-comprobaciones)
  (mision2-comprobaciones)
  (mision3-comprobaciones)
  (mision4-comprobaciones)
  (mision5-comprobaciones)
  (mision6-comprobaciones)

  (format t "~%============================================~%")
  (format t "ENSAMBLE FINAL~%")
  (format t "============================================~%")

  (ensamble-final)

  (format t "~%Operacion terminada.~%")
  (values))


;;; ============================================================
;;; FIN DEL ARCHIVO
;;; ============================================================