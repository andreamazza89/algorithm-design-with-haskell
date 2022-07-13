module OneSeven where

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p =
  foldr (\x xs -> if p x then (x : xs) else []) []

