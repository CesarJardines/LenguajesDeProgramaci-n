#lang plai

(require "grammars.rkt")

;; Algoritmo de sustitución textual.
;; subst: FAE symbol FAE -> FAE
(define (subst expr sub-id val)
  (match expr
    [(id i) (if (symbol=? i sub-id)
                val
                expr)]
    [(num n) expr]
    [(binop f izq der)
     (binop f (subst izq sub-id val) (subst der sub-id val))]
    [(fun param body)
     (if (symbol=? param sub-id)
         expr
         (fun param (subst body sub-id val)))]
    [(app fun-expr arg)
     (app (subst fun-expr sub-id val) (subst arg sub-id val))]))

;; Interpretación de expresiones FAE.
;; interp1: FAE -> FAE
(define (interp1 expr)
  (match expr
    [(id i) (error 'interp1 "Free ID")]
    [(num n) expr]
    [(binop f izq der)
     (num (f (num-n (interp1 izq)) (num-n (interp1 der))))]
    [(fun param body) expr]
    [(app fun-expr arg)
     (let ([fun-val (interp1 fun-expr)])
       (interp1 (subst (fun-body fun-val)
                       (fun-param fun-val)
                       (interp1 arg))))]))

;; Interpretación de expresiones FAE.
;; interp2: FAE Env1 -> FAE
(define (interp2 expr env)
  (match expr
    [(id i) (lookup i env)]
    [(num n) expr]
    [(binop f izq der)
     (num (f (num-n (interp2 izq env))
             (num-n (interp2 der env))))]
    [(fun param body) expr]
    [(app fun-expr arg)
     (let ([fun-val (interp2 fun-expr env)])
       (interp (fun-body fun-val)
               (aSub1 (fun-param fun-val)
                      (interp arg)
                      env)))]))

;; Interpretación de expresiones FAE.
;; interp3: FAE Env2 -> FAE
(define (interp3 expr env)
  (match expr
    [(id i) (lookup i env)]
    [(num n) (numV n)]
    [(binop f izq der)
     (numV (f (numV-n (interp3 izq env))
              (numV-n (interp3 der env))))]
    [(fun param body)
     (closureV param body env)]
    [(app fun-expr arg)
     (let ([fun-val (interp3 fun-expr env)])
       (interp (closureV-body fun-val)
               (aSub2 (closureV-param fun-val)
                      (interp arg)
                      (closureV-env fun-val))))]))
