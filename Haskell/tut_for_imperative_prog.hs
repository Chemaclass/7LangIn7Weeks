------------------------------------
--------- List exercices -----------
------------------------------------
{- #1
Create a function elem' that returns True
if an element is in a given list
and returns False otherwise
-}
elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False 
elem' e (head:tail) = (e == head) || (elem' e tail)

{- #2
Create a function nub' that removes all 
duplicates from a given list
-}
nub' :: (Eq a) => [a] -> [a]
nub' [] = []
nub' (head:tail) = if elem' head tail 
                  then nub' tail
                  else head : nub' tail 
-- OR 
-- nub' (head:tail) 
--   | elem head tail = nub' tail
--   | otherwise      = head : nub' tail 

{- #3
Create a function isAsc' that returns True
if the list given to it is a list of ascending order
-}
isAsc' :: [Int] -> Bool 
isAsc' [] = False
isAsc' [i] = True
isAsc' (x:y:xs) =
  (x <= y) && isAsc' (y:xs)


{- #4
Create a function hasPath' that determines if
a path from one node to another exists within a 
directed graph
-}
hasPath' :: [(Int,Int)] -> Int -> Int  -> Bool 
hasPath' [] x y = x == y
hasPath' xs x y
  | x == y  = True
  | otherwise = 
    let xs' = [(n,m) | (n,m) <- xs, n /=m ] in
    or [hasPath' xs' m y | (n,m) <- xs, n == x]

