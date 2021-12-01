# Haskell Intro

Scheme is Pure λ Calc w/ dirty constructs and little syntactic sugar.

Haskell is Typed λ Calculus w/ cleanliness amg lots of syntactic sugar.

## Design Goals:
- pure
- lazy
- look like math
  - infix notation
  - function definitions look lile in math class
  - juxtaposition = function call
- "fun", highly expressive
- everythihng is Curried (automatically)



## List Functions
### `length`
Returns a  functions length.
```haskell
ghci> length [5,4,3,2,1]
5
```
<br>

### `null`
Tests if a list is null.
```haskell
ghci> null [1,2,3]
False
ghci> null []
True
```
<br>

### `reverse`
Reverses a list.
```haskell
ghci> reverse [1,2,3,4,5]
[5,4,3,2,1]
```
<br>

### `take`
Takes the first n numbers from a list.
```haskell
ghci> take 3 [5,4,3,2,1]
[5,4,3]
ghci> take 0 [5,4,3,2,1]
[]
ghci> take 5 [1,2]
[1,2]
```
<br>

### `drop`
Drops the first n elements of a list.
```haskell
ghci> drop 3 [8,4,2,1,5,6]  
[1,5,6]  
ghci> drop 0 [1,2,3,4]  
[1,2,3,4]  
ghci> drop 100 [1,2,3,4]  
[] 
```
<br>

### `minimum` and `maximum`
Returns the min or max of any list.
```haskell
ghci> minimum [5,21,63,45,58]
1
ghci> maximum [5,21,63,45,58]
63
```
<br>

### `product` and `sum`
Self-explanatory.
```haskell

```
<br>

### `elem`
```haskell
```
<br>


<br><br><br><br>



