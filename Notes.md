> - CTRL + SHIFT + u3bb --> λ
> - (in Dr Racket) CTRL + \ --> λ

## Functions
``` scheme
(define foo   ;  (num->num)->num
  (λ (f)
    (+ (f 1) (f 2) (f 3))))
```

``` scheme
(define comp
  (λ (f g)
    (λ (x) (f (g x)))))
```

### Key Words

#### car
`car` is used to take the first element of a list/pair.

#### cdr
`cdr` returns list from second element to the end (chops off the first element).
Note: usually used to iterate lists recursively
