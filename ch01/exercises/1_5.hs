module OneFive where

myMap :: (a -> b) -> [a] -> [b]
myMap f =
  foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p =
  foldr (\x xs -> if p x then x : xs else xs) []

