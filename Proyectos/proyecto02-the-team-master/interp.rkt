#lang plai

(require "grammars.rkt")

;; Interpretación de expresiones LDP++.
;; interp: LDP++/S -> LDP++/s
(define (interp expr env)
  (match expr
    [(id i) (lookup i env)]
    [(num n) (numV n)]
    [(bool b) (boolV b)]
    [(list l) (interpList l)]
    [(if0 condition then-expr else-expr)
     (if (strict(interp condition env))
         (interp then-expr env)
         (interp else-expr env))]
    [(op f der)
     (numV (f (numV-n (strict (interp der env)))))]
    [(fun param body)
     (closureV param body env)]
    [(app fun-expr arg)
     (let ([fun-val (strict (interp fun-expr env))])
       (interp (closureV-body fun-val)
               (aSub (closureV-param fun-val)
                     (exprV arg env)
                     (closureV-env fun-val))))]
    [(rec param body)
     (cbai (id value env))]))

;;Funcion auxiliar para interpretar listas
(define (interpList l)
  (if (null? l)
      l
      ((interp (car l)) (interpList (cdr l)))))

;;Funcion auxiliar para interpretar rec
(define (cbai id value env)
  (let* ([value-holder (box (numV 1729))]
         [new-env (aRecSub id value-holder env)]
         [named-expr-val (interp expr new-env)])
    (begin
      (set-box! value-holder named-expr-val)
      new-env)))
#|
;;Funcion auxiliar para interpretar rec
(define (cbai id value env)
  (let ([value-holder (box 1729)])
    [new-env (aRecSub id value-holder env)]
    [named-expr-val (interp value new-env)]
    (begin
      (set-box! value-holder named-expr-val new-env))))
|#

;; Reduce expresiones a un valor concreto.
;; strict: LDP++/S-Value? -> LDP++/S-Value?
(define (strict expr)
  (match expr
    [(exprV e env) (strict (interp e env))]
    [else expr]))