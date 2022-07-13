module OneTwo where

-- I guess the opposite of consing is to split the head away from the tail?

myUncons :: [a] -> Maybe (a, [a])
myUncons (hd:tl) = Just (hd, tl)
myUncons _ = Nothing

