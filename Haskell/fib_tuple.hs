-- Using a counter

fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, index) = fibTuple(y, x + y, index - 1)

fibResult :: (Integer, Integer, Integer) -> Integer
fibResult(x, y, z) = x

fib1 :: Integer -> Integer
fib1 x = fibResult(fibTuple(0, 1, x))

-- Using pairs (without a counter)

fibNextPair :: (Integer, Integer) -> (Integer, Integer)
fibNextPair (x, y) = (y, x + y)

fibNthPair :: Integer -> (Integer, Integer)
fibNthPair 1 = (1, 1)
fibNthPair n = fibNextPair(fibNthPair (n - 1))

fib2 :: Integer -> Integer
fib2 = fst . fibNthPair
