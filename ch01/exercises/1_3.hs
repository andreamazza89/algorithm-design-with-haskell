module OneThree where

wrap :: a -> [a]
wrap x = [x]

unwrap :: [a] -> a
unwrap [x] = x
unwrap _ = undefined

single :: [a] -> Bool
single [x] = True
single _ = False

