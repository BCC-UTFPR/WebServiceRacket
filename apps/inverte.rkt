#lang racket
(define inverte
  (λ (l)
    (let ((len (length l)))
      (build-list len
                  (λ (i)
                    (list-ref l (- len i 1))
                    )
                  )
      )
    )
  )

(command-line #:args (l) (inverte (map string->number (regexp-split #px"," l))))
