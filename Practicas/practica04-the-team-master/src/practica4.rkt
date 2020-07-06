#lang plai

(require "grammars.rkt")
(require "parser.rkt")

;; Función que indica si una expresión es correcta sintácticamente o
;; no.
;; check-syntax: s-expression -> boolean
;;(define (check-syntax sexp)
  ;;  #| Aquí va su código |# )

;; Función encargada de ejecutar el intérprete para que el usuario interactúe con el lenguaje. Para
;; diferenciar el prompt de Racket del nuestro, usamos "(λ)". Aprovechamos los aspectos imperativos
;; del lenguaje para esta función.
(define (main)
    (begin
      (display "(λ) ")
      (define x (read))
      (if (equal? x '{exit})
          (display "")
          (begin 
            (with-handlers ([exn:fail? (lambda (exn) (display "Ocurrió un error al interpretar"))]) 
               (display  (parse x)))
            (display "\n")
            (main)))))

;; Llamada a la función
(display "Bienvenido a LDP v1.0.\n")
(main)
