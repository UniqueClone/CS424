# Haskell Notes

[toc]

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

<br>

## How to Run
To run haskell files, you need to be able to run `ghci` (Glasgow Haskell Compiler interactive) in Terminal.

```haskell
C:\Users\Name> ghci
ghci> 
```

### Loading in files
```haskell
ghci> :l filename.hs
```

<br>

## List Functions
### **_`length`_**
Returns a  functions length.
```haskell
ghci> length [5,4,3,2,1]
5
```
<br>

### **_`null`_**
Tests if a list is null.
```haskell
ghci> null [1,2,3]
False
ghci> null []
True
```
<br>

### **_`reverse`_**
Reverses a list.
```haskell
ghci> reverse [1,2,3,4,5]
[5,4,3,2,1]
```
<br>

### **_`take`_**
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

### **_`drop`_**
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

### **_`minimum and maximum`_**
Returns the min or max of any list.
```haskell
ghci> minimum [5,21,63,45,58]
1
ghci> maximum [5,21,63,45,58]
63
```
<br>

### **_`product and sum`_**
Takes a lsit and returns either the product or sum of all elements.
```haskell
ghci> sum [5,2,1,6,3,2,5,7]  
31  
ghci> product [6,2,1,2]  
24  
ghci> product [1,2,5,6,7,9,2,0]  
0   
```
<br>

### **_`elem`_**
Takes input element and a list. Returns boolean for if that element is in the list.
```haskell
ghci> elem 4 [3,4,5,6]  
True  
ghci> elem 10 [3,4,5,6]  
False  
```
<br>

### **_`map`_**
Applies a function to every element of a list.
```haskell
ghci> :t map
map :: (a -> b) -> [a] -> [b]

ghci> map sqrt [1,2,3,4]
[1.0,1.4142135623730951,1.7320508075688772,2.0]
```
<br>

### **_`zipWith`_**
Takes a function, and two lists. 
```haskell
ghci> :t zipWith
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

ghci> zipWith (-) [10,20,30] [1,2,3]
[9,18,27]
```

<br>

### **_`head and tail`_**
`head` returns the first element of a list.
`tail` returns the rest of the list.

```haskell
ghci> head [1,2,3,4,5]
1

ghci> tail [1,2,3,4,5]
[2,3,4,5]
```

<br>

### **_`!!`_**
Gives the nth element of a list.
```haskell
ghci> [1,2,3,4,5] !! 0
1

ghci> [1,2,3,4,5] !! 3
4
```

<br>

### **_`take`_**
Takes the first n elements of a list.
```haskell
ghci> a = [1..10000]

ghci> take 10 a
[1,2,3,4,5,6,7,8,9,10]

ghci> take 100 a
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]
```


## Bound and Free Variables
A variable is **_bound_** if it's **_defined_** inside the given expression and **_free_** if it **_isn't_**. (In a real program, the free variable is presumably defined in some outside context.)

In the function `\ x -> a + x`, `x` is bound because it's defined inside the lambda and `a` is free because it isn't. In a valid Haskell program `a` would be defined in some scope outside the lambda, but while looking at that function, it's free.


# Lecture Notes

<br>

## Lecture 1

### Why Functional Programming?
Pure languages are really gooad at:
- formal verification
- parallelism
- automatic program transformation
- distributed computing

<br>

### Using Haskell
To load a file into a `ghci` terminal, we use the `:l` command.
To find the type of something in haskell, we use the `:t` command.

Function to find hypotenuse given length of other sides:
```haskell
"lecture1.hs"
hypot x y -> sqrt (x^2 + y^2)
```

Or, if we want to specify type of the function:
```haskell
"lecture1.hs"
hypot :: Double -> Double -> Double
hypot x y -> sqrt (x^2 + y^2)
```
<br>
Running the function in terminal:

```haskell
"GHCi Terminal"
ghci> :l lecture1.hs
[1 of 1] Compiling Main             ( hw1.hs, interpreted )
Ok, one module loaded.

ghci> hypot 3 4
5.0

ghci> :t hypot
hypot :: Double -> Double -> Double

ghci> :t sin
sin :: Floating a => a -> a
```

