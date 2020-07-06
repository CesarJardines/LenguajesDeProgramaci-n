#lang plai

#| Lenguajes de Programación, 2019-2
   Práctica 2: Estructuras de datos. |#

;; predicado que acepta cualquier elemento
;; any? : a -> boolean 
(define (any? x)
    #t)

;; Definición del tipo de dato Ntree, para representar árboles n-arios.
(define-type Ntree
    [node (root any?) (subtrees (listof Ntree?))])

;; Función map definida para la estructura de datos Ntree.
;; recibe una función f y un Ntree t y aplica f a cada elemento de t
;; map-nt : (a -> b) (Ntree a) -> (Ntree b)
(define (map-nt f t)
    #| Aquí va su código.|#
 (match t
   [(node r st)
    (let ([sub (map (lambda (x) (map-nt f x)) st)]) (node (f r) sub))]))
  

;; Función filter definida para la estructura de datos Ntree.
;; recibe un predicado p, un Ntree t y deja en t únicamente los elementos que
;; cumplan el predicado.
;; filter-nt : (a -> Bool) (Ntree a) -> (Ntree a)
;;(define (filter-nt p t)
    #| Aquí va su código. |#

;;)

;; Predicado que nos dice si un elemento es parte de un Ntree
;; elem-nt? : (Ntree a) a -> boolean
(define (elem-nt? t e)
    #| Aquí va su código. |#
  (match t
    [(node r st)
     (cond
       [(equal? r e) #t]
       [else (aux_elem? st e)])])
  )

;;Funcion auxiliar de elem-nt
(define (aux_elem? list l)
  (match list
    ['() false]
    [(cons x xs)
     (cond
       [(elem-nt? x l) #t]
       [else (aux_elem? xs l)])])
  )

;;función que agrega un nuevo elemento a un Ntree F
;; add-nt : (Ntree a) a -> (Ntree a)
;;
(define (add-nt t e)
    #| Aquí va su código. |#
  (match t
    [(node r st)
     (node e (append(list (node r '())) st))]))











