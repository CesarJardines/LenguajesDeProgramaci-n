#lang plai
;; Tipo de dato para representar Árboles de Sintáxis Abstracta.
(define-type LDP++
  [idS (i symbol?)]
  [numS (n number?)]
  [boolS (b boolean?)]
  [listS (l (listof LDP++?))]
  [opS (f procedure?) (h (listof LDP++?))]
  [if0S (condition LDP++?) (then-expr LDP++?) (else-expr LDP++?)]
  [condiS (listof condicionS) (else-expr LDP++?)]
  [withS (l (listof asignacionS)) (body LDP++?)]
  [withS* (l (listof asignacionS)) (body LDP++?)]
  [recS (l (listof asignacionS)) (body LDP++?)]
  [funS (l (listof idS)) (expr LDP++?)]
  [appS (fun-expr LDP++?) (arg LDP++?)])

;; Tipo auxiliar para funciones n-arias
(define-type asignacioneS
  [asignacionS (idS symbol?) (body LDP++?)])

;; Tipo auxiliar para funciones n-arias
(define-type condicionaleS
  [condicionS (expr1 LDP++?) (expr2 LDP++?)])

;; Tipo de dato para representar Árboles de Sintaxis Abstracta sin azúcar sintáctica.
(define-type LDP++/S
  [id (i symbol?)]
  [num (n number?)]
  [bool (b boolean?)]
  [lista (l (listof LDP++?))]
  [op (f procedure?) (h (listof LDP++?))]
  [if0 (condition LDP++?) (then-expr LDP++?) (else-expr LDP++?)]
  [rec (l (listof asignacionS)) (body LDP++?)]
  [fun (l (listof idS)) (expr LDP++?)]
  [app (fun-expr LDP++/S?) (arg LDP++/S?)])

;; Tipo de dato para representar los resultados devueltos por el intérprete.
(define-type LDP++/S-Value
  [numV (n number?)]
  [boolV (b boolean?)]
  [listaV (l list?)]
  [closureV (param symbol?) (body LDP++/S?) (env Env?)]
  [exprV (expr LDP++/S?) (env Env?)])


;; Tipo de dato para representar ambientes de evaluación.
(define-type Env
  [mtSub]
  [aSub (id symbol?) (value LDP++/S-Value?) (rest-env Env?)]
  [aRecSub (id symbol?)
           (value box?)
           (rest-env Env?)])

;; Función que realiza la búsqueda de variables en el ambiente.
;; lookup: symbol Env -> Fae
(define (lookup sub-id env)
  (match env
    [(mtSub) (error 'lookup "Identificador Libre")]
    [(aSub id value rest-env)
     (if (symbol=? id sub-id)
         value
         (lookup sub-id rest-env))]))


