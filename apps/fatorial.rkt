#lang racket
(define (fatorial v) 
  (if (= v 1) 1 
      (* v (fatorial(- v 1)))
      ))

(command-line #:args (v) (fatorial (string->number v)))
