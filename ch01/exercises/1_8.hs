module OneEight where

data Status
  = Suffix
  | Result

myDropWhileEnd :: (a -> Bool) -> [a] -> [a]
myDropWhileEnd p =
  snd . foldr step (Suffix, [])
    where
      step item (status, res) = case status of
                                Result -> (Result, item : res)
                                Suffix -> if p item then (Suffix, []) else (Result, [item])

-- after looking at the solution I realised the above is more complex that it could be: the extra
-- information we need to keep track of and I made Status for is actually just the fact that the
-- 'result' list is still empty.
--
