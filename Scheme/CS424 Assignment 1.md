# CS424 Assignment 1

Date Created: September 30, 2021 4:56 PM
Due Date: November 25, 2021 1:00 PM
Module: CS424
Status: To Do

The objective of this assignment is to write some Scheme code in order to become somewhat proficient in “Pure Core Scheme”.  See the resources in the course `README.md` for pointers to tutorials and the R⁶RS language manual.  Remember: we will not use I/O, side effects, or mutation.

For each function `foo` in the assignment, please also write `test-foo`, a function of no arguments, which run some test cases on `foo` and returns a list showing which test cases passed or failed by 0 (for pass) or non-0 (for failed, with the specific value giving additional information if you want) elements in the list. You may find it helpful to write a common test jig.

When writing recursive functions, I'd suggest putting your base case(s) and induction case(s) in a comment. Making them explicit like that can help you think it through and choose the simplest possible ones.

Turn in a single file `hw1.scm` with all your definitions in it.  Please don't use weird indentation or white space (or I/O or mutation). Ideally I should be able to run `mzscheme`, then `(load "hw1.scm")`, then use your definitions.

---

## Q1 - `before-seq`

Define `before-seq`, a function which takes two lists, a target list `xs` and list to search `ys`, and returns a list (in order) of the elements of `ys` which occur immediately before a subsequence `xs`.

### Examples:

```scheme
> (before-seq '(a b) '(x y z a b 1 2 3 4 a b c d a a b))
(z 4 a)
> (before-seq '(a b) '(a b c d))
()
> (before-seq '() '(j k l m n))
(j k l m n)
> (before-seq '(t) '(a b t u v t t))
(b v t)
```

## Q2 - `ddx`

Extend the code from the `ddx` derivative-taking system we wrote in class to simplify more aggressively.
(How much more aggressively? Your choice.)

## Q3 - `f` to `cf`

Convert the following definition to CPS, i.e., define `cf`, using the notational conventions in the CPS lecture.

```scheme
(define f
  (λ (n)
    (cond ((= n 0) 1)
	      ((= n 1) 1)
		  (else (+ (f (- n 1)) (f (- n 2)))))))
```

## Q4 - `expand-and` & `expand-or`

The special forms `and` and `or` in Scheme are left-to-right short-circuiting, returning the result of the last subform evaluated. Write macro expanders `expand-and` and `expand-or` which each take an `and` or `or` form respectively, and rewrite it using `if` and `let`. Be sure nothing would be calculated twice, or calculated unnecessarily, in your expanded code.

The transformation is not always unique. For that reason, the following examples are meant to be expository.

### Examples:

```scheme
> (expand-or '(or ONE))
ONE
> (expand-or '(or))
#f
> (expand-or '(or ONE TWO THREE))
(cond (ONE => (λ (x) x))
      (TWO => (λ (x) x))
      (else THREE))
> (expand-and '(and ONE))
ONE
> (expand-and '(and))
#t
> (expand-and '(and ONE TWO THREE FOUR))
(if ONE (if TWO (if THREE FOUR) #f) #f)
```

## Q5 - `grovel-add`

Define `grovel-add` which takes two arguments, a filter function `p?` and an s-expression `s` and returns the sum of all atoms (leaves) nested within `s` that are numbers and also pass `p?`.

### Examples:

```scheme
> (grovel-add (λ (x) #t) '(a b (5 x y (z 2))))
7
> (grovel-add (λ (x) (< x 4) '(a b (5 x y (z 2))))
2
```