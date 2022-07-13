apply :: Int -> (a -> a) -> a -> a
apply times f = go times
  where
    go 0 result = result
    go n current = go (n - 1) (f current)

