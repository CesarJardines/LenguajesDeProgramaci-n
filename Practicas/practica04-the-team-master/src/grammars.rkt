#lang plai

;; Tipo de dato para representar Árboles de Sintaxis Abstracta.
(define-type WAE
   [id    (i symbol?)]
   [num   (n number?)]
   [binop (f procedure?) (lhs WAE?) (rhs WAE?)]
   [with  (id symbol?) (value WAE?) (body WAE?)])
