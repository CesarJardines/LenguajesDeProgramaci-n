#lang plai

(require "grammars.rkt")

;; Analizador sintáctico.
;; Regresa el árbol de sintaxis abstracto asociado a la sintaxis concreta.
;; parse: s-expression -> WAE.
(define (parse sexp)
    (match sexp
      [(? symbol?) (id sexp)]
      [(? number?) (num sexp)]
      [(list 'with (list id value) body) (with id (parse value) (parse body))]
      [(list op izq der) (binop (elige op) (parse izq) (parse der))]))

(define (elige s)
  (match s
    ['+ +]
    ['- -]
    ['* *]
    ['/ /]))
