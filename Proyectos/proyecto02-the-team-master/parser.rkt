#lang plai

(require "grammars.rkt")

;; Analizador sintáctico.
;; Regresa el árbol de sintaxis abstracto asociado a la sintaxis concreta.
;; parse: s-expression -> LDP++.

(define (parse sexp)
  (match sexp
    [(? symbol?) (idS sexp)]
    [(? number?) (numS sexp)]
    [(list ’if0 codition then-expr else-expr)
     (if0S (parse codition) (parse then-expr) (parse else-expr))]
    [(list ’with (list id value) body)
     (withS id (parse value) (parse body))]
    [(list ’fun (list param) body)
     (funS param (parse body))]
     [(list op izq der)
     (opS (elige op) (parse izq) (parse der))]
    [(list fun-expr arg)
     (appS (parse fun-expr) (parse arg))]))

(define (elige s)
  (match s
    ['+ +]
    ['- -]
    ['* *]
    ['/ /]
    ['sqrt sqrt]
    ['max max]
    ['min min]
    ['add1 add1]
    ['sub1 sub1]
    ['< <]
    ['> >]
    ['= =]
    ['>= >=]
    ['<= <=]
    ['not not]
    ['zero? zero?]
    ['empty? empty?]))