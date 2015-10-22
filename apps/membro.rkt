#lang racket

(define (membro? item seq)
  (sequence-ormap 
   (lambda (x)
     (equal? item x))
   seq))