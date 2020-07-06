#lang plai

(require "grammars.rkt")
(require "parser.rkt")
(require "interp.rkt")

;; Función que indica si una expresión es correcta sintácticamente o
;; no.
(define (check-syntax sexp)
    #| Aquí va su código |#
  (with-handlers ([exn:fail?
                   (lambda (exn) false)]) (FAE? (parse sexp))))

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
          (with-handlers ([exn:fail? (lambda (exn) (display "Ocurrio un error al interpretar"))])
            (display (interp (parse x))))
          (display "\n")
          (main)))))

;; Llamada a la función
(displayln "Bienvenido a LDP++ v1.2.")
(main)