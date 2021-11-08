#lang mzscheme

; This function maps a function f to every element in the list x
(define map
  (λ (f x)
    (if (null? x)
           null
           (cons (f (car x))
                 (map f (cdr x))))))


; This function is from the 2018 Autumn Paper, Q1.
; "Define a Scheme function map-skip which takes a function and a list and
; returns the result of applying the given function to every other elment
; of the given list, starting with the first element."

; Example:
; (map-skip (λ (x)(+ x 1000)) '(1 2 3 4 5 6))
; =>(map-skip (λ (x)(+ x 1000)) '(1 2 3 4 5 6))
(define map-skip
  (λ (f xs)
    (if (null? xs)
        null
        (if (null? (cdr xs))
            (list (f (car xs)))
            (append (list (f (car xs))
                          (cadr xs))
                    (map-skip f (cddr xs)))))))