# Árbol Genealógico en Prolog

Este documento contiene el código exacto mostrado en la clase (`demo.pl`) junto con las consultas e inferencias lógicas que puedes realizar en el intérprete de SWI-Prolog.

## 1. Código Fuente (`demo.pl`)

Guarda este contenido en tu archivo `demo.pl`:

```prolog
% ===================================
% HECHOS: Género / Categorías
% ===================================
padre(jose).
padre(julio).
padre(luis).
padre(ramiro).

madre(maria).
madre(julia).
madre(guadalupe).
madre(liz).

% ===================================
% HECHOS: Relaciones de Maternidad
% ===================================
madrede(maria, pedro).
madrede(maria, jose).

% ===================================
% HECHOS: Relaciones de Paternidad
% ===================================
padrede(julio, pedro).
padrede(pedro, luis).
padrede(jose, antonio).
padrede(eduardo, ramiro).
padrede(julio, josefo).
padrede(eduardo, lusio).

% ===================================
% REGLAS DE INFERENCIA
% ===================================

% Regla de Abuelos (Abuelo o Abuela)
abuelos(X, Y) :- padrede(X, Z), padrede(Z, Y).
abuelos(X, Y) :- madrede(X, Z), padrede(Z, Y).

% Otras reglas de extensión útiles
progenitor(X, Y) :- padrede(X, Y).
progenitor(X, Y) :- madrede(X, Y).

hermano(X, Y) :- padrede(P, X), padrede(P, Y), X \= Y.

ancestro(X, Y) :- progenitor(X, Y).
ancestro(X, Y) :- progenitor(X, Z), ancestro(Z, Y).
```

## 2. Cargar el Archivo en la Consola de Prolog

Para cargar o recargar el archivo en el intérprete, ejecuta:

```prolog
?- consult("/home/likcos/demo.pl").
% o de forma simplificada:
?- ['demo.pl'].
```

## 3. Consultas Realizadas en Clase

### A. Consulta de Abuelos (`abuelos(X, Y)`)

```prolog
?- abuelos(X, Y).
```

*Presiona `;` repetidamente para recorrer las soluciones:*

* `X = julio, Y = luis ;`
* `X = maria, Y = luis ;`
* `X = maria, Y = antonio.`

### B. Listar todos los pares de (Padre, Hijo)

```prolog
?- padrede(X, Y).
```

*Resultados:*
* `X = julio, Y = pedro ;`
* `X = pedro, Y = luis ;`
* `X = jose, Y = antonio ;`
* `X = eduardo, Y = ramiro ;`
* `X = julio, Y = josefo ;`
* `X = eduardo, Y = lusio.`

### C. ¿Quiénes son los hijos de Eduardo?

```prolog
?- padrede(eduardo, Y).
% Salida:
% Y = ramiro ;
% Y = lusio.
```

### D. ¿Quién es el padre de Josefo?

```prolog
?- padrede(X, josefo).
% Salida:
% X = julio.
```