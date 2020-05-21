
---------------------------------------------------------------
-- 1. Write a sort that takes a list and returns a sorted list
qsort [] = []
qsort (h:tail) = (qsort lesser) ++ [h] ++ (qsort greater)
  where 
    lesser = filter (< h) tail
    greater = filter (>= h) tail
-- Example: qsort [5,6,1,89,2,3,1] => [1,1,2,3,5,6,89]

---------------------------------------------------------------
-- Create a lazy sequence of prime numbers
lazyPrime = [n | n <- [1..], isPrime n]
  where 
    isPrime n = all ((> 0) . rem n) [2..n-1]
-- Example: take 10 lazyPrime => [1,2,3,5,7,11,13,17,19,23]

