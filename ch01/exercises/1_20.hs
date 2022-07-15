module OneTwenty where

--concat xss = foldl op id xss []

newConcat :: [[a]] -> [a]
newConcat xss = foldl op id xss []

op :: ([a] -> [a]) -> [a] -> ([a] -> [a])
op acc item =
  \moreItems -> acc item <> moreItems

