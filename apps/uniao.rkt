#lang racket

(define (uniao v_a v_b)
  (append v_a v_b))
(command-line #:args (v_a v_b) (uniao (map string->number (regexp-split #px"," v_a)) (map string->number (regexp-split #px"," v_b))))
