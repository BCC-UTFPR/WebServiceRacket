#lang racket
(define (fib n)
  (cond ((= n 1) 1)
        ((= n 2) 1)
        ((+ (fib(- n 2)) (fib(- n 1))))
    )
  )