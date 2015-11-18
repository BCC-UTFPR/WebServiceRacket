#lang racket
(define (fibonacci v)
  (cond ((= v 1) 1)
        ((= v 2) 1)
        ((+ (fibonacci(- v 2)) (fibonacci(- v 1))))
    )
  )
(command-line #:args (v) (fibonacci (string->number v)))
