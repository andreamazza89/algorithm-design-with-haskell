module OneEleven where

integer :: [Int] -> Int
integer =
  sum . zipWith (*) tens . reverse

fraction :: [Double] -> Double
fraction =
  sum . zipWith (flip (/)) (tail tenz)

tens :: [Int]
tens =
  iterate (* 10) 1

tenz :: [Double]
tenz =
  iterate (* 10) 10

