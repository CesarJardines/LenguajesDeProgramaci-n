#lang plai

(require "grammars.rkt")

;; Desendulzador.
;; Elimina el azúcar sintáctica de las expresiones devueltas por el analizador sintáctico.
;; desugar: LDP++ -> LDP++/S.
(define (desugar expr)
  (match expr
    [(idS i) (id i)]
    [(numS n) (num n)]
    [(boolS b) (bool b)]
    [(listS l) (lista (desugar l))]
    [(if0S condition then-expr else-expr)
     (if0 (desugar condition)
          (desugar then-expr)
          (desugar else-expr))]
    [(condiS con else-expr)
     (if0 (desugarList con) (desugar else-expr))]
    [(opS f der) (op f (desugar der))]
    [(withS listParam body)
     (fun (desugarList listParam) (desugar body))]
    [(withS* listParam body)
     (fun (desugarList listParam) (desugar body))]
    [(recS param body)
     (rec (desugarList param) (desugar body))]
    [(funS param body)
     (fun (desugarList param) (desugar body))]
    [(appS fun-expr arg)
     (app (desugar fun-expr) (desugar arg))]))

;;Funcion auxiliar que hace desugar en una lista.
(define (desugarList l)
  (if (null? l)
      l
      ((desugar (car l)) (desugarList (cdr l)))))
