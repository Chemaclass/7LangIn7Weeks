squareAll list = map square list
  where square x = x * x

myRange start step = start:(myRange (start + step) step)
-- take 10 (myRange 10 1) => [10,11,12,13,14,15,16,17,18,19]
-- take 5 (myRange 0 5) => [0,5,10,15,20]

------------------------------------------
-- lazy fibo -----------------------------
------------------------------------------
lazyFib x y = x:(lazyFib y (x + y))
fib = lazyFib 1 1
fibNth x = head (drop (x-1) (take (x) fib))
-- take 5 (lazyFib 0 1) => [0,1,1,2,3]
-- take 5 (fib) => [0,1,1,2,3]
-- take 5 (drop 20(fib)) => [10946,17711,28657,46368,75025]
-- fibNth 6 => 8
-- fibNth 100 => 354224848179261915075


