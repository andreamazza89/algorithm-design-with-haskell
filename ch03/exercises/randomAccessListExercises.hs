module RandomAccessListExercises where

type RandomAccessList a = [Digit a]

data Digit a
  = Zero
  | One (Tree a)
  deriving Show

data Tree a
  = Leaf a
  | Node Int (Tree a) (Tree a)
  deriving Show

size :: Tree a -> Int
size (Leaf x) = 1
size (Node n _ _) = n

node :: Tree a -> Tree a -> Tree a
node t1 t2 = Node (size t1 + size t2) t1 t2

consRA :: a -> RandomAccessList a -> RandomAccessList a
consRA x xs = consT (Leaf x) xs
  where
    consT t1 [] = [One t1]
    consT t1 (Zero:xs) = One t1 : xs
    consT t1 (One t2:xs) = Zero : consT (node t1 t2) xs

fetchT :: Int -> Tree a -> a
fetchT 0 (Leaf x) = x
fetchT k (Node n t1 t2) = if k < m then fetchT k t1 else fetchT (k - m) t2
  where
    m = n `div` 2

-- 3.9

fetchRA :: Int -> RandomAccessList a -> a
fetchRA k [] = error "You've gone too far"
fetchRA k (Zero:xs) = fetchRA k xs
fetchRA k ((One t):xs) = if k < size t then fetchT k t else fetchRA (k-size t) xs

-- 3.10

toRA :: [a] -> RandomAccessList a
toRA =
  foldr consRA []

-- 3.11

updateRA :: a -> Int -> RandomAccessList a -> RandomAccessList a ->  RandomAccessList a
updateRA newValue (-1) xs      updated = reverse updated ++ xs
updateRA newValue k (Zero:xs)  updated = updateRA newValue k xs (Zero:updated)
updateRA newValue k (One t:xs) updated =
  if k < size t then
    updateRA newValue (-1) xs (One (updateT newValue k t) : updated)
  else
    updateRA newValue (k - size t) xs (One t: updated)

-- the above is overly complex and could use the same strategy as I've done for updateT.
-- the difference is that the above keeps a result kinda 'separate', whereas it could simply
-- build it as it traverses the data structure. Here is the better version (which is the book's solution):

betterUpdateRA :: a -> Int -> RandomAccessList a -> RandomAccessList a
betterUpdateRA newValue k (Zero:xs) = Zero:betterUpdateRA newValue k xs
betterUpdateRA newValue k (One t:xs) =
  if k < size t then
    One (updateT newValue k t):xs
  else
    One t : betterUpdateRA newValue (k - size t) xs


updateT :: a -> Int -> Tree a -> Tree a
updateT newValue 0 (Leaf x) = Leaf newValue
updateT newValue k (Node n t1 t2) =
  if k < m then
    node (updateT newValue k t1) t2
  else
    node t1 (updateT newValue (k - m) t2)
  where
    m = n `div` 2

