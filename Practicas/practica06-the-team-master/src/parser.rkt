#lang plai

(require "grammars.rkt")

;; Analizador sintáctico.
;; Regresa el árbol de sintaxis abstracto asociado a la sintaxis concreta.
;; parse: s-expression -> FWAE.
(define (parse sexp)
  (match sexp
    [(? symbol?) (idS sexp)]
    [(? number?) (numS sexp)]
    [(list 'with (list id value) body)
     (withS id (parse value) (parse body))]
    [(list 'fun (list param) body)
     (funS param (parse body))]
    [(list op izq der)
     (binopS (elige op) (parse izq) (parse der))]
    [(list fun-expr arg)
     (appS (parse fun-expr) (parse arg))]))

(define (elige s)
  (match s
    ['+ +]
    ['- -]
    ['* *]
    ['/ /]))
