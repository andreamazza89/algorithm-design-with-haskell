module SymmetricListExercises where

type SymmetricList a = ([a], [a])

snocSL :: a -> SymmetricList a -> SymmetricList a
snocSL x (xs, ys) = if null xs then (ys, [x]) else (xs, x:ys)

single :: [a] -> Bool
single [x] = True
single _ = False

-- 3.1
--  Considering the invariant that if either list is null then the other is either null or has exactly one element,
--  The list "abcd" can be represented as:
--    - ("a", "dcb") <- repeatedly using snoc on a b c d
--    - ("ab", "dc") <- cons b | snoc c | snoc d | cons a
--    - ("abc", "d") <- repeatedly using cons on d c b a
--

-- 3.2

nilSL :: SymmetricList a
nilSL = ([],[])

nullSL :: SymmetricList a -> Bool
nullSL ([], []) = True
nullSL _ = False

singleSL :: SymmetricList a -> Bool
singleSL ([x], []) = True
singleSL ([], [x]) = True
singleSL _ = False

lengthSL :: SymmetricList a -> Int
lengthSL (xs, sx) = length xs + length sx

-- 3.3

consSL :: a -> SymmetricList a -> SymmetricList a
consSL x (xs, ys) = if null ys then ([x], xs) else (x:xs, ys)

headSL :: SymmetricList a -> a
headSL (xs, ys) = if null xs then head ys else head xs

-- 3.4

initSL :: SymmetricList a -> SymmetricList a
initSL (xs, ys)
  | null ys   = if null xs then (error "empty list") else nilSL
  | single ys = (us, reverse vs)
  | otherwise = (xs, tail ys)
  where
    (us, vs) = splitAt ((length xs) `div` 2) xs

-- 3.5

dropWhileSL :: (a -> Bool) -> SymmetricList a -> SymmetricList a
dropWhileSL p (xs, ys) =
  if null droppedLeft then
    ([], dropWhile p ys)
  else
    (droppedLeft, ys)
  where
    droppedLeft = dropWhile p xs

-- 3.6

initsSL :: SymmetricList a -> SymmetricList (SymmetricList a)
initsSL xs = go xs nilSL
  where
    go ([], []) result = consSL nilSL result
    go current result = go (initSL current) (consSL current result)

-- Write down the equation that expresses the relationship between
--   fromSL, initsSL, inits
--
--   inits . fromSL = map fromSL . fromSL . initsSL
--

-- 3.6
--   Give an online definition of `inits` that does not use symmetric lists for which `length . inits` takes
--   linear time.

-- Just to remind myslef, inits is kinda like this [@, *, #] ---->> [[], [@], [@,*], [@,*,#]]

-- will come up with a definition that works first, then figure out if it suits the requirements, as I am
-- struggling to come up with alternative strategies.
onlineInits :: [a] -> [[a]]
onlineInits xs = go xs [[]]
  where
    go :: [a] -> [[a]] -> [[a]]
    go [] result = reverse (reverse <$> result)
    go (y:ys) (result) = go ys ((y:(head result)):result)
-- mmm I don't think this is lenear time, but I cannot come up with anything else, so gonna peek at the solution.
-- interesting, the solution uses `scanl`, which I thought wouldn't work on infinite lists? I need to better
-- my intuition for the differences between foldl/foldr/foldl'....
-- ok, it does indeeed not work for infinite lists, but I guess the excercise is ok with that while not being
-- explicit about it?

