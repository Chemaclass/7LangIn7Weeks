
fact1 :: Integer -> Integer
fact1 0 = 1
fact1 n = n * fact1(n-1)

fact2 :: Integer -> Integer
fact2 n
 | n > 1 = n * fact2(n-1)
 | otherwise = 1
