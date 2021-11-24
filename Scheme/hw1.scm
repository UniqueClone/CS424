#lang mzscheme


;;; PART 1 - before-seq
(define before-seq
  (λ (xs ys)
    (cond ((null? xs) ys))))
    

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


;;; Test All before-seq
;;; Runs all individual test cases
;;; Returns a list with an element for each test run.
;;; Each element will be a 1 or 0. 1 signifies failure, 0 signifies success.
(define test-before-seq
  (λ ()
    (list (test1-before-seq)
          (test2-before-seq)
          (test3-before-seq)
          (test4-before-seq))))


;;; PART 2 - ddx
(define ddx
  (λ (e)
    (if (number? e)
        0
        (if (equal? e 'x)
            1
            (if (equal? (car e) '+)
                (list '+
                      (ddx (cadr e))
                      (ddx (caddr e)))
                (if (equal? (car e) '*)
                    (list '+
                          (list '*
                                (cadr e)
                                (ddx (caddr e)))
                          (list '*
                                (ddx (cadr e))
                                (caddr e)))
                    (error 'oops)))))))

;;; Test 1
(define test1-ddx
  (λ ()
    (cond
      ((equal? (ddx 'x) 1) 0)
      (else 1))))

;;; Test 2
(define test2-ddx
  (λ ()
    (cond
      ((equal? (ddx '(+ (* x 3) x)) '(+ (+ (* x 0) (* 1 3)) 1)) 0)
      (else 1))))


;;; PART 5 - grovel-add
(define grovel-add
  (λ (xs ys)
    (if (list? ys)
        (if (equal? ys '())
            0
            (cond
              ((list? (car ys)) (+ (grovel-add xs (car ys)) (grovel-add xs (cdr ys))))
              ((number? (car ys)) (+ (if (xs (car ys))
                                      (car ys)
                                      0) (grovel-add xs (cdr ys))))
              (else (grovel-add xs (cdr ys))))))))

;;; Test 1
(define test1-grovel-add
  (λ ()
   (cond
     ((equal? (grovel-add (λ (x) #t) '(a b (5 x y (z 2)))) 7) 0)
     (else 1))))

;;; Test 2
(define test2-grovel-add
  (λ ()
   (cond
     ((equal? (grovel-add (λ (x) (< x 4)) '(a b (5 x y (z 2)))) 2) 0)
     (else 1))))

;;; Test All grovel-add
(define test-grovel-add
  (λ ()
    (list (test1-grovel-add)
          (test2-grovel-add))))