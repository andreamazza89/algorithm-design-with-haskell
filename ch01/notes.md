# 1 Functional Programming

~ Going to find out how much I should be skimming over this chapter, so I might not be too detailed in note-taking.

## 1.2 Processing Lists

When going through a list, direction of travel can sometimes make a difference.

An algorithm is either *online* (it is processing a list in real time, so that it needs to be able to cope with an infinite stream) and *offline*
(all the data is available). With the former we are forced to go left to right, whereas with the latter we can choose.

## 1.3 Inductive and Recursive Definitions

We will call *inductive* definitions ones that that recurse along a data structure (structural induction). These can almost always
be expressed in terms of `foldr`.

When the recursion is not following along a data structure then the style is *recursive*
(~? though I am not sure I can fully appreciate the difference at this point.)

These two styles can lead to different solutions with different charachteristics. In other words, the same problem can be
solved in different ways by using equally clear but different definitions of one or more of the basic functions
forming the solution.

## 1.4 Fusion

This is when we can *fuse* two or more computations into one, an example being `map g ∘ map f = map (g ∘ f)`.
So a two-step process, traversing the data structure twice becomes a one-step traversal.

---
Exercise - find the right hand side of this fusion law:

`foldr f e ∘ concat = ???`

`foldr f e ∘ concat = foldr (flip (foldr f)) e`


Other exercise, do this one that's simpler

`foldr f e (xs ++ ys) = ???`

`foldr f e (foldr (:) ys xs) = ???`

`foldr (f) (foldr f e ys) xs = ???`

---

## 1.5 Accumulating and Tupling

Tupling is a mechanism to reduce the running time of an algorithm. When an algorithm is recomputing something at each step,
you can instead add a partial computation in a tuple along with the result and use that value to not have to re-perform computation.

~ The explanation above is terrible, the example in the book makes this much clearer, but basically boils down to realising that
~ certain computation/s (e.g. checking the sum of an integers list) can be stored in a tuple during recursion to avoid
~ re-computing.

In general, we should leave this as a final step, as it makes the code messier/harder to reason about.

The main principles of good algorithm design are:

1. formulate the problem in terms of basic and well-understood ingredients
2. fuse the components into a dish that is finally ready to leave the kitchen