<br><br>

If Haskell doesn't know how to print something it executed, it gives this: `No instance for (Show (<whatever couldn't be printed>)) arising from use of 'print'`

If Haskell has as syntax error it looks like this: `error: parse error on input '+'`

<br>

`(+) 3 4` is the "unsugared" version of `3 + 4`.

<br>

Backticks around non-inifx identifier makes it infix.
`mod 17 3` can be written infix by using backticks like this: 
```haskell
17 `mod` 3
```

### Factorial Example
#### In Scheme
```scheme
(define fact (lambda (n)....))
```
or
```scheme
(define (fact n)....)
```

The second version is just syntactic sugar for the first.

#### In Haskell
```haskell
fact :: Integer -> Integer
fact n = if n == 0 then 1 else n * fact (n-1)
```

which is "sort of" sugar for this:

```haskell
fact :: Integer -> Integer
fact = \n -> if n == 0 then 1 else n * fact(n-1)
```

This is also syntactic sugar for the above:

```haskell
fact 0 = 1
fact n = n * fact (n-1)
```

We can also use "guards" like this, for arbitrary conditions:
```haskell
fact n | n == 0 = 1
fact n = n * fact (n-1)
```


### Lists

- homogeneous
- type is written [Integer] for a list of Integers.
- syntax
  - `x:xs` is like Scheme `(cons x xs)`
  - `[1,2,3]` is syntactic sugar for `1:(2:(3:[]))`
  - `:` is right associative so can write that `1:2:3:[]`


Because Haskell is lazy, we can have infinite lists. This is because the only parts of a list that get calculated are the parts you look at.


```haskell
ghci> [1,2,3,4::Double]
[1.0,2.0,3.0,4.0]
```

<br>

`[1,2,3]` is syntactic sugar for `1:(2:(3:[]))`
```haskell
ghci> [1,2,3]
[1,2,3]

ghci> 1:(2:(3:[]))
[1,2,3]

ghci> 1:2:3:[]
[1,2,3]
```


### Fibonacci Example
```haskell
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
```

Above is innefficient. Instead, we try:

```haskell
fibs = 1:1:zipWith (+) fibs (tail fibs)
```

We can use this function a few ways.
We can find the nth fibonacci number very quickly:
```haskell
ghci> fibs !! 7
21

ghci> fibs !! 40
165580141

ghci> fibs !! 100
573147844013817084101

ghci> fibs !! 100
573147844013817084101

ghci> fibs !! 1000
70330367711422815821835254877183549770181269836358732742604905087154537118196933579742249494562611733487750449241765991088186363265450223647106012053374121273867339111198139373125598767690091902245245323403501
```

Or we can find the first n fibonacci numbers:
```haskell
ghci> take 5 fibs
[1,1,2,3,5]

ghci> take 10 fibs
[1,1,2,3,5,8,13,21,34,55]

ghci> take 100 fibs
[1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811,514229,832040,1346269,2178309,3524578,5702887,9227465,14930352,24157817,39088169,63245986,102334155,165580141,267914296,433494437,701408733,1134903170,1836311903,2971215073,4807526976,7778742049,12586269025,20365011074,32951280099,53316291173,86267571272,139583862445,225851433717,365435296162,591286729879,956722026041,1548008755920,2504730781961,4052739537881,6557470319842,10610209857723,17167680177565,27777890035288,44945570212853,72723460248141,117669030460994,190392490709135,308061521170129,498454011879264,806515533049393,1304969544928657,2111485077978050,3416454622906707,5527939700884757,8944394323791464,14472334024676221,23416728348467685,37889062373143906,61305790721611591,99194853094755497,160500643816367088,259695496911122585,420196140727489673,679891637638612258,1100087778366101931,1779979416004714189,2880067194370816120,4660046610375530309,7540113804746346429,12200160415121876738,19740274219868223167,31940434634990099905,51680708854858323072,83621143489848422977,135301852344706746049,218922995834555169026,354224848179261915075]
```