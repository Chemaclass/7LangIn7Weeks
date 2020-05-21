
---------------------------------------------------------------
-- 1. Write a sort that takes a list and returns a sorted list
qsort [] = []
qsort (h:tail) = (qsort lesser) ++ [h] ++ (qsort greater)
  where 
    lesser = filter (< h) tail
    greater = filter (>= h) tail

-- Example: qsort [5,6,1,89,2,3,1] => [1,1,2,3,5,6,89]
