#lang mzscheme


;;; PART 1 - before-seq
(define before-seq
  (λ (xs ys)
    (cond
      ((null? xs) ys)
      ((null? ys) '())
      ((null? (cdr ys)) '())
      ((equal? (car xs) (cadr ys)) (if (before-seq-2 (cdr xs) (cddr ys))
                                       (cons (car ys) (before-seq xs (cdr ys)))
                                       (before-seq xs (cdr ys))))
      (else (before-seq xs (cdr ys))))))

(define before-seq-2
  (λ (as bs)
    (cond
      ((null? as) #t)
      ((null? bs) #f)
      ((equal? (car as) (car bs)) (before-seq-2 (cdr as) (cdr bs)))
      (else #f))))
    

;;; Individual Tests for Q1

;;; Test 1
;;; Given '(a b) & '(x y z a b 1 2 3 4 a b c d a a b)
;;; Returns 0 if correctly evaluated to '(z 4 a)
(define test1-before-seq
  (λ ()
      (cond
        ((equal? (before-seq '(a b) '(x y z a b 1 2 3 4 a b c d a a b)) '(z 4 a)) 0)
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


;;; PART 3 - f to cf
(define f
  (λ (n)
    (cond ((= n 0) 1)
	      ((= n 1) 1)
		  (else (+ (f (- n 1)) (f (- n 2)))))))

(define c-ify2 (λ (f) (λ (c x y) (c (f x y)))))

(define c= (c-ify2 =))
(define c+ (c-ify2 +))
(define c- (c-ify2 -))


;;; Test 1
(define test1-cf
  (λ ()
    (if (equal? (f 5) (cf 5))
        0
        1)))

;;; Test 2
(define test2-cf
  (λ ()
    (if (equal? (f 10) (cf 10))
        0
        1)))

;;; Test 3
(define test3-cf
  (λ ()
    (if (equal? (f 25) (cf 25))
        0
        1)))

;;; Test all f to cf
(define test-cf
  (λ ()
    (list (test1-cf)
          (test2-cf)
          (test3-cf))))


;;; PART 5 - grovel-add
(define grovel-add
  (λ (f xs)
    (if (list? xs)
        (if (equal? xs '())
            0
            (cond
              ((list? (car xs)) (+ (grovel-add f (car xs)) (grovel-add f (cdr xs))))
              ((number? (car xs)) (+ (if (f (car xs))
                                      (car xs)
                                      0) (grovel-add f (cdr xs))))
              (else (grovel-add f (cdr xs))))))))

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