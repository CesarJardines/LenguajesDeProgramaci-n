#lang plai

(require "grammars.rkt")

;; Desendulzador.
;; Elimina el azúcar sintáctica de las expresiones devueltas por el analizador sintáctico.
;; desugar: FWAE -> FAE.
(define (desugar expr)
  (match expr
    [(idS i) (id i)]
    [(numS n) (num n)]
    [(binopS f izq der) (binop f (desugar izq) (desugar der))]
    [(withS id value body)
     (app (fun id (desugar body)) (desugar value))]
    [(funS param body)
     (fun param (desugar body))]
    [(appS fun-expr arg)
     (app (desugar fun-expr) (desugar arg))]))
