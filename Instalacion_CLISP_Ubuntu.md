# Instalación de CLISP en Ubuntu

## Introducción

En esta actividad se realizó la instalación del lenguaje de programación **CLISP** en un sistema operativo **Ubuntu**. CLISP es una implementación del lenguaje **Common Lisp**, utilizado para aprender programación funcional y desarrollar programas mediante el uso de funciones.

## Objetivo

Instalar correctamente **CLISP en Ubuntu** y comprobar su funcionamiento mediante la terminal.

## Desarrollo

### 1. Instalación de CLISP

Primero se abrió la terminal de Ubuntu y se utilizó el siguiente comando:

    sudo apt install clisp

El comando `sudo` permite ejecutar la instalación con permisos de administrador. Por otro lado, `apt install` se utiliza para instalar programas o paquetes en Ubuntu.

El paquete que se instaló fue `clisp`. Ubuntu se encargó de descargar e instalar los archivos necesarios para utilizar el intérprete.

### 2. Ejecutar CLISP

Una vez terminada la instalación, se comprobó que CLISP funcionara correctamente utilizando el siguiente comando:

    clisp

Al ejecutar el comando, se mostró la pantalla de inicio de **GNU CLISP 2.49.93+**, junto con el mensaje:

    Bienvenido a GNU CLISP 2.49.93+

Esto confirma que CLISP fue instalado correctamente y que el intérprete está funcionando.

### 3. Realizar una prueba

Después de iniciar CLISP, se puede escribir código directamente en la terminal.

Por ejemplo, se realizó una operación matemática:

    (+ 5 3)

El resultado obtenido es:

    8

Esto demuestra que el intérprete puede recibir instrucciones en lenguaje Lisp y mostrar el resultado inmediatamente.

### 4. Salir de CLISP

Para cerrar el intérprete de CLISP se puede utilizar el siguiente comando:

    (quit)

## Comandos utilizados

### Instalar CLISP

    sudo apt install clisp

### Ejecutar CLISP

    clisp

### Salir de CLISP

    (quit)

## Conclusión

Se logró instalar correctamente **CLISP en Ubuntu** mediante el administrador de paquetes `apt`. Posteriormente, se ejecutó CLISP desde la terminal y se comprobó que el intérprete **GNU CLISP 2.49.93+** funcionara correctamente.

Con esta instalación, el sistema queda preparado para realizar programas y prácticas utilizando el lenguaje de programación **Common Lisp**.