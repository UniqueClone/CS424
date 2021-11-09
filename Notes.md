# Scheme Notes
## Class Intro

Scheme is a dialect of LISP. 

LISP = 'Lots of Irritating Single Parenthesis'.

There are hundreds of implementations of Scheme. In class we mostly use **`mzscheme`**. Other options: **mitscheme**, **chicken scheme**, **chez scheme**.

Lecturer recommended using GNU Emacs for Scheme.

Why Scheme?
- fun
- lingua franca of Programming Language Theory.
- Homoiconic
- LISP is a "ball of mud".
  - small number of core features.
  - add new features by defining w/ old ones.
  - uniform mechanism for doing this (called macros)

<br>

----------------------

<br>

> - CTRL + SHIFT + u3bb --> λ
> - (in Dr Racket) CTRL + \ --> λ


Everything in Scheme is a function. 
Some functions are pre-built. 

E.g. `(+ x y)` and `(* x y)` are built in functions in scheme.

Parenthesis **_ALWAYS_** means Function Call. They are never used for grouping.

<br>

_____

<br>


## Functions
``` scheme
(define foo   ;  (num->num)->num
  (λ (f)
    (+ (f 1) (f 2) (f 3))))
```

``` scheme
(define foo (sqrt 2))

> foo
1.4142135623730951

> (* foo foo)
2.0000000000000004
```

``` scheme
(define comp
  (λ (f g)
    (λ (x) (f (g x)))))
```
<br>

-----

<br>

## Key Words

#### **`car`**
`car` is used to take the first element of a list/pair.
``` scheme
> (car '(1 2 3 4))
1
```

#### **`cdr`**
`cdr` returns list from second element to the end (chops off the first element).
``` scheme
> (cdr '(1 2 3 4))
'(2 3 4)
```
**Note:** usually used to iterate lists recursively

#### cadr and cddr
`cadr` takes the `car` of the `cdr`.
``` scheme
> (cadr ' (1 2 3 4))
2
```

`cddr` takes the `cdr` of the `cdr`.
``` scheme
> (cddr '(1 2 3 4))
'(3 4)
```