#lang racket
(define (intersecao v_a v_b)
  (if (null? v_a) '()
  (if (member (car v_a) v_b)
      (cons (car v_a) (intersecao (cdr v_a) v_b))
      (intersecao (cdr v_a) v_b))))

(command-line #:args (v_a v_b) (intersecao (map string->number (regexp-split #px"," v_a)) (map string->number (regexp-split #px"," v_b))))
