# Ejercicios de Lógica de Predicados (Lógica de Primer Orden)

Este documento contiene la formalización completa de los ejercicios de la pizarra, desglosando los elementos del lenguaje (dominio, constantes, variables, propiedades y relaciones) y las soluciones a cada proposición.

---

## 1. Elementos del Lenguaje

* **Dominio del discurso ($U$):** El conjunto de todos los objetos de estudio (objetos celestes, animales, personas).
* **Constantes de individuo ($a, b, c...$):**
  * $t$: La Tierra
  * $l$: La Luna
  * $s$: El Sol
* **Variables de individuo ($x, y, z...$):** Símbolos que representan elementos genéricos del dominio.
* **Propiedades (Predicados unarios):**
  * $P(x)$: $x$ es un planeta
  * $S(x)$: $x$ es un satélite
  * $D(x)$: $x$ es un perro
  * $C(x)$: $x$ es un cartero
  * $V(x)$: $x$ es del vecindario
* **Relaciones (Predicados binarios):**
  * $G(x, y)$: $x$ gira alrededor de $y$
  * $M(x, y)$: $x$ muerde a $y$
  * $As(x, y)$: $x$ asusta a $y$

---

## 2. Formalización de Proposiciones

### Grupo A: Proposiciones sobre Objetos Celestes (Atómicas)
1. **La Tierra es un planeta.**
   $$P(t)$$

2. **La Luna no es un planeta.**
   $$\neg P(l)$$

3. **La Luna es un satélite.**
   $$S(l)$$

4. **La Tierra gira alrededor del Sol.**
   $$G(t, s)$$

---

### Grupo B: Cuantificación sobre Objetos Celestes
5. **Todo planeta es un satélite.**
   $$\forall x (P(x) \rightarrow S(x))$$

6. **Todo planeta gira alrededor del Sol.**
   $$\forall x (P(x) \rightarrow G(x, s))$$

7. **Algún planeta gira alrededor de la Luna.**
   $$\exists x (P(x) \land G(x, l))$$

8. **Hay por lo menos un satélite.**
   $$\exists x S(x)$$

---

### Grupo C: Enunciados Complejos (Perros y Carteros)
9. **Todos los perros del vecindario muerden a algún cartero.**
   $$\forall x ((D(x) \land V(x)) \rightarrow \exists y (C(y) \land M(x, y)))$$

10. **Hay un cartero al que lo muerden todos los perros.**
    $$\exists y (C(y) \land \forall x (D(x) \rightarrow M(x, y)))$$

11. **Todos los carteros son mordidos por algún perro.**
    $$\forall y (C(y) \rightarrow \exists x (D(x) \land M(x, y)))$$

12. **Hay un perro que muerde a todos los carteros.**
    $$\exists x (D(x) \land \forall y (C(y) \rightarrow M(x, y)))$$

13. **Todos los perros que asustan a algún cartero, lo muerden.**
    $$\forall x \forall y ((D(x) \land C(y) \land As(x, y)) \rightarrow M(x, y))$$

14. **Hay un perro que muerde a todos los perros que muerden a algún cartero.**
    $$\exists x \left( D(x) \land \forall y \left( (D(y) \land \exists z (C(z) \land M(y, z))) \rightarrow M(x, y) \right) \right)$$

15. **Hay un solo perro que se muerde a sí mismo.**
    $$\exists x \left( D(x) \land M(x, x) \land \forall y ((D(y) \land M(y, y)) \rightarrow x = y) \right)$$