#lang mzscheme

(define before-seq
  (λ (xs ys)
    (if (null? xs) ys)))

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


;;; Test 4
;;; Given '(t) & '(a b t u v t t)
;;; Returns 0 if correctly evaluated to '(b v t)
(define test4-before-seq
  (λ ()
      (cond
        ((equal? (before-seq '(t) '(a b t u v t t)) '(b v t)) 0)
        (else 1))))


;;; Test All
;;; Runs all individual test cases
;;; Returns a list with an element for each test run.
;;; Each element will be a 1 or 0. 1 signifies failure, 0 signifies success.
(define test-before-seq
  (λ ()
    (list (test1-before-seq)
          (test2-before-seq)
          (test3-before-seq)
          (test4-before-seq))))