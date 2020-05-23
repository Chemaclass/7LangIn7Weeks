import Data.Char

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

------------------------------------
--------- Datatypes ----------------
------------------------------------

data Calculation =
  Add Int Int | Sub Int Int | Mul Int Int | Div Int Int

calc :: Calculation -> Int
calc (Add x y) = x + y
calc (Sub x y) = x - y
calc (Mul x y) = x * y
calc (Div x y) = x `div` y

data PeaNum = Succ PeaNum | Zero
four :: PeaNum
four = Succ $ Succ $ Succ $ Zero

data Tree a = Leaf | Node (Tree a) a (Tree a)
tree :: Tree Int 
tree = 
  Node (Node Leaf 1 Leaf) 2 (Node (Node Leaf 3 Leaf) 4 Leaf)


------------------------------------
------- Folding exercices ----------
------------------------------------
{- #1
Create a function rev' that reverses a list
-}
rev' :: [a] -> [a]
rev' = foldl (\acc x -> x : acc) []
-- OR => rev' = foldl (flip(:)) []

{- #2
Create a function prefixes that returns all
prefixes of a given list
-}
prefixes' :: [a] -> [[a]]
prefixes' = foldr (\x acc -> [x] : (map ((:) x) acc)) []
-- prefixes [1,2,3] => [[1],[1,2],[1,2,3]]


------------------------------------
------- IO -------------------------
------------------------------------

greet :: IO ()
greet = do
  putStrLn "What is your name?"
  name <- getLine
  let uname = map toUpper name
  putStrLn ("Hello " ++ uname ++ ".")

main' :: IO ()
main' = do
  line <- getLine
  if line /= "quit" then do
    putStrLn ("Input: "++line)
    main'
  else 
    return ()
 

------------------------------------
------- Mondads --------------------
--------- and the DO notation ------

monadd :: (Monad m, Num b) => m b -> m b -> m b
-- monadd mx my = 
--   mx >== (\x -> my >>= (\y -> return $ x+y))
monadd mx my = do
  x <- mx 
  y <- my 
  return $ x+y
-- Example: monadd [1] [2] => [3]
{-
# Monad Laws
## Left identity
return a >>= k = k a

## Right identity
m >>= return = m

## Associativity
m >>= (\x -> k x >>= h) = (m >> k) >>= h
-}
