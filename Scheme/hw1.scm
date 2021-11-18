#lang mzscheme


;;; Individual Tests for Q1

;;; Test 1
;;; Given '(a b) & '(x y z 1 2 3 4 a b c d a a b)
;;; Returns 0 if correctly evaluated to '(z 4 a)
(define test1-before-seq
  (λ ()
      (cond
        ((equal? (before-seq '(a b) '(x y z 1 2 3 4 a b c d a a b)) '(z 4 a)) 0)
        (else 1))))



;;; Test 2
;;; Given '(a b) & '(a b c d)
;;; Returns 0 if correctly evaluated to '()
(define test2-before-seq
  (λ ()
      (cond
        ((equal? (before-seq '(a b) '(a b c d)) '()) 0)
        (else 1))))


;;; Test 3
;;; Given '() & '(j k l m n)
;;; Returns 0 if correctly evaluated to '(j k l m n)
(define test3-before-seq
  (λ ()
      (cond
        ((equal? (before-seq '() '(j k l m n)) '(j k l m n)) 0)
        (else 1))))
