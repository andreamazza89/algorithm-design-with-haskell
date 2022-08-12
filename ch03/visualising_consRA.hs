module VisualiseConsRA where

type RandomAccessList a = [Digit a]

data Digit a
  = Zero
  | One (Tree a)
  deriving Show

data Tree a
  = Leaf a
  | Node (Tree a) (Tree a)
  deriving Show

main = scanl consRA [] "abcdef"

consRA :: a -> RandomAccessList a -> RandomAccessList a
consRA x xs = consT (Leaf x) xs
  where
    consT t1 [] = [One t1]
    consT t1 (Zero:xs) = One t1 : xs
    consT t1 (One t2:xs) = Zero : consT (Node t1 t2) xs

