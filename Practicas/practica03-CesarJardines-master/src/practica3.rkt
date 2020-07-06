#lang plai

;; predicado que acepta cualquier elemento
;; any? : a -> boolean 
(define (any? x) #t)

;; Definición del tipo de dato SnocList
(define-type SnocList
   #| Aquí va su código. |#
 [mt]
 [snoc (xs SnocList?) (x any?)])

;; Función que regresa la cabeza de una lista snoc
;; car-ns: SnocList -> a
(define (car-sn lst)
   #| Aquí va su código.|#
 (match lst
   [(snoc xs x)
    (if (equal? xs (mt)) x (car-sn xs))]))
  
;; Función que regresa la cola de una lista snoc
;; cdr-sn: SnocList -> SnocList
(define (cdr-sn lst)
   #| Aquí va su código. (snoc (cdr (snoc-x lst)) (snoc-xs lst))|#
  (match lst
      [(mt) (mt)]    
      [(snoc xs x)
       (if (equal? xs (mt)) (cdr-sn xs) (snoc (cdr-sn xs) x))])) 

;; Predicado que nos dice si un elemento está en una lista
;; elem-sn?: a SnocList -> boolean
(define (elem-sn e lst)
   #| Aquí va su código. |#
  (match lst
    [(snoc xs x) 
     (if (equal? xs e) #t #f)]))

;; Función que regresa la longitud de una lista snoc
;; longitud: SnocList -> number
(define (longitud lst)
   #| Aquí va su código. |#
  (match lst
    [(mt) 0]
     [(snoc xs x) (+ 1 (longitud xs))]))         
