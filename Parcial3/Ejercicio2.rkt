#lang racket

;; Ejercicio 2: Clasificación de temperatura
;; Para ejecutar, corre este archivo con Racket.

(define (clasificar-temperatura temp)
  (cond
    [(< temp 10) "Baja"]
    [(and (>= temp 10) (<= temp 25)) "Media"]
    [(> temp 25) "Alta"]))

(define (iniciar)
  (displayln "--- Clasificador de Temperatura ---")
  (display "Ingrese la temperatura en grados Celsius: ")
  
  ;; Leer la entrada del usuario
  (define input (read))
  
  ;; Validar si es un número
  (if (number? input)
      (begin
        (printf "La temperatura de ~a grados es considerada: ~a~n" 
                input 
                (clasificar-temperatura input)))
      (begin
        (displayln "Error: Entrada no válida. Debe ingresar un número.")
        (iniciar)))) ;; Volver a pedir si falla

;; Iniciar el programa
(iniciar)
