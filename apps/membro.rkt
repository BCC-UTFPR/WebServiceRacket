#lang racket

(define (membro e v)
  (if (null? v) "O valor não é membro!"
  (if (= e (car v)) "O valor é membro!" (membro e (cdr v)))
  )
 )
(command-line #:args (e v) (membro (string->number e) (map string->number (regexp-split #px"," v))))
