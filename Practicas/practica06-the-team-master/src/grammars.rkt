#lang plai

;; Tipo de dato para representar Árboles de Sintaxis Abstracta.
(define-type FWAE
   [idS    (i symbol?)]
   [numS   (n number?)]
   [binopS (f procedure?) (lhs FWAE?) (rhs FWAE?)]
   [withS  (id symbol?) (value FWAE?) (body FWAE?)]
   [funS   (param symbol?) (body FWAE?)]
   [appS   (fun-expr FWAE?) (arg FWAE?)])

;; Tipo de dato para representar Árboles de Sintaxis Abstracta sin azúcar sintáctica.
(define-type FAE
	[id    (i symbol?)]
	[num   (n number?)]
	[binop (f procedure?) (lhs FAE?) (rhs FAE?)]
	[fun   (param symbol?) (body FAE?)]
	[app   (fun-expr FAE?) (arg FAE?)])

;; Tipo de dato para representar ambientes de evaluación.
(define-type Env1
	[mtSub1]
	[aSub1 (id symbol?) (value FAE?) (rest-env Env1?)])

;; Tipo de dato para representar los resultados devueltos por el intérprete 3.
(define-type FAE-Value
	[numV     (n number?)]
	[closureV (param symbol?) (body FAE?) (env Env2?)])

;; Tipo de dato para representar ambientes de evaluación.
(define-type Env2
	[mtSub2]
	[aSub2 (id symbol?) (value FAE-Value?) (rest-env Env2?)])

;; Función que realiza la búsqueda de variables en el ambiente.
;; lookup: symbol Env -> Fae
(define (lookup sub-id env)
  (match env
    [(mtSub1) (error 'lookup "Free ID")]
    [(aSub1 id value rest-env)
     (if (symbol=? id sub-id)
         value
         (lookup sub-id rest-env))]))

(define (interp expr)
  (match expr
    [(id i) (error 'interp "Fre identifier")]
    [(num n) n]
    [(binop f izq der) (f (interp izq) (interp der))]
    [(fun param body) expr]
    [(app fun-expr arg)
     (let ([fun-val (interp fun-expr)])
       (interp (fun-body fun-val)
               (fun-param fun-val)
               (interp arg)))]))