module One_Four where

myReverse :: [a] -> [a]
myReverse =
  foldl (flip (:)) []

