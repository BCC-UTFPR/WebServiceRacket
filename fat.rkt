#lang racket
(define (fatorial n) 
  (if (= n 1) 1 (* n (fatorial(- n 1)))))