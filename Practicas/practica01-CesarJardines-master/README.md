# Lenguajes de Programación, 2019-2

## Práctica 1: Introducción a Racket

**Fecha de entrega: 11 de febrero de 2019**

**Resultado:** 10

* Nombre del autor

### Descripción
La práctica consiste en completar correctamente el cuerpo de las funciones faltantes del archivo `practica1.rkt`.
No se permite usar primitivas del lenguaje Racket que resuelvan directamente los ejercicios.

### Entrega

La práctica debe descargarse y entregarse mediante el repositorio destinado a esta práctica en la plataforma
GitHub Classroom: https://classroom.github.com/a/Rsec6W_J.

### Ejercicios

**Ejercicio 1.1** Completar el cuerpo de la función `area-heron` la cual calcula el área de un triángulo dados sus
lados, usando la fórmula de Herón. Usar la primitiva `let` para evitar cálculos repetitivos.

Fórmula:  

<img src="https://latex.codecogs.com/gif.latex?A=\sqrt{S(S-a)(S-b)(S-c)}" title="A=\sqrt{S(S-a)(S-b)(S-c)}" />   

dónde *S* es el semiperímetro:   

<img src="https://latex.codecogs.com/gif.latex?S=\frac{a&plus;b&plus;c}{2}" title="S=\frac{a+b+c}{2}" />
   
   ```racket
   ;; Función que calcula el área de un triángulo dados sus lados,
   ;; usando la fórmula de Herón.
   ;; area-heron: number number number -> number
   (define (area-heron a b c)
      #| Aquí va su código .|#)
   ```
**Ejercicio 1.2** Se denomina divisor propio de un número entero *z*, a otro número entero que es divisor de
*z*, pero distinto de *z*. Por ejemplo, los divisores propios de 28 son 1, 2, 4, 7 y 14. Completar el cuerpo
del predicado `divisor-propio?` que dados dos números enteros, determina si el segundo es divisor propio del
primero.
  
   ```racket
   ;; Predicado que dice si n es divisor propio de m
   ;; divisor-propio? : number number -> number
   (define (divisor-propio? n m)
      #| Aquí va su código. |#)
   ```

**Ejercicio 1.3** Completar el cuerpo de la siguiente función que calcula la **supersuma**. Se define la supersuma
de un número como la suma de sus dígitos recursivamente hasta que quede un número entre 0 y 9.

   
   ```racket
   ;; Función que calcúla la supersuma de un número.
   ;; supersuma: number -> number
   (define (supersuma x)
      #| Aquí va su código .|#)
   ```

**Ejercicio 1.4** Los números del 0 al 9 en japonés se nombran de la siguiente manera:

<img src="https://latex.codecogs.com/gif.latex?0&space;\rightarrow&space;rei\par&space;1&space;\rightarrow&space;ichi\par&space;2&space;\rightarrow&space;ni\par&space;3&space;\rightarrow&space;san\par&space;4&space;\rightarrow&space;yon\par&space;5&space;\rightarrow&space;go\par&space;6&space;\rightarrow&space;roku\par&space;7&space;\rightarrow&space;nana\par&space;8&space;\rightarrow&space;haci\par&space;9&space;\rightarrow&space;kyu" title="0 \rightarrow rei\par 1 \rightarrow ichi\par 2 \rightarrow ni\par 3 \rightarrow san\par 4 \rightarrow yon\par 5 \rightarrow go\par 6 \rightarrow roku\par 7 \rightarrow nana\par 8 \rightarrow haci\par 9 \rightarrow kyu" />   

El número 10 se nombra como *ju* y a partir de éste, pueden construirse los números del 11 al 99. Basta
con indicar cuantas veces se suma el diez y cuantas unidades tiene. Por ejemplo:

   * 20 se nombra *ni ju* pues se suma dos (*ni*) veces diez (*ju*).
   * 37 se nombra *san ju nana* pues se suma tres (*san*) veces diez (*ju*) y se tienen siete (*nana*) unidades.
   * 83 se nombra *haci ju san* pues se suma ocho (*haci*) veces diez (*ju*) y se tienen tres (*san*) unidades.
   
Definir la función `japones` que recibe un número entre 0 y 99 y regresa una cadena con su representación
japonesa.
   
   ```racket
   ;; Función que regresa la representación japonesa de un número.
   ;; japones: number -> string
   (define (japones n)
       #| Aquí va su código. |#)
   ```
