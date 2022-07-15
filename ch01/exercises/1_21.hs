module OneTwentyOne where

isSteep :: [Int] -> Bool
isSteep xs = go True xs
  where
    go result [] = result
    go False _ = False
    go True (y:ys) = go (y > sum ys) ys

-- mm the running time I think is n factorial? cause you have as many steps as list
-- items, and at each item you sum the whole (shrinking) list.
--
-- For improving the running time, we can do the sum at the beginning, and then simply
-- take the difference with the current item while traversing; let's try:
--

quickerIsSteep :: [Int] -> Bool
quickerIsSteep xs = go True (sum xs) xs
  where
    go result _ [] = result
    go False _ _ = False
    go True total (y:ys) = go (y > (total - y)) (total - y) ys

