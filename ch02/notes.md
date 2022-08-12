# 2 Timing

This chapter will cover asymptotic notation, recurrence relations and amortising running times.
Analysing the space taken up by an algorithm is also important but to do this with a
functional/lazy algorithm is tricky, so will be ignored.

## Asymptotic notation

~ I can't really grasp the definition from the book, so will search for an answer online.

There are 3 types, all relating to the running time of an algorightm.

Big O is the upper bound for the worst case (e.g. searching an item and it's at the end of the
structure) as the input grows - i.e. it will never be slower than this.

Big Ω is the lower bound for the worst case as the input grows - i.e. it will never be faster than
this.

Big Ө is somewhere in the middle
For this one, we say that a given function *f* is of order *g* if the running time of *f(n)* sits between
*C g(n)* and *D g(n)*.
It matters whether we are looking at the worst, best case or somewhere in the middle. In this book we always consider
worst case.

## 2.2 Estimating Running Times

It's tricky to estimate the running time of an algorithm, as there is no clear notion of a *basic step*.
One simple way to go about it is to try count the reduction steps, but this isn't straightforward either,
as you should take into account how finding reducible expressions can take different time and also how
reduction is performed.
To make matters worse, Haskell is lazy, so not all expressions get fully evaluated - but in this book most
algorithms are unaffected by this.

We use addition to calculate the number of reduction steps under function composition, with
`T(n) = Tg(n) + Tf(m)` saying that the total number of steps for `g . f` on an input of size `n`
is the number of steps for `g(n)` and then `f(m)`, where `m` is the size of the output returned by `g`.

To estimate the number of steps in a recursive function, we need a *recurrence relation*.

~ Having stared at this section a bit, I have decided to go through the book without going deep in timing
~ estimations as that seems to need more maths than I can currently handle.
~ Hopefully I can still learn a bunch without being able to master timing estimates.

