#lang racket

(define (quicksort xs)
    (if (null? xs)
    xs
    (let* 
        ([hd (car xs)] 
         [tail (cdr xs)]
         [smaller (filter (lambda (x) (< x hd)) tail)]
         [bigger (filter (lambda (x) (>= x hd)) tail)])
      (append (quicksort smaller) (list hd) (quicksort bigger)))))