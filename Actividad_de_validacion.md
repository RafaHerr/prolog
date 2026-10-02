# Programas en CLISP

## 1. Cálculo del sueldo de un trabajador

### Descripción

El trabajador tiene un sueldo base de 40,000 euros anuales. El aumento depende de los años que lleve trabajando en la empresa:

- Más de 10 años: aumento del 10%.
- Más de 5 años y hasta 10: aumento del 7%.
- Más de 3 años y hasta 5: aumento del 5%.
- 3 años o menos: aumento del 3%.

### Código

```lisp
(defun calcular-sueldo ()
  (format t "Ingrese los años que lleva en la empresa: ")
  (let ((anios (read)))
    (cond
      ((> anios 10)
       (format t "Sueldo anual: ~,2f euros~%" (* 40000 1.10)))

      ((> anios 5)
       (format t "Sueldo anual: ~,2f euros~%" (* 40000 1.07)))

      ((> anios 3)
       (format t "Sueldo anual: ~,2f euros~%" (* 40000 1.05)))

      (t
       (format t "Sueldo anual: ~,2f euros~%" (* 40000 1.03))))))

(calcular-sueldo)
```

---

## 2. Peso de la ropa en una lavadora

### Descripción

El programa recibe el peso de la ropa en libras y determina el nivel de la lavadora dependiendo del peso:

- Más de 30 libras: la lavadora no funcionará porque es demasiado peso.
- 22 libras o más: nivel máximo.
- 15 libras o más: nivel alto.
- 8 libras o más: nivel medio.
- Menos de 8 libras: nivel mínimo.

Para calcular el agua necesaria se considera que se utilizan 10 litros de agua por cada libra de ropa.

### Código

```lisp
(defun lavar-ropa ()
  (format t "Ingrese el peso de la ropa en libras: ")
  (let ((peso (read)))
    (cond
      ((> peso 30)
       (format t "La lavadora no funcionara, demasiado peso.~%"))

      ((>= peso 22)
       (format t "Nivel: MAXIMO~%")
       (format t "Agua necesaria: ~,2f litros~%" (* peso 10)))

      ((>= peso 15)
       (format t "Nivel: ALTO~%")
       (format t "Agua necesaria: ~,2f litros~%" (* peso 10)))

      ((>= peso 8)
       (format t "Nivel: MEDIO~%")
       (format t "Agua necesaria: ~,2f litros~%" (* peso 10)))

      (t
       (format t "Nivel: MINIMO~%")
       (format t "Agua necesaria: ~,2f litros~%" (* peso 10))))))

(lavar-ropa)
```

---

## 3. Entrada a la fiesta de quince años

### Descripción

El programa recibe la edad de una persona y determina qué requisitos debe cumplir para entrar a la fiesta:

- Menores de 15 años: no pueden entrar.
- Personas con 15 años cumplidos: pueden entrar totalmente gratis.
- Mayores de 15 años: solamente pueden entrar si llevan un regalo.

### Código

```lisp
(defun entrada-fiesta ()
  (format t "Ingrese la edad de la persona: ")
  (let ((edad (read)))
    (cond
      ((< edad 15)
       (format t "No puede entrar a la fiesta.~%"))

      ((= edad 15)
       (format t "Puede entrar gratis.~%"))

      ((> edad 15)
       (format t "Es mayor de 15 años.~%")
       (format t "Debe llevar un regalo para poder entrar.~%")))))

(entrada-fiesta)
```