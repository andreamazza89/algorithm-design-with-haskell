# Useful data structures

## Symmetric lists

In normal list, while *head* and *tail* take constant time, *append* and *last* are linear.

Symmetric lists overcome this by keeping track of the list in two halves, with the second half
reversed.

For example, the list `[1,2,3,4,5,6]` becomes `([1,2,3], [6,5,4])`.
Now *append* is simply *cons*ing the second half, *last* is *head* on the second half.

Two invariants that will be important are that if one half of the list is empty, then the other
must either be empty or a singleton, like `([1], [])`, `([], [1])` and `([], [])`

## Random-access lists

This data structure addresses the need to get a specific item of the collection, which takes linear time
in a standard list. With random-access lists this becomes log(n) (n being the length of the list), but makes
the other operations (*cons*, *head*, *tail*) deteriorate.

It's made of a sequence of *perfect* binary trees. Perfect means that each leaf has the same depth.
The sequence is made to reflect a binary number with the least significant bit first (e.g. 011 is 6).
This allows going through the sequence and skipping more than one element at a time, until you reach the
tree with the element you are after and then traverse that.

For example, a 6-element list would be stored as follows:

```
[ 0,  1,       1  ]
      |        |
     / \     /   \
    a   b   |     |
           / \   / \
          c  d  e   f
```

and then to lookup an element, you first go through the sequence, comparing the index against the size of the tree,
like so (fetching the 5th element):

```
  [ 0,  1,       1  ]
    ^------------------skip zeros
        ^------------------this tree has size 2, so keep going as 5 > 2. Continue searching with index 5-2
                 ^------------------this tree has size 4, so we pick this as 3 < 4
```

now we go through the tree, with a similar search based on the size of the tree (index is now 3):

```
      |       <------- choose the right tree because 3 > 4/2(half the tree size), update index to 3-2
    /   \
   |     |    <------- choose the right tree because 1 > 2/2(half the tree size), update index to 0
  / \   / \
 c  d  e   f  <------- got to leaf 'f', which is the 5th element
```

~ Reading through the definition of `consRA` (which is consing an element to the random-access list,
~ I am trying to develop an intuition for how that works, but struggling, so going to try visualise
~ how the list "abcdef" gets built from scratch (going backwards as we're consing).
~ -- I used scanr to generate the steps below:

```
[One (Leaf 'f')]
[Zero, One (Node (Leaf 'e') (Leaf 'f'))]
[One (Leaf 'd'), One (Node (Leaf 'e') (Leaf 'f'))]
[Zero, Zero, One (Node (Node (Leaf 'c') (Leaf 'd')) (Node (Leaf 'e') (Leaf 'f')))]
[One (Leaf 'b'), Zero, One (Node (Node (Leaf 'c') (Leaf 'd')) (Node (Leaf 'e') (Leaf 'f')))]
[Zero, One (Node (Leaf 'a') (Leaf 'b')), One (Node (Node (Leaf 'c') (Leaf 'd')) (Node (Leaf 'e') (Leaf 'f')))]
```

## Arrays

Array sacrifice some of the operations in the name of constant-time access.

This chapter discussed the Data.Array package in Haskell.

