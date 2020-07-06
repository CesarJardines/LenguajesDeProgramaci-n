# Lenguajes de Programación, 2019-2

## Práctica 2: Estructuras de datos

**Fecha de entrega: 18 de febrero de 2019**

**Resultado:** 7.5

* Nombre del autor

### Descripción
La práctica consiste en completar correctamente el cuerpo de las funciones faltantes del archivo `practica2.rkt`
utilizando la definición de árboles n-arios que se da a continuación. No se permite usar primitivas del
lenguaje Racket que resuelvan directamente los ejercicios.

   ```racket
   ;; predicado que acepta cualquier elemento
   ;; any ? : a -> boolean
   (define (any ? x) #t)
   
   ;; Definición del tipo de dato Ntree, para representar
   ;; árboles n-arios.
   (define-type Ntree
      [node (root any?) (subtrees (listof Ntree?))])
   ```

### Entrega

La práctica debe descargarse y entregarse mediante el repositorio destinado a esta práctica en la plataforma
GitHub Classroom: https://classroom.github.com/a/OAm-feu6.

### Ejercicios

**Ejercicio 1** Completar el cuerpo de la función `map-nt` que recibe una función `f` y un `Ntree` `t` y regresa el
árbol resultante de aplicar `f` a cada uno de los elementos de `t`.

   
   ```racket
   ;; Función map definida para la estructura de datos Ntree.
   ;; recibe una función f y un Ntree t y aplica f a cada
   ;; elemento de t
   ;; map-nt: (a -> b) (Ntree a) -> (Ntree b)
   (define (map-nt f t)
      #| Aquí va su código .|#)
   ```
**Ejercicio 2** Completar el cuerpo de la función `filter-nt` que recibe un predicado, un `Ntree` y regresa
un árbol que conserva únicamente los elementos que cumplan el predicado.

   
   ```racket
   ;; Función filter definida para la estructura de datos Ntree.
   ;; recibe un predicado p , un Ntree t y deja en t únicamente
   ;; los elementos que cumplan el predicado.
   ;; filter-nt: (a -> Bool) (Ntree a) -> (Ntree a)
   (define (filter-nt p t)
      #| Aquí va su código. |#)
   ```

**Ejercicio 3** Completar el cuerpo del predicado `elem-nt?` que dice si un `Ntree` contiene cierto elemento.
Regresando verdadero si el elemento está en el árbol y falso en otro caso.

   
   ```racket
   ;; Predicado que nos dice si un elemento es parte de un Ntree
   ;; elem-nt?: (Ntree a) a -> boolean
   (define (elem-nt? t e)
      #| Aquí va su código. |#)
   ```
   
**Ejercicio 4** Completar el cuerpo de la función `add-nt` que agrega un nuevo elemento a un `Ntree`, es
decir recibe un árbol y un elemento y regresa un nuevo árbol con los elementos del original y el nuevo.

   ```racket
   ;; función que agrega un nuevo elemento a un Ntree
   ;; add-nt: (Ntree a) a -> (Ntree a)
   (define (add-nt t e)
      #| Aquí va su código. |#)
   ```
