# Lambda Calculus Notes

[toc]


## λ Calculus
 - "super simple"
 - .......................

<br>

## Lecture 1
####  Define "term" (or "expression")
- $e ::= x$             &emsp;&emsp;&emsp;&emsp; &ensp; ("**variable**"; we use $x$, $y$, $z$, etc)
- $e ::= e\ e$          &emsp;&emsp;&emsp;&emsp; ("**application**", think of a function applied  to argument)
- $e ::= λ\ x\ .\ e$    &emsp; &emsp; ("**abstraction**", or "**λ expression**", think function mapping value of $x \rightarrow e$)

---
<br>

Application is left associative.
$$
e1\ e2\ e3\ e4 = ((e1\ e2)\ e3)\ e4
$$

Parentheses are for grouping only, unlike Scheme.

<br>

could add numbers:
$e ::= 0\ |\ 1\ |\ ...\ |\ plus\ |\ times$ &emsp;&emsp; (called "numeric basis")

---

### Reduction
Computation is done by performing "reductions".
E.g. $ ((\lambda x.x\ y)\ z)\ \rightarrow\beta\ \ (z\ y) $. This is read as "$ ((\lambda x.x\ y)\ z)\ \beta $-reduces to $ z\ y)$ ".

E.g. $ (x\ ((\lambda y.z)\ u))\ \rightarrow\beta\ \ (x\ z) $. Say: "where $ ((\lambda y.z)\ u)\ \beta $-reduces $ z $.

---

### $ \beta $-reduction is:
$ (\lambda v.e1)\ e2\  \rightarrow\beta\ \ [e2/v]e1 $ &emsp;&emsp; (syntactic analogy: $ (e1/v)v = e1 $)

where we define substitution with:
- $ [e/x]x = e $
<br>
- $ [e/x]y = y $ &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; (if $ x $ and $ y $ are not the same variable)
<br>
- $ [e/x](e1\ e2) = [e/x]e1\ \ [e/x]e2 $
<br>
- $ [e/x](\lambda x.e1) = (\lambda x.e1) $
<br>
- $ [e/x](\lambda y.e1) = (\lambda y.[e/x]e1) $ &emsp;&emsp; (if $ x $ and $ y $ are not the same variable, and $ y \notin FV(e) $)

<br>

where $ FV(e) $ is the set of **free variables** in term $ e $
- $ FV(x) = \{x\} $
- $ FV(e1\ e2) = FV(e1)\ \cup\ FV(e2) $
  - The free variables of an application are a union of the free variables of the expressions in the application.
- $ FV(\lambda x.e) = FV(e) \backslash \{x\} $
  - The free variables of a lambda expression $ \lambda x.e $ are a set minus of $ x $ from the set of free variables of $ e $.