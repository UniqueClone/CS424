#lang mzscheme

(define ddx
  (λ e
    (if (number? e)
        0
        (if (equal? e 'x)
            1
            (if (equal? e '+)
                (list '+
                      (ddx (cadr e))
                      (ddx)