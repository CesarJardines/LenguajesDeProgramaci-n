# Lenguajes de Programación, 2019-2

## Práctica 3: Definición de tipos de datos

**Fecha de entrega: 25 de febrero de 2019**

**Resultado:** 10

### Descripción
La práctica consiste en completar correctamente el cuerpo de las funciones y definiciones faltantes del archivo `practica3.rkt`. No se permiten usar primitivas del Racket que resuelvan directamente los ejercicios.       

### Entrega

La práctica debe descargarse y entregarse mediante el repositorio destinado a esta práctica en la plataforma GitHub Classroom: https://classroom.github.com/a/b0RrYnxr.

### Ejercicios

**Ejercicio 1** Completar la definición del tipo de dato `SnocList`, que representa *listas snoc*. Con los constructores `mt` para representar la lista vacía y `snoc` que recibe una lista y un elemento de cualquier tipo (`any?`) y lo agrega como último elemento de la lista.

```racket
;; Definición del tipo de dato SnocList
(define-type SnocList
   #| Aquí va su código. |#)
```

**Ejercicio 2** Completar el cuerpo de la función `car-sn` que recibe una lista snoc y regresa el primer elemento de ésta.

```racket
;; Función que regresa la cabeza de una lista snoc
;; car-ns: SnocList -> a
(define (car-sn lst)
   #| Aquí va su código. |#)
```

**Ejercicio 3** Completar el cuerpo de la función `cdr-sn` que recibe una lista snoc y regresa una nueva lista con todos los elementos menos el primero.

```racket
;; Función que regresa la cola de una lista snoc
;; cdr-sn: SnocList -> SnocList
(define (cdr-sn lst)
   #| Aquí va su código. |#)
```

**Ejercicio 4** Completar el cuerpo del predicado `elem-sn?` que recibe un elemento y una lista snoc e indica si el elemento pertenece a la lista, es decir, regresa verdadero si el elemento se encuentra en la lista y falso en cualquier otro caso.

```racket
;; Predicado que nos dice si un elemento está en una lista
;; elem-sn?: a SnocList -> boolean
(define (elem-sn e lst)
   #| Aquí va su código. |#)
```

**Ejercicio 5** Completar el cuerpo de la función longitud que recibe una lista snoc y regresa la longitud de ésta. La longitud de una lista se define como el número de elementos de ésta.

```racket
;; Función que regresa la longitud de una lista snoc
;; longitud: SnocList -> number
(define (longitud lst)
   #| Aquí va su código. |# )
```
