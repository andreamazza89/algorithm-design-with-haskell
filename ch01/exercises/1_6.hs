module OneSix where

-- express foldr f e . filter p as an instance of foldr
-- I guess if we rewrite filter in terms of foldr then we apply the foldr fusion law


-- foldr f e . filter p
-- = foldr f e . foldr (\x xs -> if p x then x : xs else xs) []
-- = foldr (\x xs -> if p x then f x xs : xs else xs) e

solution :: (a -> Bool) -> (a -> b -> b) -> b -> [a] -> b
solution p f e = foldr (\x xs -> if p x then f x xs else xs) e

