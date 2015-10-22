#lang racket

(define inverte
  (lambda (l)
    (let ((len (length l)))
      (build-list len
                  (lambda (i)
                    (list-ref l (- len i 1)))))))