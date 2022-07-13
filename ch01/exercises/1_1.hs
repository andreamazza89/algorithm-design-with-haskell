module OneOne where

myMaximum :: Ord a => [a] -> a
myMaximum = maximum

myTake :: Int -> [a] -> [a]
myTake = take

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile = takeWhile

mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt = splitAt

myNull :: [a] -> Bool
myNull = null

myElem :: Eq a => a -> [a] -> Bool
myElem = myElem

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith = zipWith

myMinimum :: Ord a => [a] -> a
myMinimum = minimum

myDrop :: Int -> [a] -> [a]
myDrop = drop

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile = dropWhile

mySpan :: (a -> Bool) -> [a] -> ([a], [a])
mySpan = span

myAll :: (a -> Bool) -> [a] -> Bool
myAll = all

at :: [a] -> Int ->  a
at = (!!)

