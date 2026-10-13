# Árbol Genealógico y Reglas de Inferencia en Prolog

Este documento contiene tanto los ejemplos vistos en clase como la implementación completa y corregida para la familia.

---

## Parte 1: Ejemplos Vistos en Clase

### 1. Hechos Básicos (Género)
```prolog
% Hombres / Padres
padre(jose).
padre(julio).
padre(luis).
padre(ramiro).

% Mujeres / Madres
madre(maria).
madre(julia).
madre(guadalupe).
madre(liz).
2. Relaciones Familiares Directas
Prolog
% Paternidad (padrede/2)
padrede(julio, pedro).
padrede(pedro, luis).
padrede(jose, antonio).
padrede(eduardo, ramiro).
padrede(julio, josefo).
padrede(eduardo, lusio).

% Maternidad (madrede/2)
madrede(maria, pedro).
madrede(maria, jose).
3. Regla de Inferencia de Abuelos (Vista en Pizarrón)
Prolog
% X es abuelo/abuela de Y si es progenitor de un intermediario Z que es padre/madre de Y
abuelos(X, Y) :- padrede(X, Z), padrede(Z, Y).
abuelos(X, Y) :- madrede(X, Z), padrede(Z, Y).
Parte 2: Árbol Genealógico Familiar
1. Hechos Básicos (Personas y Género)
Prolog
% --- HOMBRES ---
padre(salomon).
padre(rafael_abuelo).
padre(rafael_padre).
padre(manuel).
padre(hill_tio).
padre(marco).
padre(jesus).
padre(rafael_hermano).
padre(mariano).
padre(quetzalcoatl).
padre(hill_primo).
padre(jorge).
padre(arif).

% --- MUJERES ---
madre(maria_r).
madre(esther).
madre(ibis).
madre(claudia_tia).
madre(xochitl).
madre(ruth).
madre(lucero).
madre(claudia_hermana).
madre(sandra).
madre(monica).
madre(yunuen).
madre(vanessa).
2. Relaciones de Paternidad (padrede/2) y Maternidad (madrede/2)
A. Abuelos y sus Hijos
Prolog
% Salomón y María R son los padres de TODOS los tíos
padrede(salomon, manuel).
padrede(salomon, claudia_tia).
padrede(salomon, xochitl).
padrede(salomon, hill_tio).
padrede(salomon, marco).
padrede(salomon, ruth).
padrede(salomon, jesus).

madrede(maria_r, manuel).
madrede(maria_r, claudia_tia).
madrede(maria_r, xochitl).
madrede(maria_r, hill_tio).
madrede(maria_r, marco).
madrede(maria_r, ruth).
madrede(maria_r, jesus).

% Rafael (abuelo) y Esther son padres de Rafael (padre) e Ibis (madre)
padrede(rafael_abuelo, rafael_padre).
padrede(rafael_abuelo, ibis).

madrede(esther, rafael_padre).
madrede(esther, ibis).
B. Padres y Hermanos
Prolog
% Rafael (padre) e Ibis (madre) son padres de los hermanos
padrede(rafael_padre, lucero).
padrede(rafael_padre, claudia_hermana).
padrede(rafael_padre, sandra).
padrede(rafael_padre, rafael_hermano).

madrede(ibis, lucero).
madrede(ibis, claudia_hermana).
madrede(ibis, sandra).
madrede(ibis, rafael_hermano).
C. Tíos y Primos
Prolog
% Hijos de los tíos/tías (Primos)
padrede(manuel, monica).
padrede(manuel, mariano).

madrede(claudia_tia, quetzalcoatl).

padrede(hill_tio, hill_primo).
padrede(hill_tio, yunuen).

padrede(marco, jorge).

madrede(ruth, vanessa).

padrede(jesus, arif).
3. Reglas de Inferencia Lógica
Prolog
% --- Progenitor ---
progenitor(X, Y) :- padrede(X, Y).
progenitor(X, Y) :- madrede(X, Y).

% --- Abuelos (Regla general) ---
abuelos(X, Y) :- progenitor(X, Z), progenitor(Z, Y).

% --- Hermanos ---
hermano(X, Y) :- 
    progenitor(P, X), 
    progenitor(P, Y), 
    X \== Y.

% --- Tíos ---
tio(T, S) :- 
    hermano(T, P), 
    progenitor(P, S).

% --- Primos ---
primo(X, Y) :- 
    progenitor(P1, X), 
    progenitor(P2, Y), 
    hermano(P1, P2), 
    X \== Y.
4. Ejemplos de Consultas Útiles en Prolog
¿Quiénes son los abuelos de Rafael (hermano)?

Prolog
  ?- abuelos(X, rafael_hermano).
  % Deberá devolver a Rafael (abuelo) y Esther por parte de Rafael (padre),
  % e Ibis por la rama materna correspondiente.
  
¿Quiénes son todos los tíos de Lucero?

Prolog
  ?- tio(X, lucero).
  
¿Quiénes son los primos de Quetzalcoatl?

Prolog
  ?- primo(X, quetzalcoatl).