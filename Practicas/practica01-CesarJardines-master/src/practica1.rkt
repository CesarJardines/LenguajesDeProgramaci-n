#lang plai

#| Lenguajes de Programación, 2019-2
   Práctica 1: Introducción a Racket. |#

;; Función que calcula el área de un triángulo dados sus lados,
;; usando la fórmula de Herón.
;; area-heron: number number number -> number
(define (area-heron a b c)
  #| Aquí va su código. |# 
  (let ([S (/(+ a b c)2)]) (sqrt (* S (- S a) (- S b) (- S c)))))

;; Predicado que dice si n es divisor propio de m
;; divisor-propio?: number number -> number
(define (divisor-propio? n m)
    #| Aquí va su código. |#
  (let ([M (modulo m n)])
    (cond (boolean? (= M 0)))))

;; Función que calcúla la supersuma de un número.
;; supersuma: number -> number
(define (aux x) ;; Funcion auxiliar de la supersuma
  (cond
    [(< x 10) x]
    [else (+ (modulo x 10) (aux(quotient x 10)))]))
(define (supersuma x)
   #| Aquí va su código. |#
  (if (< x 10 ) x (supersuma (aux x))))

;; Función que regresa la representación japonesa de un número.
;; japones: number -> string
;;(define (japones n)
    #| Funciones Auxiliares. |#
(define (num_japoneses n)
  (cond
    [(equal? n 0) "rei"]
    [(equal? n 1) "ichi"]
    [(equal? n 2) "ni"]
    [(equal? n 3) "san"]
    [(equal? n 4) "yon"]
    [(equal? n 5) "go"]
    [(equal? n 6) "roku"]
    [(equal? n 7) "nana"]
    [(equal? n 8) "haci"]
    [(equal? n 9) "kyu"]))

(define (concat n)
  (string-append (num_japoneses(quotient n 10)) " ju " ))
#| Aquí va su código. |#
(define (japones n)
  (cond
    [(< n 10) (num_japoneses n)]
    [(string-append (concat n) (num_japoneses(modulo n 10) ))]
    ))